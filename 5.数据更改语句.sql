insert into student (Sno,Sname,Ssex)
values (1512251,'帆波','女');


update  student set Sage=19,Sdept = '文学'
 where(Sname = '帆波');

select * from student;

delete from student
where Sno = 1512252;

