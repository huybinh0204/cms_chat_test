var express = require('express');
var router = express.Router();
var bodyParser = require('body-parser');
var db = require('../server');
router.use(bodyParser.json());

/* GET home page. */
router.get('/', function(req, res, next) {
    var sql1 = "SELECT * FROM user";
    db.query(sql1, function(err, rows, fields) {
        if (err) {
            res.status(500).send({ error: 'Something failed!' })
        }
        res.render('admin/user/index', { title: 'Tài khoản người dùng', usern:rows });
        // res.json(rows)
    })
    // res.render('admin/user/index', { title: '' });
});
// router.get('/admin/', function(req, res, next) {
//   res.render('admin/index', { title: 'Express' });
// });

module.exports = router;
