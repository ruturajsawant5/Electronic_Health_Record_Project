const Sequelize = require("sequelize");

const sequelize = require("../util/database");

const Report = sequelize.define("report", {
  id: {
    type: Sequelize.INTEGER,
    autoIncrement: true,
    allowNull: false,
    primaryKey: true
  },
  dieseases: Sequelize.STRING,
  medicines: Sequelize.STRING,
  comments: Sequelize.STRING,
  precautions:Sequelize.STRING,
  city:Sequelize.STRING
});

module.exports = Report;
