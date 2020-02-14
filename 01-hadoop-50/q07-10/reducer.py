import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    for line in sys.stdin:

        key1 = (line.split("\t")[0]).split("-")[0]
        key2 = (line.split("\t")[0]).split("-")[1]
        key2 = int(key2)
        val = line[:-1].split("\t")[1]
        print(key1 + '   ' + val + '   ' + str(key2))