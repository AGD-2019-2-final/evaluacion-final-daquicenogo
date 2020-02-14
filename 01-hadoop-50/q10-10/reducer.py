import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    letras = None

    for line in sys.stdin:

        key, val = line.split("-")
        val = str(int(val)) + ","
        if key == curkey:
            letras += val
        else:

            if curkey is not None:

                sys.stdout.write("{}\t{}\n".format(curkey, letras[:-1]))

            curkey = key
            letras = val
    sys.stdout.write("{}\t{}\n".format(curkey, letras[:-1]))