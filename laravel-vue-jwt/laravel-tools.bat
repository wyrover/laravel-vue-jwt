::-------------------------------------------------------------------------
:: laravel-tools.bat
:: author: wyrover
:: date:    2015-10-25
:: version: 0.1
:: description:
::      �Ѵ���������� laravel ��ĿĿ¼��ִ�к�ѡ��˵�ִ���������ڱ༭���޸ĺ�
::      �� console ���ڰ� ~ + Enter ����ѡ������ִ��


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
echo  ^|  1.·���б�                       2.����������                      ^|
echo  ^|  3.����ģ�ʹ�����Ǩ��             4.����ģ��                        ^|
echo  ^|  5.��������Ǩ��                   6.��������Ǩ��                    ^|
echo  ^|  7.������������                   8.����laravel                     ^|
echo  ^|  9.����һ���պ����Ŀ�����         10.                               ^|
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
:: ·���б�
:cmd1
php artisan route:list
goto exit

::-------------------------------------------------------------------------
:: ����������
:cmd2
::php artisan make:controller xxxxxController
php artisan make:controller xxxxxController
goto exit

::-------------------------------------------------------------------------
:: ����ģ�ʹ��ṹ
:cmd3
::php artisan make:model --migration xxxxx
php artisan make:model --migration Post
goto exit

::-------------------------------------------------------------------------
:: ����ģ��
:cmd4
php artisan make:model xxxxx
goto exit

::-------------------------------------------------------------------------
:: ��������Ǩ��
:cmd5
php artisan make:migration create_xxxxx_table --create=xxxxx
goto exit

::-------------------------------------------------------------------------
:: ��������Ǩ��
:cmd6
php artisan migrate
goto exit


::-------------------------------------------------------------------------
:: ������������
:cmd7
php artisan db:seed
goto exit

::-------------------------------------------------------------------------
:: ����laravel
:cmd8
start "" "cmd /k php artisan serve --port=9091"
start "" "http://localhost:9091"
goto exit

::-------------------------------------------------------------------------
:: ����һ���պ����Ŀ�����
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