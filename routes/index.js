var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var database= process.env.DATABASE
var hostname= process.env.HOSTNAME

var con = mysql.createConnection({
  host: process.env.DATABASE,
  user: "root",
  password: "!lin229f"
});

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'NodeJS Demo',
  database: database,
  hostname: hostname  });
});
module.exports = router;
