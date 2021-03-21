const express = require("express");
// const { body } = require('express-validator');
const reportController = require("../controllers/report_doctor");

const isAuth = require("../util/is-auth-doctor");

const router = express.Router();

// index
router.post("/index", isAuth, reportController.index);

// create new
router.post("/", isAuth, reportController.create);

// show specific report
router.get("/:id", isAuth, reportController.show);

// update
router.put("/:id", isAuth, reportController.update);

// destroy
router.delete("/:id", isAuth, reportController.delete);

// file routes
router.get("/:reportid/:filename", isAuth, reportController.getFiles);

module.exports = router;
