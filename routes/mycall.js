var express = require('express');
var router = express.Router();
var bodyParser = require('body-parser');
var db = require('../server');
router.use(bodyParser.json());

/* GET home page. */
router.get('/', function(req, res, next) {
    var sql1 = "SELECT * FROM mycall";
    db.query(sql1, function(err, rows, fields) {
        if (err) {
            res.status(500).send({ error: 'Something failed!' })
        }
        res.render('admin/mycall/index', { title: 'Cuộc gọi' , mycalln : rows });
        // res.json(rows)
    })
});

module.exports = router;
