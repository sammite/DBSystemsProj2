


#------------------------------------------------------------------------------------------------------------#
# Create tables.
# Some varchar are somewhat larger than necessary,
# due to inconsistent data standards for those fields. 
# These are to account for these inconsistencies. 

create database JCPDB;

use JCPDB;

Create Table Journal(
JournalID char(8) primary key, 
VolNum int,
Issnum int,
IssDate varchar(10) 
);

Create table JournalConf(
JournalID char(8),
ConfID char(8),
Primary key (JournalID, ConfID),
Foreign Key (JournalID) references Journal(JournalID)
);

CREATE TABLE Conference(
ConfID char(8),
ConfName varchar(100),
ConfLocation varchar(100),
ConfStartDate varchar(20),
ConfEndDate varchar(20),
ConfCoor varchar(50),
primary key (ConfID)
);

create table ConfMemDetails(
MemID char(8) primary key,
MemName varChar(50),
MemType varChar(100),
MemAff varChar(100),
MemCountry varChar(50)
);

create table ConfSpon(
ConfID Char(8),
ConfSponsor varChar(100),
primary key (ConfID, ConfSponsor),
foreign key (ConfID) references conference(ConfID)
);

create table ConfMem(
ConfID char(8),
MemID char(8),
primary key(ConfID, MemID),
foreign key (ConfID) references conference(ConfID),
foreign key (MemID) references ConfMemDetails(MemID)
);

create table CPSGuide(
ConfID char(8),
CPSGuidelines varchar(200),
primary key (ConfID, CPSGuidelines),
foreign key (ConfID) references conference(ConfID)
);

create table CPSDateDetails(
CPSDateID char(8) primary key,
CPSDateType varChar(100),
CPSDate date
);

create table CPSDate(
ConfID char(8),
CPSDateID char(8), 
primary key (ConfID, CPSDateID),
foreign key (ConfID) references conference(ConfID),
foreign key (CPSDateID) references CPSDateDetails(CPSDateID)
);

create table CPSTopics(
ConfID char(8),
CPSTOPICS varchar(100),
primary key (ConfID, CPSTOPICS),
foreign key (ConfID) references conference(ConfID)
);

Create table JournalEvent(
JournalID char(8) references Journal(JournalID),
EventID char(8), 
Primary key (JournalID, EventID)
);

CREATE TABLE JL(
JLID char(8),
JLOpenDate varchar(20),
JLCloseDate varchar(20),
JLTitle varchar(50),
JLDesc varchar(300),
JLSalary varchar(50),
JLStatus varchar(10),
JLLocation varchar(50),
JLEmployer varchar(50),
JLCInfoName varchar(50),
JLCInfoAdd varchar(100),
JLCInfoEmail varchar(50),
JLCInfoFax varchar(12),
JLCInfoTelNum varchar(12),
primary key (JLID)
);

Create Table JournalJL(
JournalID char(8) ,
JLID char(8),
Primary key (JournalID, JLID),
foreign key (JLID) references JL(JLID),
foreign key (JournalID) references Journal(JournalID)
);

Create Table Event(
EventID char (8) primary key references JournalEvent(EventID),
EventEndDate char(10),
EventStartDate char(10), 
EventLocation varchar (100),
EventName varchar (100),
EventCInfoName varchar(100),
EventCInfoAdd varchar(100),
EventCInfoEmail varchar(30),
EventCinfoFax varchar(13),
EventCInfoTelNum varchar(13)
);

create table Article(
ArticleID char(8),
ArticleTitle varChar(150),
ArticleAbstract varChar(1000),
ArticleContent varChar(10000),
primary key(ArticleID)
);

create table JournalArticle(
JournalID char(8),
ArticleID char(8),
primary key(JournalID, ArticleID),
foreign key(JournalID) references Journal(JournalID),
foreign key(ArticleID) references Article(ArticleID)
);


create table ArticleAuthorDetails(
ArticleAuthorID char(8),
ArticleAuthorName varchar(30),
ArticleAuthorEmployer varchar(150),
ArticleAuthorAff varchar(100),
primary key(ArticleAuthorID)
);


