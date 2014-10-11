'use strict';

var gulp = require('gulp');

var wiredep = require('wiredep').stream;

gulp.task('bower', function () {
    gulp.src('application/views/welcome_message.php')
        .pipe(wiredep({
            optional: 'configuration',
            goes: 'here',
            src: ['application/views/welcome_message.php'],
            fileTypes: {
                php: {
                    block: /(([\s\t]*)<!--\s*bower:*(\S*)\s*-->)(\n|\r|.)*?(<!--\s*endbower\s*-->)/gi,
                    detect: {
                        js: /<script.*src=['"](.+)['"]>/gi,
                        css: /<link.*href=['"](.+)['"]/gi
                    },
                    replace: {
                        js: function (filePath) {
                            return '<script src="' + filePath.replace('../../', '') + '"></script>'
                        },
                        css: function (filePath) {
                            return  '<link rel="stylesheet" href="' + filePath.replace('../../', '') + '" />'
                        }
                    }
                }
            }
        }))
        .pipe(gulp.dest('application/views/'));
});

gulp.task('server', function () {
    gulp.start('bower');
});

gulp.task('build', function () {
    gulp.start('grunt-build');
});

gulp.task('default', ['server']);


