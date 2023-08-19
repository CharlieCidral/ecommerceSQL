import random

def generate_random_prices(num_prices, min_value, max_value):
    prices = []
    for _ in range(num_prices):
        price = round(random.uniform(min_value, max_value), 2)
        prices.append(price)
    return prices

num_prices = 7
min_price = 10.0
max_price = 100.0

random_prices = generate_random_prices(num_prices, min_price, max_price)
for price in random_prices:
    print(price)
