select Sname as '姓名','出生年份' as '年份',2024-Sage as '年份'from student;


# 添加distinct关键字，可以去除重复
# select Sno from sc;
select distinct Sno from sc;

# where条件查询语句
select Sname,sdept from student;
# 查询计算机系全体学生的姓名
select Sname , sdept from student where Sdept='计算机系';

# 查询所有年龄在20岁以上的学生的姓名和年龄
select Sname as '姓名',Sage as '年龄'from student
where Sage>20;

# 查询考试成绩优秀的学生的学号
select Sno from sc
where Grade>=90;
# 进行去重
select distinct Sno from sc
where Grade>=90;

#  between {}and{} 关键字       ||查询年龄在19-21的学生姓名，所在系，年龄
select sname as name,Sdept as xueyuan,Sage as age from student
where Sage between 19 and 21;
# 等价于
select sname as name,Sdept as xueyuan,Sage as age from student
where Sage>=19 and Sage<=21;

# 查询年龄 不 在19-21的学生姓名，所在系，年龄
select sname as name,Sdept as xueyuan,Sage as age from student
where Sage  not between 19 and 21;
# 等价于
select sname as name,Sdept as xueyuan,Sage as age from student
where Sage<19 or Sage>21;

#  （not）  in 关键字   ||   查询信息系，计算机系学生的姓名和性别
select Sname,Ssex from student
where Sdept in ('计算机系' , '信息系');
# 不在信息系，计算机系学生的姓名和性别
select Sname,Ssex from student
where Sdept not in ('计算机系' , '信息系');

# 字符串匹配  like 关键字
# “_”匹配任意一个字符
select Sname from student
where Sname like '小_';

insert into student (Sno, Sname, Ssex, Sage, Sdept) values
('S011', '小小琦', '男', 18, '数学系');

# “%”匹配0个或多个字符
select Sname from student
where Sname like '小%';

select Sname from student
where Sname like '张%' Or Sname like '王%';

# 查询名字中第二个字为“三”的学生的姓名和学号
select Sname,Sno from student
where Sname like '_三';
# 查询所有不姓“王”也不姓“张”的学生的姓名和学号
select Sname,Sno from student
where Sname not like '三%' and Sname not like '张%';

# 对查询结果进行排序
select *
from student
order by Sage; #默认为asc，升序
# 降序desc
select *
from student
order by Sage desc ;

select  * from student order by Sdept,Sage;

# 聚合函数  ps:聚合函数不能出现在where语句中 如以下写法是错误的
# select Sname from student where Sage = max(Sage);

# count(distinct)一般配合distinct使用，统计本列非空列值个数
select  count(distinct Sno) as 学生人数 from student;
# sum，计算列值总和，必须是数值类型的列
select sum(Grade) as 总成绩 from sc
where Sno="1512101";
# avg，计算列平均值，必须是数值类型的列
select avg(Grade) as 总成绩 from sc
where Sno="1512101";
# max，求列最大
select max(Grade) from  sc
where Cno="C001";
# min，求列最小
select min(Grade) from  sc
where Cno="C001";

# group by 分组函数
# 统计每门课程的选课人数，列出课程号和选课人数
select Cno as 课程,count(Sno) as 选课人数
from sc group by (Cno);

# 统计每个学生的选课门数和平均成绩
select Sno as 学号, count(*) as 选课门数,avg(Grade) as 平均成绩
from sc group by Sno;

# 统计每个系的学生人数和平均年龄
select sdept,count(*) 学生人数, avg(Sage) as 平均年龄 from student
group by Sdept;

# 带where的子句的分组，统计每个系的男生人数
select Sdept 院系,count(*) 人数 from student
where Ssex='男'
group by Sdept;

# 按多列分组，统计每个系的男生人数和女生人数，以及男生的最大年龄和女生的最大年龄
# 结果按系名的升序排序
select Sdept,Ssex,max(Sage) 最大年龄,count(Sno) 系人数 from student
group by Sdept, Ssex
order by Sdept;

# having语句，可以使用聚合函数
select Sno ,count(*) 选课门数 from sc
group by Sno
having count(*)>2;

# 查询考试平均成绩超过85的学生的学号、选课门数和平均成绩
select Sno 学号, count(*) 选课门数,avg(Grade) 平均成绩 from sc
group by Sno
having avg(Grade)>85;


# 统计每个系的男生人数，只列出男生人数大于等于3的系
select Sdept,  count(Sno)from student
group by Sdept, Ssex
having Ssex = '男' and count(Sno)>=3;
# 等价于
select Sdept,  count(Sno)from student
where Ssex = '男'
group by Sdept, Ssex
having count(Sno)>=3;

# 多表连接操作
# inner join 内连接
select sc.Sno,Sname,Ssex,Sdept,Sage,Cno,Grade
from student inner join sc on student.Sno = sc.Sno;

# 查询计算机系学生的选课情况，要求列出学生的学号、名字、所选的课程号和成绩
select  student.Sno,Sname,Cno,Grade from student inner join sc s on student.Sno = s.Sno
where Sdept = '计算机系';

# 查找计算机系选秀了地理科学的学生的成绩，列出姓名，课程名，成绩
select Sname,Cname,Grade
from student join sc s on student.Sno = s.Sno
             join course c on c.Cno = s.Cno
where Sdept = '计算机系' and Cname = '力学';

# 查询所有选修了计算机编程导论的学生，列出姓名，所在系
select Sname,Sdept from student join sc s on student.Sno = s.Sno
                                join course c on c.Cno = s.Cno
where Cname = '计算机编程导论';

# 自连接
# 查询与张三在同一个系学习的学生的姓名和所在系
select s2.Sno,s2.Sname,s2.Sdept from student s1 join student s2 on s1.Sdept = s2.Sdept
where s1.Sname = '张三' and s2.Sname !='张三';

# 外连接
select s.Sno,s.Cno,Cname,Grade from course left outer join sc s on course.Cno = s.Cno;


select s.Sno,s.Sname,Cno,Grade from sc left outer join student s on sc.Sno = s.Sno;

# limit 限制结果集
SELECT Sname, Sage, Sdept
FROM student
ORDER BY Sage desc
limit 3 ;

# 子查询
# 查询与张三在同一个系学习的学生的学号，姓名和所在系
select Sno,Sname,Sdept
from student where sdept in
                   (select Sdept from student where Sname = '张三')
               and Sname != '张三';

# 查询选修了计算机编程导论的学生的姓名，院系
select Sno,Sname,Sdept
from student where Sno in
                   (select Sno from sc
                    where Cno in (
                        select course.Cno from  course
                        where Cname  = '计算机编程导论'
                    ));

# 查询计算机系年龄最大的学生的姓名和年龄
select Sname,Sage from student
where Sdept='计算机系'
  and Sage = (select max(Sage) from student
              where Sdept = '计算机系');

SELECT Sname, Sage
FROM student
WHERE Sdept = '计算机系'
  AND Sage = (
    SELECT MAX(Sage)
    FROM student
    WHERE Sdept = '计算机系'
);

select Sname,max(Sage) from student
where Sdept in (select Sdept from student
                where Sdept='计算机系')