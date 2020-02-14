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
    key = splits[0]
    val = splits[6]
    sys.stdout.write("{}\t{}\t1\n".format(key,val))
