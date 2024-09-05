-- 삭제
DROP TABLE FILES;
DROP TABLE schedulebelongmember;
DROP TABLE ANSWER;
DROP TABLE MeetUpSchedule;
DROP TABLE REPLY;
DROP TABLE BOARD;
DROP TABLE JOINQUESTION;
DROP TABLE BELONGMEMBER;
DROP TABLE MEETUP;
DROP TABLE MEMBER;

DROP SEQUENCE SEQ_FILE;
DROP SEQUENCE SEQ_MEETUPSCHEDULE;
DROP SEQUENCE SEQ_REPLY;
DROP SEQUENCE SEQ_BOARD;
DROP SEQUENCE SEQ_JOINQUESTION;
DROP SEQUENCE SEQ_MeetUp;
DROP SEQUENCE SEQ_MEMBER;

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
                       intro varchar(100)
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
INSERT INTO MEMBER values (SEQ_MEMBER.nextval, 'test0', 'test0', '이수호',
                           'test@naver.com', 'M', TO_DATE('1999/10/29', 'YYYY/MM/DD'), '010-1111-1111', '부산', sysdate, sysdate, 'F');

INSERT INTO MEMBER values (SEQ_MEMBER.nextval, 'TEST1', 'TEST1', '이한희',
                           'test@naver.com', 'M', TO_DATE('1999/10/29', 'YYYY/MM/DD'), '010-1111-1111', '부산', sysdate, sysdate, 'F');

INSERT INTO MEMBER values (SEQ_MEMBER.nextval, 'TEST2', 'TEST2', '김연호',
                           'test@naver.com', 'M', TO_DATE('1999/10/29', 'YYYY/MM/DD'), '010-1111-1111', '부산', sysdate, sysdate, 'F');

INSERT INTO MEMBER values (SEQ_MEMBER.nextval, 'TEST3', 'TEST3', '안수형',
                           'test@naver.com', 'M', TO_DATE('1999/10/29', 'YYYY/MM/DD'), '010-1111-1111', '부산', sysdate, sysdate, 'F');

INSERT INTO MEMBER values (SEQ_MEMBER.nextval, 'TEST4', 'TEST4', '장원',
                           'test@naver.com', 'M', TO_DATE('1999/10/29', 'YYYY/MM/DD'), '010-1111-1111', '부산', sysdate, sysdate, 'F');

INSERT INTO MEMBER values (SEQ_MEMBER.nextval, 'TEST5', 'TEST5', '윤채원',
                           'test@naver.com', 'M', TO_DATE('1999/10/29', 'YYYY/MM/DD'), '010-1111-1111', '부산', sysdate, sysdate, 'F');

INSERT INTO MEMBER values (SEQ_MEMBER.nextval, 'TEST6', 'TEST6', '김상학',
                           'test@naver.com', 'M', TO_DATE('1999/10/29', 'YYYY/MM/DD'), '010-1111-1111', '부산', sysdate, sysdate, 'F');

INSERT INTO MEMBER values (SEQ_MEMBER.nextval, 'TEST7', 'TEST7', '원승언',
                           'test@naver.com', 'M', TO_DATE('1999/10/29', 'YYYY/MM/DD'), '010-1111-1111', '부산', sysdate, sysdate, 'F');

INSERT INTO MEMBER values (SEQ_MEMBER.nextval, 'TEST8', 'TEST8', '유재원',
                           'test@naver.com', 'M', TO_DATE('1999/10/29', 'YYYY/MM/DD'), '010-1111-1111', '부산', sysdate, sysdate, 'F');

INSERT INTO MEMBER values (SEQ_MEMBER.nextval, 'TEST9', 'TEST9', '황철원',
                           'test@naver.com', 'M', TO_DATE('1999/10/29', 'YYYY/MM/DD'), '010-1111-1111', '부산', sysdate, sysdate, 'F');

---------------------------------------------------------------------------------------------------
--MeetUp 테이블 더미 데이터 생성

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

