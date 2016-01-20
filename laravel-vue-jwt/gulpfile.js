var elixir = require('laravel-elixir');
require('laravel-elixir-vueify');

/*
 |--------------------------------------------------------------------------
 | Elixir Asset Management
 |--------------------------------------------------------------------------
 |
 | Elixir provides a clean, fluent API for defining some basic Gulp tasks
 | for your Laravel application. By default, we are compiling the Sass
 | file for our application, as well as publishing vendor resources.
 |
 */

elixir(function(mix) {
    var bpath = 'resources/assets/vendor/bootstrap-sass/assets';
    var jqueryPath = 'resources/assets/vendor/jquery';
    mix.sass('app.scss', 'public/assets/css')
        .copy(jqueryPath + '/dist/jquery.min.js', 'public/assets/js')
        .copy(bpath + '/fonts', 'public/assets/fonts')
        .copy(bpath + '/javascripts/bootstrap.min.js', 'public/assets/js');
    
    mix.browserify('main.js');

});
