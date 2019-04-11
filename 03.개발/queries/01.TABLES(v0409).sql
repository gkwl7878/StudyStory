/* 유저 */
DROP TABLE user_table
	CASCADE CONSTRAINTS;

/* 공지사항 */
DROP TABLE notice
	CASCADE CONSTRAINTS;

/* 문의사항 */
DROP TABLE question
	CASCADE CONSTRAINTS;

/* 스터디 */
DROP TABLE study
	CASCADE CONSTRAINTS;

/* 스터디 공지 */
DROP TABLE study_notice
	CASCADE CONSTRAINTS;

/* 과제 */
DROP TABLE homework
	CASCADE CONSTRAINTS;

/* 스터디 댓글 */
DROP TABLE s_comment
	CASCADE CONSTRAINTS;

/* 스터디 참여자 */
DROP TABLE member
	CASCADE CONSTRAINTS;

/* 스터디 신청자 */
DROP TABLE join
	CASCADE CONSTRAINTS;

/* 알림 */
DROP TABLE alarm
	CASCADE CONSTRAINTS;

/* 좋아하는 스터디 */
DROP TABLE fav_study
	CASCADE CONSTRAINTS;

/* 스터디 공지 댓글 */
DROP TABLE sn_comment
	CASCADE CONSTRAINTS;

/* 관리자 유저 */
DROP TABLE admin_user
	CASCADE CONSTRAINTS;

/* 유저 */
CREATE TABLE user_table (
	id VARCHAR2(15) NOT NULL, /* 아이디 */
	nick VARCHAR2(30) NOT NULL, /* 닉네임 */
	name VARCHAR2(30) NOT NULL, /* 이름 */
	pass VARCHAR2(100) NOT NULL, /* 비밀번호 */
	zipcode VARCHAR2(6) NOT NULL, /* 우편번호 */
	addr1 VARCHAR2(150) NOT NULL, /* 주소1 */
	addr2 VARCHAR2(150) NOT NULL, /* 주소2 */
	tel VARCHAR2(13) NOT NULL, /* 연락처 */
	email VARCHAR2(100) NOT NULL, /* 이메일 */
	question CHAR(1) NOT NULL, /* 인증질문 */
	answer VARCHAR2(100) NOT NULL, /* 질문답 */
	img VARCHAR2(100) DEFAULT 'no_user_img.png', /* 이미지 */
	introduce VARCHAR2(300), /* 소개글 */
	deactivation CHAR(1), /* 탈퇴여부 */
	reg_date DATE DEFAULT SYSDATE /* 가입일 */
);

CREATE UNIQUE INDEX PK_user_table
	ON user_table (
		id ASC
	);

CREATE UNIQUE INDEX UIX_user_table
	ON user_table (
		nick ASC,
		email ASC
	);

ALTER TABLE user_table
	ADD
		CONSTRAINT PK_user_table
		PRIMARY KEY (
			id
		);

ALTER TABLE user_table
	ADD
		CONSTRAINT UK_user_table
		UNIQUE (
			nick,
			email
		);

/* 공지사항 */
CREATE TABLE notice (
	n_num CHAR(8) NOT NULL, /* 공지사항 번호 */
	subject VARCHAR2(300) NOT NULL, /* 제목 */
	content CLOB NOT NULL, /* 내용 */
	input_date DATE DEFAULT SYSDATE, /* 등록일 */
	view_cnt NUMBER DEFAULT 0 /* 조회수 */
);

CREATE UNIQUE INDEX PK_notice
	ON notice (
		n_num ASC
	);

ALTER TABLE notice
	ADD
		CONSTRAINT PK_notice
		PRIMARY KEY (
			n_num
		);

/* 문의사항 */
CREATE TABLE question (
	q_num CHAR(8) NOT NULL, /* 문의 번호 */
	subject VARCHAR2(300) NOT NULL, /* 제목 */
	category VARCHAR2(12) NOT NULL, /* 분류 */
	content CLOB NOT NULL, /* 문의내용 */
	input_date DATE DEFAULT SYSDATE, /* 등록일 */
	answer_flag CHAR(1) DEFAULT 'N', /* 답변여부 */
	answer_content CLOB, /* 답변내용 */
	answer_date DATE, /* 답변일 */
	id VARCHAR2(15) NOT NULL /* 아이디 */
);

CREATE UNIQUE INDEX PK_question
	ON question (
		q_num ASC
	);

ALTER TABLE question
	ADD
		CONSTRAINT PK_question
		PRIMARY KEY (
			q_num
		);