----------------------------------------------------------------------------------------
--BELONGMEMBER 테이블 더미 데이터 생성
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (1, 3, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (2, 3, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (3, 3, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (4, 3, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (5, 3, sysdate, '일반');

INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (6, 2, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (7, 2, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (8, 2, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (9, 2, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (10, 2, sysdate, '일반');

INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (1, 4, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (3, 4, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (5, 4, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (7, 4, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (8, 4, sysdate, '일반');

INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (6, 3, sysdate, '일반');
INSERT INTO BELONGMEMBER(MEMBER_ID, MEET_UP_ID, JOIN_AT, GRADE) VALUES (7, 3, sysdate, '일반');

------------------------------------------------------------------------------------
--JOINQUESTION 테이블 더미 데이터 생성
INSERT INTO JOINQUESTION VALUES (2, SEQ_JOINQUESTION.nextval, '질문내용', 'T');
INSERT INTO JOINQUESTION VALUES (2, SEQ_JOINQUESTION.nextval, '질문내용', 'T');
INSERT INTO JOINQUESTION VALUES (2, SEQ_JOINQUESTION.nextval, '질문내용', 'T');

INSERT INTO JOINQUESTION VALUES (3, SEQ_JOINQUESTION.nextval, '질문내용', 'T');
INSERT INTO JOINQUESTION VALUES (3, SEQ_JOINQUESTION.nextval, '질문내용', 'T');
INSERT INTO JOINQUESTION VALUES (3, SEQ_JOINQUESTION.nextval, '질문내용', 'T');

INSERT INTO JOINQUESTION VALUES (4, SEQ_JOINQUESTION.nextval, '질문내용', 'T');
INSERT INTO JOINQUESTION VALUES (4, SEQ_JOINQUESTION.nextval, '질문내용', 'T');
INSERT INTO JOINQUESTION VALUES (4, SEQ_JOINQUESTION.nextval, '질문내용', 'T');
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
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 3, 1, '게시글제목', '게시글내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 3, 2, '게시글제목', '게시글내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 3, 3, '게시글제목', '게시글내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 3, 4, '게시글제목', '게시글내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 3, 5, '게시글제목', '게시글내용', sysdate, sysdate);

INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 6, '게시글제목', '게시글내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 7, '게시글제목', '게시글내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 8, '게시글제목', '게시글내용', sysdate, sysdate);
INSERT INTO BOARD VALUES(SEQ_BOARD.nextval, 2, 9, '게시글제목', '게시글내용', sysdate, sysdate);

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
                                title varchar(50),
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

INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 3, 1,
                                   '🌳 흑석동 반려견 모임 공지 🌳 1',
                                   '안녕하세요,  귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 24,
                                   TO_TIMESTAMP('2024-09-09 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-24 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );

INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 3, 2,
                                   '🌳 흑석동 반려견 모임 공지 🌳 2',
                                   '안녕하세요,  귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 5,
                                   TO_TIMESTAMP('2024-09-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-10-03 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );

INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 3, 3,
                                   '🌳 흑석동 반려견 모임 공지 🌳 3',
                                   '안녕하세요,  귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 17,
                                   TO_TIMESTAMP('2024-09-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-12 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );

INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 3, 4,
                                   '🌳 흑석동 반려견 모임 공지 🌳 4',
                                   '안녕하세요,  귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 4,
                                   TO_TIMESTAMP('2024-09-07 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-13 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );

INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 3, 5,
                                   '🌳 흑석동 반려견 모임 공지 🌳 5',
                                   '안녕하세요,  귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 2,
                                   TO_TIMESTAMP('2024-09-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-17 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );

INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 2, 6,
                                   '🌳 흑석동 반려견 모임 공지 🌳 6',
                                   '안녕하세요,  귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 7,
                                   TO_TIMESTAMP('2024-09-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-15 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );

INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 2, 7,
                                   '🌳 흑석동 반려견 모임 공지 🌳 7',
                                   '안녕하세요,  귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 6,
                                   TO_TIMESTAMP('2024-09-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-10-12 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );

INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 2, 8,
                                   '🌳 흑석동 반려견 모임 공지 🌳 8',
                                   '안녕하세요,  귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 11,
                                   TO_TIMESTAMP('2024-09-13 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-10-22 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );

INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 2, 9,
                                   '🌳 흑석동 반려견 모임 공지 🌳 9',
                                   '안녕하세요,  귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 9,
                                   TO_TIMESTAMP('2024-09-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-27 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );

INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 2, 10,
                                   '🌳 흑석동 반려견 모임 공지 🌳 10',
                                   '안녕하세요,  귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 2,
                                   TO_TIMESTAMP('2024-09-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-21 22:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'

                                  );

INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 3, 7,
                                   '🌳 흑석동 반려견 모임 공지 🌳 11',
                                   '안녕하세요,  귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 3,
                                   TO_TIMESTAMP('2024-09-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-25 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );

INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 3, 4,
                                   '🌳 흑석동 반려견 모임 공지 🌳 12',
                                   '안녕하세요, 귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 4,
                                   TO_TIMESTAMP('2024-09-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );


INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 3, 4,
                                   '🌳 흑석동 반려견 모임 공지 🌳 13',
                                   '안녕하세요, 귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 9,
                                   TO_TIMESTAMP('2024-09-03 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-03 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );


INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 4, 7,
                                   '🌳 흑석동 반려견 모임 공지 🌳 14',
                                   '안녕하세요, 귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 4,
                                   TO_TIMESTAMP('2024-09-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );


INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 4, 7,
                                   '🌳 흑석동 반려견 모임 공지 🌳 15',
                                   '안녕하세요, 귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 6,
                                   TO_TIMESTAMP('2024-09-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );


INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 4, 7,
                                   '🌳 흑석동 반려견 모임 공지 🌳 16',
                                   '안녕하세요, 귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 2,
                                   TO_TIMESTAMP('2024-09-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );


INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 4, 3,
                                   '🌳 흑석동 반려견 모임 공지 🌳 17',
                                   '안녕하세요, 귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 5,
                                   TO_TIMESTAMP('2024-09-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );


INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 3, 1,
                                   '🌳 흑석동 반려견 모임 공지 🌳 18',
                                   '안녕하세요, 귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 3,
                                   TO_TIMESTAMP('2024-09-08 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-08 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );


INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 4, 7,
                                   '🌳 흑석동 반려견 모임 공지 🌳 19',
                                   '안녕하세요, 귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 1,
                                   TO_TIMESTAMP('2024-09-29 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-29 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );


INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 3, 1,
                                   '🌳 흑석동 반려견 모임 공지 🌳 20',
                                   '안녕하세요, 귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 8,
                                   TO_TIMESTAMP('2024-10-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-10-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );


INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 4, 3,
                                   '🌳 흑석동 반려견 모임 공지 🌳 21',
                                   '안녕하세요, 귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 7,
                                   TO_TIMESTAMP('2024-10-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-10-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );


INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 3, 1,
                                   '🌳 흑석동 반려견 모임 공지 🌳 22',
                                   '안녕하세요, 귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 7,
                                   TO_TIMESTAMP('2024-09-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );


INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 4, 7,
                                   '🌳 흑석동 반려견 모임 공지 🌳 23',
                                   '안녕하세요, 귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 2,
                                   TO_TIMESTAMP('2024-09-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );


INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 4, 7,
                                   '🌳 흑석동 반려견 모임 공지 🌳 24',
                                   '안녕하세요, 귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 10,
                                   TO_TIMESTAMP('2024-09-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );


INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 4, 3,
                                   '🌳 흑석동 반려견 모임 공지 🌳 25',
                                   '안녕하세요, 귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 6,
                                   TO_TIMESTAMP('2024-09-06 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-06 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );


INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 4, 3,
                                   '🌳 흑석동 반려견 모임 공지 🌳 26',
                                   '안녕하세요, 귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 2,
                                   TO_TIMESTAMP('2024-09-19 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-19 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );


INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 4, 7,
                                   '🌳 흑석동 반려견 모임 공지 🌳 27',
                                   '안녕하세요, 귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 7,
                                   TO_TIMESTAMP('2024-09-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );


INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 3, 1,
                                   '🌳 흑석동 반려견 모임 공지 🌳 28',
                                   '안녕하세요, 귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 4,
                                   TO_TIMESTAMP('2024-10-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-10-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );


INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 4, 3,
                                   '🌳 흑석동 반려견 모임 공지 🌳 29',
                                   '안녕하세요, 귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 2,
                                   TO_TIMESTAMP('2024-09-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );


INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 4, 7,
                                   '🌳 흑석동 반려견 모임 공지 🌳 30',
                                   '안녕하세요, 귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 7,
                                   TO_TIMESTAMP('2024-09-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );


INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 3, 4,
                                   '🌳 흑석동 반려견 모임 공지 🌳 31',
                                   '안녕하세요, 귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 5,
                                   TO_TIMESTAMP('2024-09-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );


INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 4, 7,
                                   '🌳 흑석동 반려견 모임 공지 🌳 32',
                                   '안녕하세요, 귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 5,
                                   TO_TIMESTAMP('2024-09-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );


INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 4, 7,
                                   '🌳 흑석동 반려견 모임 공지 🌳 33',
                                   '안녕하세요, 귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 4,
                                   TO_TIMESTAMP('2024-09-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );


INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 3, 4,
                                   '🌳 흑석동 반려견 모임 공지 🌳 34',
                                   '안녕하세요, 귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 7,
                                   TO_TIMESTAMP('2024-09-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );


INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 4, 3,
                                   '🌳 흑석동 반려견 모임 공지 🌳 35',
                                   '안녕하세요, 귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 3,
                                   TO_TIMESTAMP('2024-09-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );


INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 4, 7,
                                   '🌳 흑석동 반려견 모임 공지 🌳 36',
                                   '안녕하세요, 귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 8,
                                   TO_TIMESTAMP('2024-09-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );


INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 4, 7,
                                   '🌳 흑석동 반려견 모임 공지 🌳 37',
                                   '안녕하세요, 귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 6,
                                   TO_TIMESTAMP('2024-09-09 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-09 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );


INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 3, 1,
                                   '🌳 흑석동 반려견 모임 공지 🌳 38',
                                   '안녕하세요, 귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 4,
                                   TO_TIMESTAMP('2024-09-22 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-22 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );


INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 3, 4,
                                   '🌳 흑석동 반려견 모임 공지 🌳 39',
                                   '안녕하세요, 귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 3,
                                   TO_TIMESTAMP('2024-09-03 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-03 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );


INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 3, 4,
                                   '🌳 흑석동 반려견 모임 공지 🌳 40',
                                   '안녕하세요, 귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 2,
                                   TO_TIMESTAMP('2024-09-03 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-03 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );


INSERT INTO MeetUpSchedule VALUES (SEQ_MEETUPSCHEDULE.nextval, 3, 4,
                                   '🌳 흑석동 반려견 모임 공지 🌳 41',
                                   '안녕하세요, 귀여운 강아지 동호회 회원 여러분! 다가오는 주말, 강아지들과 함께 즐거운 시간을 보낼 모임을 준비했습니다',
                                   '창경궁로 254 동원빌딩 1층', 1,
                                   TO_TIMESTAMP('2024-09-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                                   TO_TIMESTAMP('2024-09-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), systimestamp, 'T'
                                  );

------------------------------------------------------------------

create table schedulebelongmember (
                                      meet_up_id number,
                                      member_id number,
                                      schedule_id number
);

INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 6, 2, 7, '댓글1', SYSDATE, SYSDATE, 0, 0, NULL);
INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 6, 2, 8, '대댓글1', SYSDATE, SYSDATE, 1, 0, 1);
INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 6, 2, 7, '대댓글1-1', SYSDATE, SYSDATE, 2, 0, 2);
INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 6, 2, 7, '대댓글1-2', SYSDATE, SYSDATE, 2, 0, 2);
INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 6, 2, 7, '대댓글1-1', SYSDATE, SYSDATE, 0, 4, NULL);

INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 6, 2, 7, '대댓글1-1', SYSDATE, SYSDATE, 1, 4, 5);
INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 6, 2, 7, '대댓글1-4', SYSDATE, SYSDATE, 1, 4, 5);

INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 8, 2, 6, '댓글1', SYSDATE, SYSDATE, 0, 0, NULL);
INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 8, 2, 7, '대댓글1', SYSDATE, SYSDATE, 1, 0, 8);
INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 8, 2, 8, '대댓글1-1', SYSDATE, SYSDATE, 2, 0, 9);
INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 8, 2, 7, '대댓글2', SYSDATE, SYSDATE, 1, 0, 8);
INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 8, 2, 9, '댓글2', SYSDATE, SYSDATE, 0, 4, NULL);

INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 8, 2, 7, '대댓글2-1', SYSDATE, SYSDATE, 1, 4, 12);
INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 8, 2, 7, '대댓글2-2', SYSDATE, SYSDATE, 1, 4, 12);


INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 6, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 7, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 8, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 9, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 7, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 8, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 9, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 7, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 8, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 9, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 7, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 8, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 9, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 7, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 8, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 9, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 7, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 8, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 9, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 7, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 8, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 9, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 7, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 8, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 9, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);

alter table schedulebelongmember add constraint PK_SCHEDULEBELONGMEMBER PRIMARY KEY(meet_up_id,member_id,schedule_id);
alter table schedulebelongmember add constraint FK_SCHEDULEBELONGMEMBER FOREIGN KEY(meet_up_id,member_id)
    REFERENCES BELONGMEMBER (meet_up_id, member_id) ON DELETE CASCADE;

alter table schedulebelongmember add constraint FK_SCHEDULEBELONGMEMBER_SC FOREIGN KEY(schedule_id)
    REFERENCES MeetUpSchedule (schedule_id) ON DELETE CASCADE;

INSERT INTO SCHEDULEBELONGMEMBER s values(3, 3, 2);
INSERT INTO SCHEDULEBELONGMEMBER s values(3, 4, 2);
INSERT INTO SCHEDULEBELONGMEMBER s values(3, 5, 2);


INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 6, 2, 7, '댓글1', SYSDATE, SYSDATE, 0, 0, NULL);
INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 6, 2, 8, '대댓글1', SYSDATE, SYSDATE, 1, 0, 1);
INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 6, 2, 7, '대댓글1-1', SYSDATE, SYSDATE, 2, 0, 2);
INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 6, 2, 7, '대댓글1-2', SYSDATE, SYSDATE, 2, 0, 2);
INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 6, 2, 7, '대댓글1-1', SYSDATE, SYSDATE, 0, 4, NULL);

INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 6, 2, 7, '대댓글1-1', SYSDATE, SYSDATE, 1, 4, 5);
INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 6, 2, 7, '대댓글1-4', SYSDATE, SYSDATE, 1, 4, 5);

INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 8, 2, 6, '댓글1', SYSDATE, SYSDATE, 0, 0, NULL);
INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 8, 2, 7, '대댓글1', SYSDATE, SYSDATE, 1, 0, 8);
INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 8, 2, 8, '대댓글1-1', SYSDATE, SYSDATE, 2, 0, 9);
INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 8, 2, 7, '대댓글2', SYSDATE, SYSDATE, 1, 0, 8);
INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 8, 2, 9, '댓글2', SYSDATE, SYSDATE, 0, 4, NULL);

INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 8, 2, 7, '대댓글2-1', SYSDATE, SYSDATE, 1, 4, 12);
INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 8, 2, 7, '대댓글2-2', SYSDATE, SYSDATE, 1, 4, 12);


INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 6, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 7, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 8, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 9, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 7, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 8, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 9, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 7, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 8, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 9, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 7, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 8, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 9, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 7, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 8, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 9, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 7, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 8, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 9, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 7, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 8, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 9, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 7, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 8, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 9, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);


INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 6, 2, 7, '댓글1', SYSDATE, SYSDATE, 0, 0, NULL);
INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 6, 2, 8, '대댓글1', SYSDATE, SYSDATE, 1, 0, 1);
INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 6, 2, 7, '대댓글1-1', SYSDATE, SYSDATE, 2, 0, 2);
INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 6, 2, 7, '대댓글1-2', SYSDATE, SYSDATE, 2, 0, 2);
INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 6, 2, 7, '대댓글1-1', SYSDATE, SYSDATE, 0, 4, NULL);

INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 6, 2, 7, '대댓글1-1', SYSDATE, SYSDATE, 1, 4, 5);
INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 6, 2, 7, '대댓글1-4', SYSDATE, SYSDATE, 1, 4, 5);

INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 8, 2, 6, '댓글1', SYSDATE, SYSDATE, 0, 0, NULL);
INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 8, 2, 7, '대댓글1', SYSDATE, SYSDATE, 1, 0, 8);
INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 8, 2, 8, '대댓글1-1', SYSDATE, SYSDATE, 2, 0, 9);
INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 8, 2, 7, '대댓글2', SYSDATE, SYSDATE, 1, 0, 8);
INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 8, 2, 9, '댓글2', SYSDATE, SYSDATE, 0, 4, NULL);

INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 8, 2, 7, '대댓글2-1', SYSDATE, SYSDATE, 1, 4, 12);
INSERT INTO REPLY VALUES (SEQ_REPLY.NEXTVAL, 8, 2, 7, '대댓글2-2', SYSDATE, SYSDATE, 1, 4, 12);


INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 6, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 7, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 8, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 9, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 7, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 8, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 9, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 7, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 8, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 9, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 7, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 8, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 9, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 7, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 8, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 9, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 7, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 8, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 9, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 7, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 8, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 9, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 7, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 8, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);
INSERT INTO BOARD VALUES (SEQ_BOARD.NEXTVAL, 2, 9, '게시글 제목', '게시글 내용', SYSDATE, SYSDATE);

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
    FILE_ORIGINAL_NAME VARCHAR(100),
    FILE_UUID_NAME VARCHAR(100),
    FILE_TYPE VARCHAR(100),
    MEMBER_ID NUMBER NULL,
    MEET_UP_ID NUMBER NULL,
    CONSTRAINT FK_FILE_MEETUP FOREIGN KEY (MEET_UP_ID) REFERENCES MEETUP(MEET_UP_ID),
    CONSTRAINT FK_FILE_MEMBER FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER(MEMBER_ID)
);

CREATE SEQUENCE SEQ_FILE START WITH 1 INCREMENT BY 1;

INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'ㅎㅇ', 'e8183fd2-0f42-43fa-b699-6cf1e04a8d3a', 'TITLE', NULL, 2);
INSERT INTO FILES VALUES (SEQ_FILE.NEXTVAL, 'ㅎㅇgd', 'dev-jeans.png', 'MEMBER', 6, null);

COMMIT;
