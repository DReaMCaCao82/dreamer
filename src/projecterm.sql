/* Drop Tables */

DROP TABLE AppealImg CASCADE CONSTRAINTS;
DROP TABLE BBSAccusation CASCADE CONSTRAINTS;
DROP TABLE Like_comment CASCADE CONSTRAINTS;
DROP TABLE BBS_Comment CASCADE CONSTRAINTS;
DROP TABLE BBS_IMG CASCADE CONSTRAINTS;
DROP TABLE Like_BBS CASCADE CONSTRAINTS;
DROP TABLE performance CASCADE CONSTRAINTS;
DROP TABLE BBS CASCADE CONSTRAINTS;
DROP TABLE Calendar CASCADE CONSTRAINTS;
DROP TABLE chat_member CASCADE CONSTRAINTS;
DROP TABLE message CASCADE CONSTRAINTS;
DROP TABLE Message_file CASCADE CONSTRAINTS;
DROP TABLE chatting CASCADE CONSTRAINTS;
DROP TABLE Donation CASCADE CONSTRAINTS;
DROP TABLE funding CASCADE CONSTRAINTS;
DROP TABLE MeetingAccusation CASCADE CONSTRAINTS;
DROP TABLE MeetingHistory CASCADE CONSTRAINTS;
DROP TABLE MeetingRole CASCADE CONSTRAINTS;
DROP TABLE MeetingWarning CASCADE CONSTRAINTS;
DROP TABLE Meeting CASCADE CONSTRAINTS;
DROP TABLE Category CASCADE CONSTRAINTS;
DROP TABLE Interests CASCADE CONSTRAINTS;
DROP TABLE MemberWarning CASCADE CONSTRAINTS;
DROP TABLE Town CASCADE CONSTRAINTS;
DROP TABLE Member CASCADE CONSTRAINTS;
DROP TABLE Notice_file CASCADE CONSTRAINTS;
DROP TABLE Notice CASCADE CONSTRAINTS;


/* Create Sequences */

CREATE SEQUENCE SEQ_AppealImg INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_BBS INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_BBSAccusation INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_BBS_Comment INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_BBS_IMG INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Calendar INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Chatting INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Donation INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Interests INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Like_BBS INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Like_comment INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Category INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Meeting INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_MeetingAccusation INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_MeetingHistory INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_MeetingRole INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_MeetingWarning INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_MemberWarning INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Message INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Message_file INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Notice INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Notice_file INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Performance INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Town INCREMENT BY 1 START WITH 1;

/* Create Tables */

CREATE TABLE AppealImg
(
	appealNo number NOT NULL,
	img Nvarchar2(30) NOT NULL,
	id varchar2(15) NOT NULL,
	PRIMARY KEY (appealNo)
);


CREATE TABLE BBS
(
	bbsNo number NOT NULL,
	title nvarchar2(50) NOT NULL,
	contents nvarchar2(2000) NOT NULL,
	meetingNo number NOT NULL,
	id varchar2(15) NOT NULL,
	division number(1) NOT NULL,
	PRIMARY KEY (bbsNo)
);


CREATE TABLE BBSAccusation
(
	bAccusationNo number NOT NULL,
	Reason nvarchar2(30) NOT NULL,
	Content nvarchar2(200) NOT NULL,
	bbsNo number NOT NULL,
	id varchar2(15) NOT NULL,
	process nvarchar2(10) DEFAULT '접수' NOT NULL,
	PRIMARY KEY (bAccusationNo)
);


CREATE TABLE BBS_Comment
(
	commentNo number NOT NULL,
	contents nvarchar2(200) NOT NULL,
	bbsNo number NOT NULL,
	id varchar2(15) NOT NULL,
	class number NOT NULL,
	parentComment number DEFAULT 0 NOT NULL,
	PRIMARY KEY (commentNo)
);


CREATE TABLE BBS_IMG
(
	imgNo number NOT NULL,
	bbsNo number NOT NULL,
	 img nvarchar2(30) NOT NULL,
	PRIMARY KEY (imgNo)
);

CREATE TABLE Category
(
	categoryNo number NOT NULL,
	maincategory nvarchar2(15) NOT NULL,
	subcategory nvarchar2(15) NOT NULL,
	PRIMARY KEY (categoryNo)
);

CREATE TABLE Calendar
(
	CalendarNo number NOT NULL,
	title nvarchar2(20) NOT NULL,
	contents nvarchar2(200) NOT NULL,
	meetingNo number NOT NULL,
	PRIMARY KEY (CalendarNo)
);


CREATE TABLE Chatting
(
	chatNo number NOT NULL,
	meetingNo number NOT NULL,
	name nvarchar2(20) NOT NULL,
	PRIMARY KEY (chatNo)
);


CREATE TABLE Chat_member
(
	roleNo number NOT NULL,
	chatNo number NOT NULL,
	name nvarchar2(10) NOT NULL,
	UNIQUE (roleNo, chatNo)
);


CREATE TABLE Donation
(
	donationNo number NOT NULL,
	meetingNo number NOT NULL,
	id varchar2(15) NOT NULL,
	donation number NOT NULL,
	PRIMARY KEY (donationNo)
);


