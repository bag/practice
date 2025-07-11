#!/bin/python3

import math
import os
import random
import re
import sys



#
# Complete the 'fizzBuzz' function below.
#
# The function accepts INTEGER n as parameter.
#

def fizzBuzz(n):
    # Write your code here
    for i in range(1, n+1):
        print("FizzBuzz" if (i % 15) == 0 else ("Buzz" if (i % 5) == 0 else ("Fizz" if (i % 3) == 0 else i)))
        
if __name__ == '__main__':
    n = int(input().strip())

    fizzBuzz(n)
