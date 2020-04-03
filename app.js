var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
//cms admin
var admin_Router = require('./routes/admin');
var user_Router = require('./routes/user');
var department_Router = require('./routes/department');
var question_Router = require('./routes/question');
var message_icon_Router = require('./routes/message_icon');
var admin_list_Router = require('./routes/admin_list');
var contacts_Router = require('./routes/contacts');
var mycall_Router = require('./routes/mycall');
var system_bulletin_Router = require('./routes/system_bulletin');
var personal_newsletter_Router = require('./routes/personal_newsletter');
var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/admin', admin_Router);
app.use('/admin/user', user_Router);
app.use('/admin/admin/', admin_list_Router);
app.use('/admin/contacts/', contacts_Router);
app.use('/admin/department/', department_Router);
app.use('/admin/question/', question_Router);
app.use('/admin/message_icon/', message_icon_Router);
app.use('/admin/mycall/', mycall_Router);
app.use('/admin/system_bulletin/', system_bulletin_Router);
app.use('/admin/personal_newsletter/', personal_newsletter_Router);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
