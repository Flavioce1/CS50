while True:
    try:
        height = int(input("Height: "))
        if 1 <= height <= 8:
            break
    except ValueError:
        pass

for i in range(1, height+1):
    space = " " * (height-i)
    hashes = "#" * i
    print(space + hashes)
