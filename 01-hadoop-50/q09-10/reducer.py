import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':
  cuenta = 0
  for line in sys.stdin:
    key, val1, val2, num = line.split("\t")
    cuenta += int(num)
    if cuenta < 7:
      print(val1 + '\t' + val2 + '\t' + str(int(key)))