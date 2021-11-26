
SET client_encoding TO 'LATIN10';

---
--- drop tables
---

DROP TABLE IF EXISTS projects CASCADE;
DROP TABLE IF EXISTS students CASCADE;
DROP TABLE IF EXISTS review CASCADE;
DROP TABLE IF EXISTS courses CASCADE;

--
--create projects table:
--

CREATE TABLE projects (
	project_id SERIAL PRIMARY KEY,
	course_id VARCHAR(5),
	project_name VARCHAR(50), 
	description VARCHAR(200), 
	tasks VARCHAR(300), 
	bg_materials VARCHAR(300), 
	type VARCHAR(50), 
	team BOOL DEFAULT FALSE
);

--
--create students table:
--


CREATE TABLE students (
	student_id SERIAL PRIMARY KEY, 
	name VARCHAR(30), 
	nickname VARCHAR(20), 
	course_id VARCHAR(5),
	join_date DATE, 
	city VARCHAR(30), 
	hobby VARCHAR(30), 
	email VARCHAR(50), 
	other VARCHAR(100)
);

--
--create review table:
--

CREATE TABLE review (
	review_id SERIAL PRIMARY KEY, 
	student_id INT, 
	project_id INT, 
	reviewer_id INT, 
	"when" DATE, 
	mark INT, 
	comment VARCHAR(100)
); 

--
--create courses table:
--

CREATE TABLE courses(
	course_id VARCHAR(5) PRIMARY KEY,  
	course_description VARCHAR(50)
);

--
--fill tables:
--

INSERT INTO students 
(name, nickname, course_id, join_date, city, hobby, email, other) 
VALUES 
	('István Márton', 'Marci', 'TST01', '2021-08-11', 'Pomáz', 'Gitár', 'marciistvan45@gmail.com', 'Szereti a sütit'),
	('Szarka Vivien', 'Vivi', 'TST01', '2021-08-11', 'Miskolc', '3D nyomtatás', 'kalna.vivien@gmail.com', 'Van két zebra pintye'),
	('Weisz Dávid', 'Dávid', 'TST01', '2021-08-11', 'Kóka', 'Időjárás megfigyelés', 'yaraclen@gmail.com', 'Varázsló szeretne lenni'),
	('Lentvorszki Éva', 'Évi', 'TST01', '2021-08-11', 'titkosított', 'titkosított', 'titkosított', 'titkosított'),
	('Palacsinta Jolán', 'PaliJoli', 'TST02', '2020-06-15', 'Tokaj', 'Borászat', 'palijoli@email.com', 'A tokaji szőlőhegyen két szál vessző...'),
	('Csin Csilla', 'Csillu', 'TST02', '2001-08-10', 'Vatta', 'Természetfotózás', 'csilluka@email.com', 'Nagy állatbarát'),
	('Zsíros B. Ödön', 'Bödön', 'BCK01', '2020-06-15', 'Apácatorna', 'Aerobik', 'zsirosbodon@email.com', 'Kedvence a zsírosdeszka lilahagymával'),
	('Wincs Eszter', 'Vinyó', 'BCK01', '2039-08-05', 'Rásonysápberencs', 'Informatika', 'vinyoka99@email.com', 'Már az apja is informatikus volt'),
	('Meg Győző', 'Győzike', 'FRT01', '2000-01-01', 'Pókaszepetk', 'Politika', 'gyozo@email.com', 'NEM nagyon kígyó, a zebra mintát is utálja'),
	('Riz Ottó', 'Tészta nemvót?', 'FRT01', '2015-09-01', 'Iklódbördőce', 'Főzés', 'teszta@email.com', 'A főzésre született'), 
	('Koaxk Ábel', 'Kábel', 'SYS01', '1998-03-20', 'Makkoshotyka', 'Kapcsolat szakértő', 'koax@email.com', '15m, F csatlakozóval, kábelrögzítőkkel'),
	('Ebéd Elek', 'Elek', 'SYS01', '2013-10-02', 'Sonkád', 'azt hitted a főzés? hát nem', 'elekelek@email.com', 'Ő csinálja a legjobb mikrós popcornt')
;

