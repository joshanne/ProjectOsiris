@echo off
REM sets user environment variable so "GIT for WINDOWS" can
REM use the PUTTY SSH Agent instead of manually adding key
setx GIT_SSH="C:\Program Files\PuTTY\plink.exe"