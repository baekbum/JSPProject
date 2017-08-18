-- 메인글 테이블
CREATE TABLE "FREEBOARD" (
  "IDX" NUMBER(*,0) NOT NULL, 
	"NAME" CHAR(20 BYTE) NOT NULL, 
	"PASSWORD" CHAR(20 BYTE) NOT NULL, 
	"SUBJECT" VARCHAR2(100 BYTE) NOT NULL, 
	"CONTENT" VARCHAR2(500 BYTE) NOT NULL, 
	"HIT" NUMBER(*,0) DEFAULT 0, 
	"WRITEDATE" TIMESTAMP (6) DEFAULT sysdate, 
	"IP" CHAR(15 BYTE), 
  "NOTICE" CHAR(10 BYTE), 
	PRIMARY KEY ("IDX")
);

-- 댓글 테이블
CREATE TABLE "FREEBOARDCOMMENT" (
  "IDX" NUMBER(*,0) NOT NULL, 
	"REF" NUMBER(*,0), 
	"NAME" CHAR(20 BYTE) NOT NULL, 
	"PASSWORD" CHAR(20 BYTE) NOT NULL, 
	"CONTENT" VARCHAR2(500 BYTE) NOT NULL, 
	"WRITEDATE" TIMESTAMP (6) DEFAULT sysdate, 
	"IP" CHAR(15 BYTE), 
	PRIMARY KEY ("IDX")
);

delete from freeboard;
drop sequence freeboard_idx_seq;
create sequence freeboard_idx_seq;

delete from freeboardcomment;
drop sequence freeboardcomment_idx_seq;
create sequence freeboardcomment_idx_seq;

select * from freeboard order by idx desc;
select count(*) from freeboard;

insert into freeboard (idx, name, password, subject, content, ip) 
values (freeboard_idx_seq.nextval, '홍길동', '1111', '1등', '1등입니다.', '192.168.100.101');
insert into freeboard (idx, name, password, subject, content, ip) 
values (freeboard_idx_seq.nextval, '임꺽정', '2222', '2등', '2등입니다.', '192.168.100.102');
insert into freeboard (idx, name, password, subject, content, ip) 
values (freeboard_idx_seq.nextval, '장길산', '3333', '3등', '3등입니다.', '192.168.100.103');
insert into freeboard (idx, name, password, subject, content, ip) 
values (freeboard_idx_seq.nextval, '일지매', '4444', '4등', '4등입니다.', '192.168.100.104');

commit;

