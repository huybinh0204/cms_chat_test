var express = require('express');
var router = express.Router();
var bodyParser = require('body-parser');
var db = require('../server');
router.use(bodyParser.json());

/* GET home page. */
router.get('/', function(req, res, next) {
    var sql1 = "SELECT * FROM question";
    db.query(sql1, function(err, rows, fields) {
        if (err) {
            res.status(500).send({ error: 'Something failed!' })
        }
        res.render('admin/question/index', { title: 'Câu hỏi thường gặp', questionn:rows });
        // res.json(rows)
    })
});
// View thêm mới
router.get('/add/', function (req, res, next) {
    res.render('admin/question/add', {title: 'Admin'});
});
router.post('/add-create', function (req, res, next) {
    var title_name = req.body.title_name;
    var name = req.body.name;
    var sql = `INSERT INTO question (title_name,name) VALUES ("${title_name}","${name}")`;
    db.query(sql, function(err, result) {
        if(err) {
            res.status(500).send({ error: 'Something failed!' })
        }
        res.redirect('/admin/question/');
    })
});
// View thêm Sửa lại
router.get('/edit/:id', function(req, res, next) {
    var id = req.params.id;
    console.log(id);
    var sql = `SELECT * FROM question WHERE id=${id}`;
    db.query(sql, function(err, rows, fields) {
        if(err) {
            res.status(500).send({ error: 'Something failed!' })
        }
        res.render('admin/question/edit', {title: 'Admin', edit_question:rows[0]});
        // res.render('admin/department/edit', {title: 'Admin'});
        // res.json(rows[0])
    })
// res.render('admin/department/edit', {title: 'Admin'});
});
router.post('/edit_create/:id', function(req, res, next) {
    var id = req.params.id;
    var title_name = req.body.title_name;
    var name = req.body.name;
    var sql = `UPDATE question SET name="${name}" , title_name="${title_name}" WHERE id=${id}`;
    console.log(sql);
    db.query(sql, function(err, result) {
        if(err) {
            res.status(500).send({ error: 'Somthing failed!' })
        }
        res.redirect('/admin/question/');
    })
});
router.get('/delete/:id', function(req, res, next) {
    var id = req.params.id;
    var sql = `DELETE FROM question WHERE id=${id}`;
    db.query(sql, function(err,result) {
        if(err) {
            res.status(500).send({ error: 'Something failed!' })
        }
        res.redirect('/admin/question/');
    });
})


module.exports = router;