create table ArticleAuthor(
ArticleID char(8),
ArticleAuthorID char(8),
primary key(ArticleID, ArticleAuthorID),
foreign key(ArticleID) references Article(ArticleID),
foreign key(ArticleAuthorID) references ArticleAuthorDetails(ArticleAuthorID)
);

create table ArticleKey(
ArticleID char(8),
ArticleKeywords varChar(50),
primary key(ArticleID, ArticleKeywords),
foreign key(ArticleID) references Article(ArticleID)
);

create table Reference (
RefID char(8),
RefReleaseDate varChar(10),
RefPageIndex varChar(10),
RefTitle varChar(100),
RefSource varChar(100),
RefLocation varChar(100),
primary key(RefID)
);

create table ArticleRef(
ArticleID char(8) ,
RefID char(8),
primary key(ArticleID, RefID),
foreign key(RefID) references Reference(RefID),
foreign key (ArticleID) references Article(ArticleID)
);

create table ReferenceAuthor(
RefID char(8),
RefAuthorName varChar(20),
primary key(RefID, RefAuthorName),
foreign key(RefID) references Reference(RefID)
);

CREATE TABLE EventSpon(
EventID char(8),
EventSpon varchar(140),
primary key (EventID, EventSpon),
foreign key (EventID) references Event(EventID)
);

CREATE TABLE JLQualification(
JLID char(8),
JLQual varchar(250),
primary key (JLID, JLQual),
foreign key (JLID) references JL(JLID)
);

CREATE TABLE ConfContactDetails(
ConfCInfoID char(8),
ConfCInfoName varchar(30),
ConfCInfoType varchar(50),
ConfCInfoEmail varchar(50),
ConfCInfoAdd varchar(120),
ConfCInfoTelNum varchar(12),
ConfCInfoFax varchar(12),
primary key (ConfCInfoID)
);

CREATE TABLE ConfContact(
ConfID char(8),
ConfCInfoID char(8),
primary key (ConfID, ConfCInfoID),
foreign key (ConfID) references Conference(ConfID),
foreign key (ConfCInfoID) references ConfContactDetails(ConfCInfoID)
);

create table Degree(
DegID char(8),
DegType varchar(100),
DegLevel varchar(30),
DegYrComplete char(4),
primary key(DegID)
);

create table Student(
StuID char(8),
StuName varchar(30),
StuBackstory varchar(2500),
StuCity varchar(100),
StuState varchar(100),
StuCountry varchar(100),
primary key(StuID)
);

create table StudentDegree(
StuID char(8),
DegID char(8),
primary key(StuID, DegID),
foreign key (StuID) references Student(StuID),
foreign key (DegID) references Degree(DegID)
);

create table JournalStu(
JournalID char(8),
StuID char(8),
primary key(JournalID, StuID),
foreign key (JournalID) references Journal(JournalID),
foreign key (StuID) references Student(StuID)
);





#------------------------------------------------------------------------------------------------------------#
# Import data into relations

# Add CSV's to the tables.
# path to CSV's has been modified to point to \CSVs. Requires extra \ in the middle.
# Several CSV’s were somewhat corrupted from standard. 
# Rather than parsing by hand, slight # edits were made to commands, 
# such as enclosing with a different char, or using different 
# character encoding, to complete the database on schedule. 

Load Data Infile '\CSVs\\Conference.csv'
Into table Conference
Fields Terminated by ','
Enclosed by '"'
Lines terminated by '\r\n'
Ignore 1 rows;

Load Data infile '\CSVs\\ConfMemDetails.csv'
into table confmemdetails
fields terminated by ','
enclosed by "'"
lines terminated by '\r\n'
ignore 1 rows;

Load Data infile '\CSVs\\ConfMem.csv'
into table confmem
fields terminated by ','
enclosed by "'"
lines terminated by '\r\n'
ignore 1 rows;

Load Data infile '\CSVs\\ConfSpon.csv'
into table confspon
fields terminated by ','
enclosed by "'"
lines terminated by '\n'
ignore 1 rows;