CREATE TABLE Funding
(
	meetingNo number NOT NULL,
	amount number DEFAULT 0 NOT NULL,
	enddate date,
	PRIMARY KEY (meetingNo)
);


CREATE TABLE Interests
(
	interestsNo number NOT NULL,
	inter nvarchar2(10) NOT NULL,
	id varchar2(15) NOT NULL,
	PRIMARY KEY (interestsNo)
);


CREATE TABLE Like_BBS
(
	likeBNo number NOT NULL,
	bbsNo number NOT NULL,
	id varchar2(15) NOT NULL,
	PRIMARY KEY (likeBNo)
);


CREATE TABLE Like_comment
(
	likeCNo number NOT NULL,
	id varchar2(15) NOT NULL,
	commentNo number NOT NULL,
	PRIMARY KEY (likeCNo)
);


CREATE TABLE Meeting
(
	meetingNo number NOT NULL,
	meetingname nvarchar2(20) NOT NULL,
	operator varchar2(15) NOT NULL,
	opendate date DEFAULT SYSDATE NOT NULL,
	enddate date NOT NULL,
	town nvarchar2(30) NOT NULL,
	meetingdescription nvarchar2(1000) NOT NULL,
	categoryNo number NOT NULL,
	warningCount number DEFAULT 0,
	enabled number(1) DEFAULT 1,
	bannerimg nvarchar2(30),
	PRIMARY KEY (meetingNo)
);


CREATE TABLE MeetingAccusation
(
	mAccusationNo number NOT NULL,
	Reason nvarchar2(30) NOT NULL,
	Content nvarchar2(200) NOT NULL,
	id varchar2(15) NOT NULL,
	meetingNo number NOT NULL,
	process nvarchar2(10) DEFAULT '접수' NOT NULL,
	PRIMARY KEY (mAccusationNo)
);


CREATE TABLE MeetingHistory
(
	historyNo number NOT NULL,
	id varchar2(15) NOT NULL,
	progress varchar2(1) NOT NULL,
	meetingNo number NOT NULL,
	PRIMARY KEY (historyNo)
);


CREATE TABLE MeetingRole
(
	roleNo number NOT NULL,
	rolename nvarchar2(20) NOT NULL,
	id varchar2(15) NOT NULL,
	meetingNo number NOT NULL,
	name nvarchar2(10) NOT NULL,
	PRIMARY KEY (roleNo)
);


