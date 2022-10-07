# Project Review

## Overview
Pewlett Hackard is anticipating an increase in the number of individuals within their organization retiring within the next few years.  In order to plan for this, the organization has requested a review of employee records to identify the active employees who may be retiring, which departments may be most impacted, titles that may see the highest levels of retirement and current employees who may be eligible to participate in a mentorship program. 

Data was provided by Pewlett Hackard in the form of CSV files that contain: 
- Employees
- Departments
- Department Managers
- Employee Departments
- Salaries
- Titles 

This data was reviewed to provide the following: 
- Retirement Eligible Employees and Titles
- Retirement eligible employees and their current title
- Count of Retirement Eligible employee titles 
- Employees eligible to be considered for mentorship 

Queries used to determine this information can be found in this file: 
[Employee Database Challenge] (https://github.com/klbrabec/Wk_7_BC_Challenge_Employee_Analysis/blob/main/SQL_Files/Employee_Database_Challenge..sql)

This information will be used by Pewlett Hackard to plan for future business activities. 

## Results
### Employee Impact 
[Retirement Titles](https://github.com/klbrabec/Wk_7_BC_Challenge_Employee_Analysis/blob/main/data_files/Retirement_titles.csv)
- The total number of employees that are eligible to retire:  
  - The initial filtering of records returned 133776 records. However, this overinflates the numbers of retirement eligible employees.  
- Further filtering of records for active employees and their current title returned 72458 records.  (a 54.2% reduction in records)
  This filtering accounts for: 
  - People being promoted or changing roles during their tenure with Pewlett Hackard 
  - People who have previously separated from the company 

### Title Impact 
[Retiring Titles](https://github.com/klbrabec/Wk_7_BC_Challenge_Employee_Analysis/blob/main/data_files/retiring_titles.csv)
- The total number of titles eligible for retirement: 

|Title|Count|
|---|---|
|Senior Engineer|25916|
|Senior Staff|24926|
|Engineer|9285|
|Staff|7636|
|Technique Leader|3603|
|Assistant Engineer|1090|
|Manager|2|

## Mentorship Planning 
[Mentorship Eligibility](https://github.com/klbrabec/Wk_7_BC_Challenge_Employee_Analysis/blob/main/data_files/mentorship_eligibility.csv)
- The total number of employees eligilble to participate in the proposed mentorship program is: 1940


## Summary 
### Retiring Employees 
Employees with a birthdate between 1952 and 1955 are considered eligible for retirement.  While the number of employees impacted here is substantial (72458) not all employees may born within this date range will choose to retire.  Additionally, employees that are still active and born prior to 1952 or after 1955 may choose to retire based on factors that are outside of the scope of this report. (Currently there are no employees with a birthdate on or before 1/1/1952 in the provided data set.) Pewlett Hackard should consider having individual discussions with team members in order to adjust planning if needed. 

### Retiring Titles 
The larger number of titles that are eligible for retirement are in the 'senior' category (Senior Engineer -25916 and Senior Staff - 24926)  There is a substantial amount of 'institutional knowledge' that will be lost when these team members depart, and they should all be encouraged to participate in the mentorship program to pass that knowledge on to team members who will remain.  However, knowing that participation in these coaching programs is not something that everyone is comfortable with, alternative methods of knowledge documentation and transfer should be considered to enable a smoother transition. 

### Mentorship Program 
Currently, there are 1940 employees that have been identified as being eligible to participate in the mentorship program being developed.  However, there are considerably more employees that are eligible for retirement.  The organization may want to consider expanding the eligibility definition for the mentorship program in order to enable more employees to step into the roles vacated by retiring team members.  

### Staffing Impact 
The impact of departing staff will vary by departments.  Some will be able to redirect team activities to function in a more streamlined manner.  Some could be folded into other teams to combine work on common projects.  However, it is important to realize that the departure of team members, even when voluntary will cause a negative impact on overall team morale.    This can be done by allowing retiring employees to 'phase out' of their role, by stepping down from more high pressure, high profile roles into more 'support' roles. This can also facilitate the knowledge transfer and retention goals in the mentorship program.  It is recommended that at least 50% of all roles that are vacated through retirement are backfilled, with the understanding that restructuring teams and business groups may also allow for new business models. 

### Financial Implications 
[Retiring Salaries](https://github.com/klbrabec/Wk_7_BC_Challenge_Employee_Analysis/blob/main/data_files/retirement_salaries.csv)

One thing that should be considered as part of retirement mitigation planning is the total amount of salaries that will be no longer paid to employees that retire.  Adding the sum of current salaries to the count of titles that are retiring shows the following: 

|Title|Count|Salary|AVG Salary|
|---|---|---|---|
|Senior Engineer|25,916|1,255,837,996|48458|
|Senior Staff|24,926|1,454,372,793|58347|
|Engineer|9,285|450,389,534|48507|
|Staff|7,636|445,503,817|58342|
|Technique Leader|3,603|173,784,813|48233|
|Assistant Engineer|1,090|52,733,484|48379|
|Manager|2|119,255|59612|
|TOTALS| 72,458|3,832,741,608|52,896|

It is understood that these salaries are due to the time employees have worked with the organization.  A portion of these savings will be put into salaries of new employees, however it is recommended that some should also be earmarked for training and staff improvement plans to mitigate the institutional knowledge loss.  

### Expanding Mentorship Program 
The current mentorship program eligiblity includes employees who were born in 1965.  This subset includes 1940 employees, or approximately 1% of the entire employee populated.  It is shortsighted to only equip employees of a certain age range with the tools to adapt to the loss of a significant portion of the employee population, as team members continue to age and retire, the organization will continue to deal with knowledge loss.  

It is recommended to modify the mentorship program to target people by hire date rather than birth date. For example, modifying the selection criteria to include employees hired between 1985 and 1995, that are not part of the retirement target group, 155943 employees become eligible for mentorship.  In order to accomodate the employees that are within 3 years of retirement, expanding the birth date range to 1958 reduces the number of eligible employees to 104372, which is still substantial.  (It is recommended that the employees in the expanded retirement age group be consulted to become mentors as well)

In addition to widening the pool for employees eligible to be mentored for future growth, changing the selection criteria from age based to hiring date based is strongly encouraged to reduce any potential age discrimination implications.  People enter the work force at various ages and points in life.  Age is considered a protected class and should not be used for eligiblity for programs such as this. 
