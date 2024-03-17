# alter table <表名>

alter table student
add  Spec char(10) null ;

alter table student
# 这里使用的是motify，不是alter
modify column Spec char(20);

alter table student
drop column Spec
