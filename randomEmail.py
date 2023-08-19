import random
import string

def generate_random_name(length):
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for _ in range(length))

def generate_random_email():
    random_name = generate_random_name(10)  # Change the length as needed
    domain = 'email.com'
    return f'{random_name}@{domain}'

num_emails = 6

for _ in range(num_emails):
    random_email = generate_random_email()
    print(random_email)
