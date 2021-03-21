const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const Admin = require("../models/admin");
const Report = require("../models/report");
const Sequelize = require("sequelize");

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


  bcrypt
    .hash(password, 12)
    .then((hashedPw) => {
      const admin = Admin.build({
        username: username,
        password: hashedPw,

      });
      return admin.save();
    })

    .then((result) => {
      res.status(201).json({ message: "Admin created!", adminId: result.id });
    })
    .catch((err) => {
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

  Admin.findOne({ where: { username: username } })
    .then((user) => {
      if (!user) {
        const error = new Error("1");
        error.statusCode = 401;
        throw error;
      }

      loadedUser = user;
      return bcrypt.compare(password, user.password);
    })
    .then((isEqual) => {
      if (!isEqual) {
        const error = new Error("2");
        error.statusCode = 401;
        throw error;
      }
      const token = jwt.sign(
        {
          username: loadedUser.username,
          userId: loadedUser.id.toString(),
          userType: "Admin",
        },
        "somesupersecretsecret",
        { expiresIn: "1h" }
      );
      res.status(200).json({ token: token, userId: loadedUser.id.toString() });
    })
    .catch((err) => {
      if (!err.statusCode) {
        err.statusCode = 500;
      }
      next(err);
    });
};

exports.analytics = (req, res, next) => {
  // "city",

  //  v1
  // Report.findAll({ group: ["dieseases"], attributes: ['dieseases', Sequelize.fn('count', Sequelize.col('dieseases'))] })
  //   .then((result) => {
  //     res.status(200).json(result);
  //   })
  //   .catch((err) => {
  //     res.status(204).json({ data: "No content found" });
  //     console.log(err);
  //   });

  // v2
  // Report.findAll({ group: ["dieseases"], attributes: ['dieseases', [Sequelize.fn('COUNT', 'dieseases'), 'dieseases']] })
  // .then((result) => {
  //   res.status(200).json(result);
  // })
  // .catch((err) => {
  //   res.status(204).json({ data: "No content found" });
  //   console.log(err);
  // });

  // v3
  Report.findAll({
    group: ["dieseases", "city"],
    attributes: [
      "dieseases",
      "city",
      [Sequelize.fn("COUNT", "dieseases"), "count_dieseases"],
    ],
  })
    .then((result) => {
      res.status(200).json(result);
    })
    .catch((err) => {
      res.status(204).json({ data: "No content found" });
      console.log(err);
    });
};


exports.citywise = (req, res, next) => {
  const  city = req.params.city;


    Report.findAll({
      group: ["dieseases"],
      attributes: [
        "dieseases",
        [Sequelize.fn("COUNT", "dieseases"), "count"]
      ],
      where:{city:city}
    })
      .then((result) => {
        // const [array0] = result.map(x => x.data)
        let w =  result.map(a => a.dataValues.dieseases);
        let x = result.map(a => a.dataValues.count);
       obj={
         "diseases":w,
         "count":x
       }
       
        res.status(200).json(obj);
      })
      .catch((err) => {
        res.status(204).json({ data: "No content found" });
        console.log(err);
      });
  
};

exports.diseasewise = (req, res, next) => {
  const diesease = req.params.disease;


    Report.findAll({
      group: ["city"],
      attributes: [
        "city",
        [Sequelize.fn("COUNT", "city"), "count"]
      ],
      where:{dieseases:diesease}
    })
      .then((result) => {
        // const [array0] = result.map(x => x.data)
        let w =  result.map(a => a.dataValues.city);
        let x = result.map(a => a.dataValues.count);
       obj={
         "city":w,
         "count":x
       }
       
        res.status(200).json(obj);
      })
      .catch((err) => {
        res.status(204).json({ data: "No content found" });
        console.log(err);
      });
  
};
