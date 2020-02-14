import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
## Esta funcion reduce los elementos que
## tienen la misma clave
##

if __name__ == '__main__':

    for line in sys.stdin:

        key = line.split("\t")[0]
        val = line[:-1].split("\t")[1]
        sys.stdout.write("{},{}\n".format(val, key))