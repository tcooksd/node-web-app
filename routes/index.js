var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var database = process.env.MYSQL_IP;
var databaseport = process.env.MYSQL_PORT;
var hostname = process.env.HOSTNAME;

var con = mysql.createConnection({
  host: process.env.DATABASE,
  user: "root",
  password: "password!"
});

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'NodeJS Demo',
  database: database,
  port: databaseport,
  hostname: hostname,});
});
module.exports = router;
