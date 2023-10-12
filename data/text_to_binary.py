# filename: text_to_binary.py

def text_to_binary(filename):
    with open(filename, 'r') as file:
        content = file.read()
        for char in content:
            # Convert each character to binary and remove the '0b' prefix
            binary_repr = bin(ord(char))[2:]
            # Ensure it's an 8-bit representation
            print(f'{binary_repr:08}', end=' ')

if __name__ == "__main__":
    import sys
    if len(sys.argv) != 2:
        print("Usage: python text_to_binary.py <filename.txt>")
        sys.exit(1)

    text_to_binary(sys.argv[1])