CREATE TABLE Member
(
	id varchar2(15) NOT NULL,
	pwd varchar2(15) NOT NULL,
	name nvarchar2(10),
	age number(3),
	gender char(1),
	tel varchar2(11) NOT NULL,
	profileimg varchar2(30),
	pr nvarchar2(50),
	about_me nvarchar2(1000),
	postdate date DEFAULT SYSDATE NOT NULL,
	authority varchar2(20) DEFAULT 'ROLE_USER' NOT NULL,
	enabled number(1) DEFAULT 1 NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE Message
(
	messageNo number NOT NULL,
	content nvarchar2(50) NOT NULL,
	chatNo number NOT NULL,
	roleNo number NOT NULL,
	postDate date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (messageNo)
);


CREATE TABLE Message_file
(
	cFileNo number NOT NULL,
	path varchar2(50) NOT NULL,
	filename nvarchar2(20) NOT NULL,
	chatNo number NOT NULL,
	postDate date DEFAULT SYSDATE NOT NULL,
	roleNo number NOT NULL,
	PRIMARY KEY (cFileNo)
);


CREATE TABLE Notice
(
	noticeNo number NOT NULL,
	title nvarchar2(50) NOT NULL,
	content nvarchar2(2000) NOT NULL,
	PRIMARY KEY (noticeNo)
);


CREATE TABLE Notice_file
(
	fileNo number NOT NULL,
	noticeNo number NOT NULL,
	path varchar2(50) NOT NULL,
	filename nvarchar2(20) NOT NULL,
	filetype varchar2(10) NOT NULL,
	filesize varchar2(10) NOT NULL,
	PRIMARY KEY (fileNo)
);


CREATE TABLE Performance
(
	pereformNo number NOT NULL,
	bbsNo number NOT NULL,
	perform_date date NOT NULL,
	town varchar2(10) NOT NULL,
	PRIMARY KEY (pereformNo)
);


CREATE TABLE Town
(
	townNo number NOT NULL,
	town nvarchar2(30),
	id varchar2(15) NOT NULL,
	PRIMARY KEY (townNo)
);



/* Create Foreign Keys */

ALTER TABLE BBSAccusation
	ADD FOREIGN KEY (bbsNo)
	REFERENCES BBS (bbsNo)
	ON DELETE CASCADE
;


ALTER TABLE BBS_Comment
	ADD FOREIGN KEY (bbsNo)
	REFERENCES BBS (bbsNo)
	ON DELETE CASCADE
;


ALTER TABLE BBS_IMG
	ADD FOREIGN KEY (bbsNo)
	REFERENCES BBS (bbsNo)
	ON DELETE CASCADE
;


ALTER TABLE Like_BBS
	ADD FOREIGN KEY (bbsNo)
	REFERENCES BBS (bbsNo)
	ON DELETE CASCADE
;


ALTER TABLE Performance
	ADD FOREIGN KEY (bbsNo)
	REFERENCES BBS (bbsNo)
	ON DELETE CASCADE
;


ALTER TABLE Like_comment
	ADD FOREIGN KEY (commentNo)
	REFERENCES BBS_Comment (commentNo)
	ON DELETE CASCADE
;


ALTER TABLE Chat_member
	ADD FOREIGN KEY (chatNo)
	REFERENCES Chatting (chatNo)
	ON DELETE CASCADE
;


ALTER TABLE Message
	ADD FOREIGN KEY (chatNo)
	REFERENCES Chatting (chatNo)
	ON DELETE CASCADE
;


ALTER TABLE Message_file
	ADD FOREIGN KEY (chatNo)
	REFERENCES Chatting (chatNo)
	ON DELETE CASCADE
;


ALTER TABLE Donation
	ADD FOREIGN KEY (meetingNo)
	REFERENCES Funding (meetingNo)
	ON DELETE CASCADE
;


ALTER TABLE BBS
	ADD FOREIGN KEY (meetingNo)
	REFERENCES Meeting (meetingNo)
	ON DELETE CASCADE
;


ALTER TABLE Calendar
	ADD FOREIGN KEY (meetingNo)
	REFERENCES Meeting (meetingNo)
	ON DELETE CASCADE
;


ALTER TABLE Chatting
	ADD FOREIGN KEY (meetingNo)
	REFERENCES Meeting (meetingNo)
	ON DELETE CASCADE
;


ALTER TABLE Funding
	ADD FOREIGN KEY (meetingNo)
	REFERENCES Meeting (meetingNo)
	ON DELETE CASCADE
;


ALTER TABLE MeetingAccusation
	ADD FOREIGN KEY (meetingNo)
	REFERENCES Meeting (meetingNo)
	ON DELETE CASCADE
;


ALTER TABLE MeetingHistory
	ADD FOREIGN KEY (meetingNo)
	REFERENCES Meeting (meetingNo)
	ON DELETE CASCADE
;


ALTER TABLE MeetingRole
	ADD FOREIGN KEY (meetingNo)
	REFERENCES Meeting (meetingNo)
	ON DELETE CASCADE
;


ALTER TABLE Chat_member
	ADD FOREIGN KEY (roleNo)
	REFERENCES MeetingRole (roleNo)
	ON DELETE CASCADE
;


ALTER TABLE Message
	ADD FOREIGN KEY (roleNo)
	REFERENCES MeetingRole (roleNo)
	ON DELETE CASCADE
;


ALTER TABLE Message_file
	ADD FOREIGN KEY (roleNo)
	REFERENCES MeetingRole (roleNo)
	ON DELETE CASCADE
;


ALTER TABLE AppealImg
	ADD FOREIGN KEY (id)
	REFERENCES Member (id)
	ON DELETE CASCADE
;


ALTER TABLE BBS
	ADD FOREIGN KEY (id)
	REFERENCES Member (id)
	ON DELETE CASCADE
;


ALTER TABLE BBSAccusation
	ADD FOREIGN KEY (id)
	REFERENCES Member (id)
	ON DELETE CASCADE
;


ALTER TABLE BBS_Comment
	ADD FOREIGN KEY (id)
	REFERENCES Member (id)
	ON DELETE CASCADE
;


ALTER TABLE Donation
	ADD FOREIGN KEY (id)
	REFERENCES Member (id)
	ON DELETE CASCADE
;


ALTER TABLE Interests
	ADD FOREIGN KEY (id)
	REFERENCES Member (id)
	ON DELETE CASCADE
;


ALTER TABLE Like_BBS
	ADD FOREIGN KEY (id)
	REFERENCES Member (id)
	ON DELETE CASCADE
;


ALTER TABLE Like_comment
	ADD FOREIGN KEY (id)
	REFERENCES Member (id)
	ON DELETE CASCADE
;


ALTER TABLE Meeting
	ADD FOREIGN KEY (operator)
	REFERENCES Member (id)
	ON DELETE CASCADE
;


ALTER TABLE MeetingAccusation
	ADD FOREIGN KEY (id)
	REFERENCES Member (id)
	ON DELETE CASCADE
;


ALTER TABLE MeetingHistory
	ADD FOREIGN KEY (id)
	REFERENCES Member (id)
	ON DELETE CASCADE
;


ALTER TABLE MeetingRole
	ADD FOREIGN KEY (id)
	REFERENCES Member (id)
	ON DELETE CASCADE
;


ALTER TABLE Town
	ADD FOREIGN KEY (id)
	REFERENCES Member (id)
	ON DELETE CASCADE
;


ALTER TABLE Notice_file
	ADD FOREIGN KEY (noticeNo)
	REFERENCES Notice (noticeNo)
	ON DELETE CASCADE
;


ALTER TABLE Meeting
	ADD FOREIGN KEY (categoryNo)
	REFERENCES Category (categoryNo)
	ON DELETE CASCADE
;



