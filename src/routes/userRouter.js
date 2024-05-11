import express from "express";
import {
  deleteImageById,
  getInfoUser,
  getNewImagesByUserId,
  getSavedImagesByUserId,
  login,
  postImgUser,
  signUp,
  putInfoUser,
} from "../controllers/userController.js";
import { upload, upload2 } from "../config/upload.js";
import { middletokenUser } from "../config/jwt.js";

const userRouter = express.Router();

userRouter.post("/signup", signUp);
userRouter.post("/login", login);
userRouter.get("/get-info-user/:nguoiDungId", middletokenUser, getInfoUser);
userRouter.get(
  "/get-save-img-user/:nguoiDungId",
  middletokenUser,
  getSavedImagesByUserId
);
userRouter.get(
  "/get-new-img-user/:nguoiDungId",
  middletokenUser,
  getNewImagesByUserId
);
userRouter.delete("/delete-img-id/:imageId", middletokenUser, deleteImageById);
userRouter.post(
  "/post-img-user",
  middletokenUser,
  upload2.single("avatar"),
  postImgUser
);
userRouter.put(
  "/put-info-user",
  middletokenUser,
  upload.single("avatar"),
  putInfoUser
);

export default userRouter;
