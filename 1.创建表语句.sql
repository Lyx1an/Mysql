CREATE TABLE Student(
                        Sno CHAR(7) PRIMARY KEY,
                        Sname CHAR(10) CHARACTER SET utf8mb4 NOT NULL,
                        Ssex CHAR(2),
                        Sage TINYINT,
                        Sdept CHAR(20) CHARACTER SET utf8mb4
) CHARACTER SET = utf8mb4;

CREATE TABLE Course(
                       Cno CHAR(6) PRIMARY KEY,
                       Cname CHAR(20) CHARACTER SET utf8mb4 NOT NULL,
                       Credit TINYINT,
                       Semester  TINYINT
) CHARACTER SET = utf8mb4;

CREATE TABLE SC(
                   Sno CHAR(7) NOT NULL,
                   Cno CHAR(6) NOT NULL,
                   Grade SMALLINT,
                   PRIMARY KEY(Sno,Cno),
                   FOREIGN KEY(Sno) REFERENCES Student(Sno),
                   FOREIGN KEY(Cno) REFERENCES Course(Cno)
) CHARACTER SET = utf8mb4;

-- 插入学生数据，随机匹配给定的三个系
INSERT INTO Student (Sno, Sname, Ssex, Sage, Sdept) VALUES
('1512101', '张三', '男', 20, '计算机系'),
('1512102', '李四', '男', 21, '信息系'),
('1512103', '王五', '男', 22, '数学系'),
('1512104', '赵六', '女', 19, '数学系'),
('1512105', '小红', '女', 20, '计算机系'),
('1512106', '小明', '男', 21, '信息系'),
('1512107', '小花', '女', 22, '数学系'),
('1512108', '小刚', '男', 19, '信息系'),
('1512109', '小美', '女', 20, '计算机系'),
('1512110', '小龙', '男', 21, '数学系');

-- 插入课程数据
INSERT INTO Course (Cno, Cname, Credit, Semester) VALUES
('C001', '计算机编程导论', 3, 1),
('C002', '线性代数', 4, 1),
('C003', '力学', 4, 2),
('C004', '有机化学', 3, 2),
('C005', '生物学', 3, 1),
('C006', '地理科学', 3, 1),
('C007', '历史文化', 3, 2),
('C008', '经济学原理', 4, 2),
('C009', '英语写作', 2, 1),
('C010', '体育健身', 2, 2);

-- 插入选课数据，确保每个学生至少选修三门课程
INSERT INTO SC (Sno, Cno, Grade) VALUES
('1512101', 'C001', 85), ('1512101', 'C002', 75), ('1512101', 'C003', 90),
('1512102', 'C001', 90), ('1512102', 'C003', 80), ('1512102', 'C004', 88),
('1512103', 'C002', 88), ('1512103', 'C003', 92), ('1512103', 'C004', 78),
('1512104', 'C001', 82), ('1512104', 'C002', 90), ('1512104', 'C003', 85),
('1512105', 'C003', 75), ('1512105', 'C004', 80), ('1512105', 'C005', 85),
('1512106', 'C004', 90), ('1512106', 'C005', 88), ('1512106', 'C006', 92),
('1512107', 'C005', 78), ('1512107', 'C006', 82), ('1512107', 'C007', 90),
('1512108', 'C006', 85), ('1512108', 'C007', 75), ('1512108', 'C008', 80),
('1512109', 'C007', 90), ('1512109', 'C008', 88), ('1512109', 'C009', 92),
('1512110', 'C008', 78), ('1512110', 'C009', 82), ('1512110', 'C010', 85);
