const express = require("express");

const multer = require("multer");

const bodyParser = require("body-parser");

const logger = require("morgan");

const app = express();

require("dotenv").config({ path: "./vars.env" });

const sequelize = require("./util/database");

const patientRoutes = require("./routes/patient");

const hospitalRoutes = require("./routes/hospital");

const docotrRoutes = require("./routes/doctor");

const reportPatientRoutes = require("./routes/report_patient");

const reportHospitalRoutes = require("./routes/report_hospital");

const reportDoctorRoutes = require("./routes/report_doctor");

const adminRoutes = require("./routes/admin")

const Hospital = require("./models/hospital");

const Hospital_Doctor = require("./models/hospital_doctor");

const Patient = require("./models/patient");

const Report = require("./models/report");

const Doctor = require("./models/doctor");

const File = require("./models/file");

var multerS3 = require("multer-s3");

var aws = require("aws-sdk");

const fileFilter = (req, file, cb) => {
  if (
    file.mimetype === "image/png" ||
    file.mimetype === "image/jpg" ||
    file.mimetype === "image/jpeg" ||
    file.mimetype === "application/pdf"
  ) {
    cb(null, true);
  } else {
    cb(null, false);
  }
};


//***********************************************************
aws.config.update({
  accessKeyId: "AKIA5WCHYC22OXDPC3XR",
  secretAccessKey: "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",
  region: "ap-south-1"
});

var s3 = new aws.S3();
var upload = multer({
  storage: multerS3({
    s3: s3,
    bucket: "ehr-g12-record-files",
    metadata: function(req, file, cb) {
      cb(null, { fieldName: file.fieldname });
    },
    key: function(req, file, cb) {
      cb(null, Date.now().toString() + file.originalname);
    }
  })
  ,
  fileFilter: fileFilter
});



app.use(upload.array("mulfiles", 10));


//***************************************************************


//*******************************************
// const fileStorage = multer.diskStorage({
//   destination: (req, file, cb) => {
//     cb(null, "files");
//   },
//   filename: (req, file, cb) => {

//     cb(null,  Date.now().toString() + file.originalname);

//     // cb(null, req.body.hospitalId + '-'+req.body.doctorId + '-'+req.body.patientId + '-' + file.originalname);
//   }
// });

// const fileFilter = (req, file, cb) => {
//   if (
//     file.mimetype === "image/png" ||
//     file.mimetype === "image/jpg" ||
//     file.mimetype === "image/jpeg" ||
//     file.mimetype === "application/pdf"
//   ) {
//     cb(null, true);
//   } else {
//     cb(null, false);
//   }
// };

// app.use(
//   multer({ storage: fileStorage, fileFilter: fileFilter }).array("mulfiles", 10)
// );
//*************************************************************************

app.use(logger(process.env.APP));

app.use(bodyParser.json());

// // CORS

app.use((req, res, next) => {
  res.setHeader("Access-Control-Allow-Origin", "*");
  res.setHeader(
    "Access-Control-Allow-Methods",
    "OPTIONS, GET, POST, PUT, PATCH, DELETE"
  );
  res.setHeader("Access-Control-Allow-Headers", "Content-Type, Authorization");
  // console.log(req.body);*
  next();
});

app.use("/api/admin", adminRoutes);

app.use("/api/patient", patientRoutes);

app.use("/api/hospital", hospitalRoutes);

app.use("/api/doctor", docotrRoutes);

app.use("/api/patient/report", reportPatientRoutes);

app.use("/api/hospital/report", reportHospitalRoutes);

app.use("/api/doctor/report", reportDoctorRoutes);

// ***********************

// File
File.belongsTo(Report);

// Report
Report.hasMany(File);
//Report.belongsTo(Patient,{ through: Report_Auth});
//Report.belongsToMany(Doctor,{ through: Report_Auth});
//Report.belongsTo(Hospital);

// Patient
Patient.hasMany(Report);
// Patient.belongsToMany(Doctor, { through: Report });
// Patient.belongsToMany(Hospital, { through: Report });

// Doctors
Doctor.hasMany(Report);
// Doctor.belongsToMany(Patient, { through: Report });
//Doctor.belongsToMany(Hospital, { through: Hospital_Doctor });
// Doctor.hasOne(Hospital)

// Hospitals
// Hospital.belongsToMany(Patient, { through: Report });
// Hospital.belongsToMany(Doctor, { through: Hospital_Doctor });
Hospital.hasMany(Report);
// ***********************

app.use((error, req, res, next) => {
  console.log(error);
  const status = error.statusCode || 500;
  const message = error.message;
  const data = error.data;
  res.status(status).json({ message: message, data: data });
});

// app.listen(process.env.PORT);

sequelize
  .sync()
  // .sync({ force: true })
  .then(result => {
    app.listen(process.env.PORT, process.env.IP);
    console.log("Server Started");
  })
  .catch(err => {
    console.log(err);
  });
