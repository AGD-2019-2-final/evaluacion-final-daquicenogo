import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
  for line in sys.stdin:
    # Setting some defaults
    purpose = ""
    amount = ""
    line = line.strip()
    splits = line.split(",")
    purpose = splits[3]
    amount = splits[4]
    #print(str(len(splits)) + ' :: ' + line)
    #print(key + '\t' + '1')
    if purpose != "purpose":
      sys.stdout.write("{}\t{}\n".format(purpose,amount))