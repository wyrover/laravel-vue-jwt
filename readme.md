# laravel-vue-jwt

## 1. 安装 laravel 框架

composer create-project laravel/laravel laravel-login

如果是从 github 拉下来的，使用 `composer install --prefer-dist` 更新库

## 2. 修改工程命名空间

php artisan app:name LarVue


## 3. 更新前端库

type nul> .bowerrc
编辑 .bowerrc 文件

{
    "directory": "resources/assets/vendor"
}

type nul> bower.json

编辑 bower.json 文件

{
    "name": "AppName",
    "dependencies": {
      "bootstrap-sass": "~3.3.5"
    }
}

bower install bootstrap-sass --save



## 4. npm 安装库


删除 package.json 里的 bootstrap-sass 引用，然后执行

```
npm install
```

这步很无聊，从其他项目软链接一份

```
mklink /d /j "H:\rover\rover-self-work\php\laravel-vue-jwt\laravel-vue-jwt\node_modules" "H:\rover\rover-self-work\php\laravel-login\laravel-login\node_modules" 
```

## 4. 修改 gulpfile.js

``` javascript
var elixir = require('laravel-elixir');

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
});

```

## 5. 修改 bootstrap 编译文件 \resources\assets\sass\app.scss

```
@import "resources/assets/vendor/bootstrap-sass/assets/stylesheets/bootstrap"; 
```
## 6. 编译前端库

执行 `gulp`


## 7. 先启动 laravel 看一下

php artisan serve --port 9096

http://localhost:9096/


## 7. 准备 vue.js


## 8. 定义 layout

-  base_layout.blade.php   基本 layout
-  home.blade.php           主页


## 9. 定义 routes


## 10. 定义 controller

