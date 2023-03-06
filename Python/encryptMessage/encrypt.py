def encryptRSA(message, n, e):
    # Convert message to ASCII representation
    ascii_vals = [ord(c) for c in message]

    # Convert each ASCII value to a string and join them together
    plaintext = ''.join(str(val) for val in ascii_vals)

    # Split the plaintext into blocks of length equal to the number of digits in n
    block_size = len(str(n))
    blocks = [plaintext[i:i+block_size] for i in range(0, len(plaintext), block_size)]

    # Pad the last block if it's shorter than the others
    last_block = blocks[-1].zfill(block_size)
    blocks[-1] = last_block

    # Encrypt each block using RSA algorithm
    encrypted_blocks = []
    for block in blocks:
        int_block = int(block)
        encrypted_block = pow(int_block, e, n)
        padded_encrypted_block = str(encrypted_block).zfill(block_size)
        encrypted_blocks.append(padded_encrypted_block)

    # Return encrypted message as a string of space-separated values
    return ' '.join(encrypted_blocks)

# Test cases
encrypted1 = encryptRSA("STOP", 2537, 13)
print("Encrypted Message 1:", encrypted1)
print("Expected Message 1: 2081 2094")

encrypted2 = encryptRSA("HELP", 2537, 13)
print("Encrypted Message 2:", encrypted2)
print("Expected Message 2: 0981 0461")

encrypted3 = encryptRSA("STOPS", 2537, 13)
print("Encrypted Message 3:", encrypted3)
print("Expected Message 3: 2081 2182")

encrypted4 = encryptRSA("UPLOAD", 3233, 17)
print("Encrypted Message 4:", encrypted4)
print("Expected Message 4: 2545 2757 1211")
