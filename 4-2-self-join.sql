use market_db;
create table emp_table (emp char(4), manager char(4), phone varchar(8));
Insert into emp_table values('경리부장', '관리이사', '2222-1');
insert into emp_table values('관리이사', '대표', '2222');

select a.emp '직원', b.emp "직속상관", b.phone "직속상관연락처"
from emp_table a
inner join emp_table B
on a.manager = b.emp
where a.emp = '경리부장';