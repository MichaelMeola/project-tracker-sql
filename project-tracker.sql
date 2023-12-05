CREATE TABLE students(
    github VARCHAR(30) PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30)
);

INSERT INTO students
VALUES ('sdevelops', 'Sarah', 'Developer');

INSERT INTO students
VALUES ('jhacks', 'Jane', 'Hacker');

SELECT first_name, last_name
FROM students
WHERE github = 'jhacks';

CREATE TABLE projects(
    title VARCHAR(30) PRIMARY KEY,
    description TEXT,
    max_grade INT
);

INSERT INTO projects
VALUES ('Markov', 'Tweets generated from Markov chains', '50');

INSERT INTO projects
VALUES ('Blockly', 'Programmatic Logic Puzzle Game', '100');

INSERT INTO projects
VALUES ('X', 'Cleansing the world', '100');

INSERT INTO projects
VALUES ('Confused', 'Who can stare at a wall the longest ', '75');

INSERT INTO projects
VALUES ('One', 'Last man standing', '100');

SELECT title, max_grade
FROM projects
WHERE max_grade > 50;

SELECT title, max_grade
FROM projects
WHERE max_grade > 10 AND max_grade < 60;

SELECT title, max_grade
FROM projects
WHERE max_grade < 25 OR max_grade > 75;

SELECT * FROM projects
ORDER BY max_grade;

CREATE TABLE grades(
    id SERIAL PRIMARY KEY,
    student_github VARCHAR(30) REFERENCES students,
    project_title VARCHAR(30) REFERENCES projects,
    grade INT
);


INSERT INTO grades (student_github, project_title, grade)
VALUES ('jhacks', 'Markov', '10'),
('jhacks', 'Blockly', '2'),
('sdevelops', 'Markov', '50'),
('sdevelops', 'Blockly', '100');


SELECT first_name, last_name
FROM students
WHERE github = 'jhacks';

SELECT project_title, grade
FROM grades
WHERE student_github = 'jhacks';

SELECT title, max_grade
FROM projects;

SELECT *
FROM students
    JOIN grades ON (students.github = grades.student_github);


SELECT students.first_name,
       students.last_name,
       grades.project_title,
       grades.grade
FROM students
JOIN grades ON (students.github = grades.student_github);

SELECT *
FROM students
  JOIN grades ON (students.github = grades.student_github)
  JOIN projects ON (grades.project_title = projects.title);

SELECT *
FROM students
  JOIN grades ON (students.github = grades.student_github)
  JOIN projects ON (grades.project_title = projects.title)
WHERE github = 'jhacks';