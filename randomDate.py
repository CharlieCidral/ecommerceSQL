import random
from datetime import datetime, timedelta

def generate_random_date(start_date, end_date):
    time_between_dates = end_date - start_date
    days_between_dates = time_between_dates.days
    random_number_of_days = random.randrange(days_between_dates)
    random_date = start_date + timedelta(days=random_number_of_days)
    return random_date

start_date_str = '2023-08-16'
end_date_str = '2023-09-17'

start_date = datetime.strptime(start_date_str, '%Y-%m-%d')
end_date = datetime.strptime(end_date_str, '%Y-%m-%d')

for _ in range(4):
    random_date = generate_random_date(start_date, end_date)
    formatted_random_date = random_date.strftime('%Y-%m-%d')
    print(formatted_random_date)
