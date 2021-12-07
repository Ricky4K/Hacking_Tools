@echo off
title Discord Crash Video Creator

color c
echo ========================= NOTE =========================
echo This script creates videos that crash Discord/Chrome.
echo Hardware acceleration must be enabled for it to work.
echo Crash videos will get you banned in some Discord groups!
echo.
echo FFmpeg needs to be installed for this to work:
echo https://youtu.be/qjtmgCb8NcE
echo ========================================================
echo.
pause

WHERE ffmpeg
IF %ERRORLEVEL% NEQ 0 echo ffmpeg wasn't found. Please make sure it is installed correctly. && pause && exit
color 7
cls

set /p filepath=Enter path to video file (or drag and drop the video here): 

set timestamp=1
set /p timestamp=How many seconds in should the video crash?: 
echo.

echo Getting video duration...
ffprobe -i %filepath% -show_entries format=duration -v quiet -of csv="p=0" > tmpfile
set /p duration= < tmpfile
del tmpfile

echo Splitting video...
ffmpeg -i %filepath% -ss 0 -t %timestamp% part1.mp4
ffmpeg -i %filepath% -ss %timestamp% -t %duration% part2.mp4

echo Changing video properties...
ffmpeg -i part2.mp4 -pix_fmt yuv444p part2_new.mp4


echo Creating file list...
echo file part1.mp4> file_list.txt
echo file part2_new.mp4>> file_list.txt

echo Creating output file...
ffmpeg -f concat -safe 0 -i file_list.txt -codec copy output.mp4

echo Cleaning up old files...
del part1.mp4
del part2.mp4
del part2_new.mp4
del file_list.txt

color a
echo Output video created! It is located at "%CD%\output.mp4"
echo.
pause