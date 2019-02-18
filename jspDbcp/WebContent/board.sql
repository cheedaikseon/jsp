create table board_test(b_num number primary key,b_auth varchar(50),b_content varchar(300));

create sequence b_num start with 0 increment by 1 minvalue 0;

insert into board_test values (b_num.nextval,'firstAuth','hello');