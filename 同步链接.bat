@echo off

title 同步链接.bat

:del&rd→Favorites\*&*.*
del /f /a /q %UserProfile%\Favorites\*.*
rd /s /q %UserProfile%\Favorites\

:exist→Favorites&md→Favorites\Links:
if not exist %UserProfile%\Favorites md %UserProfile%\Favorites
if not exist %UserProfile%\Favorites\Links md %UserProfile%\Favorites\Links

:xcopy→.\last→Favorites:
::复制当前目录下的last文件夹下的所有文件到用户文件夹下的收藏夹
xcopy /e /h .\last %UserProfile%\Favorites /y

:exit:
exit