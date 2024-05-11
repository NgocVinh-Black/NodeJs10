import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";
import { responseData } from "../config/Response.js";
import { Sequelize } from "sequelize";

const model = initModels(sequelize);

const getImage = async (req, res) => {
  try {
    let data = await model.hinh_anh.findAll();
    responseData(res, "Thành công", 200, data);
  } catch (error) {
    responseData(res, "Lỗi khi lấy danh sách ảnh", 500);
  }
};

const searchImageName = async (req, res) => {
  const { text } = req.query;
  try {
    let data = await model.hinh_anh.findAll({
      where: { ten_hinh: { [Sequelize.Op.like]: "%" + text + "%" } },
    });
    responseData(res, "Thành công", 200, data);
  } catch (error) {
    console.error("Lỗi khi tìm kiếm ảnh:", error);
    responseData(res, "Lỗi khi tìm kiếm ảnh", 500);
  }
};

const getInfoImg = async (req, res) => {
  const { typeId } = req.params;
  try {
    let data = await model.hinh_anh.findAll({
      where: {
        hinh_id: typeId,
      },
    });
    responseData(res, "Thành công", 200, data);
  } catch (error) {
    console.error("Lỗi khi tìm kiếm ảnh:", error);
    responseData(res, "Lỗi khi tìm kiếm ảnh", 500);
  }
};

const getCommentImg = async (req, res) => {
  const { typeId } = req.params;
  try {
    let data = await model.binh_luan.findAll({
      where: {
        hinh_id: typeId,
      },
    });
    responseData(res, "Thành công", 200, data);
  } catch (error) {
    console.error("Lỗi khi tìm kiếm ảnh:", error);
    responseData(res, "Lỗi khi tìm kiếm ảnh", 500);
  }
};

const getInfoSaveImg = async (req, res) => {
  const { imageId } = req.params;
  try {
    let data = await model.luu_anh.findOne({
      where: {
        hinh_id: imageId,
      },
    });
    if (data) {
      responseData(res, "Thành công", 200, { saved: true });
    } else {
      responseData(res, "Thành công", 200, { saved: false });
    }
  } catch (error) {
    console.error("Lỗi khi kiểm tra ảnh đã lưu:", error);
    responseData(res, "Lỗi khi kiểm tra ảnh đã lưu", 500);
  }
};

const postInfoComment = async (req, res) => {
  try {
    const { nguoiDungId, hinhId, noiDung } = req.body;

    if (!nguoiDungId || !hinhId || !noiDung) {
      return responseData(res, "Thiếu thông tin bình luận", 400, "");
    }
    const newComment = await model.binh_luan.create({
      nguoi_dung_id: nguoiDungId,
      hinh_id: hinhId,
      ngay_binh_luan: new Date(),
      noi_dung: noiDung,
    });

    // Trả về phản hồi cho client
    responseData(res, "Bình luận đã được tạo thành công", 201, newComment);
  } catch (error) {
    console.error("Lỗi khi tạo bình luận:", error);
    responseData(res, "Đã có lỗi xảy ra khi tạo bình luận", 500);
  }
};

export {
  getImage,
  searchImageName,
  getInfoImg,
  getCommentImg,
  getInfoSaveImg,
  postInfoComment,
};