INSERT INTO projects 
(project_name, course_id, description, tasks, bg_materials, "type", team) 
VALUES 
	('Introduction to SQL', 'TST01', 'Learn SQL basics', E'1, Taste it,\n2, Explore further', 'https://journey.code.cool/v2/project/curriculum/materials/tutorials/introduction-to-sql.md', 'Tutorial', 'FALSE'),
	('Setup PostgreSQL', 'TST01', 'Install and experience the fun and never ending joy that comes from debugging the errors in psql', E'1, Install PostgreSQL,\n2, Set up PostgreSQL,\n3, Connect with psql and create a table with data,\n4, Connect with your IDE and get some data,\n5, Connect to PostgreSQL with Python', 'https://journey.code.cool/v2/project/curriculum/project/setup-postgresql/SOLO/PYTHON/TESTING-4M-DAYTIME', 'Exercise', 'FALSE'),
	('Project Codewars - 7 kyu in SQL', 'TST01', 'Fight through the challenges and build your way up to 7 kyu in the legendary codewars battleground', '1, Reach 7 kyu in SQL', 'https://journey.code.cool/v2/project/curriculum/project/codewars-sql-7-kyu/SOLO/GENERAL/TESTING-4M-DAYTIME', 'Exercise', 'FALSE'),
	('TodoDB.sql', 'TST01', 'Write your own todo list in a damn database without any given graphic shell, why? Why not?', E'1, VM with NAT Networking,\n2, Create Database,\n3, Create Schema,\n4, Alter Schema,\n5, Insert Data,\n6, Retrieve Data,\n7, Modify Existing Data,\n8, Delete Finished Tasks,\n9, Drop Tables', 'https://journey.code.cool/v2/project/curriculum/project/tododb-sql/SOLO/GENERAL/TESTING-4M-DAYTIME', 'Exercise', 'FALSE'),
	('Northwind Traders', 'TST01', 'You are a member of the Data Analysis team, and your task is to help the management to understand what is going on in the company', E'1, List products and their suppliers,\n2, Count products by categories,\n3, Top 10 Worst selling products,\n4, Important countries,\n5, Total revenue by month,\n6, Get order numbers for each customer from the US with less than 5 orders', 'https://journey.code.cool/v2/project/curriculum/project/northwind-traders/TEAM/PYTHON/TESTING-4M-DAYTIME', 'Exercise', 'TRUE'),
	('Curriculum', 'TST01', 'If the previous tasks were not enough for you here is more (HALLELUJAH)', E'1, Create db,\n2, Insert tables with overflowing data,\n3, Do some cool shit with them', 'https://docs.google.com/document/d/1EFUF7Ip7qGinUgyL10GQfORXApeQA9LZ1FlF4Nky56s/edit', 'Exercise', 'TRUE'),
	('Introduction to SQL', 'TST02', 'Learn SQL basics', E'1, Taste it,\n2, Explore further', 'https://journey.code.cool/v2/project/curriculum/materials/tutorials/introduction-to-sql.md', 'Tutorial', 'FALSE'),
	('Setup PostgreSQL', 'TST02', 'Install and experience the fun and never ending joy that comes from debugging the errors in psql', E'1, Install PostgreSQL,\n2, Set up PostgreSQL,\n3, Connect with psql and create a table with data,\n4, Connect with your IDE and get some data,\n5, Connect to PostgreSQL with Python', 'https://journey.code.cool/v2/project/curriculum/project/setup-postgresql/SOLO/PYTHON/TESTING-4M-DAYTIME', 'Exercise', 'FALSE'),
	('Project Codewars - 7 kyu in SQL', 'TST02', 'Fight through the challenges and build your way up to 7 kyu in the legendary codewars battleground', '1, Reach 7 kyu in SQL', 'https://journey.code.cool/v2/project/curriculum/project/codewars-sql-7-kyu/SOLO/GENERAL/TESTING-4M-DAYTIME', 'Exercise', 'FALSE'),
	('TodoDB.sql', 'TST02', 'Write your own todo list in a damn database without any given graphic shell, why? Why not?', E'1, VM with NAT Networking,\n2, Create Database,\n3, Create Schema,\n4, Alter Schema,\n5, Insert Data,\n6, Retrieve Data,\n7, Modify Existing Data,\n8, Delete Finished Tasks,\n9, Drop Tables', 'https://journey.code.cool/v2/project/curriculum/project/tododb-sql/SOLO/GENERAL/TESTING-4M-DAYTIME', 'Exercise', 'FALSE'),
	('Northwind Traders', 'TST02', 'You are a member of the Data Analysis team, and your task is to help the management to understand what is going on in the company', E'1, List products and their suppliers,\n2, Count products by categories,\n3, Top 10 Worst selling products,\n4, Important countries,\n5, Total revenue by month,\n6, Get order numbers for each customer from the US with less than 5 orders', 'https://journey.code.cool/v2/project/curriculum/project/northwind-traders/TEAM/PYTHON/TESTING-4M-DAYTIME', 'Exercise', 'FALSE'),
	('Curriculum', 'TST02', 'If the previous tasks were not enough for you here is more (HALLELUJAH)', E'1, Create db,\n2, Insert tables with overflowing data,\n3, Do some cool shit with them', 'https://docs.google.com/document/d/1EFUF7Ip7qGinUgyL10GQfORXApeQA9LZ1FlF4Nky56s/edit', 'Exercise', 'FALSE'),
	('TodoDB.sql', 'BCK01', 'Write your own todo list in a damn database without any given graphic shell, why? Why not?', E'1, VM with NAT Networking,\n2, Create Database,\n3, Create Schema,\n4, Alter Schema,\n5, Insert Data,\n6, Retrieve Data,\n7, Modify Existing Data,\n8, Delete Finished Tasks,\n9, Drop Tables', 'https://journey.code.cool/v2/project/curriculum/project/tododb-sql/SOLO/GENERAL/TESTING-4M-DAYTIME', 'Exercise', 'FALSE'),
	('Northwind Traders', 'BCK01', 'You are a member of the Data Analysis team, and your task is to help the management to understand what is going on in the company', E'1, List products and their suppliers,\n2, Count products by categories,\n3, Top 10 Worst selling products,\n4, Important countries,\n5, Total revenue by month,\n6, Get order numbers for each customer from the US with less than 5 orders', 'https://journey.code.cool/v2/project/curriculum/project/northwind-traders/TEAM/PYTHON/TESTING-4M-DAYTIME', 'Exercise', 'TRUE'),
	('Introduction to SQL', 'FRT01', 'Learn SQL basics', E'1, Taste it,\n2, Explore further', 'https://journey.code.cool/v2/project/curriculum/materials/tutorials/introduction-to-sql.md', 'Tutorial', 'FALSE'),
	('Setup PostgreSQL', 'FRT01', 'Install and experience the fun and never ending joy that comes from debugging the errors in psql', E'1, Install PostgreSQL,\n2, Set up PostgreSQL,\n3, Connect with psql and create a table with data,\n4, Connect with your IDE and get some data,\n5, Connect to PostgreSQL with Python', 'https://journey.code.cool/v2/project/curriculum/project/setup-postgresql/SOLO/PYTHON/TESTING-4M-DAYTIME', 'Exercise', 'FALSE'),
	('TodoDB.sql', 'SYS01', 'Write your own todo list in a damn database without any given graphic shell, why? Why not?', E'1, VM with NAT Networking,\n2, Create Database,\n3, Create Schema,\n4, Alter Schema,\n5, Insert Data,\n6, Retrieve Data,\n7, Modify Existing Data,\n8, Delete Finished Tasks,\n9, Drop Tables', 'https://journey.code.cool/v2/project/curriculum/project/tododb-sql/SOLO/GENERAL/TESTING-4M-DAYTIME', 'Exercise', 'FALSE'),
	('Northwind Traders', 'SYS01', 'You are a member of the Data Analysis team, and your task is to help the management to understand what is going on in the company', E'1, List products and their suppliers,\n2, Count products by categories,\n3, Top 10 Worst selling products,\n4, Important countries,\n5, Total revenue by month,\n6, Get order numbers for each customer from the US with less than 5 orders', 'https://journey.code.cool/v2/project/curriculum/project/northwind-traders/TEAM/PYTHON/TESTING-4M-DAYTIME', 'Exercise', 'TRUE')
