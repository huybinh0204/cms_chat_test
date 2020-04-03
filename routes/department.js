var express = require('express');
var router = express.Router();
var bodyParser = require('body-parser');
var db = require('../server');
router.use(bodyParser.json());

/* GET home page. */
router.get('/', function (req, res, next) {
    var sql1 = "SELECT * FROM department";
    db.query(sql1, function (err, rows, fields) {
        if (err) {
            res.status(500).send({error: 'Something failed!'})
        }
        res.render('admin/department/index', {title: 'Phòng ban', departmentn: rows});
        // res.json(rows)
    })
});
// View thêm mới
router.get('/add', function (req, res, next) {
    res.render('admin/department/add', {title: 'Admin'});
});
// View thêm Sửa lại
router.get('/edit/:id', function(req, res, next) {
    const id = req.params.id;
    const sql = `SELECT * FROM department WHERE id=${id}`;
    db.query(sql, function(err, rows, fields) {
        if(err) {
            res.status(500).send({ error: 'Something failed!' })
        }
        res.render('admin/department/edit', {title: 'Admin', edit_departmen:rows[0]});
        // res.render('admin/department/edit', {title: 'Admin'});
        // res.json(rows[0])
    })
    // res.render('admin/department/edit', {title: 'Admin'});
});
router.get('/delete/:id', function(req, res, next) {
    const id = req.params.id;
    const sql = `DELETE FROM department WHERE WHERE id=${id}`;
    db.query(sql, function(err, result) {
        if(err) {
            res.status(500).send({ error: 'Something failed!' })
        }
        res.json({'status': 'success'})
    })
});

module.exports = router;
