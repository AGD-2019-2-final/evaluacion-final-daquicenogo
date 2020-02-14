import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
  for line in sys.stdin:
    key = ""
    val1 = ""
    val2 = ""
    line = line.strip()
    splits = line.split(" ")
    key = splits[6].zfill(3)
    val1 = splits[0]
    val2 = splits[3]
    sys.stdout.write("{}\t{}\t{}\t1\n".format(key,val1,val2))