Load Data infile '\CSVs\\CPSDateDetails.csv'
into table cpsdatedetails
fields terminated by ','
enclosed by "'"
lines terminated by '\n'
ignore 1 rows;

Load Data infile '\CSVs\\CPSDate.csv'
into table cpsdate
fields terminated by ','
enclosed by "'"
lines terminated by '\n'
ignore 1 rows;

Load Data infile '\CSVs\\cpsguide.csv'
into table cpsguide
fields terminated by ','
enclosed by "'"
lines terminated by '\n'
ignore 1 rows;

Load Data infile '\CSVs\\CPSTopics.csv'
into table cpstopics
fields terminated by ','
enclosed by "'"
lines terminated by '\n'
ignore 1 rows;

Load data infile '\CSVs\\Journal.csv'
Into Table Journal
Fields Terminated by ','
Enclosed by "'"
Lines terminated by '\r\n'
Ignore 1 Rows;

Load data infile '\CSVs\\JournalConf.csv'
Into Table JournalConf
Fields Terminated by ','
Lines terminated by '\r\n'
Ignore 1 Rows;

Load data infile 'kj\CSVs\\JournalEvent.csv'
Into Table JournalEvent
Fields Terminated by ','
Lines terminated by '\r\n'
Ignore 1 Rows;

Load data infile '\CSVs\\Event.csv'
Into Table Event
Fields Terminated by ','
Enclosed by "'"
Lines terminated by '\r\n'
Ignore 1 Rows;

Load Data Infile '\CSVs\\EventSpon.csv'
Into table EventSpon
Fields Terminated by ','
Enclosed by "'"
Lines terminated by '\r\n'
Ignore 1 rows;

Load Data Infile '\CSVs\\JL.csv'
Into table JL
Fields Terminated by ','
Enclosed by '"'
Lines terminated by '\r\n'
Ignore 1 rows;

Load Data infile '\CSVs\\ArticleAuthorDetails.csv'
into table ArticleAuthorDetails
fields terminated by ','
enclosed by "'"
lines terminated by '\r\n'
ignore 1 rows;

Load data infile '\CSVs\\Article.csv'
Into table Article
Fields terminated by ','
Enclosed by "'"
Lines terminated by '\r\n'
Ignore 1 rows;

Load data infile '\CSVs\\ArticleKey.csv'
Into table ArticleKey
Fields terminated by ','
Enclosed by "'"
Lines terminated by '\r\n'
Ignore 1 rows;

Load data infile '\CSVs\\JournalArticle.csv'
Into table JournalArticle
Fields terminated by ','
Lines terminated by '\r\n'
Ignore 1 rows;

Load data infile '\CSVs\\Reference.csv'
Into table Reference
Fields terminated by ','
Enclosed by "'"
Lines terminated by '\r\n'
Ignore 1 rows;

Load data infile '\CSVs\\ReferenceAuthor.csv'
Into table ReferenceAuthor
Fields terminated by ','
Enclosed by "'"
Lines terminated by '\r\n'
Ignore 1 rows;

Load Data Infile '\CSVs\\ConfContactDetails.csv'
Into table ConfContactDetails
Fields Terminated by ','
Enclosed by '"'
Lines terminated by '\r\n'
Ignore 1 rows;

Load Data Infile '\CSVs\\ConfContact.csv'
Into table ConfContact
Fields Terminated by ','
Enclosed by '"'
Lines terminated by '\r\n'
Ignore 1 rows;

Load Data infile '\CSVs\\Degree.csv'
into table Degree
fields terminated by ','
enclosed by "'"
lines terminated by '\r\n'
ignore 1 rows;

Load data infile '\CSVs\\JournalJL.csv'
Into Table JournalJL
Fields Terminated by ','
Lines terminated by '\r\n'
Ignore 1 Rows;

Load Data Infile '\CSVs\\JLQualification.csv'
Into table JLQualification
Fields Terminated by ','
Enclosed by '"'
Lines terminated by '\r\n'
Ignore 1 rows;



