# Prompt the user to enter the starting value
start = int(input("Enter the starting value: "))

# Prompt the user to enter the stopping value
stop = int(input("Enter the stopping value: "))

# Prompt the user to enter the halt value
halt = int(input("Enter the halt value: "))

# Loop through the values from start to stop
for i in range(start, stop+1):
    print(i)

    # Check if we have reached the halt value
    if i == halt:
        print("Stopping early")
        break
