-- drop 문구--------------------------------------------------
drop table members;

drop sequence seqprod;
drop table products;

drop sequence seqorder;
drop table orders;
ALTER TABLE orders DROP PRIMARY KEY;


drop sequence seqdetail;
drop table orderdetails;
ALTER TABLE orderdetails DROP PRIMARY KEY;


drop table boards;
ALTER TABLE boards DROP PRIMARY KEY;
drop sequence myboard;

drop sequence seqother;
drop table otheraddress;
ALTER TABLE otheraddress DROP PRIMARY KEY;

drop table cart;

-----------members------------------------------------------------------------------------------------------------------
--members 테이블 생성
create table members(
   id Varchar2(20) Primary Key not null,   
   name Varchar2(20) not null,   
   password Varchar2(30) not null,   
   email Varchar2(50) not null,   
   gender Varchar2(10) not null,   
   zipcode Varchar2(10) not null,   
   address1 Varchar2(255) not null,   
   address2 Varchar2(255) not null,   
   birth date not null,
   phonenumber varchar2(50) not null,  
   roadaddress varchar2(255),
   extraaddress varchar2(255)
);


insert into members( id, name, password, email, gender, zipcode, address1, address2, birth, phonenumber, point, roadaddress, extraaddress) 
values( 'yusin', '김유신', 'abc1234', 'yusin@yusin.com','남자', '147-258', '서울시 송파구','석촌' ,'1990/12/25' , '01054851234', 150, 'd', 'dd' );

insert into members( Id, Name, Password, Email, Gender, Zipcode, Address1, Address2, Birth, phonenumber, Point, roadaddress, extraaddress) 
values('kim09' , '김구', 'abc1234', 'kim09@kim09.co.kr','남자', '789-456', '서울시 서초구', '강남','1995/01/20' , '01012345678', 100, 'd', 'dd' );





----------------------------------------------------------------------------------------------------------------------------------







---------------------products--------------------------------------------------------------------------------------------
-- 시퀀스 생성(pno)
create sequence seqprod start with 1 increment by 1 nocache ;

-- products 테이블 생성
create table products(
	pno number primary key,
	pname varchar2(30) not null,
	brand varchar2(30) not null,
	image varchar2(30),
	stock number not null,
	price number not null,
	category varchar2(20) not null,
	inputdate date default sysdate,
	alcohol number not null,
	content varchar2(300), 
	volume number not null
) ;

alter table products add company varchar2(30);



insert into products(pno, pname, brand, image, stock, price, category,  alcohol, content, volume)
values(seqprod.nextval, '환희', '산맥와인', '환희.png', 100, 80000, 'brandy',  40, '맛있다', 375);		

insert into products(pno, pname, brand, image, stock, price, category, alcohol, content, volume)
values(seqprod.nextval, '핸드릭스', 'william grant', '핸드릭스.png', 80, 65000, 'gin',  43, '너무쓰다', 1000);		

insert into products(pno, pname, brand, image, stock, price, category, alcohol, content, volume)
values(seqprod.nextval, '모나크 다크럼', 'Hood River', '모나크 다크럼.png', 60, 23000, 'rum', 40, '달달하다', 750);		

insert into products(pno, pname, brand, image, stock, price, category, alcohol, content, volume)
values(seqprod.nextval, '산타나', '데낄라', '산타나.png', 30, 20000, 'tequila',40, '나쁘지않다', 700);		

insert into products(pno, pname, brand, image, stock, price, category, alcohol, content, volume)
values(seqprod.nextval, '앱솔루트 보드카', '앱솔루트', '앱솔루트.png', 70, 32000, 'vodka', 40, '머리아프다', 1000);		

insert into products(pno, pname, brand, image, stock, price, category, alcohol, content, volume)
values(seqprod.nextval, '탈리스만 위스키', '탈리스만', '탈리스만위스키.png', 50, 15980, 'whiskey', 40, '강력추천한다', 1000);		

insert into products(pno, pname, brand, image, stock, price, category, alcohol, content, volume)
values(seqprod.nextval, '엑스레이티드', '엑스', '엑스레이티드.png', 70, 21000, 'vodka', 35, '너무 맛있잖아', 5000);

insert into products(pno, pname, brand, image, stock, price, category, alcohol, content, volume)
values(seqprod.nextval, '아가베로', '카사', '아가베로.png', 60, 19000, 'tequila', 35, '너무 맛있잖아', 5000);

commit;
-----------------------------------------------------------------------------------------------------------------------------------








----------------orders-----------------------------------------------------------------------------------------------------------
-- 시퀀스 생성(oid)
create sequence seqorder start with 1 increment by 1 nocache ;

-- orders 테이블 생성
create Table orders(
   oid number primary key,
   mid Varchar(20),
   orderdate date default sysdate,
   remark varchar2(255)
);



-- 외래키 생성(mid)
alter table orders
add constraint orders_mid_fk
foreign key(mid) references members(id) on delete set null;




insert into orders( oid, mid, orderdate) values( seqorder.nextval, 'yusin', sysdate );
insert into orders( oid, mid, orderdate) values( seqorder.nextval, 'kim09', sysdate );
insert into orders( oid, mid, orderdate) values( seqorder.nextval, 'yusin', sysdate );



-----------------------------------------------------------------------------------------------------------------------------------