Load data infile '\CSVs\\ArticleAuthor.csv'
Into table ArticleAuthor
Fields terminated by ','
Lines terminated by '\r\n'
Ignore 1 rows;

Load Data infile '\CSVs\\ArticleRef.csv'
into table ArticleRef
fields terminated by ','
enclosed by "'"
lines terminated by '\n'
ignore 1 rows;

Load Data infile '\CSVs\\Student.csv'
into table Student
character set latin1
fields terminated by ','
enclosed by "'"
lines terminated by '\r\n'
ignore 1 rows;

Load Data infile '\CSVs\\JournalStu.csv'
into table JournalStu
fields terminated by ','
enclosed by "'"
lines terminated by '\n'
ignore 1 rows;

Load Data infile '\CSVs\\StudentDegree.csv'
into table StudentDegree
fields terminated by ','
enclosed by "'"
lines terminated by '\n'
ignore 1 rows;

#------------------------------------------------------------------------------------------------------------#
# Create the views 
 
# Researcher View 
Create View ResearcherView (IssNum, IssDate, ArticleTitle, ArticleAuthorName, ArticleKeywords)
AS  Select IssNum, IssDate, ArticleTitle, ArticleAuthorName, ArticleKeywords
From (((((Journal join JournalArticle on Journal.JournalID = JournalArticle.JournalID) 
join Article on JournalArticle.ArticleID = Article.ArticleID) 
join ArticleKey on Article.ArticleID = ArticleKey.ArticleID) 
join ArticleAuthor on Article.ArticleID = ArticleAuthor.ArticleID) 
join ArticleAuthorDetails on ArticleAuthorDetails.ArticleAuthorID = ArticleAuthor.ArticleAuthorID);

# Job Hunter View
Create View JobHunterView (IssNum, IssDate, JLTitle, JLLocation, JLStatus, JLSalary)
AS
Select IssNum, IssDate, JLTitle, JLLocation, JLStatus, JLSalary
From Journal, JournalJL, JL
Where Journal.JournalID = JournalJL.JournalID AND
JournalJL.JLID = JL.JLID;

#------------------------------------------------------------------------------------------------------------#

# Query 1: Display (print) your entire database

Select *
From Degree; 

Select *
From Student; 

Select *
From StudentDegree; 

Select *
From JournalStu;

Select *
From ArticleAuthorDetails; 

Select *
From ArticleRef; 

Select *
From Article; 

Select *
From ArticleAuthor; 

Select *
From ArticleKey; 

Select *
From Reference; 

Select *
From ReferenceAuthor; 

Select *
From JournalArticle; 

Select *
From Journal; 

Select *
From JournalConf;

Select *
From JournalEvent; 

Select *
From JournalJL; 

Select *
From Event; 

Select *
From EventSpon; 

Select *
From JL; 

Select *
From JLQualification; 

Select *
From ConfContactDetails; 

Select *
From Conference; 

Select *
From ConfContact; 

Select *
From ConfMemDetails; 

Select *
From ConfSpon; 

Select *
From ConfMem; 

Select *
From CPSGuide; 

Select *
From CPSDate; 

Select *
From CPSTopics; 

Select *
From CPSDateDetails;

# Query 2: Get the name of those conferences which hold outside of the United States.
Select ConfName
From Conference
Where ConfLocation Not like '%United States%';

# Query 3: Get the list of all conferences which hold in cooperation with IEEE.
# Modeled conferences with call for papers separately from conferences in event calendar.
# Unable to fix this with the time constraint we had when we discovered this was an error.
# This query pulls only from conferences in the calendar.                
Select *
From event
Where eventid = ANY
                (Select eventid
                From eventspon
                Where eventspon.EventSpon like '%coop%IEEE%');

# Pulls only from conferences in the calls for papers.
Select *
From Conference
Where Conference.ConfID = ANY
                (Select ConfSpon.ConfID
                From ConfSpon
                Where ConfSpon.ConfSponsor like '%In cooperation with%IEEE%');


# Query 4: To whom the papers should be sent for the 13th International Conference 
# on Distributed Computing Systems and where is the location of this conference.

