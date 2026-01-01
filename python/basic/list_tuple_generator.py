struct_size = int(input("enter size of list and tuple: "))

num_list = []


for i in range(struct_size):
    a = int(input("enter the number: "))
    num_list.append(a)

print("List is: ",num_list)
print("tuple is: ",tuple(num_list))