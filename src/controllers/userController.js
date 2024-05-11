import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";
import { responseData } from "../config/Response.js";
import bcrypt from "bcrypt";
import { createToken, decodeToken } from "../config/jwt.js";

const model = initModels(sequelize);

const signUp = async (req, res) => {
  try {
    let { email, matKhau, hoTen, tuoi } = req.body;

    let checkEmail = await model.nguoi_dung.findOne({
      where: {
        email,
      },
    });

    if (checkEmail) {
      responseData(res, "Email đã tồn tại", 400, "");
      return;
    }

    let newData = {
      email,
      mat_khau: bcrypt.hashSync(matKhau, 10),
      ho_ten: hoTen,
      tuoi,
    };

    await model.nguoi_dung.create(newData);
    responseData(res, "Thành công", 200, "");
  } catch (error) {
    responseData(res, "Lỗi hệ thống", 500, "");
  }
};

const login = async (req, res) => {
  try {
    let { email, matKhau } = req.body;

    let checkEmail = await model.nguoi_dung.findOne({
      where: {
        email,
      },
    });

    if (checkEmail) {
      if (bcrypt.compareSync(matKhau, checkEmail.mat_khau)) {
        let token = createToken({
          nguoiDungId: checkEmail.dataValues.nguoi_dung_id,
        });
        responseData(res, "Thành công", 200, token);
        return;
      }
      responseData(res, "Mật khẩu không đúng", 400, "");
      return;
    }
    responseData(res, "Email không đúng", 400, "");
  } catch (error) {
    responseData(res, "Lỗi hệ thống", 500, "");
  }
};

const getInfoUser = async (req, res) => {
  try {
    const { nguoiDungId } = req.params;
    const user = await model.nguoi_dung.findByPk(nguoiDungId, {
      attributes: { exclude: ["mat_khau"] },
    });
    if (!user) {
      responseData(res, "Không tìm thấy người dùng", 404, "");
      return;
    }
    responseData(res, "Thành công", 200, user);
  } catch (error) {
    console.error("Lỗi khi lấy thông tin người dùng:", error);
    responseData(res, "Lỗi hệ thống", 500, "");
  }
};

const getSavedImagesByUserId = async (req, res) => {
  const { nguoiDungId } = req.params;
  try {
    let data = await model.luu_anh.findAll({
      where: {
        nguoi_dung_id: nguoiDungId,
      },
    });
    responseData(res, "Thành công", 200, data);
  } catch (error) {
    responseData(res, "Lỗi hệ thống", 500);
  }
};

const getNewImagesByUserId = async (req, res) => {
  const { nguoiDungId } = req.params;
  try {
    let data = await model.hinh_anh.findAll({
      where: {
        nguoi_dung_id: nguoiDungId,
      },
    });
    responseData(res, "Thành công", 200, data);
  } catch (error) {
    responseData(res, "Lỗi hệ thống", 500);
  }
};

const deleteImageById = async (req, res) => {
  const { imageId } = req.params;
  try {
    await model.binh_luan.destroy({
      where: {
        hinh_id: imageId,
      },
    });
    await model.luu_anh.destroy({
      where: {
        hinh_id: imageId,
      },
    });
    await model.hinh_anh.destroy({
      where: {
        hinh_id: imageId,
      },
    });
    return responseData(res, "Xóa ảnh thành công", 200);
  } catch (error) {
    return responseData(res, "Lỗi hệ thống", 500);
  }
};

const postImgUser = async (req, res) => {
  try {
    const { nguoi_dung_id, mo_ta } = req.body;
    const file = req.file;
    const user = await model.nguoi_dung.findByPk(nguoi_dung_id);
    if (!user) {
      return responseData(res, "Người dùng không tồn tại", 404, "");
    }
    const newImage = await model.hinh_anh.create({
      ten_hinh: file.originalname,
      duong_dan: file.filename,
      mo_ta: mo_ta,
      nguoi_dung_id: nguoi_dung_id,
    });
    responseData(res, "Thêm ảnh thành công", 201, newImage);
  } catch (error) {
    responseData(res, "Lỗi hệ thống", 500, "");
  }
};

const putInfoUser = async (req, res) => {
  try {
    const { nguoi_dung_id, email, mat_khau, ho_ten, tuoi } = req.body;
    const file = req.file;
    const user = await model.nguoi_dung.findByPk(nguoi_dung_id);
    if (!user) {
      return responseData(res, "Người dùng không tồn tại", 404, "");
    }
    const hashedPassword = await bcrypt.hash(mat_khau, 10);
    await model.nguoi_dung.update(
      {
        email: email,
        mat_khau: hashedPassword,
        ho_ten: ho_ten,
        tuoi: tuoi,
        anh_dai_dien: file ? file.filename : user.anh_dai_dien,
      },
      {
        where: {
          nguoi_dung_id: nguoi_dung_id,
        },
      }
    );
    responseData(res, "Cập nhật thông tin người dùng thành công", 200, "");
  } catch (error) {
    responseData(res, "Lỗi hệ thống", 500, "");
  }
};

export {
  signUp,
  login,
  putInfoUser,
  getInfoUser,
  getSavedImagesByUserId,
  getNewImagesByUserId,
  deleteImageById,
  postImgUser,
};
