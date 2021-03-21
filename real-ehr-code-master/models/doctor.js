const Sequelize = require("sequelize");

const sequelize = require("../util/database");

const Doctor = sequelize.define("doctor", {
  id: {
    type: Sequelize.INTEGER,
    autoIncrement: true,
    allowNull: false,
    primaryKey: true
  },
  username: Sequelize.STRING,
  password: Sequelize.STRING,
  email: Sequelize.STRING,
  name: Sequelize.STRING,
  gender: Sequelize.STRING,
  date: Sequelize.DATEONLY,
  address: Sequelize.STRING,
  mobile: Sequelize.STRING,
  occupation: Sequelize.STRING
});

module.exports = Doctor;
