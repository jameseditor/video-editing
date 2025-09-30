# successful = False

# for number in range(3):
#     print("Attempt")
#     if successful:
#         print("Successful")
#         break
# else:
#     print("Attempted 3 times and fail")


# for x in range(5):
#     for y in range(1, 4):
#         print(f"({x},{y})")


# print(type(5))
# print(type(range(5)))


# item = "bread"

# for x in [item]:
#     print(item)


# number = 100
# while number > 0:
#     print(number)
#     number //= 2


# command = ""
# while command.lower() != "quit":
#     command = input(">")
#     print("ECHO", command)


# while True:
#     command = input(">")
#     print("ECHO", command)
#     if command.lower() == "quit":
#         break


# successful = False


count = 0
for x in range(1, 10):
    if x % 2 == 0:
        print(x)
        count += 1
print(f"We have {count} even numbers")
