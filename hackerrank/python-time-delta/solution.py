#!/bin/python3

import math
import os
import random
import re
import sys

from datetime import datetime

# Complete the time_delta function below.
def time_delta(t1, t2):
    fs = "%a %d %b %Y %H:%M:%S %z"
    u1 = datetime.strptime(t1, fs)
    u2 = datetime.strptime(t2, fs)
    td = u1 - u2
    return(str(round(abs(td.total_seconds()))))

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    t = int(input())

    for t_itr in range(t):
        t1 = input()

        t2 = input()

        delta = time_delta(t1, t2)

        fptr.write(delta + '\n')

    fptr.close()
