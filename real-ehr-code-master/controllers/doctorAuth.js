const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const Doctor = require("../models/doctor");
const Hospital_Doctor = require("../models/hospital_doctor");

const { check, validationResult } = require("express-validator");

exports.signup = (req, res, next) => {
  const errors = validationResult(req);
  console.log(errors);
  if (!errors.isEmpty()) {
    const error = new Error("Validation failed.");
    error.statusCode = 422;
    error.data = errors.array();
    throw error;
  }

  const username = req.body.username;
  const password = req.body.password;
  const name = req.body.name;
  const gender = req.body.gender;
  const date = req.body.date;
  const address = req.body.address;
  const mobile = req.body.mobile;
  const email = req.body.email;
  const occupation = req.body.occupation;

  // console.log(req.body);

  bcrypt
    .hash(password, 12)
    .then(hashedPw => {
      const doctor = Doctor.build({
        username: username,
        password: hashedPw,
        name: name,
        gender: gender,
        date: date,
        address: address,
        mobile: mobile,
        email: email,
        occupation: occupation
      });
      return doctor.save();
    })

    .then(result => {
      //   res.status(201).json({ message: 'Hospital created!', HospitalId: result._id });
      Hospital_Doctor.create({
        hospitalId: req.hospitalId,
        doctorId: result.id
      })
        .then(result1 => {
          res
            .status(201)
            .json({ message: "Doctor created!", DoctorId: result.id });
        })
        .catch(err1 => {
          if (!err1.statusCode) {
            err1.statusCode = 500;
          }
          next(err1);
        });
    })
    .catch(err => {
      if (!err.statusCode) {
        err.statusCode = 500;
      }
      next(err);
    });

};

exports.login = (req, res, next) => {
  const username = req.body.username;
  const password = req.body.password;
  let loadedUser;

  Doctor.findOne({ where: { username: username } })
    .then(user => {
      if (!user) {
        const error = new Error(
          "1"
        );
        error.statusCode = 401;
        throw error;
      }

      loadedUser = user;
      return bcrypt.compare(password, user.password);
    })
    .then(isEqual => {
      if (!isEqual) {
        const error = new Error("2");
        error.statusCode = 401;
        throw error;
      }
      const token = jwt.sign(
        {
          username: loadedUser.username,
          userId: loadedUser.id.toString(),
          userType: "Doctor"
        },
        "somesupersecretsecret",
        { expiresIn: "1h" }
      );
      res.status(200).json({ token: token, userId: loadedUser.id.toString() });
    })
    .catch(err => {
      if (!err.statusCode) {
        err.statusCode = 500;
      }
      next(err);
    });
};
