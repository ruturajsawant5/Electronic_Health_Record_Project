const express = require("express");
// const { body } = require('express-validator');
const reportController = require('../controllers/report_hospital')

const isAuth = require("../util/is-auth-hospital")

const router = express.Router();

// index
router.post("/index",isAuth, reportController.index);

// show specific report
router.get("/:id",isAuth, reportController.show);

// file routes
router.get("/:reportid/:filename",isAuth,reportController.getFiles);

module.exports = router;
