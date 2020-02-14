import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
  for line in sys.stdin:
    key = ""
    val = ""
    line = line.strip()
    splits = line.split(" ")
    key = splits[0] + '-' + splits[6].zfill(3)
    val = splits[3]
    sys.stdout.write("{}\t{}\n".format(key,val))