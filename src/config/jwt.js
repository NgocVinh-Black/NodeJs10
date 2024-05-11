import jwt from "jsonwebtoken";

export const createToken = (data) => {
  return jwt.sign(data, "PASS_LEVEL_2", { expiresIn: "10m" });
};

export const checkToken = (token) => {
  return jwt.verify(token, "PASS_LEVEL_2", (error) => error);
};

export const decodeToken = (token) => {
  return jwt.decode(token);
};

export const middletoken = (req, res, next) => {
  let { token } = req.headers;
  if (checkToken(token) == null) {
    next();
  } else {
    if (error.name == "TokenExpriedError")
      res.status(401).send("Not authorize");
    else res.status(401).send("Không có quyền");
  }
};

export const middletokenUser = (req, res, next) => {
  const { token } = req.headers;
  if (!token) {
    res.status(401).send("Token not provided");
  } else {
    const tokenError = checkToken(token);
    if (tokenError) {
      if (tokenError.name === "TokenExpiredError") {
        res.status(401).send("Token expired");
      } else {
        res.status(401).send("Invalid token");
      }
    } else {
      const decodedToken = decodeToken(token);
      if (!decodedToken) {
        res.status(401).send("Invalid token");
      } else {
        const { nguoiDungId } = decodedToken;
        req.nguoiDungId = nguoiDungId;
        next();
      }
    }
  }
};