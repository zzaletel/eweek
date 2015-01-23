CREATE TABLE `student` (
	`student_id` int(4) NOT NULL AUTO_INCREMENT,
	`name` text NOT NULL,
	`school` text NOT NULL,
	`grade` text NOT NULL, 	
	CONSTRAINT pk_stu_student_id PRIMARY KEY(`student_id`)	
);

CREATE TABLE `event` (
	`event_id` int(2) NOT NULL AUTO_INCREMENT,
	`name` text NOT NULL,	
	CONSTRAINT pk_stu_student_id PRIMARY KEY(`event_id`)	
);

CREATE TABLE `team` (
	`team_id` int(4) NOT NULL AUTO_INCREMENT,
	`name` text NOT NULL,
	`member_names` text NOT NULL,
	`team_size` int(2) NOT NULL,
	`representative_id` int(4) NOT NULL,
	CONSTRAINT pk_stu_student_id PRIMARY KEY(`team_id`)	
);

ALTER TABLE team AUTO_INCREMENT=5001;

CREATE TABLE `student_event_affiliation` (
	`student_id` int(4) NOT NULL,
	`event_id` int(2) NOT NULL,
	CONSTRAINT pk_sea_student_major_id PRIMARY KEY(`student_id`, `event_id`),
	CONSTRAINT fk_sea_student_id FOREIGN KEY(`student_id`) REFERENCES student(`student_id`)
	ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_sea_event_id FOREIGN KEY(`event_id`) REFERENCES event(`event_id`)
	ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE `team_event_affiliation` (
	`team_id` int(4) NOT NULL,
	`event_id` int(2) NOT NULL,
	CONSTRAINT pk_tea_student_major_id PRIMARY KEY(`team_id`, `event_id`),
	CONSTRAINT fk_tea_team_id FOREIGN KEY(`team_id`) REFERENCES team(`team_id`)
	ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_tea_event_id FOREIGN KEY(`event_id`) REFERENCES event(`event_id`)
	ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE `student_team_affiliation` (
	`team_id` int(4) NOT NULL,
	`student_id` int(4) NOT NULL,
	CONSTRAINT pk_sta_student_major_id PRIMARY KEY(`student_id`, `team_id`),
	CONSTRAINT fk_sta_student_id FOREIGN KEY(`student_id`) REFERENCES student(`student_id`)
	ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_sta_team_id FOREIGN KEY(`team_id`) REFERENCES team(`team_id`)
	ON UPDATE CASCADE ON DELETE RESTRICT	
);

CREATE TABLE `egg_drop_report` (
	`record_id` int(4) NOT NULL AUTO_INCREMENT,
	`participant_id` int(4) NOT NULL,
	`student_names` text NOT NULL,
	`school` text NOT NULL,
	`number_of_team_members` int(2) NOT NULL,
	`grade_group` text NOT NULL,
	`survive` text NOT NULL,
	`measured_dist` decimal(6,2),
	`allowed_time` text NOT NULL,
	`start_time` text NOT NULL,
	`end_time` text NOT NULL,
	`total_time` text NOT NULL,
	`penalty_dist` decimal(6,2),
	`total_dist` decimal(6,2),

	CONSTRAINT pk_edr_record_id PRIMARY KEY(`record_id`)	
);

CREATE TABLE `lego_longo_report` (
	`record_id` int(4) NOT NULL AUTO_INCREMENT,
	`participant_id` int(4) NOT NULL,
	`student_names` text NOT NULL,
	`school` text NOT NULL,
	`grade_group` text NOT NULL,
	`length1` decimal(6,3),
	`weight1` decimal(6,2),
	`survive1` text NOT NULL,
	`length2` decimal(6,3),
	`weight2` decimal(6,2),
	`survive2` text NOT NULL,
	`max_distance` decimal(6,3),
	CONSTRAINT pk_edr_record_id PRIMARY KEY(`record_id`)
);

CREATE TABLE `shake_and_break_report` (
	`record_id` int(4) NOT NULL AUTO_INCREMENT,
	`participant_id` int(4) NOT NULL,
	`student_names` text NOT NULL,
	`school` text NOT NULL,
	`grade_group` text NOT NULL,
	`survival_time` decimal(6,2),
	`stories_num` decimal(6,2),
	`total_points` decimal(6,2),
	CONSTRAINT pk_edr_record_id PRIMARY KEY(`record_id`)
);

CREATE TABLE `floatable_moatable_report` (
	`record_id` int(4) NOT NULL AUTO_INCREMENT,
	`participant_id` int(4) NOT NULL,
	`student_names` text NOT NULL,
	`school` text NOT NULL,
	`grade_group` text NOT NULL,
	`marbles_num` int(5),
	`people_num` int(2),
	CONSTRAINT pk_edr_record_id PRIMARY KEY(`record_id`)
);

CREATE TABLE `egg_toss_report` (
	`record_id` int(4) NOT NULL AUTO_INCREMENT,
	`participant_id` int(4) NOT NULL,
	`student_names` text NOT NULL,
	`school` text NOT NULL,
	`grade_group` text NOT NULL,
	`dist_from_target` decimal(6,2),
	`construt_time` text NOT NULL,
	`total_points` decimal(6,2),
	CONSTRAINT pk_edr_record_id PRIMARY KEY(`record_id`)
);

CREATE TABLE `paper_airplanes_report` (
	`record_id` int(4) NOT NULL AUTO_INCREMENT,
	`participant_id` int(4) NOT NULL,
	`student_names` text NOT NULL,
	`school` text NOT NULL,
	`grade_group` text NOT NULL,
	`Plane_num` text NOT NULL,
	`dist1_ft` decimal(6,2),
	`dist1_in` decimal(6,2),
	`offset1_ft` decimal(6,2),
	`offset1_in` decimal(6,2),
	`score1` decimal(6,2),
	`dist2_ft` decimal(6,2),
	`dist2_in` decimal(6,2),
	`offset2_ft` decimal(6,2),
	`offset2_in` decimal(6,2),
	`score2` decimal(6,2),
	`max_dist` decimal(6,2),
	CONSTRAINT pk_edr_record_id PRIMARY KEY(`record_id`)
);

--Query--
SELECT t.team_id, t.name, sta.student_id, s.name, s.school, s.grade
FROM team as t,
student as s,
student_team_affiliation as sta
WHERE t.team_id = sta.team_id
AND sta.student_id = s.student_id;

--Insert--
INSERT INTO `event` (`name`) VALUES
('Egg drop'),
('Floatable moatables'),
('Paper airplanes'),
('Egg toss'),
('Lego longo'),
('Shake & Break'),
('Bridge buster');

INSERT INTO `student` (`name`, `school`, `grade`) VALUES
('Aaron', 'Service high',11),
('Aaron2', 'Service high',12),
('Aaron3', 'Service high',12);

INSERT INTO team (name) VALUES
('team a'),
('team b');

INSERT INTO student_team_affiliation (team_id,student_id) VALUES
(1,1),(1,2),(1,3),(2,35),(2,36);

INSERT INTO `egg_drop_report` (
	`participant_id`,
	`student_names`,
	`school`,
	`number_of_team_members`,
	`grade_group`,
	`survive`,
	`measured_dist`,
	`allowed_time`,
	`start_time`,
	`end_time`,
	`total_time`,
	`penalty_dist`,
	`total_dist`) VALUES
(9999,'Aaron9999', 'Service high','Yes','9 ot 12',1,13.75,'40','10:30','10:42','0:12',0,13.75);

INSERT INTO `lego_longo_report` (
	`participant_id`,
	`student_names`,
	`school`,
	`grade_group`,
	`length`,
	`weight`,
	`survive`,
	`max_distance`) VALUES
(1,'Aaron', 'Service high','11'),
(2,'Aaron2', 'Service high','12'),
(3,'Aaron3', 'Service high','12');

DELETE FROM `eweek`.`egg_drop_report` WHERE `record_id`='1';
--insert from another table
INSERT INTO `student` (`name`, `school`, `grade`)
SELECT *
FROM sampleDataTable;

--Update--
UPDATE student
SET grade = 11; --updates all rows

UPDATE student
SET grade = 11
WHERE student_id = 1; --shall use pk

--Delete--
DELETE *
FROM student
WHERE student_id = 1; --shall use pk

Truncate table student; -- resets auto id
--Alter--
ALTER TABLE student
ADD age int(2);	--add `age` field

ALTER TABLE student
DROP age;	--drop `age` field

ALTER TABLE student
MODIFY COLUMN age int(3) NOT NULL; --redefined `age` field 

ALTER TABLE student
CHANGE age age2 int(3) NOT NULL; --change name `age` to `age2`

ALTER TABLE student
ADD CONSTRAINT pk_stu_student_id PRIMARY KEY(`student_id`); --add constraint

ALTER TABLE Person
ADD CONSTRAINT personfkmother FOREIGN KEY(motherSSN)
REFERENCES Mother(SSN);

ALTER TABLE Person
DROP CONSTRAINT pk_stu_student_id; --drop constraint

ALTER TABLE student
DROP PRIMARY KEY; --drop pk

ALTER TABLE student
DROP FOREIGN KEY fk_name; --drop fk

--Drop--
DROP TABLE student;

DROP INDEX lastnameindex
ON Person;