matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

print(f"access matrix 0,2 index: {matrix[0][2]}")

### Sum of all elements in the matrix
sum = 0
for row in matrix:
    for element in row:
        sum += element
print(f"sum of all elements in the matrix: {sum}")

### Sum of diagonal elements in the matrix

sum = 0
for i in range(len(matrix)):
    sum += matrix[i][i]
print(f"sum of diagonal elements in the matrix: {sum}")

sum = 0
for row in matrix:
    for element in row:
        if row.index == element.index:
            sum += element
print(f"sum of diagonal elements in the matrix: {sum}")
