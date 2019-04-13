@echo off
setlocal EnableDelayedExpansion
set kindlegen=d:\Books\KindleTools\kindlegen.exe 
set workdir=D:\Books\XXXX
set title_prefix=XXXX
   for /f "delims=" %%a in (' dir %workdir% /b /a:d ') do (
     
      echo name is "%%~nxa"
      set new_name=%title_prefix%_%%~nxa
      python .\kcc-c2e.py --profile=KPW --manga-style --two-panel --format=EPUB --title=%title_prefix%_%%~nxa --output=%workdir%\%title_prefix%_%%~nxa.epub %workdir%\%%~nxa
      %kindlegen% -verbose -locale zh -dont_append_source %workdir%\%title_prefix%_%%~nxa.epub
   )