/* 스터디 */
CREATE TABLE study (
	s_num CHAR(8) NOT NULL, /* 스터디 번호 */
	study_name VARCHAR2(72) NOT NULL, /* 스터디명 */
	loc CHAR(6) NOT NULL, /* 지역 */
	category CHAR(6) NOT NULL, /* 주제 */
	content CLOB NOT NULL, /* 상세설명 */
	img VARCHAR2(100) DEFAULT 'no_study_img.png', /* 이미지 */
	recruitment CHAR(1) DEFAULT 'Y', /* 모집여부 */
	accept_flag CHAR(1) DEFAULT 'N', /* 수락여부 */
	input_date DATE DEFAULT SYSDATE, /* 생성일 */
	deactivation CHAR(1), /* 종료여부 */
	id VARCHAR2(15) NOT NULL, /* 리더 아이디 */
	delete_flag CHAR(1) /* 삭제여부 */
);

CREATE UNIQUE INDEX PK_study
	ON study (
		s_num ASC
	);

CREATE UNIQUE INDEX UIX_study
	ON study (
		study_name ASC
	);

ALTER TABLE study
	ADD
		CONSTRAINT PK_study
		PRIMARY KEY (
			s_num
		);

ALTER TABLE study
	ADD
		CONSTRAINT UK_study
		UNIQUE (
			study_name
		);

/* 스터디 공지 */
CREATE TABLE study_notice (
	sn_num CHAR(9) NOT NULL, /* 스터디 공지번호 */
	subject VARCHAR2(300) NOT NULL, /* 공지명 */
	meeting_info VARCHAR2(100) NOT NULL, /* 모임시간 */
	content CLOB NOT NULL, /* 공지내용 */
	addr VARCHAR2(300) NOT NULL, /* 주소 */
	s_num CHAR(8) NOT NULL, /* 스터디 번호 */
	input_date DATE DEFAULT SYSDATE /* 작성일 */
);

CREATE UNIQUE INDEX PK_study_notice
	ON study_notice (
		sn_num ASC
	);

ALTER TABLE study_notice
	ADD
		CONSTRAINT PK_study_notice
		PRIMARY KEY (
			sn_num
		);

/* 과제 */
CREATE TABLE homework (
	id VARCHAR2(15) NOT NULL, /* 아이디 */
	workload VARCHAR2(300) NOT NULL, /* 과제내용 */
	finish_flag CHAR(1) DEFAULT 'N', /* 완료여부 */
	sn_num CHAR(9) NOT NULL /* 스터디 공지번호 */
);

CREATE UNIQUE INDEX PK_homework
	ON homework (
		id ASC
	);

ALTER TABLE homework
	ADD
		CONSTRAINT PK_homework
		PRIMARY KEY (
			id
		);

/* 스터디 댓글 */
CREATE TABLE s_comment (
	s_num CHAR(8) NOT NULL, /* 스터디 번호 */
	s_comment VARCHAR2(300) NOT NULL, /* 댓글내용 */
	input_date DATE DEFAULT SYSDATE, /* 댓글등록일 */
	id VARCHAR2(15) NOT NULL /* 아이디 */
);

CREATE UNIQUE INDEX PK_s_comment
	ON s_comment (
		s_num ASC
	);

ALTER TABLE s_comment
	ADD
		CONSTRAINT PK_s_comment
		PRIMARY KEY (
			s_num
		);

/* 스터디 참여자 */
CREATE TABLE member (
	id VARCHAR2(15) NOT NULL, /* 아이디 */
	s_num CHAR(8) NOT NULL /* 스터디 번호 */
);

CREATE UNIQUE INDEX PK_member
	ON member (
		id ASC,
		s_num ASC
	);

ALTER TABLE member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			id,
			s_num
		);

/* 스터디 신청자 */
CREATE TABLE join (
	id VARCHAR2(15) NOT NULL, /* 아이디 */
	s_num CHAR(8) NOT NULL, /* 스터디 번호 */
	introduce VARCHAR2(300) NOT NULL, /* 자기소개 */
	motive VARCHAR2(300) NOT NULL, /* 지원동기 */
	accept_flag CHAR(1) DEFAULT 'N', /* 수락여부 */
	input_date DATE DEFAULT SYSDATE /* 신청일 */
);

CREATE UNIQUE INDEX PK_join
	ON join (
		id ASC,
		s_num ASC
	);

ALTER TABLE join
	ADD
		CONSTRAINT PK_join
		PRIMARY KEY (
			id,
			s_num
		);

/* 알림 */
CREATE TABLE alarm (
	a_num CHAR(8) NOT NULL, /* 알림 번호 */
	category VARCHAR2(12) NOT NULL, /* 분류 */
	subject VARCHAR2(300) NOT NULL, /* 제목 */
	content VARCHAR2(300) NOT NULL, /* 내용 */
	input_date DATE DEFAULT SYSDATE, /* 등록일 */
	read_flag CHAR(1) DEFAULT 'N', /* 읽음여부 */
	id VARCHAR2(15) NOT NULL /* 아이디 */
);

CREATE UNIQUE INDEX PK_alarm
	ON alarm (
		a_num ASC
	);

ALTER TABLE alarm
	ADD
		CONSTRAINT PK_alarm
		PRIMARY KEY (
			a_num
		);

