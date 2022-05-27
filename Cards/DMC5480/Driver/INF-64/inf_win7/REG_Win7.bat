@echo off

del /f /s /q %systemroot%\System32\drivers\windrvr6.sys

cd /d %~dp0

.\drv_v64\wdreg -inf .\drv_v64\windrvr6.inf install