Select ConfName, ConfLocation, ConfCInfoName, ConfCInfoType, ConfCInfoEmail, 
	ConfCInfoAdd, ConfCInfoTelNum, ConfCInfoFax from ConfContactDetails, Conference
Where ConfName like '%13th International Conference on Distributed Computing Systems' 
	and ConfCInfoType like 'Paper Submission' and ConfCInfoID = any(
    Select ConfCInfoID from ConfContact 
    Where ConfID = any(
        Select ConfID from Conference
        Where ConfName like '%13th International Conference on Distributed Computing Systems'));

# Query 5: Get the list of authors who also serve as the conference committee members
Select * from ArticleAuthorDetails
Where ArticleAuthorName = any(
    Select MemName from ConfMemDetails
    Where MemType like '%Committee');
    
# Query 6: How many call for papers are in the issue of August 1992.
Select COUNT(*) from Conference
Where ConfID = any(
    Select ConfID from JournalConf
    Where JournalID = any(
        Select JournalID from Journal
        Where IssDate like '%08%1992%'));
        
# Query 7: Get the list of Jobs which are located in the same state as the conference on the Solid Model '93

Select *
from JL
where JLLocation = ANY
(Select ConfLocation
from Conference
where ConfName = "Solid Modeling '93"
);

# Query 8: Get the list of qualifications for all jobs available outside of United States.

Select JLQual
From JLQualification
Where JLQualification.JLID = ANY
(Select JLID 
From JL
Where JLLocation not like '%United States%'
);


# Query 9: We have forgotten to include two job announcements for the last issue. 
# Add these job announcements to your database (Look for these jobs under the heading of LOST JOBS in the attachment)

Select * from JL where JLID = '36145034' or JLID = '43434356';
Select * from JLQualification where JLID = '36145034' or JLID = '43434356';
Select * from JournalJL where JLID =  '36145034' or JLID = '43434356';

Insert into JL(JLID, JLOpenDate, JLTitle, JLDesc, JLSalary, JLStatus, 
				JLLocation, JLEmployer, JLCloseDate, JLCInfoName, JLCInfoAdd, 
                JLCInfoEmail, JLCInfoFax, JLCInfoTelNum)
Values
('36145034', '1992-04-13', 'Assistant Professor', 
'Teach variety of undergraduate courses in computing science and business information systems.', 
'null', 'tenure', 'Oregon, United States', 'Linfield College', '1992-09-01', 
'Dr. Kenneth P. Goodrich', 'Dean of Faculty, Linfield College, Mckinnville, Oregon 97128', 'null', 'null', 'null'),

('43434356', 'null', 'faculty position', 
'Seeks an experienced candidate for a tenure track or tenured faculty position in the area of computer engineering.', 
'null', 'tenure', 'North Carolina, United States', 'Duke University', 'null', 
'Kishor Trivedi', 'Department of Electrical Engineering, Duke University, Durham, North Carolina 27706', 
'null', 'null', 'null');

Insert into JLQualification(JLID, JLQual)
Values
('36145034', 'Ph.D. in Computing Science or related field with either masters in computing science (preferred) or equivalent experience'),
('36145034', 'Teaching experience, preferably beyond teaching assistant level'),
('43434356', 'Ph.D.'),
('43434356', 'Strong and documented research record'),
('43434356', 'Dedication to excellence in teaching');
Insert into JournalJL(JournalID, JLID)
Values
('12300002', '36145034'),
('12300002', '43434356');

Select * from JL where JLID = '36145034' or JLID = '43434356';
Select * from JLQualification where JLID = '36145034' or JLID = '43434356';
Select * from JournalJL where JLID =  '36145034' or JLID = '43434356';

# Query 10: The deadline for submitting a paper to the Solid Model '93 conference 
# has been changed to December 30, 1992. Update your database to reflect the new date.

Select * from CPSDateDetails 
where CPSDateType = 'Full Papers Due (6 Copies)' and CPSDateID = Any
(Select CPSDateID
From CPSDate
Where ConfID = Any
(Select ConfID
From Conference
where ConfName = "Solid Modeling '93")
);


