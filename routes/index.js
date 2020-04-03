var express = require('express');
var router = express.Router();
var bodyParser = require('body-parser');
var db = require('../server');
router.use(bodyParser.json());

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: '' });
});
// router.get('/admin/', function(req, res, next) {
//   res.render('admin/index', { title: 'Express' });
// });

module.exports = router;
