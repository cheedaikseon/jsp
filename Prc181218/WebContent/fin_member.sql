create table fin_member(u_num number primary key, u_id varchar2(20) unique, u_pass varchar(20), u_age number, u_gender varchar(20));

create sequence f_num start with 0 increment by 1 minvalue 0;


select * from FIN_MEMBER;

insert into fin_member values(f_num.nextval, 'admin', 'admin', 20, '');