Update CPSDateDetails
Set CPSDate = '1992-12-30'
where CPSDateType = 'Full Papers Due (6 Copies)' and CPSDateID = Any
(Select CPSDateID
From CPSDate
Where ConfID = Any
(Select ConfID
From Conference
where ConfName = "Solid Modeling '93")
);

Select * from CPSDateDetails 
where CPSDateType = 'Full Papers Due (6 Copies)' and CPSDateID = Any
(Select CPSDateID
From CPSDate
Where ConfID = Any
(Select ConfID
From Conference
where ConfName = "Solid Modeling '93")
);


# Query 11: The university of Miami withdrew its ad for open position yesterday. 
# Delete this job announcement from your database.

(Select JLID from JL where JLEmployer = "University of Miami");

Delete from JournalJL where JLID = 
(Select JLID from JL where JLEmployer = "University of Miami");
Delete from JLQualification where JLID = any
(Select JLID from JL where JLEmployer = "University of Miami");
Delete from JL where JLEmployer = "University of Miami";

(Select JLID from JL where JLEmployer = "University of Miami");

# Query 12: Get the name of conferences which is sponsored by both SIGART and SIGCHI.
# Get the name of conferences which is sponsored by both SIGART and SIGCHI.
# Modeled conferences with call for papers separately from conferences in event calendar.
# Unable to fix this with the time constraint we had when we discovered this was an error.
# This query pulls only from conferences in the calendar.
Select EventName from Event where eventID = any
(Select eventID from eventSpon where
eventID = any (Select eventID from eventSpon where eventSpon like "%SIGART%") and
eventID = any (Select eventID from eventSpon where eventSpon like "%SIGCHI%"));

# This query pulls only from conferences in the call for papers submissions. 
# Cannot combine as we are not allowed to join them.
Select ConfName from Conference where confID = any
(Select ConfID from ConfSpon where
ConfID = any (Select ConfID from ConfSpon where confSponsor like "%SIGART%") and
ConfID = any (Select ConfID from ConfSpon where ConfSponsor like "%SIGCHI%"));

# Query 13: Get the list of authors who had a publication in both issues of the JCP

Select articleauthordetails.ArticleAuthorName
from articleauthordetails
where articleauthordetails.ArticleAuthorID = any 
	(select articleauthor.ArticleAuthorID
	from articleauthor
	where articleauthor.ArticleID = any
		(select journalarticle.ArticleID
		from journalarticle
		where journalarticle.JournalID = any
			(select journal.JournalID
			from journal
			where journal.JournalID = any
				(select journal.JournalID
				from journal
				where JournalID = '12300001' AND articleauthordetails.ArticleAuthorName = any
					(Select articleauthordetails.ArticleAuthorName
					from articleauthordetails
					where articleauthordetails.ArticleAuthorID = any 
						(select articleauthor.ArticleAuthorID
						from articleauthor
						where articleauthor.ArticleID = any
							(select journalarticle.ArticleID
							from journalarticle
							where journalarticle.JournalID = any
								(select journal.JournalID
								from journal
								where journal.JournalID = any
									(select journal.JournalID
									from journal
									where JournalID = '12300002')))))))));
                                    
# Query 14: Get the name of students (serving as interns) who study in the same discipline 
# as "Clara Prez Marcos" and they are originally from the same country as "Thomas Kavoory".

 Select student.stuName
  from student
  where student.StuCountry = any 
			(select student.StuCountry
			from student
			where student.StuName = 'Thomas Kavoori' AND student.StuID = any
				(select studentdegree.StuID from studentdegree  where studentdegree.DegID = any
					(select degree.DegID
					from degree where degree.DegType = any 
						(select degree.DegType   
						from degree 
                        where degree.DegID = any
										(select studentdegree.DegID                                                                                                                                                                from studentdegree                                                                                                                                                          where studentdegree.StuID = any                (select student.StuID                                                                                                                                                                                                from student
										where student.StuName = 'Clara Perez Marcos'))))));


