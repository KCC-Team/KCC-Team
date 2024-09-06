-- 삭제
--DROP TABLE FILES;
--DROP TABLE schedulebelongmember;
--DROP TABLE ANSWER;
--DROP TABLE MeetUpSchedule;
--DROP TABLE REPLY;
--DROP TABLE BOARD;
--DROP TABLE JOINQUESTION;
--DROP TABLE BELONGMEMBER;
--DROP TABLE MEETUP;
--DROP TABLE MEMBER;
--
--DROP SEQUENCE SEQ_FILE;
--DROP SEQUENCE SEQ_MEETUPSCHEDULE;
--DROP SEQUENCE SEQ_REPLY;
--DROP SEQUENCE SEQ_BOARD;
--DROP SEQUENCE SEQ_JOINQUESTION;
--DROP SEQUENCE SEQ_MeetUp;
--DROP SEQUENCE SEQ_MEMBER;

--  회원 테이블 생성
create table Member(
                       member_id number,
                       username varchar(20),
                       password varchar(100),
                       nickname varchar(20),
                       email varchar(30),
                       gender varchar(2),
                       birthdate date,
                       tel varchar(15),
                       address varchar(50),
                       created_at timestamp,
                       updated_at timestamp,
                       isDelete varchar(1)
);
alter table member add constraint PK_MEMBER PRIMARY KEY (member_id);

CREATE SEQUENCE SEQ_MEMBER
    START WITH 1
    INCREMENT BY 1;
--------------------------------------------------------------------------------
-- 모임 테이블 생성
create table MeetUp(
                       meet_up_id number,
                       title varchar(100),
                       person number,
                       category varchar(20),
                       intro varchar(1000)
);
alter table MeetUp add constraint PK_MeetUp PRIMARY KEY (meet_up_id);

CREATE SEQUENCE SEQ_MeetUp
    START WITH 1
    INCREMENT BY 1;
--------------------------------------------------------------------------------
-- 모임가입질문 테이블 생성
create table JoinQuestion(
                             meet_up_id number,
                             question_id number,
                             content varchar(100),
                             status varchar(1)
);
alter table JoinQuestion add constraint PK_JoinQuestion PRIMARY KEY (meet_up_id, question_id);
alter table JoinQuestion add constraint FK_JoinQuestion_MeetUp FOREIGN KEY(meet_up_id) REFERENCES MeetUp (meet_up_id);

CREATE SEQUENCE SEQ_JoinQuestion
    START WITH 1
    INCREMENT BY 1;

--------------------------------------------------------------------------------
-- 소속회원 테이블 생성 (클러스터 테이블)
--create cluster c_belongmember ( meet_up_id number ) index;
--
--create index c_belongmember_idx on cluster c_belongmember;
--
--create table BelongMember (
--    belong_member_id number,
--    member_id number,
--    meet_up_id number,
--    created_at date )
--cluster c_belongmember(meet_up_id);

create table BelongMember (
                              member_id number,
                              meet_up_id number,
                              join_at date,
                              grade varchar(100)
);


alter table belongmember add constraint PK_BELONGMEMBER PRIMARY KEY (meet_up_id, member_id);
alter table belongmember add constraint FK_BELONGMEMBER_MeetUp FOREIGN KEY(meet_up_id) REFERENCES MeetUp (meet_up_id);
alter table belongmember add constraint FK_BELONGMEMBER_MEMBER FOREIGN KEY(member_id) REFERENCES Member (member_id);

--CREATE SEQUENCE SEQ_BelongMember
--START WITH 1
--INCREMENT BY 1;
--------------------------------------------------------------------------------
-- MEMBER 테이블 데이터 생성


---------------------------------------------------------------------------------------------------
--MeetUp 테이블 더미 데이터 생성


----------------------------------------------------------------------------------------

------------------------------------------------------------------------------------

----------------------------------------------------------------------------------
--BOARD 테이블 생성
CREATE TABLE BOARD (
                       board_id number,
                       meet_up_id number,
                       member_id number,
                       title varchar(50),
                       content varchar(1000),
                       created_at date,
                       updated_at date
);
CREATE SEQUENCE SEQ_BOARD
    START WITH 1
    INCREMENT BY 1;
alter table BOARD add constraint PK_BOARD PRIMARY KEY (board_id);
--alter table BOARD add constraint FK_BOARD_MeetUp FOREIGN KEY(meet_up_id) REFERENCES MeetUp (meet_up_id);
alter table BOARD add constraint FK_BOARD_BELONGMEMBER FOREIGN KEY(meet_up_id, member_id) REFERENCES BELONGMEMBER (meet_up_id, member_id);

----------------------------------------------------------------------------------
--BOARD 테이블 더미 데이터 생성


-----------------------------------------------------------------------------------
--REPLY 테이블 생성
CREATE TABLE REPLY (
                       reply_id number,
                       board_id number,
                       meet_up_id number,
                       member_id number,
                       content varchar(100),
                       created_at date,
                       updated_at date,
                       dept number,
                       order_number number,
                       top_reply_id number
);

CREATE SEQUENCE SEQ_REPLY
    START WITH 1
    INCREMENT BY 1;

