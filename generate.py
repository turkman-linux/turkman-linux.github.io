import os
import sys
from rst2html import rst2html


def txt2html(path):
    template = open("res/template.html","r").read()
    template = template.replace("@CONTENT@",rst2html(open(path,"r").read())[0])
    template = template.replace("@TITLE@",open("res/title.html","r").read())
    return template

for f in os.listdir("src"):
    open(f.replace("rst","html"),"w").write(txt2html("src/{}".format(f)))