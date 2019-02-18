CREATE TABLE member(num number, name varchar(50), addr varchar(300));

CREATE SEQUENCE m_num increment by 1 start with 1;

SELECT * FROM member;

INSERT INTO member(num, name, addr) VALUES(m_num.nextval,'홍길동','서울');