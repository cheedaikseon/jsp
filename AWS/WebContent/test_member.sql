create table test_member(
	id varchar(30) NOT NULL,
	pass varchar(30),
	name varchar(30),
	addr varchar(30),
	phone varchar(30),
	PRIMARY KEY (id)
);

select * from test_member;
insert into TEST_MEMBER values('admin','admin','admin','blank','blank');

create table board_test(b_num int(10) unsigned NOT NULL AUTO_INCREMENT,b_auth varchar(50),b_content varchar(300),  primary key(b_num)); 

insert into board_test values (1,'firstAuth','hello');
insert into board_test(b_auth,b_content) values ('3','hello');
select * from board_test;
select * from board_test;

INSERT INTO board_test(b_auth,b_content) values ('?','?');