;
	

INSERT INTO review 
(student_id, project_id, reviewer_id, "when", mark, comment) 
VALUES 
	(1, 1, 3, '2021-11-22', 1, 'Hát ez ÉRTÉKELHETETLEN'),
	(2, 3, 4, '2021-11-19', 5, 'Elérte'),
	(2, 4, 4, '2021-11-19', 4, 'Fasza'),
	(2, 1, 4, '2021-11-19', 3, 'Érti'),
	(4, 2, 2, '2021-11-19', 5, 'Már régóta használja'),
	(4, 4, 2, '2021-11-19', 4, 'Mintha a bevásárlólistát is ebben írná'),
	(4, 3, 2, '2021-11-19', 4, 'Tudja ő csak néha felejt, lámpaláz'),
	(2, 2, 4, '2021-11-19', 5, 'Teljesen működőképes'),
	(4, 1, 2, '2021-11-19', 4, 'Megy ez neki'),
	(3, 2, 1, '2021-11-22', 5, 'Hát ő egy varázsló'),
	(3, 4, 1, '2021-11-22', 5, 'Hát ő egy varázsló'),
	(3, 1, 1, '2021-11-22', 5, 'Hát ő egy varázsló'),
	(3, 3, 1, '2021-11-22', 5, 'Hát ő egy varázsló'),
	(2, 6, 4, '2021-11-26', 5, '5* - Hála nekik meglettek csinálva az adatbázisok'),
	(1, 2, 3, '2021-11-26', 3, 'Műkszik'),
	(1, 3, 3, '2021-11-26', 2, 'Nem tudom hogy, de sikerült neki'),
	(2, 5, 4, '2021-11-26', 2, 'Format c:'),
	(1, 4, 3, '2021-11-26', 2, 'Hát kicsit buggos lett de nem szar'),
	(1, 6, 3, '2021-11-26', 1, 'Nem tetszik a diagrammja'),
	(3, 5, 1, '2021-11-26', 5, 'Hát ő egy varázsló'),
	(1, 5, 3, '2021-11-26', 3, 'Hát ez ízi volt'),
	(4, 6, 2, '2021-11-26', 5, 'Gyönyörű adat architektúrákat épít'),
	(4, 5, 2, '2021-11-26', 3, 'Összehozta ez a lényeg'),
	(3, 6, 1, '2021-11-26', 5, 'Hát ő egy varázsló'),
	(5, 7, 6, '2021-11-26', 1, 'Nem tetszik a diagrammja'),
	(5, 8, 6, '2021-11-19', 4, 'Tudja ő csak néha felejt, lámpaláz'),
	(5, 9, 6, '2021-11-26', 3, 'Hát ez ízi volt'),
	(5, 10, 6, '2021-11-22', 5, 'Hát ő egy varázsló'),
	(5, 11, 6, '2021-11-26', 2, 'Nem tudom hogy, de sikerült neki'),
	(5, 12, 6, '2021-11-19', 5, 'Teljesen működőképes'),
	(6, 7, 5,  '2021-11-19', 4, 'Ejjde jó lett'),
	(6, 8, 5, '2021-03-05', 3, 'No nem baj'),
	(6, 9, 5, '2019-02-13', 2, 'Ez egyre rosszabb'),
	(6, 10, 5, '2016-03-26', 5, 'Naugye hogy megy'),
	(6, 11, 5, '2006-03-11', 4, 'Thumbs up'),
	(6, 12, 5, '2019-09-09', 5, 'Végére javítottál'),
	(7, 13, 8, '2018-06-30', 1, 'jujj'),
	(7, 14, 8, '2021-03-02', 3, 'áá hagyjuk'),
	(8, 13, 7, '2019-07-01', 2, 'Tied se sokkal jobb'),
	(8, 14, 7, '2012-02-03', 5, 'Taníts mester'),
	(9, 15, 10, '2021-04-05', 4, 'Elfáradtam'),
	(9, 16, 10, '2021-03-25', 5, 'mindjárt vége'),
	(10, 15, 9, '2021-11-05', 1, 'mindenhonnan kihagytatd a vesszőket'),
	(10, 16, 9, '2021-05-05', 4, 'mintha nem lenne konzisztens a dátum'),
	(11, 17, 12, '2021-03-05', 2, 'huh'),
	(11, 18, 12, '2021-12-15', 5, 'ügyi'),
	(12, 17, 11, '2021-03-03', 2, 'nem ügyi'),
	(12, 18, 11, '2021-12-06', 5, 'Mikulás hozta ajándékba')
;

INSERT INTO courses 
(course_id, course_description) 
VALUES 
	('TST01', 'Tester morning group'),
	('TST02', 'Tester afternoon group'),
	('BCK01', 'Backend group'),
	('FRT01', 'Frontend group'),
	('SYS01', 'Sysadmin group');

--
--add constraints:
--

ALTER TABLE review
ADD CONSTRAINT FK_student_id
FOREIGN KEY (student_id) 
REFERENCES students(student_id);

ALTER TABLE review
ADD CONSTRAINT FK_project_id
FOREIGN KEY (project_id) 
REFERENCES projects(project_id);

ALTER TABLE review
ADD CONSTRAINT FK_reviewer_id
FOREIGN KEY (reviewer_id) 
REFERENCES students(student_id);

ALTER TABLE students
ADD CONSTRAINT FK_course_id
FOREIGN KEY (course_id)
REFERENCES courses(course_id);

ALTER TABLE projects
ADD CONSTRAINT FK_course_id
FOREIGN KEY (course_id)
REFERENCES courses(course_id);
