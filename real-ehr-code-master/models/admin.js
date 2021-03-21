const Sequelize = require("sequelize");

const sequelize = require("../util/database");

const Admin = sequelize.define("admin", {
  id: {
    type: Sequelize.INTEGER,
    autoIncrement: true,
    allowNull: false,
    primaryKey: true
  },
  username: Sequelize.STRING,
  password: Sequelize.STRING
});

module.exports = Admin;
