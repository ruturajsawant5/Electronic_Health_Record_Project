const express = require("express");
// const { body } = require('express-validator');

const reportController = require("../controllers/report_patient");

const isAuth = require("../util/is-auth-patient");

const router = express.Router();

// index
router.get("/", isAuth, reportController.index);

// show specific report
router.get("/:id", isAuth, reportController.show);

// file routes
router.get("/:reportid/:filename", isAuth, reportController.getFiles);
// router.get("/:reportid/:filename", reportController.getFiles);


module.exports = router;
