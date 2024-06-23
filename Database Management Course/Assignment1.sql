CREATE DATABASE Phitron1;

CREATE TABLE student
(
	Student_id INT NOT NULL,
    Student_name VARCHAR(100),
    Email VARCHAR(70) UNIQUE,
    Address VARCHAR(50),
    Age INT CHECK(Age>18),
    PRIMARY KEY (Student_id)
);

CREATE TABLE Library
(
	Lib_id INT NOT NULL,
    Book_name VARCHAR(90),
    Student_id INT NOT NULL,
    PRIMARY KEY (Lib_id),
    FOREIGN KEY (Student_id) REFERENCES student(Student_id)
);


CREATE TABLE Fees
(
	Fee_id INT NOT NULL,
    Fee_amount DECIMAL(10,2),
    Student_id INT NOT NULL,
    Lib_id INT NOT NULL,
    PRIMARY KEY (Fee_id, Student_id, Lib_id),
    FOREIGN KEY (Student_id) REFERENCES student(Student_id),
    FOREIGN KEY (Lib_id) REFERENCEs Library(Lib_id)
);
