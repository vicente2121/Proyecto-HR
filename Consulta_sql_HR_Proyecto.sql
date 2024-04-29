
use prueba

Drop table Stage_table

Create table Stage_table 
(
Age int,
Distance_From_Home int,
Total_Working_Years int,
Job_Satisfaction int,
Ditance_status varchar (100),
Working_year_group varchar(100),
Age_bucket varchar(100),
Job_Satisfaction_Status varchar(100),
Attrition varchar(50),
Gender varchar(100)
)

select * from Stage_table


Create table DimDistance
(
IdDistance int identity (1,1), 
Ditance_status varchar (100)
)


Create table DimWorkingYearGroup
(
IdWorkingYearGroup int identity (1,1), 
WorkingYearGroup varchar (100)
)


Create table DimAgeBucket
(
IdAgeBucket int identity (1,1), 
AgeBucket varchar (100)
)


Create table DimJobSatisfactionStatus

(
IdJobSatisfactionStatus int identity (1,1), 
JobSatisfactionStatus varchar (100)
)

Create table DimAttriotionGender

(
IdAttriotionGender int identity (1,1), 
Attriotion varchar (100),
Gender varchar (100)
)

insert into DimAttriotionGender
select distinct 
Attrition,gender 
from
Stage_table

select * from DimAttriotionGender


insert into DimDistance
select distinct 
Ditance_status
from
Stage_table

select * from DimDistance

insert into DimWorkingYearGroup
select distinct 
Working_year_group
from
Stage_table


select * from DimWorkingYearGroup

insert into DimAgeBucket
select distinct 
Age_bucket
from
Stage_table


select * from DimAgeBucket

insert into DimJobSatisfactionStatus
select distinct 
Job_Satisfaction_Status
from
Stage_table

delete  DimJobSatisfactionStatus

select * from DimJobSatisfactionStatus

create table Fact_HR

(
IdDistance

)

Select * 
into #Temporals
from Stage_table

select * from  #Temporals

Select b.IdAttriotionGender,c.IdDistance,d.IdWorkingYearGroup,e.IdAgeBucket,f.IdJobSatisfactionStatus
from  #Temporals as a
left join  DimAttriotionGender as b
on a.gender =b.gender and 
a.Attrition=b.Attriotion
left join DimDistance as c
on a.Ditance_status=c.Ditance_status
left join DimWorkingYearGroup as d
on a.Working_year_group=d.WorkingYearGroup
left join DimAgeBucket as e
on a.Age_bucket=e.AgeBucket
left join DimJobSatisfactionStatus as f
on a.Job_Satisfaction_Status=f.JobSatisfactionStatus

create table Fact_HR
(
IdHR int identity(1,1),
IdAttriotionGender int,
IdDistance int,
IdWorkingYearGroup int,
IdAgeBucket int,
IdJobSatisfactionStatus int
)


INSERT INTO Fact_HR
Select b.IdAttriotionGender,c.IdDistance,d.IdWorkingYearGroup,e.IdAgeBucket,f.IdJobSatisfactionStatus
from  #Temporals as a
left join  DimAttriotionGender as b
on a.gender =b.gender and 
a.Attrition=b.Attriotion
left join DimDistance as c
on a.Ditance_status=c.Ditance_status
left join DimWorkingYearGroup as d
on a.Working_year_group=d.WorkingYearGroup
left join DimAgeBucket as e
on a.Age_bucket=e.AgeBucket
left join DimJobSatisfactionStatus as f
on a.Job_Satisfaction_Status=f.JobSatisfactionStatus
