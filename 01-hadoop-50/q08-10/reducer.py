import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    suma = 0
    cuenta = 0

    for line in sys.stdin:

        key, val1, val2 = line.split("\t")
        val1 = float(val1)
        val2 = int(val2)

        if key == curkey:
            suma   += val1
            cuenta += val2
        else:

            if curkey is not None:
              prom = suma/cuenta
              if len(str(prom)) > 6:
                prom = str(prom)[0:6]
                sys.stdout.write("{}\t{}\t{}...\n".format(curkey, suma,prom))
              else:
                sys.stdout.write("{}\t{}\t{}\n".format(curkey, suma,prom))

            curkey = key
            suma = val1
            cuenta = val2
    prom = suma/cuenta
    if len(str(prom)) > 6:
    	prom = str(prom)[0:6]
    	sys.stdout.write("{}\t{}\t{}...\n".format(curkey, suma,prom))
    else:
    	sys.stdout.write("{}\t{}\t{}\n".format(curkey, suma,prom))