/* 좋아하는 스터디 */
CREATE TABLE fav_study (
	s_num CHAR(8) NOT NULL, /* 스터디 번호 */
	id VARCHAR2(15) NOT NULL /* 아이디 */
);

CREATE UNIQUE INDEX PK_fav_study
	ON fav_study (
		s_num ASC,
		id ASC
	);

ALTER TABLE fav_study
	ADD
		CONSTRAINT PK_fav_study
		PRIMARY KEY (
			s_num,
			id
		);

/* 스터디 공지 댓글 */
CREATE TABLE sn_comment (
	sn_num CHAR(9) NOT NULL, /* 스터디 공지번호 */
	sn_comment VARCHAR2(300) NOT NULL, /* 댓글내용 */
	input_date DATE DEFAULT SYSDATE, /* 댓글등록일 */
	id VARCHAR2(15) NOT NULL /* 아이디 */
);

CREATE UNIQUE INDEX PK_sn_comment
	ON sn_comment (
		sn_num ASC
	);

ALTER TABLE sn_comment
	ADD
		CONSTRAINT PK_sn_comment
		PRIMARY KEY (
			sn_num
		);

/* 관리자 유저 */
CREATE TABLE admin_user (
	id VARCHAR2(15) NOT NULL, /* 아이디 */
	pass VARCHAR2(100) NOT NULL, /* 비밀번호 */
	reg_date DATE DEFAULT SYSDATE /* 등록일 */
);

CREATE UNIQUE INDEX PK_admin_user
	ON admin_user (
		id ASC
	);

ALTER TABLE admin_user
	ADD
		CONSTRAINT PK_admin_user
		PRIMARY KEY (
			id
		);

ALTER TABLE question
	ADD
		CONSTRAINT FK_user_table_TO_question
		FOREIGN KEY (
			id
		)
		REFERENCES user_table (
			id
		);

ALTER TABLE study
	ADD
		CONSTRAINT FK_user_table_TO_study
		FOREIGN KEY (
			id
		)
		REFERENCES user_table (
			id
		);

ALTER TABLE study_notice
	ADD
		CONSTRAINT FK_study_TO_study_notice
		FOREIGN KEY (
			s_num
		)
		REFERENCES study (
			s_num
		)
		ON DELETE CASCADE;

ALTER TABLE homework
	ADD
		CONSTRAINT FK_user_table_TO_homework
		FOREIGN KEY (
			id
		)
		REFERENCES user_table (
			id
		);

ALTER TABLE homework
	ADD
		CONSTRAINT FK_study_notice_TO_homework
		FOREIGN KEY (
			sn_num
		)
		REFERENCES study_notice (
			sn_num
		)
		ON DELETE CASCADE;

ALTER TABLE s_comment
	ADD
		CONSTRAINT FK_user_table_TO_s_comment
		FOREIGN KEY (
			id
		)
		REFERENCES user_table (
			id
		);

ALTER TABLE s_comment
	ADD
		CONSTRAINT FK_study_TO_s_comment
		FOREIGN KEY (
			s_num
		)
		REFERENCES study (
			s_num
		)
		ON DELETE CASCADE;

ALTER TABLE member
	ADD
		CONSTRAINT FK_study_TO_member
		FOREIGN KEY (
			s_num
		)
		REFERENCES study (
			s_num
		)
		ON DELETE CASCADE;

ALTER TABLE member
	ADD
		CONSTRAINT FK_user_table_TO_member
		FOREIGN KEY (
			id
		)
		REFERENCES user_table (
			id
		);

ALTER TABLE join
	ADD
		CONSTRAINT FK_user_table_TO_join
		FOREIGN KEY (
			id
		)
		REFERENCES user_table (
			id
		);

ALTER TABLE join
	ADD
		CONSTRAINT FK_study_TO_join
		FOREIGN KEY (
			s_num
		)
		REFERENCES study (
			s_num
		)
		ON DELETE CASCADE;

ALTER TABLE alarm
	ADD
		CONSTRAINT FK_user_table_TO_alarm
		FOREIGN KEY (
			id
		)
		REFERENCES user_table (
			id
		);

ALTER TABLE fav_study
	ADD
		CONSTRAINT FK_study_TO_fav_study
		FOREIGN KEY (
			s_num
		)
		REFERENCES study (
			s_num
		)
		ON DELETE CASCADE;

ALTER TABLE fav_study
	ADD
		CONSTRAINT FK_user_table_TO_fav_study
		FOREIGN KEY (
			id
		)
		REFERENCES user_table (
			id
		);

ALTER TABLE sn_comment
	ADD
		CONSTRAINT FK_user_table_TO_sn_comment
		FOREIGN KEY (
			id
		)
		REFERENCES user_table (
			id
		);

ALTER TABLE sn_comment
	ADD
		CONSTRAINT FK_study_notice_TO_sn_comment
		FOREIGN KEY (
			sn_num
		)
		REFERENCES study_notice (
			sn_num
		)
		ON DELETE CASCADE;

COMMIT;