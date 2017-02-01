#! /usr/bin/python
import subprocess
import os
import shutil

cmd = "gsettings get org.gnome.desktop.background picture-uri"
p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE)
output, _ = p.communicate()

# strip file:/// part

src = output.decode()[8:-2]
name = os.path.basename(src)
dst = os.path.join(os.path.expanduser("~"), "Pictures", "favorites", name)

shutil.copyfile(src, dst)