--------------------orderdetails--------------------------------------------------------------------------------------------------------
-- 시퀀스 생성(oid)
create sequence seqdetail start with 1 increment by 1 nocache ;

-- orderdetails 테이블 생성
create table orderdetails(
    odid number primary key,
    oid number not null,
    pnum number not null,
    qty Number,
    remark varchar2(255)
);

-- 외래키 생성(oid)
alter table orderdetails
add constraint orderdetails_oid_fk
foreign key(oid) references orders(oid) on delete set null;

-- 외래키 생성(pnum)
alter table orderdetails
add constraint orderdetails_pnum_fk
foreign key(pnum) references products(pno) on delete set null;





insert into orderdetails values(seqdetail.nextval, 1, 2, 10, default);
insert into orderdetails values(seqdetail.nextval, 2, 2, 5,  default);
insert into orderdetails values(seqdetail.nextval, 3, 4, 7, default);





-----------------------------------------------------------------------------------------------------------------------------------


---------------------boards-----------------------------------------------------------------------------------------------------
-- 시퀀스 생성(bno)
create sequence myboard start with 1 increment by 1 nocache ;

-- boards 테이블 생성
create table boards(
    bno number primary key,
    writer varchar2(20),
    title varchar2(30) not null,
    bcontents varchar2(300) not null,
    writedate date default sysdate,
    remark varchar2(255),
    depth number
);

-- 외래키 생성
alter table boards
add constraint boards_mid_fk
foreign key(writer) references members(id) on delete set null;

select * from boards;

insert into boards values(myboard.nextval, 'yusin', '주인장은 보시오', 'too expensive', default, default,0);
insert into boards values(myboard.nextval, 'alsdn', '너무한거 아니요', '그렇다구요', default, default,0);
insert into boards values(myboard.nextval, 'alsdn', 'heyheyhey', 'hihihi', default, default,0);


commit;
-------------------------------------------------------------------------------------------------------------



----------------------otheraddress-------------------------------------------------------------------------
-- 시퀀스 생성(fid)
create sequence seqotheraddr start with 1 increment by 1 nocache ;

-- otheraddress 테이블 생성
create table otheraddress(
    fid number primary key,
    mid varchar2(20),
    fname varchar2(20),
    zipcode varchar2(10),
    addr1 varchar2(255),
    addr2 varchar2(255),
    remark varchar2(255)
);

-- 외래키 생성(mid)
alter table otheraddress
add constraint otheraddr_mid_fk
foreign key(mid) references members(id) on delete cascade; 

-- 데이터 입력
insert into otheraddress values(seqotheraddr.nextval, 'yusin', '조민우', '11111', '서울', '서초구', default);
insert into otheraddress values(seqotheraddr.nextval, 'kim09', '홍길동', '22222', '경기', '상록구', default);
insert into otheraddress values(seqotheraddr.nextval, 'kim09', '고길동', '33333', '강원', '인제시', default);


alter table otheraddress add roadaddress varchar2(30);
alter table otheraddress add extraaddress varchar2(30);
   


-----------------------------------------------------------------------------------
create table postcodes(	
	area_cd varchar2(50),
	si_nm varchar2(50),
	sgg_nm varchar2(50),
	emd_nm varchar2(50),
	ri_nm varchar2(50),
	rd_nm varchar2(50),
	udrgrnd_yn varchar2(50),
	mt_yn varchar2(50),
	bd_ma_sn varchar2(50),
	bd_sb_sn varchar2(50),
	lndn_ma_sn varchar2(50),
	lndn_sb_sn varchar2(50),
	search_word varchar2(255),
	display_word varchar2(255),
	display_word_dtail varchar2(255)
); 



commit;






-------------------------------review------------------------------------------
create sequence seqreview start with 1 increment by 1 nocache ;

--테이블 생성
create table review(
    vnum number primary key not null,
    pno number,
    mid varchar2(20),
    Vcomment varchar2(255),
    inputdate DATE default sysdate
);

insert into review values(seqreview.nextval, 1, 'yusin', 'dsfsfds', default);

alter table review
add constraint review_pno_fk
foreign key(pno) references products(pno) on delete cascade; 

alter table review
add constraint review_mid_fk
foreign key(mid) references members(id) on delete set null; 





---------------------------My Cart-------------------------------------------

create table cart(
    mid varchar2(20) not null,
    pnum number not null,
    pname varchar2(30) not null,
    qty number not null,
    price number not null,
    image varchar2(30) not null,
    point number
);


alter table cart
add constraint cart_mid_fk
foreign key(mid) references members(id) on delete cascade; 

alter table cart
add constraint cart_pnum_fk
foreign key(pnum) references products(pno) on delete cascade; 



insert into cart values('yusin',1,'안녕',15,4000,'아아',0);
commit;


-----------------------  --------replys-----------------------------------------
create sequence myreply start with 1 increment by 1 nocache ;

create table replys(
    rno number,
    groupno number,
    mid VARCHAR2(30),
    comments VARCHAR2(255),
    redate date DEFAULT sysdate
);

alter table replys
add constraint replys_groupno_fk
foreign key(groupno) references boards(bno) on delete cascade; 

insert into replys values( MYREPLYS.nextval, 3,'kim' ,'kimkim' ,sysdate );
insert into replys values( MYREPLYS.nextval, 1,'kim' ,'kimkim' ,sysdate );


--------------------------------------------------------------------------------

