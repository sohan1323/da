#Given two integer numbers,
# write a Python program to return their product only if the product is equal to or lower than 1000.
# Otherwise, return their sum.

a = int(input("enter first number :"))
b = int(input("enter second number :"))

if (a*b) <= 1000:
    print("the product is :",a*b)
else:
    print("sum is :",a+b)