def encryptRSA(message, n, e):
    # Convert the string message to a list of integers
    m = [ord(char) for char in message]

    # Use the public key (n, e) to encrypt each integer in the list
    c = [(char ** e) % n for char in m]

    # Combine the encrypted integers into a single integer
    encrypted = 0
    for i, char in enumerate(c):
        encrypted += char * (256 ** i)

    # Return the encrypted message as an integer
    return encrypted
    
# Part of Test 1
encrypted1 = encryptRSA("STOP", 2537, 13)
print("Encrypted Message:", encrypted1)

# Test 2
encrypted = encryptRSA("UPLOAD", 3233, 17)
print("Encrypted Message:", encrypted)
print("Excepted: 2545 2757 1211")
