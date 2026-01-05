#Write Python code to iterate through the first 10 numbers and,
# in each iteration, print the sum of the current and previous number.

r = int(input("enter a range :"))

print(f"Printing current and previous number sum in a range({r})")

sm = 0

for i in range(r):

    print(f"current number {i} Previous number {i-1} Sum is {i+i-1}")