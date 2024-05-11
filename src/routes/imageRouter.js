import { middletoken } from "../config/jwt.js";
import {
  getCommentImg,
  getImage,
  getInfoImg,
  getInfoSaveImg,
  postInfoComment,
  searchImageName,
} from "../controllers/imageController.js";
import express from "express";

const imageRouter = express.Router();

imageRouter.get("/get-hinh-anh", getImage);
imageRouter.get("/search-hinh-anh", searchImageName);
imageRouter.get("/get-info-hinh-anh/:typeId", middletoken, getInfoImg);
imageRouter.get("/get-comment-hinh-anh/:typeId", middletoken, getCommentImg);
imageRouter.get(
  "/get-info-save-hinh-anh/:imageId",
  middletoken,
  getInfoSaveImg
);
imageRouter.post("/post-info-comment", middletoken, postInfoComment);

export default imageRouter;
