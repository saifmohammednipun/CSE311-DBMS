> The relational schema for student course registration are as follows
> Parents-S(F-NID, M-NID, Sid, F-name, M-name, street, city, income)
> Student (Sid, name, street, city. Mobile, email, CGPA, age, tot-cred, dept-id)
> Takes (course-id, Sid, semester, year, gradepoint)
> Course (course-id, title, credit-hour)
> Parents-T(F-NID, M-NID, Tid, F-name, M-name, street, city, income)
> Teacher (Tid, name, designation, street, city, Mobile, email, salary, date-of-birth, dept-id)
> Teach (course-id, Tid, semester, year, remuneration)

--------------------------------------------

Q. 1: Write SQL expression to find Sid, F-NID, M-NID, mobile, email and age of all
students whose tot-cred is greater than or equal to 130.

```sql
Select s.Sid, p.F-NID, p.M-NID, s.mobile, s.email, s.age
From Students s join Parents-S p on s.Sid = p.Sid
Where s.sid IN (Select sid 
               From Student
               Where tot-cred >= 130);
```

Q. 2: Write SQL expression to find F-NID, Sid, course-id and title for all students whose
parents live in Dhaka.

```sql
Select p.F-NID, s.Sid, t.course-id, c.title
From Parents-S p join Student s on p.Sid = s.Sid
                 join Takes t on s.Sid = t.Sid
                 join Course c on t.course-id = c.course-id
Where p.Sid IN (Select Sid
                 From Parents-S
                 Where city = 'Dhaka');
```

Q. 3: Write SQL expression to find Sid, name, street, city and average gradepoint of each student.

```sql
Select s.Sid, s.name, s.street, s.city, avg(t.gradepoint)     
From Student s
Group by sid;
```

Q. 4: Find city and street wise average, maximum and minimum income of parents (of students) 
living in Dhaka or Rajshahi and average income higher than 500000.

```sql
Select city, street, avg(income), max(income), min(income)
From Parents-S
Where P-NID In ( Select P-NID
                 From Parents-S 
                 Where city = 'Dhaka' or 'Rajshahi'
                 Group by city, street
                 Having avg(income) > 500000);
```

Q. 5: Write SQL expression to find Sid, name, course-id and title of all students who have
taken any course (course-id) taken by Abid in Fall 2018.

```sql
Select S.Sid, S.name, T.course-id, C.title
From Student S join Takes T on S.Sid = T.Sid
              join Course C on T.course-id = C.course-id
Where T.course-id IN (Select course-id
                      From Takes
                      Where Sid = (Select Sid
                                   From Student
                                   Where name = 'Abid')
                      And semester = 'Fall'
                      And year = 2018);
```
Q. 6: Write SQL expression to find Sid, name, course-id and title of all students who have
taken all courses taken by Abid in Fall 2018.

```sql
Select S.Sid, S.name, T.course-id, C.title
From Student S join Takes T on S.Sid = T.Sid
              join Course C on T.course-id = C.course-id
Where Not Exists ( Select course-id 
                   From Takes
                   Where Sid = (Select Sid
                               From Student
                               Where name = 'Abid')
                   And semester = 'Fall'
                   And year = 2018

                   Except

                   Select course-id
                   From Takes
                   Where Sid = S.Sid
                   And semester = T.semester
                   And year = T.year);
```
Q. 7: Increase salary by 10% of all teachers who taught 3 credit courses in Spring 2024.

```sql
Update Teacher
Set salary = salary * 1.1
Where Tid IN (Select Tid
              From Teach
              Where semester = 'Spring'
              And year = 2024
              And course-id IN (Select course-id
                                From Course
                                Where credit-hour = 3));
```

Q. 8. Some students have become teachers. Write SQL statement to insert id, name, street,
city, mobile and email into teacher table for those students with cgpa 4 and tot-cred 130.
Other attributes will be null.

```sql
Insert into Teacher (Tid, name, street, city, mobile, email)
Select Sid, name, street, city, mobile, email
From Student
Where CGPA = 4 and tot-cred = 130;
```

Q.9 Update the salary of all teachers for Spring 2023 into null. Then update their salary by
the sum of all remuneration of courses taught by each teacher in Spring 2023.

```sql
Update Teacher
Set salary = null
Where Tid IN (Select Tid
              From Teach
              Where semester = 'Spring'
              And year = 2023)

Update Teacher t
Set salary = (Select sum(remuneration)
              From Teach th
              Where t.Tid = th.Tid
              And semester = 'Spring'
              And year = 2023);
```

Q10: Update the tot-cred of all students by the sum of all credits of courses taken by each
student and gradepoint is neither null nor ‘F’.

```sql
update Student s
Set s.tot-cred = (Select sum(c.credit-hour)
                From Course c join Takes t on c.course-id = t.course-id
                Where t.Sid = s.Sid
                t.gradepoint is not null 
                or t.gradepoint <> 'F')
```

Q11: Find all the brothers (With same F-NID and teacher or students) of Tid = 1001.

