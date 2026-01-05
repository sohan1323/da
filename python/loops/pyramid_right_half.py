size = int(input("enter size of pyramid"))

for i in range(1,size+1):
    for j in range(1,i+1):
        print(f"{j}",end=" ")
    print()