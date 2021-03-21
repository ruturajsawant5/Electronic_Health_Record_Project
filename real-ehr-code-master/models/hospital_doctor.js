const Sequelize = require("sequelize");

const sequelize = require("../util/database");

const Hospital_Doctor = sequelize.define("hospital_doctor", {
  id: {
    type: Sequelize.INTEGER,
    autoIncrement: true,
    allowNull: false,
    primaryKey: true
  },
  hospitalId: {
    type: Sequelize.INTEGER
  },
  doctorId: {
    type: Sequelize.INTEGER
  }
});

module.exports = Hospital_Doctor;
