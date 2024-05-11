import multer, { diskStorage } from "multer";

export const upload = multer({
  storage: diskStorage({
    destination: process.cwd() + "/public/img/folder2",
    filename: (req, file, callback) =>
      callback(null, new Date().getTime() + "_" + file.originalname),
  }),
});

export const upload2 = multer({
  storage: diskStorage({
    destination: process.cwd() + "/public/img/folder1",
    filename: (req, file, callback) =>
      callback(null, new Date().getTime() + "_" + file.originalname),
  }),
});
