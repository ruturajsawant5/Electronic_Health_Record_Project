const express = require("express");

const { check } = require("express-validator");

const Patient = require("../models/patient");

const authController = require("../controllers/patientAuth");

const router = express.Router();

router.put(
  "/signup",
  [
    check("username").custom(value => {
      return Patient.findOne({ where: { username: value } }).then(patient => {
        if (patient) {
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
    check("date").trim()
  ],
  authController.signup
);

router.post("/login", authController.login);

module.exports = router;
