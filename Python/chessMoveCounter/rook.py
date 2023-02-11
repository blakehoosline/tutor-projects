print("Enter the coordinates of the initial square:")
initial_square = input().split()
initial_x = int(initial_square[0])
initial_y = int(initial_square[1])

print("Enter the coordinates of the destination square:")
destination_square = input().split()
destination_x = int(destination_square[0])
destination_y = int(destination_square[1])

if initial_x == destination_x or initial_y == destination_y:
    print("The minimum number of squares the Rook will need to traverse is 1.")
else:
    print("The minimum number of squares the Rook will need to traverse is 2.")
