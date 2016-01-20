# laravel-vue-jwt

## 1. 安装 laravel 框架

先设置 composer 中国区镜像

composer config -g repo.packagist composer http://packagist.phpcomposer.com

更新下 `composer selfupdate`

新建项目

composer create-project laravel/laravel laravel-vue-jwt

如果是从 github 拉下来的，使用 `composer install --prefer-dist` 更新库

添加表单支持库和调试支持库

```
composer require laravelcollective/html
composer require barryvdh/laravel-debugbar
```

需要配置 config/app.php 

providers 部分

```
Collective\Html\HtmlServiceProvider::class,
Barryvdh\Debugbar\ServiceProvider::class,
```

aliases 部分

```
'Form'      => Collective\Html\FormFacade::class,
'Html'      => Collective\Html\HtmlFacade::class,
'Debugbar'  => Barryvdh\Debugbar\Facade::class,
```





## 2. 修改工程命名空间

php artisan app:name LarVue


## 3. 更新前端库

```
type nul> .bowerrc
```

编辑 .bowerrc 文件
``` javascript
{
    "directory": "resources/assets/vendor"
}
```

```
type nul> bower.json
```

编辑 bower.json 文件
``` javascript
{
    "name": "AppName",
    "dependencies": {
      "bootstrap-sass": "~3.3.5"
    }
}
```

```
bower install bootstrap-sass --save
```


## 4. npm 安装库


删除 package.json 里的 bootstrap-sass 引用，然后执行

```
npm install
```

这步很无聊，从其他项目软链接一份

```
mklink /d /j "H:\rover\rover-self-work\php\laravel-vue-jwt\laravel-vue-jwt\node_modules" "H:\rover\rover-self-work\php\laravel-login\laravel-login\node_modules" 
```

## 5. 修改 gulpfile.js

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

## 6. 修改 bootstrap 编译文件 \resources\assets\sass\app.scss

```
@import "resources/assets/vendor/bootstrap-sass/assets/stylesheets/bootstrap"; 
```
## 7. 编译前端库

执行 `gulp`


## 8. 先启动 laravel 看一下

php artisan serve --port 9096

[http://localhost:9096/](http://localhost:9096/)

## 9. 定义 layout

-  _base_layout.blade.php   基本 layout
-  home.blade.php           主页



修改路由，查看 home.blade.php 的输出结果

刷新页面


## 10. 准备 vue.js



## 11. 定义 routes


## 12. 定义 controller

