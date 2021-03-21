const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const Hospital = require("../models/hospital");
const { check, validationResult } = require("express-validator");

exports.signup = (req, res, next) => {
  const errors = validationResult(req);

  if (!errors.isEmpty()) {
    const error = new Error("Validation failed.");
    error.statusCode = 422;
    error.data = errors.array();
    throw error;
  }

  const username = req.body.username;
  const password = req.body.password;
  const name = req.body.name;
  const address = req.body.address;
  const mobile = req.body.mobile;
  const email = req.body.email;

  // console.log(req.body);

  bcrypt
    .hash(password, 12)
    .then(hashedPw => {
      const hospital = Hospital.build({
        username: username,
        password: hashedPw,
        name: name,
        address: address,
        mobile: mobile,
        email: email
      });
      return hospital.save();
    })

    .then(result => {
      //   res.status(201).json({ message: 'Hospital created!', HospitalId: result._id });
      res
        .status(201)
        .json({ message: "Hospital created!", HospitalId: result.id });
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
  // console.log("username")
  // console.log(username)

  Hospital.findOne({ where: { username: username } })
    .then(user => {
      if (!user) {
        const error = new Error("1");
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
          userType: "Hospital"
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
