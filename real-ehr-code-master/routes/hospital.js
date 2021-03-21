const express = require("express");
const { check } = require("express-validator");

const Hospital = require("../models/hospital");
const authController = require("../controllers/hospitalAuth");

const router = express.Router();

router.put(
  "/signup",
  [
    check("username").custom(value => {
      return Hospital.findOne({ where: { username: value } }).then(hospital => {
        if (hospital) {
          return Promise.reject("Username already in use");
        }
      });
    }),
    check("password").isLength({ min: 5 }),
    check("email")
      .trim()
      .isEmail(),
    check("name").trim(),
    check("address").trim(),
    check("mobile").trim()
  ],
  authController.signup
);

router.post("/login", authController.login);

module.exports = router;