```sql
Select s.Sid, s.name
From Student s
Join Parents_S ps ON s.Sid = ps.Sid
Where ps.F_NID IN ( Select F_NID
                    From Parents_T
                    Where Tid = 1001)
Union

Select t.id, t.name
From Teacher t
Join Parents-T pt on t.Tid = pt.Tid
Where pt.F-NID IN ( Select F-NID
                    From Parents-T  
                    Where Tid = 1001)
```

Q12: Find Sid, name, department id of all students with the same teacher name in the same department.

```sql
Select Sid, sname, dept-id
From Student
Where dept_id IN (Select dept_id
                  From Tacher
                  Where name = Student.name);
```

> Given the relational schema as follows:
> branch(branch name, branch city, assets)
> customer (customer name, customer street, customer city)
> loan (loan number, branch name, amount)
> borrower (customer name, loan number)
> account (account number, branch name, balance )
> depositor (customer name, account number)

a. Insert all the loans of branch name = “NSU” to the account relation as loan number will  be account number and amount will be balance.

```sql
Insert into account(account_number, branch_name, balance)
Select account_number, loan number, amount
From loan
Where branch name = 'NSU';

```
b. Delete all loans of customers who lives in ‘Gazipur

```sql
Delete from loan
Where loan number IN (Select loan number
                      From borrower
                      Where customer name IN (Select customer name
                                              From customer
                                              Where customer city = 'Gazipur'));
```

c. Find the list of customer name, branch name and branch city of all customers who lives in ‘Dhaka’
```sql
Select c.customer name, b.branch name, b.branch city
From customer c join depositor d on c.customer name = d.customer name
                join account a on d.account number = a.account number
                join branch b on a.branch name = b.branch name
Where c.customer name IN (Select customer name
                          From customer
                          Where customer city = 'Dhaka');
```


d. Find the list of customer name, branch name and branch city of all customers who have 
accounts in all branches in comilla city.
```sql
Select c.customer name, b.branch name, b.branch city
From customer c join depositor d on c.customer name = d.customer name
                join account a on d.account number = a.account number
                join branch b on a.branch name = b.branch name
Where NOT EXISTS (Select branch name
                  From branch
                  Where branch city = 'Comilla'
                    Except
                  Select branch name
                  From account
                  Where d.account number = a.account number);
```

e. Add 10% benefit to all accounts with balance less than 50000 and 5% benefit to others.

```sql
Update account
Set balance =  case salary < 5000 then balance * 1.1
               else balance * 1.05
               end;
```

f. Find customer name and city of all customers who have both loan and account.

```sql
Select customer name, customer city
From customer
Where customer name IN (Select customer name
                        From borrower
                        Where loan number IN (Select loan number From loan)
                        Intersect
                        Select customer name
                        From depositor
                        Where account number IN (Select account number From account));
```

g. Find customer name and city of all customers who have account but no loan.

```sql
Select customer name, customer city
From customer
Where customer name IN (Select customer name
                        From depsitor
                        Where accounte number IN (Select account number From accounet)
                        Except
                        Select customer name
                        From borrower
                        Where loan number IN (Select loan number From loan));
```

> Given the relational schema as follows:
> employee (person name, street, city)
> works (person name, company name, salary)
> company (company name, city)

a. Find person name, street, employee.city, company name, company.city for all employees 
salary greater than 10000.

```sql
Select e.person name, e.street, e.city, w.company name, c.city
From employee e join works w on e.person name = w.person name
                join company c on w.company name = c.company name
Where p.person name IN (Select person name 
                        From works
                        Where salary > 10000);
```

b. Find person name, street and city of all employees who live in the same city as 
‘Mr. Akib’ lives.

```sql
Select person name, street, city
From employee 
Where city IN ( Select city
                From employee
                Where person name = 'Mr. Akib');
```

c. Find all person name of all employees who live in the same city as the company.

```sql
Select e.person_name
From employee e
Where e.city IN ( Select c.city
                 From company c join works w on c.comapny_name = w.company_name
                 Where c.city = e.city);
```


> Q: Given the following relational schema:
> branch(branch name, branch city, assets)
> customer (customer name, customer street, customer city)
> borrower (customer name, loan number)
> loan (loan number, branch name, amount)

Find each customer city and the total amount of loan of that customer city. Output:
customer city, loan-amount.
```sql
Select c.customer city, sum(l.amount)
From customer c join borrower b on c.customer name = b.customer name
                join loan l on b.loan number = l.loan number
Group by customer city;
```

> Q. Given the following relational schema:
> branch(branch name, branch city, assets)
> customer (customer name, customer street, customer city)
> depositor (customer name, account number)
> account (account number, branch name, balance )

a. Delete all accounts of customers who lives in ‘Sylhet’.
```sql
Delete from account
Where account number IN (Select account number
                         From depositor
                         Where customer name IN (Select customer name
                                                 From customer
                                                 Where customer city = 'Sylhet'));
```

b. Gave 10% profit to all accounts of customers living in Bhola and 5% profit to customers
living in Dhaka and 6% to others.
```sql
Update account
Set balance = case
                customer city = 'Bhola' then balance * 1.1
                customer city = 'Dhaka' then balance * 1.05
                else balance * 1.06
                end;
```
