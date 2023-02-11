CLS
PRINT "Payroll Calculator"
PRINT
INPUT "Enter Employee Name: ", employee_name$
INPUT "Enter Hours Worked: ", hours_worked
INPUT "Enter Rate of Pay: ", rate_of_pay

' Calculate Gross Pay
gross_pay = hours_worked * rate_of_pay

' Calculate Taxes Withheld
tax_rate = 0.28
taxes_withheld = gross_pay * tax_rate

' Calculate Net Pay
net_pay = gross_pay - taxes_withheld

' Display results
CLS
PRINT "Payroll Results"
PRINT
PRINT "Employee Name: ", employee_name$
PRINT
PRINT "Hours Worked: ", hours_worked
PRINT "Rate of Pay: ", using("##0.00", rate_of_pay)
PRINT
PRINT "Total Gross Pay: $", using("##0.00", gross_pay)
PRINT "Taxes Withheld: $", using("##0.00", taxes_withheld)
PRINT "Total Net Pay: $", using("##0.00", net_pay)

END
