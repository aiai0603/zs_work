import dis
def f(x):
     if (x == 0): 
         return 1
     elif (x == 1): 
        return 1
     else :
         return f(x - 1) + f(x - 2)

dis.dis(f)