alter table REPLY add constraint PK_REPLY PRIMARY KEY (reply_id);
alter table REPLY add constraint FK_REPLY_BOARD FOREIGN KEY(board_id) REFERENCES BOARD (board_id);
alter table REPLY add constraint FK_REPLY_BELONGMEMBER FOREIGN KEY(meet_up_id, member_id) REFERENCES BELONGMEMBER (meet_up_id, member_id);
alter table REPLY add constraint FK_REPLY_REPLY FOREIGN KEY(top_reply_id) REFERENCES REPLY (reply_id);

---------------------------------------------
create table MeetUpSchedule (
                                schedule_id number,
                                meet_up_id number,
                                member_id number,
                                title varchar(100),
                                content varchar(500),
                                location varchar(40),
                                person number,
                                deadline timestamp,
                                appointment_time timestamp,
                                created_at timestamp,
                                dead_status varchar(1)
);

CREATE SEQUENCE SEQ_MEETUPSCHEDULE
    START WITH 1
    INCREMENT BY 1;


alter table MeetUpSchedule add constraint PK_MeetUpSchedule PRIMARY KEY (schedule_id);
alter table MeetUpSchedule add constraint FK_MeetUpSchedule_BELONGMEMBER FOREIGN KEY(meet_up_id, member_id)
    REFERENCES BELONGMEMBER (meet_up_id, member_id);


                            

------------------------------------------------------------------

create table schedulebelongmember (
                                      meet_up_id number,
                                      member_id number,
                                      schedule_id number
);



alter table schedulebelongmember add constraint PK_SCHEDULEBELONGMEMBER PRIMARY KEY(meet_up_id,member_id,schedule_id);
alter table schedulebelongmember add constraint FK_SCHEDULEBELONGMEMBER FOREIGN KEY(meet_up_id,member_id)
    REFERENCES BELONGMEMBER (meet_up_id, member_id) ON DELETE CASCADE;

alter table schedulebelongmember add constraint FK_SCHEDULEBELONGMEMBER_SC FOREIGN KEY(schedule_id)
    REFERENCES MeetUpSchedule (schedule_id) ON DELETE CASCADE;


CREATE TABLE ANSWER (
    MEET_UP_ID NUMBER,
    MEMBER_ID NUMBER,
    QUESTION_ID NUMBER,
    ANSWER VARCHAR(500)
);

alter table ANSWER add constraint FK_ANSWER_JOINQUESTION FOREIGN KEY(MEET_UP_ID,QUESTION_ID) 
REFERENCES JOINQUESTION (MEET_UP_ID, QUESTION_ID);

ALTER TABLE ANSWER ADD CONSTRAINT FK_ANSWER_MEMBER FOREIGN KEY(MEMBER_ID) 
REFERENCES MEMBER (MEMBER_ID);

ALTER TABLE ANSWER ADD CONSTRAINT PK_ANSWER PRIMARY KEY(MEET_UP_ID, MEMBER_ID, QUESTION_ID);

CREATE TABLE FILES (
    FILE_ID NUMBER,
    FILE_ORIGINAL_NAME VARCHAR(300),
    FILE_UUID_NAME VARCHAR(300),
    FILE_TYPE VARCHAR(100),
    MEMBER_ID NUMBER NULL,
    MEET_UP_ID NUMBER NULL,
    CONSTRAINT FK_FILE_MEETUP FOREIGN KEY (MEET_UP_ID) REFERENCES MEETUP(MEET_UP_ID),
    CONSTRAINT FK_FILE_MEMBER FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER(MEMBER_ID)
);

CREATE SEQUENCE SEQ_FILE START WITH 1 INCREMENT BY 1;



















INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL, 'kosa1', 'kosa1!', '김영진', 'kosa1@naver.com', 'M', 
TO_DATE('1999/10/29', 'YYYY/MM/DD'), '010-1111-1111', '부산시', sysdate, sysdate, 'F');

INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL, 'kosa2', 'kosa2!', '지승용', 'kosa1@naver.com', 'M', 
TO_DATE('1999/10/29', 'YYYY/MM/DD'), '010-1111-1111', '부산시', sysdate, sysdate, 'F');

INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL, 'kosa3', 'kosa3!', '유은서', 'kosa1@naver.com', 'M', 
TO_DATE('1999/10/29', 'YYYY/MM/DD'), '010-1111-1111', '부산시', sysdate, sysdate, 'F');

INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL, 'kosa4', 'kosa4!', '김진아', 'kosa1@naver.com', 'M', 
TO_DATE('1999/10/29', 'YYYY/MM/DD'), '010-1111-1111', '부산시', sysdate, sysdate, 'F');

INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL, 'kosa5', 'kosa5!', '김연호', 'kosa1@naver.com', 'M', 
TO_DATE('1999/10/29', 'YYYY/MM/DD'), '010-1111-1111', '부산시', sysdate, sysdate, 'F');

INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL, 'kosa6', 'kosa6!', '이수호', 'kosa1@naver.com', 'M', 
TO_DATE('1999/10/29', 'YYYY/MM/DD'), '010-1111-1111', '부산시', sysdate, sysdate, 'F');

INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL, 'kosa7', 'kosa7!', '이한희', 'kosa1@naver.com', 'M', 
TO_DATE('1999/10/29', 'YYYY/MM/DD'), '010-1111-1111', '부산시', sysdate, sysdate, 'F');

INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL, 'kosa8', 'kosa8!', '안수형', 'kosa1@naver.com', 'M', 
TO_DATE('1999/10/29', 'YYYY/MM/DD'), '010-1111-1111', '부산시', sysdate, sysdate, 'F');

INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL, 'kosa9', 'kosa9!', '송동호', 'kosa1@naver.com', 'M', 
TO_DATE('1999/10/29', 'YYYY/MM/DD'), '010-1111-1111', '부산시', sysdate, sysdate, 'F');

INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL, 'kosa10', 'kosa10!', '장원', 'kosa1@naver.com', 'M', 
TO_DATE('1999/10/29', 'YYYY/MM/DD'), '010-1111-1111', '부산시', sysdate, sysdate, 'F');

INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL, 'kosa11', 'kosa11!', '송예림', 'kosa1@naver.com', 'M', 
TO_DATE('1999/10/29', 'YYYY/MM/DD'), '010-1111-1111', '부산시', sysdate, sysdate, 'F');

INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL, 'kosa12', 'kosa12!', '조정하', 'kosa1@naver.com', 'M', 
TO_DATE('1999/10/29', 'YYYY/MM/DD'), '010-1111-1111', '부산시', sysdate, sysdate, 'F');

INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL, 'kosa13', 'kosa13!', '김현민', 'kosa1@naver.com', 'M', 
TO_DATE('1999/10/29', 'YYYY/MM/DD'), '010-1111-1111', '부산시', sysdate, sysdate, 'F');

INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL, 'kosa14', 'kosa14!', '황철원', 'kosa1@naver.com', 'M', 
TO_DATE('1999/10/29', 'YYYY/MM/DD'), '010-1111-1111', '부산시', sysdate, sysdate, 'F');

INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL, 'kosa15', 'kosa15!', '김상학', 'kosa1@naver.com', 'M', 
TO_DATE('1999/10/29', 'YYYY/MM/DD'), '010-1111-1111', '부산시', sysdate, sysdate, 'F');

INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL, 'kosa16', 'kosa16!', '윤채원', 'kosa1@naver.com', 'M', 
TO_DATE('1999/10/29', 'YYYY/MM/DD'), '010-1111-1111', '부산시', sysdate, sysdate, 'F');

INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL, 'kosa17', 'kosa17!', '노승우', 'kosa1@naver.com', 'M', 
TO_DATE('1999/10/29', 'YYYY/MM/DD'), '010-1111-1111', '부산시', sysdate, sysdate, 'F');

INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL, 'kosa18', 'kosa18!', '원승언', 'kosa1@naver.com', 'M', 
TO_DATE('1999/10/29', 'YYYY/MM/DD'), '010-1111-1111', '부산시', sysdate, sysdate, 'F');

INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL, 'kosa19', 'kosa19!', '유재원', 'kosa1@naver.com', 'M', 
TO_DATE('1999/10/29', 'YYYY/MM/DD'), '010-1111-1111', '부산시', sysdate, sysdate, 'F');

INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL, 'kosa20', 'kosa20!', '이지훈', 'kosa1@naver.com', 'M', 
TO_DATE('1999/10/29', 'YYYY/MM/DD'), '010-1111-1111', '부산시', sysdate, sysdate, 'F');

INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL, 'kosa21', 'kosa21!', '이예림', 'kosa1@naver.com', 'M', 
TO_DATE('1999/10/29', 'YYYY/MM/DD'), '010-1111-1111', '부산시', sysdate, sysdate, 'F');

INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL, 'kosa22', 'kosa22!', '우영두', 'kosa1@naver.com', 'M', 
TO_DATE('1999/10/29', 'YYYY/MM/DD'), '010-1111-1111', '부산시', sysdate, sysdate, 'F');

INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL, 'kosa23', 'kosa23!', '도성구', 'kosa1@naver.com', 'M', 
TO_DATE('1999/10/29', 'YYYY/MM/DD'), '010-1111-1111', '부산시', sysdate, sysdate, 'F');




-----------------------------------------------------------------------------------------------------------------------------


INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '서울 강남구 코코의 강아지 친구들', 10, '소형견', '안녕하세요. 강남구에 있는 코코의 친구들입니다.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '부산 해운대구 멍멍이들의 파티', 3, '대형견', '안녕하세요. 해운대구의 멍멍이들의 파티입니다.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '인천 남동구 비글 모임', 5, '중형견', '놀기 좋아하는 비글들 모여라!');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '대구 달서구 푸들들의 세상', 4, '소형견', '푸들들과 함께 뛰어놀아요~');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '광주 서구 골든리트리버 모임', 10, '대형견', '안녕하세요. 서구의 골든리트리버 모임입니다.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '울산 남구 스피츠 클럽', 30, '중형견', '안녕하세요. 스피츠들의 클럽입니다.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '서울 종로구 말티즈 동호회', 20, '소형견', '안녕하세요. 종로구의 말티즈 동호회입니다.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '경기 수원시 허스키 모임', 5, '대형견', '안녕하세요. 허스키들이 모이는 곳입니다.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '부산 북구 시바견 동호회', 3, '중형견', '안녕하세요. 시바견들의 모임입니다.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '서울 용산구 요크셔테리어 클럽', 30, '소형견', '작지만 강한 요크셔 모여라!');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '서울 강북구 치와와 친구들', 8, '소형견', '안녕하세요. 강북구의 치와와 친구들 모임입니다.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '부산 사하구 퍼그 파티', 6, '소형견', '퍼그들과 함께 즐거운 시간을 보냅니다.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '대전 유성구 코카 스파니엘 모임', 12, '중형견', '코카 스파니엘들이 모여서 놀아요!');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '제주 제주시 아키타견 모임', 5, '대형견', '아키타견과 함께하는 제주도 모임입니다.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '서울 송파구 닥스훈트 클럽', 15, '소형견', '닥스훈트 모여라! 송파구에서 함께해요.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '광주 광산구 시츄 사랑 모임', 25, '소형견', '시츄와 함께하는 행복한 시간.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '경기 고양시 셰퍼드 모임', 7, '대형견', '경기 고양시에서 셰퍼드들과 함께합니다.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '서울 성북구 바센지 모임', 10, '중형견', '조용한 바센지들과 함께해요.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '부산 동래구 래브라도 리트리버 파티', 18, '대형견', '래브라도 리트리버들이 모여요.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '대구 중구 포메라니안 클럽', 22, '소형견', '중구의 포메라니안들이 함께 모입니다.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '서울 마포구 그레이하운드 모임', 6, '대형견', '그레이하운드들이 마포구에서 모입니다.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '경기 안양시 복서견 클럽', 11, '대형견', '복서견들과 함께하는 클럽입니다.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '서울 은평구 잭 러셀 테리어 모임', 9, '중형견', '활발한 잭 러셀 테리어들 모여라!');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '부산 중구 보더콜리 클럽', 16, '대형견', '보더콜리들과 함께 달리는 모임입니다.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '인천 미추홀구 셔틀랜드 쉽독 모임', 8, '중형견', '셔틀랜드 쉽독과 함께하는 인천 모임.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '서울 강서구 스무디 스피츠 클럽', 14, '중형견', '강서구의 스무디 스피츠들이 모입니다.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '대구 북구 비숑프리제 파티', 20, '소형견', '비숑프리제들이 모여서 파티를 즐깁니다.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '광주 동구 달마시안 모임', 12, '대형견', '달마시안들이 모여서 함께 달립니다.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '울산 동구 푸들 클럽', 28, '소형견', '동구의 푸들들이 함께하는 클럽입니다.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '서울 영등포구 코카 푸들 모임', 10, '소형견', '코카 푸들들과 함께하는 영등포구 모임입니다.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '경기 성남시 골든리트리버 클럽', 8, '대형견', '성남시의 골든리트리버들이 모입니다.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '부산 연제구 요크셔 테리어 파티', 13, '소형견', '요크셔 테리어들이 함께 즐기는 모임입니다.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '서울 서대문구 불독 모임', 9, '중형견', '불독들이 모여서 함께 시간을 보냅니다.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '대전 중구 퍼그 클럽', 5, '소형견', '중구의 퍼그 클럽입니다.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '광주 북구 치와와 파티', 12, '소형견', '치와와들이 모여서 신나게 놀아요!');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '울산 중구 비글 모임', 18, '중형견', '울산 중구의 비글들이 모입니다.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '서울 노원구 말티푸 동호회', 22, '소형견', '말티푸 친구들과 함께하는 노원구 모임입니다.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '부산 금정구 웰시코기 클럽', 6, '중형견', '웰시코기들이 금정구에 모입니다.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '서울 동작구 미니핀 모임', 19, '소형견', '미니핀들이 동작구에서 모입니다.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '광주 남구 시바견 클럽', 15, '중형견', '시바견들이 모여서 함께 즐기는 남구 클럽.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '대전 대덕구 허스키 모임', 11, '대형견', '대덕구에서 허스키들이 함께합니다.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '부산 강서구 닥스훈트 친구들', 7, '소형견', '닥스훈트들이 부산 강서구에 모입니다.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '서울 관악구 라브라도 리트리버 클럽', 16, '대형견', '라브라도 리트리버들과 함께하는 모임.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '경기 용인시 말티즈 클럽', 20, '소형견', '용인시의 말티즈들이 모이는 클럽입니다.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '대구 수성구 미니어처 슈나우저 모임', 10, '소형견', '미니어처 슈나우저들이 함께 모입니다.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '인천 연수구 비글 동호회', 9, '중형견', '연수구의 비글들이 함께 즐깁니다.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '광주 남구 골든 리트리버 파티', 25, '대형견', '골든 리트리버들과 함께하는 남구 파티.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '울산 북구 푸들 파티', 12, '소형견', '푸들들과 함께하는 울산 북구 모임.');
INSERT INTO MEETUP VALUES (SEQ_MEETUP.nextval, '서울 중랑구 비숑프리제 동호회', 18, '소형견', '비숑프리제들이 함께하는 동호회입니다.');











INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (1, 1, sysdate, '모임장');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (2, 1, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (3, 1, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (4, 1, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (5, 2, sysdate, '모임장');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (6, 2, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (7, 2, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (8, 2, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (9, 3, sysdate, '모임장');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (10, 3, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (11, 3, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (12, 3, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (13, 4, sysdate, '모임장');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (14, 4, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (15, 4, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (16, 4, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (17, 5, sysdate, '모임장');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (18, 5, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (19, 5, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (20, 5, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (11, 6, sysdate, '모임장');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (3, 6, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (5, 6, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (13, 6, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (4, 7, sysdate, '모임장');


INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (1, 49, sysdate, '모임장');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (2, 49, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (3, 49, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (4, 49, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (5, 49, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (6, 49, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (7, 49, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (8, 49, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (9, 49, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (10, 49, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (11, 49, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (12, 49, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (13, 49, sysdate, '일반');

INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (1, 48, sysdate, '모임장');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (2, 48, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (3, 48, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (4, 48, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (5, 48, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (6, 48, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (7, 48, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (8, 48, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (9, 48, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (10, 48, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (11, 48, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (12, 48, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (13, 48, sysdate, '일반');


-- MEET_UP_ID = 46
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (1, 46, sysdate, '모임장');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (2, 46, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (3, 46, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (4, 46, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (5, 46, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (6, 46, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (7, 46, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (8, 46, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (9, 46, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (10, 46, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (11, 46, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (12, 46, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (13, 46, sysdate, '일반');

-- MEET_UP_ID = 45
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (1, 45, sysdate, '모임장');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (2, 45, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (3, 45, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (4, 45, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (5, 45, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (6, 45, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (7, 45, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (8, 45, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (9, 45, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (10, 45, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (11, 45, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (12, 45, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (13, 45, sysdate, '일반');

-- MEET_UP_ID = 44
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (1, 44, sysdate, '모임장');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (2, 44, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (3, 44, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (4, 44, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (5, 44, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (6, 44, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (7, 44, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (8, 44, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (9, 44, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (10, 44, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (11, 44, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (12, 44, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (13, 44, sysdate, '일반');

-- MEET_UP_ID = 43
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (1, 43, sysdate, '모임장');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (2, 43, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (3, 43, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (4, 43, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (5, 43, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (6, 43, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (7, 43, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (8, 43, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (9, 43, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (10, 43, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (11, 43, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (12, 43, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (13, 43, sysdate, '일반');

-- MEET_UP_ID = 42
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (1, 42, sysdate, '모임장');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (2, 42, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (3, 42, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (4, 42, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (5, 42, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (6, 42, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (7, 42, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (8, 42, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (9, 42, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (10, 42, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (11, 42, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (12, 42, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (13, 42, sysdate, '일반');


-- MEET_UP_ID = 41
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (1, 41, sysdate, '모임장');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (2, 41, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (3, 41, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (4, 41, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (5, 41, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (6, 41, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (7, 41, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (8, 41, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (9, 41, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (10, 41, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (11, 41, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (12, 41, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (13, 41, sysdate, '일반');

-- MEET_UP_ID = 40
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (1, 40, sysdate, '모임장');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (2, 40, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (3, 40, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (4, 40, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (5, 40, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (6, 40, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (7, 40, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (8, 40, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (9, 40, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (10, 40, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (11, 40, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (12, 40, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (13, 40, sysdate, '일반');




-- MEET_UP_ID = 39
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (1, 39, sysdate, '모임장');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (2, 39, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (3, 39, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (4, 39, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (5, 39, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (6, 39, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (7, 39, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (8, 39, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (9, 39, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (10, 39, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (11, 39, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (12, 39, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (13, 39, sysdate, '일반');




-- MEET_UP_ID = 38
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (1, 38, sysdate, '모임장');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (2, 38, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (3, 38, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (4, 38, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (5, 38, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (6, 38, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (7, 38, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (8, 38, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (9, 38, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (10, 38, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (11, 38, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (12, 38, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (13, 38, sysdate, '일반');

-- MEET_UP_ID = 37
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (1, 37, sysdate, '모임장');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (2, 37, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (3, 37, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (4, 37, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (5, 37, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (6, 37, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (7, 37, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (8, 37, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (9, 37, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (10, 37, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (11, 37, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (12, 37, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (13, 37, sysdate, '일반');


-- MEET_UP_ID = 36
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (1, 36, sysdate, '모임장');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (2, 36, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (3, 36, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (4, 36, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (5, 36, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (6, 36, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (7, 36, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (8, 36, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (9, 36, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (10, 36, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (11, 36, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (12, 36, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (13, 36, sysdate, '일반');

-- MEET_UP_ID = 35
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (1, 35, sysdate, '모임장');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (2, 35, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (3, 35, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (4, 35, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (5, 35, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (6, 35, sysdate, '일반');


INSERT INTO JOINQUESTION VALUES (1, SEQ_JOINQUESTION.nextval, '말티즈 견주이신가요?', 'T');
INSERT INTO JOINQUESTION VALUES (1, SEQ_JOINQUESTION.nextval, '질문내용', 'T');
INSERT INTO JOINQUESTION VALUES (1, SEQ_JOINQUESTION.nextval, '질문내용', 'T');


INSERT INTO JOINQUESTION VALUES (2, SEQ_JOINQUESTION.nextval, '질문내용', 'T');
INSERT INTO JOINQUESTION VALUES (2, SEQ_JOINQUESTION.nextval, '질문내용', 'T');
INSERT INTO JOINQUESTION VALUES (2, SEQ_JOINQUESTION.nextval, '질문내용', 'T');

INSERT INTO JOINQUESTION VALUES (3, SEQ_JOINQUESTION.nextval, '질문내용', 'T');
INSERT INTO JOINQUESTION VALUES (3, SEQ_JOINQUESTION.nextval, '질문내용', 'T');
INSERT INTO JOINQUESTION VALUES (3, SEQ_JOINQUESTION.nextval, '질문내용', 'T');

INSERT INTO JOINQUESTION VALUES (4, SEQ_JOINQUESTION.nextval, '질문내용', 'T');
INSERT INTO JOINQUESTION VALUES (4, SEQ_JOINQUESTION.nextval, '질문내용', 'T');
INSERT INTO JOINQUESTION VALUES (4, SEQ_JOINQUESTION.nextval, '질문내용', 'T');



INSERT INTO JOINQUESTION VALUES (49, SEQ_JOINQUESTION.nextval, '비숑 견주이신가요?', 'T');
INSERT INTO JOINQUESTION VALUES (49, SEQ_JOINQUESTION.nextval, '서울 거주중이신가요?', 'T');
INSERT INTO JOINQUESTION VALUES (49, SEQ_JOINQUESTION.nextval, '비숑의 장점은 무엇이라고 생각하시나요', 'T');



INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 1, 1,
                                   '🐾 강아지들과 산책 시간 공지 🐾',
                                   '반려견 친구들과 함께하는 시간을 기대해주세요!',
                                   '성북구 동소문로 98', 24,
                                   TO_TIMESTAMP('2024-09-09 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-24 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );

INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 1, 2,
                                   '🐕 흑석동 친구들 모임 안내 🐕',
                                   '이번 모임에서 강아지들과 즐거운 시간을 보낼 수 있습니다!',
                                   '중구 을지로 102', 5,
                                   TO_TIMESTAMP('2024-09-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-10-03 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );

INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 1, 3,
                                   '🐶 강아지와 함께하는 행복한 시간 🐶',
                                   '모두 반려견과 함께하는 멋진 하루를 보내시길 바랍니다!',
                                   '강남구 역삼로 120', 17,
                                   TO_TIMESTAMP('2024-09-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-12 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );

INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 1, 1,
                                   '🐾 반려견 사랑 모임 공지 🐾',
                                   '귀여운 강아지들과 함께 멋진 시간을 보내보세요!',
                                   '용산구 이태원로 33', 4,
                                   TO_TIMESTAMP('2024-09-07 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-13 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );

INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 1, 1,
                                   '🐕 산책과 놀이 모임 🐕',
                                   '모임에 참가하여 반려견과 함께 즐거운 하루를 보내세요!',
                                   '송파구 백제고분로 47', 2,
                                   TO_TIMESTAMP('2024-09-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-17 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );
<<<<<<< Updated upstream

INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 2, 6,
                                   '흑석동 비숑 프리제 반려 모임 초대',
                                   '여러분의 사랑스러운 반려견과 함께할 수 있는 특별한 시간을 마련했습니다! 이번 주말에 만나요!',
                                   '창경궁로 254 동원빌딩 1층', 7,
                                   TO_TIMESTAMP('2024-09-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-15 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );

INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 2, 7,
                                   '닥스훈트 친목 모임',
                                   '반려견을 사랑하는 모든 분들을 위한 즐거운 모임이 준비되었습니다. 다음 주말에 뵙겠습니다!',
                                   '창경궁로 254 동원빌딩 1층', 6,
                                   TO_TIMESTAMP('2024-09-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-10-12 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );

INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 2, 8,
                                   '흑석동 반려견 교류회',
                                   '귀여운 반려견과 함께하는 시간을 즐기러 오세요! 이번 주말에 흑석동에서 만나요!',
                                   '창경궁로 254 동원빌딩 1층', 11,
                                   TO_TIMESTAMP('2024-09-13 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-10-22 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );

INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 2, 9,
                                   '반려견 모임 초대',
                                   '주말을 반려견과 함께 즐겁게 보낼 수 있는 완벽한 기회입니다. 함께 해요!',
                                   '창경궁로 254 동원빌딩 1층', 9,
                                   TO_TIMESTAMP('2024-09-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-27 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );

INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 2, 10,
                                   '무악동 반려견 교류회',
                                   '이번 주말, 반려견과의 특별한 만남을 계획하고 있습니다. 모두 참여해 주세요!',
=======
                                  
                                  
                                  
INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 1, 1,
                                   '🌳 흑석동 반려견 모임 공지 🌳 10',
                                   '안녕하세요,  귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
>>>>>>> Stashed changes
                                   '창경궁로 254 동원빌딩 1층', 2,
                                   TO_TIMESTAMP('2024-09-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-21 22:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );


                                  
                                  INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 1, 2,
                                   '🐕 귀여운 강아지들과의 만남 🐕 2',
                                   '반려견 친구들과 함께하는 재미있는 시간을 기대하세요!',
                                   '동대문구 장안동 29', 7,
                                   TO_TIMESTAMP('2024-09-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-15 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );

INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 1, 3,
                                   '🐾 반려견과 함께하는 오후 모임 🐾',
                                   '강아지와의 소중한 시간을 만끽하세요!',
                                   '서초구 반포대로 220', 6,
                                   TO_TIMESTAMP('2024-09-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-10-12 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );

INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 1, 4,
                                   '🐕 강아지와 즐거운 시간 안내 🐕 2',
                                   '강아지와 함께 행복한 시간을 보내는 기회를 놓치지 마세요!',
                                   '노원구 동일로 167', 11,
                                   TO_TIMESTAMP('2024-09-13 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-10-22 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );

INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 1, 2,
                                   '🐾 귀여운 강아지들 모임 안내 🐾 2',
                                   '강아지 친구들과 함께 즐거운 시간을 가지세요!',
                                   '관악구 낙성대길 45', 9,
                                   TO_TIMESTAMP('2024-09-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-27 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );

INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 1, 3,
                                   '🐶 반려견과의 행복한 만남 🐶 2',
                                   '이번 모임에서 강아지들과 소중한 시간을 보내세요!',
                                   '영등포구 경인로 204', 3,
                                   TO_TIMESTAMP('2024-09-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-25 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );

INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 1, 4,
                                   '🐾 강아지와의 특별한 시간 🐾 2',
                                   '강아지와 함께 특별한 시간을 보내세요!',
                                   '강동구 천호대로 105', 4,
                                   TO_TIMESTAMP('2024-09-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );

INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 2, 6,
                                   '🐕 강아지 친구들과의 하루 🐕 2',
                                   '강아지와 함께하는 즐거운 시간을 기대하세요!',
                                   '중구 명동길 20', 4,
                                   TO_TIMESTAMP('2024-09-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );

INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 2, 7,
                                   '🐾 귀여운 강아지 모임 안내 🐾 2',
                                   '강아지 친구들과 함께하는 소중한 시간을 가지세요!',
                                   '서대문구 신촌로 40', 6,
                                   TO_TIMESTAMP('2024-09-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );

INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 2, 7,
                                   '🐶 강아지들과의 만남 공지 🐶 2',
                                   '강아지와 함께하는 행복한 시간을 만끽하세요!',
                                   '강서구 공항대로 115', 2,
                                   TO_TIMESTAMP('2024-09-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );

INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 2, 8,
                                   '🐾 강아지와의 특별한 시간 🐾 2',
                                   '이번 모임에서 강아지와 특별한 시간을 보내세요!',
                                   '중랑구 상봉로 50', 5,
                                   TO_TIMESTAMP('2024-09-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );

INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 2, 6,
                                   '🐕 강아지와 함께하는 시간 🐕 2',
                                   '반려견과 함께 즐거운 시간을 보내보세요!',
                                   '마포구 월드컵로 300', 3,
                                   TO_TIMESTAMP('2024-09-08 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-08 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );


INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog4.jfif', 'TITLE', NULL, 1);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog1.jfif', 'TITLE', NULL, 2);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog2.jfif', 'TITLE', NULL, 3);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog3.jfif', 'TITLE', NULL, 4);

INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog4.jfif', 'TITLE', NULL, 49);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog1.jfif', 'TITLE', NULL, 48);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog2.jfif', 'TITLE', NULL, 47);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog3.jfif', 'TITLE', NULL, 46);

INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog4.jfif', 'TITLE', NULL, 45);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog1.jfif', 'TITLE', NULL, 44);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog2.jfif', 'TITLE', NULL, 43);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog3.jfif', 'TITLE', NULL, 42);

INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog4.jfif', 'TITLE', NULL, 41);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog1.jfif', 'TITLE', NULL, 40);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog2.jfif', 'TITLE', NULL, 39);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog3.jfif', 'TITLE', NULL, 38);

INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog4.jfif', 'TITLE', NULL, 37);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog1.jfif', 'TITLE', NULL, 36);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog2.jfif', 'TITLE', NULL, 35);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog3.jfif', 'TITLE', NULL, 34);

INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog4.jfif', 'TITLE', NULL, 33);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog1.jfif', 'TITLE', NULL, 32);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog2.jfif', 'TITLE', NULL, 31);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog3.jfif', 'TITLE', NULL, 30);

INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog4.jfif', 'TITLE', NULL, 29);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog1.jfif', 'TITLE', NULL, 28);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog2.jfif', 'TITLE', NULL, 27);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog3.jfif', 'TITLE', NULL, 26);

INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog4.jfif', 'TITLE', NULL, 25);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog1.jfif', 'TITLE', NULL, 24);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog2.jfif', 'TITLE', NULL, 23);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog3.jfif', 'TITLE', NULL, 22);

INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog4.jfif', 'TITLE', NULL, 21);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog1.jfif', 'TITLE', NULL, 20);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog2.jfif', 'TITLE', NULL, 19);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog3.jfif', 'TITLE', NULL, 18);

INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog4.jfif', 'TITLE', NULL, 17);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog1.jfif', 'TITLE', NULL, 16);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog2.jfif', 'TITLE', NULL, 15);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog3.jfif', 'TITLE', NULL, 14);

INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog4.jfif', 'TITLE', NULL, 13);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog1.jfif', 'TITLE', NULL, 12);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog2.jfif', 'TITLE', NULL, 11);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog3.jfif', 'TITLE', NULL, 10);

INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog4.jfif', 'TITLE', NULL, 9);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog1.jfif', 'TITLE', NULL, 8);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog2.jfif', 'TITLE', NULL, 7);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog3.jfif', 'TITLE', NULL, 6);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'dog4.jfif', 'TITLE', NULL, 5);





INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', '인물19.jfif', 'MEMBER', 1, null);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', '인물20.jfif', 'MEMBER', 2, null);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', '인물21.jfif', 'MEMBER', 3, null);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', '인물22.jfif', 'MEMBER', 4, null);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'eye-2340806_640.jpg ', 'MEMBER', 5, null);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'people-showing-support-and-respect-with-yellow-background-for-suicide-prevention-day.jpg', 'MEMBER', 6, null);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'person-771996_640.jpg', 'MEMBER', 7, null);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'person17.jfif', 'MEMBER', 8, null);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'person18.jfif', 'MEMBER', 9, null);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'person23.jfif', 'MEMBER', 10, null);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'person24.jfif', 'MEMBER', 11, null);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'portrait-of-white-man-isolated.jpg', 'MEMBER', 12, null);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'toddler-758571_640.jpg ', 'MEMBER', 13, null);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'KakaoTalk_20240905_214931037.jpg ', 'MEMBER', 14, null);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'zRCdz691z2WGD_yJxEDnFu4kYG8OvUnZ4SfPnj_ZKv4qtF1s9M2DtT9aIDu6ErKoOOlhhiIDKBh1AtDUnzBEfGSF68dkMaGljg7bhHtHlbq4kB3kRUgAqg0Qt32cDfnEjQcL5sgbJlto-Sui70HoAA.png', 'MEMBER', 15, null);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'zRCdz691z2WGD_yJxEDnFu4kYG8OvUnZ4SfPnj_ZKv4qtF1s9M2DtT9aIDu6ErKoOOlhhiIDKBh1AtDUnzBEfGSF68dkMaGljg7bhHtHlbq4kB3kRUgAqg0Qt32cDfnEjQcL5sgbJlto-Sui70HoAA.png', 'MEMBER', 16, null);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'zRCdz691z2WGD_yJxEDnFu4kYG8OvUnZ4SfPnj_ZKv4qtF1s9M2DtT9aIDu6ErKoOOlhhiIDKBh1AtDUnzBEfGSF68dkMaGljg7bhHtHlbq4kB3kRUgAqg0Qt32cDfnEjQcL5sgbJlto-Sui70HoAA.png', 'MEMBER', 17, null);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'zRCdz691z2WGD_yJxEDnFu4kYG8OvUnZ4SfPnj_ZKv4qtF1s9M2DtT9aIDu6ErKoOOlhhiIDKBh1AtDUnzBEfGSF68dkMaGljg7bhHtHlbq4kB3kRUgAqg0Qt32cDfnEjQcL5sgbJlto-Sui70HoAA.png', 'MEMBER', 18, null);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'zRCdz691z2WGD_yJxEDnFu4kYG8OvUnZ4SfPnj_ZKv4qtF1s9M2DtT9aIDu6ErKoOOlhhiIDKBh1AtDUnzBEfGSF68dkMaGljg7bhHtHlbq4kB3kRUgAqg0Qt32cDfnEjQcL5sgbJlto-Sui70HoAA.png', 'MEMBER', 19, null);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'TEST', 'zRCdz691z2WGD_yJxEDnFu4kYG8OvUnZ4SfPnj_ZKv4qtF1s9M2DtT9aIDu6ErKoOOlhhiIDKBh1AtDUnzBEfGSF68dkMaGljg7bhHtHlbq4kB3kRUgAqg0Qt32cDfnEjQcL5sgbJlto-Sui70HoAA.png', 'MEMBER', 20, null);





INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);

INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);

INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);

INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);

INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);

INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);

INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);

INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);

INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);

INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);



INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);



INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);



INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);



INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);



INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);



INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);



INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);



INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 5, '테스트제목', '테스트내용', sysdate, sysdate);
