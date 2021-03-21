const Report = require("../models/report");
const Doctor = require("../models/doctor");
const Patient = require("../models/patient");
const Hospital_Doctor = require("../models/hospital_doctor");
const Hospital = require("../models/hospital");

const File = require("../models/file");
const path = require("path");
const aws = require("aws-sdk");
const s3 = new aws.S3({
  accessKeyId: "AKIA5WCHYC22OXDPC3XR",
  secretAccessKey: "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",
});



// var CryptoJS = require("crypto-js");
// var encrypted = CryptoJS.AES.encrypt("Message", "Secret Passphrase");
// var decrypted = CryptoJS.AES.decrypt(encrypted, "Secret Passphrase");

exports.index = (req, res, next) => {
  const doctorId = req.userId;
  const email = req.body.email;

  Patient.findOne({ where: { email: email }})
    .then((patient) => {
      Report.findAll({ where: { doctorId: doctorId, patientId: patient.id } , include: [File] } )
        .then((reports) => {
          res.status(200).json(reports);
        })
        .catch((err) => {
          res.status(204).json({ data: "No content found" });
          console.log(err);
        });
    })
    .catch((err) => {
      res.status(204).json({ data: "No content found*" });
      console.log(err);
    });
};

exports.create = (req, res, next) => {
  const date = req.body.date;
  const dieseases = req.body.dieseases;
  const medicines = req.body.medicines;
  const precautions = req.body.precautions;
  const comments = req.body.comments;

  const doctorId = req.userId;

  const city = req.body.city;

  const email = req.body.email;

  Hospital_Doctor.findOne({ where: { id: doctorId } })
    .then((hdoctor) => {
      Patient.findOne({ where: { email: email } })
        .then((patient) => {
          const patientId = patient.id;
          const hospitalId = hdoctor.hospitalId;
          Report.create({
            date: date,
            dieseases: dieseases,
            medicines: medicines,
            precautions: precautions,
            comments: comments,
            city: city,

            patientId: patientId,
            hospitalId: hospitalId,
            doctorId: doctorId,
          })
            .then((report) => {
              for (var i = 0; i < req.files.length; i++) {
                File.create({
                  reportId: report.id,
                  name: req.files[i].key,
                })
                  .then((file) => {
                    console.log("file uploaded");
                  })
                  .catch((err) => {
                    console.log(err);
                  });
              }
              res.status(200).json({ Report: "Report Created Suceesfully" });
            })
            .catch((err) => {
              console.log(err);
            });
        })
        .catch((err) => {
          res.status(204).json({ data: "No content found*" });
          console.log(err);
        });
    })
    .catch((err) => {
      res.status(204).json({ data: "No content found*" });
      console.log(err);
    });
};

exports.show = (req, res, next) => {
  const reportId = req.params.id;
  Report.findOne({ where: { id: reportId}, include: [File] })
    .then(report => {
          res.status(200).json(report);
    })
    .catch(err => {
      res.status(204).json({ data: "No content found" });
      console.log(err);
    });
  // Report.findOne({ where: { id: reportId } })
  //   .then((report) => {
  //     Doctor.findOne({
  //       attributes: ["username"],
  //       where: { id: report.doctorId },
  //     }).then((doctor) => {
  //       Hospital.findOne({
  //         where: { id: report.hospitalId },
  //       }).then((hospital) => {
  //         File.findAll({ where: { reportId: report.id } }).then((files) => {
  //           let merged = { report, doctor, hospital, files };
  //           res.status(200).json(merged);
  //         });
  //       });
  //     });
  //   })
  //   .catch((err) => {
  //     res.status(204).json({ data: "No content found" });
  //     console.log(err);
  //   });

  // Report.findOne({ where: { id: reportId } })
  //   .then((reports) => {
  //     File.findAll({ where: { reportId: reports.id } })
  //       .then((files) => {
  //         let merged = { reports, files };
  //         res.status(200).json(merged);
  //       })
  //       .catch((err) => {
  //         console.log(err);
  //       });
  //   })
  //   .catch((err) => {
  //     res.status(204).json({ data: "No content found" });
  //     console.log(err);
  //   });
};

exports.update = (req, res, next) => {
  const reportId = req.params.id;
  const dieseases = req.body.dieseases;
  const medicines = req.body.medicines;
  const precautions = req.body.precautions;
  const comments = req.body.comments;

  Report.findOne({ where: { id: reportId}, include: [File] })
  .then((report) => {
    // report.date = date;
    report.dieseases = dieseases;
    report.medicines = medicines;
    report.precautions = precautions;
    report.comments = comments;
    return report.save();
  })
  .then((report) => {
    res.status(200).json(report);
  })
  .catch((err) => {
    res.status(204).json({ data: "No content found" });
    console.log(err);
  });
};


// exports.update = (req, res, next) => {
//   const reportId = req.params.id;
//   // const date = req.body.date;
//   const dieseases = req.body.dieseases;
//   const medicines = req.body.medicines;
//   const precautions = req.body.precautions;
//   const comments = req.body.comments;

//   Report.findOne({ where: { id: reportId } })
//     .then((report) => {
//       // report.date = date;
//       report.dieseases = dieseases;
//       report.medicines = medicines;
//       report.precautions = precautions;
//       report.comments = comments;
//       return report.save();
//     })
//     .then((report) => {
//       res.status(200).json(report);
//     })
//     .catch((err) => {
//       res.status(204).json({ data: "No content found" });
//       console.log(err);
//     });
// };

exports.delete = (req, res, next) => {
  const reportId = req.params.id;

  Report.findOne({ where: { id: reportId } })
    .then((report) => {
      return report.destroy();
    })
    .then((reports) => {
      res.status(200).json(reports);
    })
    .catch((err) => {
      res.status(204).json({ data: "No content found" });
      console.log(err);
    });
};

exports.getFiles = (req, res, next) => {
  const reportId = req.params.id;
  const filename = req.params.filename;
  var params = {
    Bucket: "ehr-g12-record-files",
    Key: filename,
  };
  s3.getObject(params, function (err, data) {
    if (err) {
      console.log(err);
    } else {
      res.send(data.Body);
    }
  });
};
