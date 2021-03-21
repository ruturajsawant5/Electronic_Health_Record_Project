const Report = require("../models/report");
const File = require("../models/file");

const aws = require("aws-sdk");
const s3 = new aws.S3({
  accessKeyId: "AKIA5WCHYC22OXDPC3XR",
  secretAccessKey: "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",
});



exports.index = (req, res, next) => {
  const patientId = req.userId;

  Report.findAll({ where: { patientId: patientId}, include: [File] })
    .then(report => {
          res.status(200).json(report);
    })
    .catch(err => {
      res.status(204).json({ data: "No content found" });
      console.log(err);
    });

  // Report.findAll({ where: { patientId: patientId } })
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

// exports.show = (req, res, next) => {
//   const reportId = req.params.id;
  
//   const patientId = req.userId;
//   // Report.findOne({ where: { id: reportId } })
//   //   .then(report => {
//   //     // File.findAll({ where:{ reportId: 2 }})
//   //     File.findAll()
//   //       .then(files => {
//   //         console.log(files);
//   //         res.status(200).json(report);
//   //       })
//   //       .catch(err => {
//   //         console.log(err);
//   //         res.status(200).json(report);
//   //       });
//   //   })
//   //   .catch(err => {
//   //     res.status(204).json({ data: "No content found" });
//   //     console.log(err);
//   //   });
//     Report.findOne({ where: { id: reportId,patientId:patientId }, include: [File] })
//     .then(report => {
//           res.status(200).json(report);
//     })
//     .catch(err => {
//       res.status(204).json({ data: "No content found" });
//       console.log(err);
//     });
// };

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
      console.log("file sent");
      res.send(data.Body);
    }
  });
};
