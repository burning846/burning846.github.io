@echo off

echo 0.��װ  1.����(8899)  2.����  3.����
set input=
set /p input=������ѡ��:

if "%input%" == "0" call :installFunc
if "%input%" == "1" call :startFunc  8899
if "%input%" == "2" call :buildFunc
if "%input%" == "3" call :deployFunc

goto :eof

:installFunc
call bundle install
goto :eof

:startFunc
call bundle exec jekyll serve --watch --host=0.0.0.0 --port=%1%
goto :eof

:buildFunc
call bundle exec jekyll build --destination=dist
goto :eof

:deployFunc
REM ����
call :buildFunc
REM �л�����������Ŀ¼
D:
cd D:\vscode-work-space\workspace-go\blog-deploy
go run main.go
REM �ص��ű�Ŀ¼
%~d0
cd %~dp0
goto :eof