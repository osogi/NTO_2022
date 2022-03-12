from os import listdir
import os 



onlyfiles = [f for f in listdir()]

prefix = ".encr"

def decrtpt_file(filename):
    out = filename[:-len(prefix)]
    os.system("openssl enc -aes-256-cbc -d -a -in "+filename+"  -out "+out+" -pass pass:45BC4F0B18 -iv 82262272B0DA75FF6A6613864AF3AEBC")



for f in onlyfiles:
    if(f.count(prefix)>0):
        decrtpt_file(f)
