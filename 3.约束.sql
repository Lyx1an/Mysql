# create table 工作表(
#     工作编号 char(8) not null ,
#     最低工资 int,
#     最高工资 int,
#     check ( 最低工资 <= 最高工资 )
# );
# create table 雇员表(
#     雇员编号 char(7) not null ,
#     工作编号 char(8),
#     工资 int,
#     电话号码 char(8)
# )
#

# 对雇员表和工作表分别添加主键约束。
alter table work_review.雇员表
    add constraint pk_emp primary key (雇员编号);
alter table work_review.工作表
    add constraint pk_job primary key (工作编号);

# 为雇员表的电话号码添加unique约束
alter table work_review.雇员表
add constraint uk_sid unique (电话号码);

# 为雇员表的工作编号添加外键约束，引用了工作表的工作编号列，
# 防止了在 雇员表 中插入或更新一个不存在于 工作表 的 工作编号 中的值。
alter table work_review.雇员表
add constraint fk_job_id foreign key (工作编号)
references 工作表(工作编号);


# default约束，用来设定默认值
# 请注意，此语句中使用的是 ALTER COLUMN 而不是 ADD CONSTRAINT，因为默认值是直接应用于列而不是创建一个约束。
alter table work_review.雇员表
alter column 工资 set default 1600;

# check 约束
alter table work_review.雇员表
add constraint chk_salary check ( 工资>=1000 );

