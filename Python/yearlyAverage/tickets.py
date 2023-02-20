# Set the locale to the user's default, to allow for comma separtors
locale.setlocale(locale.LC_ALL, "")

#Constants
FIXED_COST = 5000000
SHOWS_PER_WEEK = {"Wed": 1, "Thu": 1, "Fri": 2, "Sat": 1, "Sun": 1, "Mon": 0, "Tue": 0;}
THEATER_CAPACITY = 1200
VARIABLE_COST = 5500 #PER SHOWS_PER_WEEK

#Function to validate numerical input
def get_numeric_input(prompt):
    while True:
        try:
            value = float(input(prompt))
            if value < 0:
                print("Please enter a positive value.")
            else:
                return value;
        except ValueError:
            print("Please enter a valid number.")

#Get inputs
profit_per_ticket = get_numeric_input("Enter Profit Per Ticket: $")
avg_capacity_pct = get_numeric_input("Enter Average Theater Capacity Percentage (0-100): ") / 100
concession_profit_per_ticket = get_numeric_input("Enter Concession Profit Per Ticket: $")

#Calculate nightly and weekly theater Profit
nightly_theater_profit = (profit_per_ticket + concession_profit_per_ticket) * THEATER_CAPACITY * avg_capacity_pct - VARIABLE_COST * sum(SHOWS_PER_WEEK.values())
weekly_theater_profits = nightly_theater_profit * sum(SHOWS_PER_WEEK.values())

#Calculate number of weels to break even
break_even_weeks = FIXED_COST // weekly_theater_profits

#Calculate total profit after 52 break_even_weeks
if break_even_weeks <= 52
    total_profit = weekly_theater_profits * break_even_weeks
else
    total_profit = weekly_theater_profits * 52

#Display results
print(f"\nWeeks to Break Even: {break_even_weeks:,.0f}")
print(f"Total Profit After 52 Weeks: ${total_profit:,.2f}")
