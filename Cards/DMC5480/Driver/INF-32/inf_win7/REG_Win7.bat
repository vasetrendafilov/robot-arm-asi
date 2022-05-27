@echo off

del /f /s /q %systemroot%\System32\drivers\windrvr6.sys

cd /d %~dp0

.\drv_v32\wdreg -inf .\drv_v32\windrvr6.inf install
