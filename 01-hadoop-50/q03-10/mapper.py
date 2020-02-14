import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
  for line in sys.stdin:
    # Setting some defaults
    key = ""
    val = ""
    line = line.strip()
    splits = line.split(",")
    key = splits[1]
    val = splits[0]
    #print(str(len(splits)) + ' :: ' + line)
    #print(key + '\t' + '1')
    sys.stdout.write("{}\t{}\n".format(key,val))