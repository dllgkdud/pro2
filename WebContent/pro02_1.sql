-- 데이터베이스 생성 시 필수 요건
create database myshop;
-- 데이터베이스 사용 시 필수 요건
use myshop;
commit;

-- 고객테이블
create table custom(
	cusId varchar(13) primary key,
    cusPw varchar(200) not null,
    cusName varchar(50) not null,
    address varchar(500) not null,
    cusTel varchar(50) not null,
    regDate datetime default now(),
    point int default 0,
    visited int default 0
);
select * from notice;

-- 수정사항(고객등급책정)
alter table custom modify point int default 1;

-- 고객 더미데이터(관리자)
insert into custom values("admin","03AC674216F3E15C761EE1A5E255F067953623C8B388B4459E13F978D7C846F4", "관리자", "웹사이트", "010-1111-1111", now(), 0, 0);

-- 공지사항테이블
create table notice(
	notNo int primary key auto_increment,
    title varchar(100) not null,
    content varchar(1000) not null,
    author varchar(50) not null,
    resDate datetime default now(),
    visited int default 0
);

-- 공시사항 더미데이터
insert into notice(title, content, author) values ("boardTest1", "This is boardWorkTest in boardTest1", "admin");
insert into notice(title, content, author) values ("boardTest2", "This is boardWorkTest in boardTest2", "admin");
insert into notice(title, content, author) values ("boardTest3", "This is boardWorkTest in boardTest3", "admin");

-- 제품테이블
create table product (
	proNo int primary key auto_increment,	
	cateNo int not null,	
	proName varchar(40),		
	proSpec varchar(500),	
	costPrice int not null,		
	disRate double not null,	
	proPrice int not null,
	proPic1 varchar(200),	
	proPic2 varchar(200)
);

-- 카테고리테이블
create table category(
	cateNo int primary key auto_increment,
	cateName varchar(50)
);

-- 카테고리 더미데이터
insert into category(cateName) values ("베스트");
insert into category(cateName) values ("티 제품");
insert into category(cateName) values ("티푸드");
insert into category(cateName) values ("티웨어");
insert into category(cateName) values ("라이프스타일");
select * from category;

-- 판매테이블
create table sales(
	saleNo int primary key auto_increment,	
	cusId varchar(13) not null,
	proNo int not null,
	amount int not null,	
	saleDate datetime default now(),
	parselNo int,
	salePayNo int
);

-- 배송테이블
create table parsel(
	parselNo int primary key auto_increment,
    parselAddr varchar(500),
    cusTel varchar(14),
    parselCompany varchar(50),
    parselTel varchar(14),
    parselState int default 0
);

-- 입고테이블
create table wearing(
	proNo int primary key,
    amount int
);