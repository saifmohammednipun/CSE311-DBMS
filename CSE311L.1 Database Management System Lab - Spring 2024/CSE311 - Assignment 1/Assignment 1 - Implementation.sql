CREATE DATABASE assignment1_2121913642;


CREATE TABLE Teacher(T_id INT NOT NULL,
                     Name VARCHAR(255),
                     DOB DATE,
                     Street VARCHAR(255),
                     City VARCHAR(255),
                     Designation VARCHAR(255),
                     Total_salary DECIMAL(6,2),
                     PRIMARY KEY (T_id)
                     );


CREATE TABLE Course(Course_id INT NOT NULL,
                    Title VARCHAR(255),
                    Credit_hour INT,
                    PRIMARY KEY (Course_id)
                    );


CREATE TABLE Teaches(T_id INT NOT NULL,
                     Course_id INT NOT NULL,
                     Semester VARCHAR(255),
                     Year_Teaching YEAR,
                     Remuneration DECIMAL(4,2),
                     Section INT,
                     Number_students INT,
                     Course_fee DECIMAL(4,2),
                     PRIMARY KEY (T_id, Course_id,Semester, Year_Teaching),
                     FOREIGN KEY (T_id) REFERENCES teacher(T_id),
                     FOREIGN KEY (Course_id) REFERENCES course(Course_id)
                     );


CREATE TABLE Mother(M_BRN INT NOT NULL,
                    Name VARCHAR(255),
                    Number_sons INT,
                    NUmber_daughters INT,
                    Total_child INT,
                    DOB DATE,
                    Profession VARCHAR(255),
                    Income DECIMAL(7,2),
                    PRIMARY KEY (M_BRN)
                    );


CREATE TABLE Child(C_BRN INT NOT NULL,
                   Name VARCHAR(255),
                   DOB DATE,
                   BirthTime_height DECIMAL(5,2),
                   BirthTime_weight DECIMAL(5,2),
                   Gender CHAR(5),
                   M_BRN INT NOT NULL,
                   PRIMARY KEY (C_BRN),
                   FOREIGN KEY (M_BRN) REFERENCES mother(M_BRN)
                   );


CREATE TABLE Apartment(Apart_id INT NOT NULL,
                       Size INT,
                       Building_name VARCHAR(255),
                       TotalFloor_num INT,
                       Location VARCHAR(255),
                       Price VARCHAR(255),
                       PRIMARY KEY (Apart_id)
                       );


CREATE TABLE Person(NID INT NOT NULL,
                    Name VARCHAR(255),
                    Gender CHARACTER(5),
                    DOB DATE,
                    Profession VARCHAR(255),
                    Income DECIMAL(7,2),
                    Street VARCHAR(255),
                    City VARCHAR(255),
                    Birth_registration INT,
                    Apart_id INT,
                    PRIMARY KEY (NID),
                    FOREIGN KEY (Apart_id) REFERENCES apartment(Apart_id)
                    );

