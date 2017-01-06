var gulp = require('gulp');
var browserify = require('browserify');
var source = require('vinyl-source-stream');
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');
var utilities = require('gulp-util');
var del = require('del');
var jshint = require('gulp-jshint');
var browserSync = require('browser-sync').create();
var sass = require('gulp-sass');
var sourcemaps = require('gulp-sourcemaps');
var lib = require('bower-files')({
  "overrides": {
    "bootstrap": {
      "main": [
        "less/bootstrap.less",
        "dist/css/bootstrap.css",
        "dist/js/bootstrap.js"
      ]
    }
  }
});
var inProd = utilities.env.production;

gulp.task('concatInterface', function() {
  return gulp.src(['./js/*-interface.js'])
  .pipe(concat('allConcat.js'))
  .pipe(gulp.dest('./tmp'));
});

gulp.task('jsBrowserify', ['concatInterface'] , function() {
  return browserify({ entries: ['./tmp/allConcat.js'] })
  .bundle()
  .pipe(source('app.js'))
  .pipe(gulp.dest('./build/js'));
});

gulp.task('minifyScripts', ['jsBrowserify'], function() {
  return gulp.src('./build/js/app.js')
  .pipe(uglify())
  .pipe(gulp.dest('./build/js'));
});

gulp.task('sass', function() {
  return gulp.src(['scss/*.scss'])
    .pipe(sourcemaps.init())
    .pipe(sass())
    .pipe(sourcemaps.write())
    .pipe(gulp.dest('./build/css'))
});

gulp.task('jshint', function() {
  return gulp.src(['js/*.js'])
    .pipe(jshint())
    .pipe(jshint.reporter('default'));
});

gulp.task('clean', function() {
  return del(['build', 'tmp'])
});


gulp.task('bowerJS', function() {
  return gulp.src(lib.ext('js').files)
  .pipe(concat('vendor.min.js'))
  .pipe(uglify())
  .pipe(gulp.dest('./build/js'));
});

gulp.task('bowerFonts', function() {
  return gulp.src(['bower_components/materialize/fonts/roboto/Roboto-*.*'])
  .pipe(gulp.dest('./build/fonts/roboto/'));
});

gulp.task('bowerCSS', ['bowerFonts'], function() {
  return gulp.src(lib.ext('css').files)
  .pipe(concat('vendor.css'))
  .pipe(gulp.dest('./build/css'));
});

gulp.task('bower', ['bowerJS', 'bowerCSS']);

gulp.task('build', ['clean'], function() {
  if(inProd) {
    gulp.start('minifyScripts');
  } else {
    gulp.start('jsBrowserify');
  }
  gulp.start('bower');
  gulp.start('sass');
});


gulp.task('buildJS', ['jsBrowserify', 'jshint'], function() {
  browserSync.reload();
});

gulp.task('buildBower', ['bower'], function() {
  browserSync.reload();
});

gulp.task('buildSass', ['sass'], function() {
  browserSync.reload();
});

gulp.task('serve', function() {
  browserSync.init({
    server: {
      baseDir: './',
      index: 'index.html'
    }
  });

  gulp.watch(['js/*.js'], ['buildJS']);
  gulp.watch(['bower.json'], ['buildBower']);
  gulp.watch(['scss/*.scss'], ['buildSass']);
});

gulp.task('default', ['serve']);
