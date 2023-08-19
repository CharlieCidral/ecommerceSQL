import random

def generate_sequence(num_items, num_digits):
    sequence = []
    for _ in range(num_items):
        item = ''.join(str(random.randint(0, 9)) for _ in range(num_digits))
        sequence.append(item)
    return sequence

num_items = 1
num_digits = 15

sequence = generate_sequence(num_items, num_digits)
for item in sequence:
    print(item)
