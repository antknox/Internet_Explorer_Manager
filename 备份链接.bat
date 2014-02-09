@echo off

titile 备份链接.bat

:exist→last&del&rd→last:
::判断last是否存在，存在删除last文件夹；不存在，创建last文件夹
if exist last goto DE
goto BC
:DE
::删除last文件夹
del /f /a /q .\last\*.*
rd /s /q .\last
:BC

:exist→last&md→last:
::判断last是否存在，不存在，创建last&last\Links文件夹
if not exist last md last\Links

:copy→Favorites→.\last:
::复制 用户文件夹下的收藏夹的所有链接到当前目录下的last文件夹下
xcopy /e /h %UserProfile%\Favorites .\last /y

:7z→.\last→xx_xx_Favorites.7z:
::压缩 当前目录下的last并创建以当前日期_时间_links.7z为名的7z压缩包
7z.exe a .\"%date:~0,4%-%date:~5,2%-%date:~8,2%_%time:~0,2%-%time:~3,2%_Favorites".7z .\last

:exit:
exit