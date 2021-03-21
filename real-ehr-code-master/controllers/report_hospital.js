const Report = require("../models/report");
const Patient = require("../models/patient");
const File = require("../models/file")
const aws = require("aws-sdk");
const s3 = new aws.S3({
  accessKeyId: "AKIA5WCHYC22OXDPC3XR",
  secretAccessKey: "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",
});



exports.index = (req, res, next) => {
  // const hospitalId = req.userId;

  const email = req.body.email;

  Patient.findOne({ where: { email: email } })
    .then((patient) => {
      Report.findAll({ where: { patientId: patient.id } , include: [File] })
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


  // Report.findAll({ where: { hospitalId: hospitalId } })
  //   .then(reports => {
  //     res.status(200).json(reports);
  //   })
  //   .catch(err => {
  //     res.status(204).json({ data: "No content found" });
  //     console.log(err);
  //   });
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

};

exports.getFiles = (req, res, next) => {
  const reportId = req.params.id;
  const filename = req.params.filename;
  var params = {
    Bucket: "ehr-g12-record-files",
    Key: filename
  };
  s3.getObject(params, function(err, data) {
    if (err) {
      console.log(err);
    } else {
      // console.log(data.Body.toString());
      res.send(data.Body);
    }
  });
};
