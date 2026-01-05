#Print characters present at an even index number

s = input("enter sample string")

print(f"original string is {s}")
print("printing only even index chars")

lst = list(s[::2])
print(lst)
