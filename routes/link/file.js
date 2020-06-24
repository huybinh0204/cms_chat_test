var express = require('express');
var router = express.Router();
var bodyParser = require('body-parser');
var db = require('../server');
// var urlencodedParser = bodyParser.urlencoded({extended: false});
router.use(bodyParser.json());
/* GET home page. */

module.exports = router;
