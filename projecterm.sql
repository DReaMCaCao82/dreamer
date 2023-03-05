

/* Create Tables */

CREATE TABLE AppealImg
(
	appealNo number NOT NULL,
	img varchar2(50) NOT NULL,
	id varchar2(15) NOT NULL,
	path varchar2(50) NOT NULL,
	filename nvarchar2(20) NOT NULL,
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
	path varchar2(50) NOT NULL,
	filename nvarchar2(20) NOT NULL,
	PRIMARY KEY (imgNo)
);


CREATE TABLE Calendar
(
	CalendarNo number NOT NULL,
	title nvarchar2(20) NOT NULL,
	contents nvarchar2(200) NOT NULL,
	meetingNo number NOT NULL,
	PRIMARY KEY (CalendarNo)
);


CREATE TABLE chatting
(
	chatNo number NOT NULL,
	meetingNo number NOT NULL,
	name nvarchar2(10) NOT NULL,
	PRIMARY KEY (chatNo)
);


CREATE TABLE chat_member
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


CREATE TABLE funding
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


CREATE TABLE MainCategory
(
	categoryNo number NOT NULL,
	name nvarchar2(10) NOT NULL,
	PRIMARY KEY (categoryNo)
);


CREATE TABLE Meeting
(
	meetingNo number NOT NULL,
	meetingname nvarchar2(20) NOT NULL,
	operator varchar2(15) NOT NULL,
	category nvarchar2(10) NOT NULL,
	opendate date DEFAULT SYSDATE NOT NULL,
	enddate date NOT NULL,
	town nvarchar2(10) NOT NULL,
	meetingdescription nvarchar2(1000) NOT NULL,
	subCategoryNo number NOT NULL,
	PRIMARY KEY (meetingNo)
);


CREATE TABLE MeetingAccusation
(
	mAccusationNo number NOT NULL,
	Reason nvarchar2(30) NOT NULL,
	Content nvarchar2(200) NOT NULL,
	id varchar2(15) NOT NULL,
	meetingNo number NOT NULL,
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
	profileimg varchar2(50),
	pr nvarchar2(50),
	about_me nvarchar2(1000),
	postdate date DEFAULT SYSDATE NOT NULL,
	authority varchar2(20) DEFAULT 'ROLE_USER' NOT NULL,
	enabled number(1) DEFAULT 1 NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE message
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


CREATE TABLE performance
(
	bbsNo number NOT NULL,
	perform_date date NOT NULL,
	town varchar2(10) NOT NULL,
	PRIMARY KEY (bbsNo)
);


CREATE TABLE SubCategory
(
	subCategoryNo number NOT NULL,
	name nvarchar2(15) NOT NULL,
	categoryNo number NOT NULL,
	PRIMARY KEY (subCategoryNo)
);


CREATE TABLE Town
(
	townNo number NOT NULL,
	town varchar2(10),
	id varchar2(15) NOT NULL,
	PRIMARY KEY (townNo)
);



/* Create Foreign Keys */

ALTER TABLE BBSAccusation
	ADD FOREIGN KEY (bbsNo)
	REFERENCES BBS (bbsNo)
;


ALTER TABLE BBS_Comment
	ADD FOREIGN KEY (bbsNo)
	REFERENCES BBS (bbsNo)
;


ALTER TABLE BBS_IMG
	ADD FOREIGN KEY (bbsNo)
	REFERENCES BBS (bbsNo)
;


ALTER TABLE Like_BBS
	ADD FOREIGN KEY (bbsNo)
	REFERENCES BBS (bbsNo)
;


ALTER TABLE performance
	ADD FOREIGN KEY (bbsNo)
	REFERENCES BBS (bbsNo)
;


ALTER TABLE Like_comment
	ADD FOREIGN KEY (commentNo)
	REFERENCES BBS_Comment (commentNo)
;


ALTER TABLE chat_member
	ADD FOREIGN KEY (chatNo)
	REFERENCES chatting (chatNo)
;


ALTER TABLE message
	ADD FOREIGN KEY (chatNo)
	REFERENCES chatting (chatNo)
;


ALTER TABLE Message_file
	ADD FOREIGN KEY (chatNo)
	REFERENCES chatting (chatNo)
;


ALTER TABLE Donation
	ADD FOREIGN KEY (meetingNo)
	REFERENCES funding (meetingNo)
;


ALTER TABLE SubCategory
	ADD FOREIGN KEY (categoryNo)
	REFERENCES MainCategory (categoryNo)
;


ALTER TABLE BBS
	ADD FOREIGN KEY (meetingNo)
	REFERENCES Meeting (meetingNo)
;


ALTER TABLE Calendar
	ADD FOREIGN KEY (meetingNo)
	REFERENCES Meeting (meetingNo)
;


ALTER TABLE chatting
	ADD FOREIGN KEY (meetingNo)
	REFERENCES Meeting (meetingNo)
;


ALTER TABLE funding
	ADD FOREIGN KEY (meetingNo)
	REFERENCES Meeting (meetingNo)
;


ALTER TABLE MeetingAccusation
	ADD FOREIGN KEY (meetingNo)
	REFERENCES Meeting (meetingNo)
;


ALTER TABLE MeetingHistory
	ADD FOREIGN KEY (meetingNo)
	REFERENCES Meeting (meetingNo)
;


ALTER TABLE MeetingRole
	ADD FOREIGN KEY (meetingNo)
	REFERENCES Meeting (meetingNo)
;


ALTER TABLE chat_member
	ADD FOREIGN KEY (roleNo)
	REFERENCES MeetingRole (roleNo)
;


ALTER TABLE message
	ADD FOREIGN KEY (roleNo)
	REFERENCES MeetingRole (roleNo)
;


ALTER TABLE Message_file
	ADD FOREIGN KEY (roleNo)
	REFERENCES MeetingRole (roleNo)
;


ALTER TABLE AppealImg
	ADD FOREIGN KEY (id)
	REFERENCES Member (id)
;


ALTER TABLE BBS
	ADD FOREIGN KEY (id)
	REFERENCES Member (id)
;


ALTER TABLE BBSAccusation
	ADD FOREIGN KEY (id)
	REFERENCES Member (id)
;


ALTER TABLE BBS_Comment
	ADD FOREIGN KEY (id)
	REFERENCES Member (id)
;


ALTER TABLE Donation
	ADD FOREIGN KEY (id)
	REFERENCES Member (id)
;


ALTER TABLE Interests
	ADD FOREIGN KEY (id)
	REFERENCES Member (id)
;


ALTER TABLE Like_BBS
	ADD FOREIGN KEY (id)
	REFERENCES Member (id)
;


ALTER TABLE Like_comment
	ADD FOREIGN KEY (id)
	REFERENCES Member (id)
;


ALTER TABLE Meeting
	ADD FOREIGN KEY (operator)
	REFERENCES Member (id)
;


ALTER TABLE MeetingAccusation
	ADD FOREIGN KEY (id)
	REFERENCES Member (id)
;


ALTER TABLE MeetingHistory
	ADD FOREIGN KEY (id)
	REFERENCES Member (id)
;


ALTER TABLE MeetingRole
	ADD FOREIGN KEY (id)
	REFERENCES Member (id)
;


ALTER TABLE Town
	ADD FOREIGN KEY (id)
	REFERENCES Member (id)
;


ALTER TABLE Notice_file
	ADD FOREIGN KEY (noticeNo)
	REFERENCES Notice (noticeNo)
;


ALTER TABLE Meeting
	ADD FOREIGN KEY (subCategoryNo)
	REFERENCES SubCategory (subCategoryNo)
;



