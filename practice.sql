-- The relational schema for student course registration are as follows

-- Parents-S(F-NID, M-NID, Sid, F-name, M-name, street, city, income)
-- Student (Sid, name, street, city. Mobile, email, CGPA, age, tot-cred, dept-id)
-- Takes (course-id, Sid, semester, year, gradepoint)
-- Course (course-id, title, credit-hour)
-- Parents-T(F-NID, M-NID, Tid, F-name, M-name, street, city, income)
-- Teacher (Tid, name, designation, street, city, Mobile, email, salary, date-of-birth, dept-id)
-- Teach (course-id, Tid, semester, year, remuneration)


-- Q. 1: Write SQL expression to find Sid, F-NID, M-NID, mobile, email and age of all
-- students whose tot-cred is greater than or equal to 130.
Select s.Sid, p.F-NID, p.M-NID, s.mobile, s.email, s.age
From Students s join Parents-S p on s.Sid = p.Sid
Where s.tot-cred >= 130;


Q. 2: Write SQL expression to find F-NID, Sid, course-id and title for all students whose
parents live in Dhaka.
Select p.F-NID, s.Sid, t.course-id, c.title
From Parents-S p join Student s on p.Sid = s.Sid
                 join Takes t on s.Sid = t.Sid
                 join Course c on t.course-id = c.course-id
Where p.city IN ('Dhaka')

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
Where city = ( Select city 
               From Parents-S 
               Where city = 'Dhaka' or 'Rajshahi')
Group by city, street;
Having avg(income) > 500000;

Q. 5: Write SQL expression to find Sid, name, course-id and title of all students who have
taken any course (course-id) taken by Abid in Fall 2018.

Solution:
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

Q. 6: Write SQL expression to find Sid, name, course-id and title of all students who have
taken all courses taken by Abid in Fall 2018.
Select S.Sid, S.name, T.course-id, C.title
From Student S join Takes T on S.Sid = T.Sid
              join Course C on T.course-id = C.course-id

 -- Not Exists is used to find the students who have taken all the courses taken by Abid in Fall 2018
Where Not Exists ( Select course-id  -- courses taken by Abid in Fall 2018
                   From Takes
                  Where Sid = (Select Sid
                               From Student
                               Where name = 'Abid')
                  And semester = 'Fall'
                  And year = 2018
                    Except
                    Select course-id  -- coursees taken by all students in Fall 2018
                    From Takes
                    Where Sid = S.Sid
                    And semester = T.semester
                    And year = T.year);

Q. 7: Increase salary by 10% of all teachers who taught 3 credit courses in Spring 2024.
Update Teacher
Set salary = salary + salary * 0.1
Where Tid IN (Select Tid
              From Teach
              Where semester = 'Spring'
              And year = 2024
              And course-id IN (Select course-id
                                From Course
                                Where credit-hour = 3));

Q. 8. Some students have become teachers. Write SQL statement to insert id, name, street,
city, mobile and email into teacher table for those students with cgpa 4 and tot-cred 130.
Other attributes will be null.

Insert into Teacher (Tid, name, street, city, mobile, email)
Select Sid, name, street, city, mobile, email
From Student
Where CGPA = 4 and tot-cred = 130;

Q.9 Update the salary of all teachers for Spring 2023 into null. Then update their salary by
the sum of all remuneration of courses taught by each teacher in Spring 2023.

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
              And year = 2023)

Q10: Update the tot-cred of all students by the sum of all credits of courses taken by each
student and gradepoint is neither null nor ‘F’.

update Student
Set tot-cred = (Select sum(credit-hour)
                From Takes
                Where Student.Sid = Takes.Sid
                And gradepoint IS NOT NULL
                And gradepoint <> 'F');


Q11: Find all the brothers (With same F-NID and teacher or students) of Tid = 1001.

Select Tid, name
From Teacher
Where F-NID = (Select F-NID
               From Teacher
               Where Tid = 1001)
Union

Select Sid, name
From Student
Where F-NID = (Select F-NID
               From Teacher
               Where Tid = 1001);