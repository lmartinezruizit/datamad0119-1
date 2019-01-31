"""
The code below generates a given number of random strings that consists of numbers and 
lower case English letters. You can also define the range of the variable lengths of
the strings being generated.

The code is functional but has a lot of room for improvement. Use what you have learned
about simple and efficient code, refactor the code.
"""

import string
from numpy import random

def RandomStringGenerator(l=12, a=list(string.ascii_lowercase)+list(string.digits)):

  s = random.choice(a,l)
  return ''.join(s)

def BatchStringGenerator(n, a=8, b=12):
  r = []
  import sys
  if a>b:
    sys.exit('Incorrect min and max string lengths. Try again.')
  for i in range(n):  
    r.append(RandomStringGenerator(random.choice(range(a, b)) if a < b else a))
  return r  
 
a = input('Enter minimum string length: ')
b = input('Enter maximum string length: ')
n = input('How many random strings to generate? ')

print(BatchStringGenerator(int(n), int(a), int(b)))