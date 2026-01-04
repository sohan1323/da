import numpy as np

# print(np.__version__)           # checks version

# array = np.array([1,2,3,4])
# doubled_array = array * 2
# print(array)
# print(doubled_array)
# print(type(array))
#################################################################################################################################################################################################################
# array = np.array(['A'])
# array2 = np.array([['A','B','C'],['D','E',' ']])        # array must contain homogeneous elements (i.e here each subarray must contain equal number of elements), here ' ' is used as placeholder
# print(array)
# print(array2)
# print(array.ndim)                   # dimension of array
# print(array2.ndim)
#
# print(array2.shape)                 # depth,no.of rows, no. of columns , ...

# print(array2[0,2])                    # this is multidimensional indexing (in python we use chain indexing [0][1])

# word = array2[0,0] + array2[0,2] + array2[1,1]      # string concat
# print(word)
######################################################################################################################################################################################
# array = np.array([[1,2,3,4],
#                   [5,6,7,8],
#                   [9,10,11,12],
#                   [13,14,15,16]])

# row selection
# print(array[0:2])       # select row 0 & 1
# print(array[::-1])      # print reverse order

# column selection
# print(array[:, 0])        # print 1st column
# print(array[:, -1])       # print last column
# print(array[:, 0:3])      # print 1st 3 column
# print(array[:, ::2])      # print every 2nd column
# print(array[0:2, 0:2])    # first two rows , first two columns
###################################################################################################################################

# scalar arithmetic

# array = np.array([1,2,3])
# print(array + 1)
# print(array - 2)
# print(array * 3)
# print(array / 4)
# print(array ** 5)
############################################################################################################################

# vectorized math function

# array = np.array([1.01,2.56,3.98])

# print(np.sqrt(array))
# print(np.round(array))
# print(np.floor(array))
# print(np.ceil(array))
# print(np.pi)

#practice question calculate circle area from radii
# radii = np.array([1, 2, 3])
# print(np.pi * radii ** 2)
############################################################################################################

# Element-wise arithmetic

# array1 = np.array([1, 2, 3])
# array2 = np.array([4, 5, 6])
#
# print(array1 + array2)
# print(array1 - array2)
# print(array1 * array2)
# print(array1 / array2)
# print(array1 ** array2)

#######################################################################################################################

# comparison operators

# scores = np.array([91, 55, 100, 73, 82, 64])
#
# print(scores == 100)
# scores[scores < 60] = 0
# print(scores)

########################################################################################################################

# broadcasting - allows NumPy to perform operations on arrays
#                with different shapes by virtually expanding dimensions
#                so they can match larger array's shape
# rule -        The dimensions have the same size
#               OR
#               One of the dimensions has a size of 1
# ex:           (1,3) and (4,3)  allowed
#               (3,4) and (4,3) not allowed

# array1 = np.array([[1, 2, 3, 4]])
# array2 = np.array([[1], [2], [3], [4]])
#
# print(array1.shape)
# print(array2.shape)
#
# print(array1 * array2)
########################################################################################################################

# aggregate functions - summarizes data and typically return a single value

# array = np.array([[1, 2, 3, 4, 5],
#                   [6, 7, 8, 9, 10]])
# print(np.sum(array))
# print(np.mean(array))
# print(np.std(array))
# print(np.var(array))
# print(np.median(array))
# print(np.min(array))
# print(np.max(array))
# print(np.argmax(array))
# print(np.argmin(array))
# print(np.sum(array, axis=0))        # sum by column
# print(np.sum(array, axis=1))        # sum by row

########################################################################################################################

# filtering = process of selecting elements from an array that match a given condition

# ages = np.array([[21, 17, 19, 20, 16, 30, 18, 65],
#                  [39, 22, 15, 99, 18, 19, 20, 21]])

# teenagers = ages[ages < 18]
# adults = ages[(ages >= 18) & (ages < 65)]
# print(teenagers)
# print(adults)

# ages = np.where(ages >= 18, ages, 0)     # syntax :  np.where(condition, array, fill_value)
# print(ages)

# where preserves array structure unlike boolean indexing which flattens the array

########################################################################################################################

# random numbers

# rng = np.random.default_rng(12)                     # 12 is seed to produce same result
# print(rng.integers(1, 10, (3,2)))                   # 3rd arg is size means dimension of output

# for boolean number
# np.random.seed(1)                                     # to set seed
# print(np.random.uniform(low=-1, high=1, size=5))      # (start, end excl., size)

# array shuffle
# rng = np.random.default_rng()
# array = np.array([1, 2, 3, 4, 5])
# rng.shuffle(array)
# print(array)

# random choice
rng = np.random.default_rng()

fruits = np.array(["apple", "banana", "orange", "coconut", "pineapple"])

fruit = rng.choice(fruits, 3)
print(fruit)