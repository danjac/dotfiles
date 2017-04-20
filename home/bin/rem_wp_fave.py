#! /usr/bin/python
import subprocess
import os

cmd = "gsettings get org.gnome.desktop.background picture-uri"
p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE)
output, _ = p.communicate()

# strip file:/// part

src = output.decode()[8:-2]
os.remove(src)
# os.system("~/bin/rotate_bg.py")
