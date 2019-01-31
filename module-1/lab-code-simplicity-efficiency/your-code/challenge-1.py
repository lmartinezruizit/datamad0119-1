import os
"""
This is a dumb calculator that can add and subtract whole numbers from zero to five.
When you run the code, you are prompted to enter two numbers (in the form of English
word instead of number) and the operator sign (also in the form of English word).
The code will perform the calculation and give the result if your input is what it
expects.

The code is very long and messy. Refactor it according to what you have learned about
code simplicity and efficiency.
"""
print('Welcome to this calculator!\nIt can add and subtract whole numbers from zero to five')

def in_put():
    a = input('Please choose your first number (zero to five): ')
    b = input('What do you want to do? plus or minus: ')
    c = input('Please choose your second number (zero to five): ')
    return a,b,c
a,b,c=in_put()

dict={'negative five':-5,'negative four':-4,'negative three':-3,'negative two':-2,'negative one':-1,'zero':0,'one':1,'two':2,'three':3,'four':4,'five':5}

while (a not in dict or c not in dict or (b != 'plus' and b !='minus')):
    print("I am not able to answer this question. Check your input.")
    clear=lambda: os.system('clear')
    clear()
    in_put()
    
res=dict.get(a)+dict.get(c) if b=='plus' else dict.get(a)-dict.get(c)
print(a,b,c,"equals",str([k for k, v in dict.items() if v == res][0])) 

print("Thanks for using this calculator, goodbye :)")
