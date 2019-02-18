create table test_member(
	id varchar2(30) primary key,
	pass varchar2(30),
	name varchar2(30),
	addr varchar2(30),
	phone varchar2(30)
);

select * from test_member;
insert into TEST_MEMBER values('admin','admin','admin','blank','blank');

create table board_test(b_num number primary key,b_auth varchar(50),b_content varchar(300)); 
--char 지정된 공간 만큼만 varchar은 입력된 글자 공간만큼, 가변형 저장공간.

create sequence b_num start with 0 increment by 1 minvalue 0;	

insert into board_test values (b_num.nextval,'firstAuth','hello');

select * from board_test;