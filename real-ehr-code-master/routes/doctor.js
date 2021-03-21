const express = require("express");

const { check } = require("express-validator");

const Doctor = require("../models/doctor");

const authController = require("../controllers/doctorAuth");

const isAuthHospital = require("../util/is-auth-hospital");

const router = express.Router();

router.put(
  "/signup",
  [
    check("username").custom(value => {
      return Doctor.findOne({ where: { username: value } }).then(doctor => {
        if (doctor) {
          return Promise.reject("Username already in use");
        }
      });
    }),
    check("password").isLength({ min: 5 }),
    check("name").trim(),
    check("address").trim(),
    check("mobile")
      .trim()
      .isMobilePhone(),
    check("email")
      .trim()
      .isEmail(),
    check("gender").trim(),
    check("date").trim(),
    check("occupation").trim()
  ],
  isAuthHospital,
  authController.signup
);

router.post("/login", authController.login);

module.exports = router;
