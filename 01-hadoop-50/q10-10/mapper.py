import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
  for line in sys.stdin:
    key = ""
    val = ""
    line = line.strip()
    splits = line.split("\t")
    val = splits[0].zfill(2)
    for letter in splits[1].split(","):
      key = letter
      sys.stdout.write("{}-{}\n".format(key,val))     