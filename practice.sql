The relational schema for student course registration are as follows

Parents-S(F-NID, M-NID, Sid, F-name, M-name, street, city, income)
Student (Sid, name, street, city. Mobile, email, CGPA, age, tot-cred, dept-id)
Takes (course-id, Sid, semester, year, gradepoint)
Course (course-id, title, credit-hour)
Parents-T(F-NID, M-NID, Tid, F-name, M-name, street, city, income)
Teacher (Tid, name, designation, street, city, Mobile, email, salary, date-of-birth, dept-id)
Teach (course-id, Tid, semester, year, remuneration)


Q. 1: Write SQL expression to find Sid, F-NID, M-NID, mobile, email and age of all
students whose tot-cred is greater than or equal to 130.

Solution:
Select Sid, F-NID, M-NID, mobile, email, age
From Students  Natural Join Parents-S 
Where tot-cred >= 130;


Q. 2: Write SQL expression to find F-NID, Sid, course-id and title for all students whose
parents live in Dhaka.

Solution:
Select P.F-NID, S.Sid, T.course-id, C.title
From Student S, Parents-S P, Takes T, Course C
Where  S.Sid = P.Sid 
and Sid = T.Sid 
and T.course-id = C.course-id
and P.city = 'Dhaka';

Q. 3: Write SQL expression to find Sid, name, street, city and average gradepoint of each
student.

Solution:
Select S.Sid, S.name, S.street, S.city, avg(T.gradepoint)
From Student S Natural Join Takes T
Group by Sid;

Q. 4: Find city and street wise average, maximum and minimum income of parents (of
students) living in Dhaka or Rajshahi and average income higher than 500000.

Solution:
Select city, street, avg(income), max(income), min(income)
From Parents-S
Where city = 'Dhaka' or city = 'Rajshahi' 
Group by city, street;
Having avg(income) > 500000;

Q. 5: Write SQL expression to find Sid, name, course-id and title of all students who have
taken any course (course-id) taken by Abid in Fall 2018.

Solution:
Select S.Sid, S.name, T.course-id, C.title
From Student S, Takes T, Course C
Where S.Sid = T.Sid
and T.course-id = C.course-id
and T.semester = 'Fall'
and T.year = 2018
and T.course-id in (Select course-id
                    From Takes, Student
                    Where Student.Sid = Takes.Sid)


