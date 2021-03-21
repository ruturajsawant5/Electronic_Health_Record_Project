const Sequelize = require("sequelize");

const sequelize = require("../util/database");

const Patient = sequelize.define("patient", {
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
  mobile: Sequelize.STRING
});

module.exports = Patient;
