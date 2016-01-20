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


## 10. 准备几个命令准备拷贝粘贴

-  `php artisan migrate`
-  `php artisan db:seed`
-  `php artisan route:list`
-  `php artisan route:list >output.txt`

或者在项目根目录创建一个批处理 `laravel-tools.bat`

``` bat
::-------------------------------------------------------------------------
:: laravel-tools.bat
:: author: wyrover
:: date:    2015-10-25
:: version: 0.1
:: description:
::      把此批处理放在 laravel 项目目录，执行后选择菜单执行相关命令，在编辑器修改后
::      在 console 窗口按 ~ + Enter 重新选择命令执行


@echo off
if [%1] == [] goto runbat_args
if [%1] == [menu] goto menu
:runbat
@color 0A
@mode con cols=120 rows=30 >nul
@mode con cp select=936  >nul
doskey ~=%~dp0\%0 menu



:menu

CALL "C:\nginxstack\scripts\setenv.bat"


echo   ______________________________________________________________________
echo  ^|  1.路由列表                       2.创建控制器                      ^|
echo  ^|  3.创建模型带数据迁移             4.创建模型                        ^|
echo  ^|  5.创建数据迁移                   6.运行数据迁移                    ^|
echo  ^|  7.运行种子数据                   8.运行laravel                     ^|
echo  ^|  9.创建一个空函数的控制器         10.                               ^|
echo  ^|_____________________________________________________________________^|
echo.

echo.
echo.

set /p ID="Select action, press 0.99 key: "%
if %ID%#==1# goto cmd1
if %ID%#==2# goto cmd2
if %ID%#==3# goto cmd3
if %ID%#==4# goto cmd4
if %ID%#==5# goto cmd5
if %ID%#==6# goto cmd6
if %ID%#==7# goto cmd7
if %ID%#==8# goto cmd8
if %ID%#==9# goto cmd9
if %ID%#==10# goto cmd10
if %ID%#==11# goto cmd11
if %ID%#==12# goto cmd12
if %ID%#==13# goto cmd13
if %ID%#==14# goto cmd14
if %ID%#==15# goto cmd15
if %ID%#==16# goto cmd16
if %ID%#==17# goto cmd17
if %ID%#==18# goto cmd18
if %ID%#==19# goto cmd19
if %ID%#==20# goto cmd20
if %ID%#=="" goto menu
if %ID%#==34# goto menu

goto exit





::-------------------------------------------------------------------------
:: 路由列表
:cmd1
php artisan route:list
goto exit

::-------------------------------------------------------------------------
:: 创建控制器
:cmd2
::php artisan make:controller xxxxxController
php artisan make:controller xxxxxController
goto exit

::-------------------------------------------------------------------------
:: 创建模型带结构
:cmd3
::php artisan make:model --migration xxxxx
php artisan make:model --migration Post
goto exit

::-------------------------------------------------------------------------
:: 创建模型
:cmd4
php artisan make:model xxxxx
goto exit

::-------------------------------------------------------------------------
:: 创建数据迁移
:cmd5
php artisan make:migration create_xxxxx_table --create=xxxxx
goto exit

::-------------------------------------------------------------------------
:: 运行数据迁移
:cmd6
php artisan migrate
goto exit


::-------------------------------------------------------------------------
:: 运行种子数据
:cmd7
php artisan db:seed
goto exit

::-------------------------------------------------------------------------
:: 运行laravel
:cmd8
start "" "cmd /k php artisan serve --port=9096"
start "" "http://localhost:9096"
goto exit

::-------------------------------------------------------------------------
:: 创建一个空函数的控制器
:cmd9
::php artisan make:controller XxxxxController --plain
goto exit


::-------------------------------------------------------------------------
::
:cmd10
goto exit

::-------------------------------------------------------------------------
::
:cmd11
call tc.bat "C:\Users\ROVER\AppData\Roaming\npm"
goto exit


::-------------------------------------------------------------------------
::
:cmd12

goto exit

::-------------------------------------------------------------------------
::
:cmd13


goto exit

::-------------------------------------------------------------------------
::
:cmd14

goto exit

::-------------------------------------------------------------------------
::
:cmd15

goto exit


::-------------------------------------------------------------------------
::
:cmd16

goto exit


:runbat_args
start laravel-tools.bat 111

:exit
echo.
```


## 11. 准备 vue.js

npm install laravel-elixir --save-dev
npm install vue --save
npm install vue-router --save


## 12. 再次修改 gulpfile.js

```
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

```



## 11. 定义 routes


## 12. 定义 controller

