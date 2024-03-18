

create view is_student
as select Sname,Sno,Sage from student
where Sdept = '信息系';


select * from is_student;

