# Prompt user for three positive three-digit integers
num1 = int(input("Enter the first number: "))
num2 = int(input("Enter the second number: "))
num3 = int(input("Enter the third number: "))

# Calculate sum of digits for each number
sum1 = (num1 // 100) + ((num1 // 10) % 10) + (num1 % 10)
sum2 = (num2 // 100) + ((num2 // 10) % 10) + (num2 % 10)
sum3 = (num3 // 100) + ((num3 // 10) % 10) + (num3 % 10)

# Check which number has the smallest sum of digits
if sum1 <= sum2 and sum1 <= sum3:
    smallest_num = num1
    position = "1st"
elif sum2 <= sum1 and sum2 <= sum3:
    smallest_num = num2
    position = "2nd"
else:
    smallest_num = num3
    position = "3rd"

# Output the smallest number and its position
print(f"The {position} number ({smallest_num}) has the smallest sum of digits.")
