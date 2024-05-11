import express from "express";
import imageRouter from "./imageRouter.js";
import userRouter from "./userRouter.js";

const rootRouter = express.Router();

rootRouter.use("/image", imageRouter);
rootRouter.use("/user", userRouter);

export default rootRouter;
