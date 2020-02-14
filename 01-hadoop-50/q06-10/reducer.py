import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    maxi = None
    mini = None

    for line in sys.stdin:

        key, val = line.split("\t")
        val = float(val)

        if key == curkey:
          if val > maxi:
            maxi = val
          if val < mini:
            mini = val
        else:
            if curkey is not None:
                sys.stdout.write("{}\t{}\t{}\n".format(curkey, maxi, mini))

            curkey = key
            maxi = val
            mini = val

    sys.stdout.write("{}\t{}\t{}\n".format(curkey, maxi, mini))