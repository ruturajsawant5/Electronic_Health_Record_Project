const Sequelize = require("sequelize");

const sequelize = require("../util/database");

const Hospital = sequelize.define("hospital", {
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
  address: Sequelize.STRING,
  mobile: Sequelize.STRING
});

module.exports = Hospital;
