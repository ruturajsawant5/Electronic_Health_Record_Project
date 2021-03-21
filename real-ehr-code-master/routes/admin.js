const express = require("express");

const { check } = require("express-validator");

const Admin = require("../models/admin");

const authController = require("../controllers/adminAuth");

const isAuth = require("../util/is-auth-admin");


const router = express.Router();

router.put(
  "/signup",
  [
    check("username").custom(value => {
      return Admin.findOne({ where: { username: value } }).then(admin => {
        if (admin) {
          return Promise.reject("Username already in use");
        }
      });
    }),
    check("password").isLength({ min: 5 })
  ],
  authController.signup
);

router.post("/login", authController.login);

router.get("/analytics/city/:city",isAuth, authController.citywise);

router.get("/analytics/disease/:disease",isAuth, authController.diseasewise);

router.get("/analytics",isAuth, authController.analytics);


module.exports = router;
