-- ���� ���� ���̺�
create table c_member(
    m_id VARCHAR2(200) PRIMARY KEY, --���� ID
    m_pwd VARCHAR2(400) not null, --����� ��й�ȣ
    m_birth VARCHAR2(200) not null, --����� ����
    m_name VARCHAR2(200) not null, --������̸�
    m_email VARCHAR2(200) not null, --����� �̸���
    m_tel VARCHAR2(200) not null, --����� ��Ż�
    m_phone VARCHAR2(200) not null, --����� ��ȭ��ȣ
    m_state Number not null, -- ����ȸ���̸� 1, Ż��ȸ���̸� 2
    m_regdate date -- ȸ������ ��¥
);
-- �� ���� ���̺�
create table c_car(
    c_num number not null, -- ���� �ڵ��ȣ
    c_name varchar2(200) primary key, -- ���� �̸�
    c_brand varchar2(200)not null, -- ���� �귣��
    c_year varchar2(200) not null, -- ���� ���
    c_color varchar2(200) not null, -- ���� ����
    c_type varchar2(200) not null, -- ���� ������
    c_type2 varchar2(200) not null, -- ���� ����
    c_oil varchar2(200) not null, -- ���� �⸧
    c_price number not null, -- ���� ����
    c_img varchar2(200) not null -- ���� �̹���
);
-- ���� ���̺�
CREATE TABLE c_rental (
    cr_num number PRIMARY KEY,                              -- �����ȣ
    cr_mid VARCHAR2(30),                                        -- �� ���̵�
    cr_cname VARCHAR2(200),                                     --�� �̸�
    cr_rdate VARCHAR2(200),                                      --���� ����
    cr_sdate VARCHAR2(200),                                     --���� �뿩��
    cr_edate VARCHAR2(200),                                     --�ݳ� ����
    cr_price number,                                              --��Ʈ ���
    cr_order VARCHAR2(100),                                   --�ֹ� ��ȣ
    cr_status VARCHAR2(30) DEFAULT 'wait' NOT NULL, --���� ���� Ȯ��
    cr_paytime TIMESTAMP,
    cr_waittime VARCHAR2(200),
    FOREIGN KEY (cr_mid) REFERENCES c_member(m_id) ON DELETE CASCADE,
    FOREIGN KEY (cr_cname) REFERENCES c_car(c_name)
);
-- ��������â
create table c_order_info (
    id number primary key,
    buyer_name varchar2(255),
    buyer_phone varchar2(20),
    member_email varchar2(255),
    buy_date varchar2(20),
    product_name varchar2(255),
    buy_id varchar2(255),
    merchant_id varchar2(255),
    pay_price number,
    card_num varchar2(255),
    pay_status varchar2(50),
    post_code number,
    refund varchar2(20),
    parent_merchant_id varchar2(255)
);
-- �������� ���̺�
CREATE TABLE C_SERVICE (
    cs_no NUMBER(*,0),
    cs_id varchar2(200 byte),
    cs_pwd varchar2(200 byte),
    cs_title VARCHAR2(200 BYTE), 
    cs_cont VARCHAR2(4000 BYTE), 
    cs_date DATE DEFAULT SYSDATE, 
    cs_type VARCHAR2(20 BYTE),
    cs_hit int default 0,
    FOREIGN KEY (cs_id) REFERENCES c_member(m_id) ON DELETE CASCADE
);
--Q&A ���̺�
CREATE TABLE c_qna (
    cq_no NUMBER(*,0), 
    cq_id VARCHAR2(20 BYTE), 
    cq_pwd VARCHAR2(400 BYTE), 
    cq_title VARCHAR2(200 BYTE), 
    cq_cont VARCHAR2(4000 BYTE), 
    cq_date DATE DEFAULT SYSDATE, 
    cq_file VARCHAR2(400 BYTE), 
    QNA_REPLYGROUP NUMBER(*,0), 
    QNA_REPLYTYPE NUMBER(*,0), 
    QNA_REPLYINDEX NUMBER(*,0),
    FOREIGN KEY (cq_id) REFERENCES c_member(m_id) ON DELETE CASCADE
);
-- ���̹� �α���
create table social(
 id NUMBER(19) DEFAULT social_seq.nextval primary key ,
 username VARCHAR2(400) not null,
 password VARCHAR2(200) not null,
 email VARCHAR2(400) not null,
 role  VARCHAR2(255 CHAR) DEFAULT 'user',
 create_date DATE DEFAULT SYSDATE,
 k_state NUMBER(38)
);

-- ���̹� �α��� ������
create SEQUENCE social_seq
INCREMENT by 1
START WITH 1
NOCACHE;

-- ���� ���� ���̺� ������
create sequence car_seq
start with 1
increment by 1
nocache;
-- ���� ���̺� ������
create sequence cr_seq
start with 1
increment by 1
nocache;
-- ���� ���� ���̺� ������
create sequence co_seq
start with 1
increment by 1
nocache;
-- �������� ���̺� ������
create sequence cs_seq
start with 1
increment by 1
nocache;
-- Q&A ���̺� ������
create sequence cq_seq
start with 1
increment by 1
nocache;

-- �ڵ��� insert
-- ����
insert into c_car(c_num, c_name, c_brand, c_type, c_type2, c_oil, c_year, c_color, c_price, c_img)
values(car_seq.nextval, '����', 'KIA', '���� RV', '����', '���ָ�', '2023', 'WHITE', 100, 'Gcar01.png');

insert into c_car(c_num, c_name, c_brand, c_type, c_type2, c_oil, c_year, c_color, c_price, c_img)
values(car_seq.nextval, '���', 'KIA', '���� ��ġ��', '����', '���ָ�', '2023', 'WHITE', 100, 'Gcar02.png');

insert into c_car(c_num, c_name, c_brand, c_type, c_type2, c_oil, c_year, c_color, c_price, c_img)
values(car_seq.nextval, 'ĳ����', '����', '���� SUV', '����', '���ָ�', '2023', 'BLUE', 200, 'Gcar03.JPG');

-- ����
insert into c_car(c_num, c_name, c_brand, c_type, c_type2, c_oil, c_year, c_color, c_price, c_img)
values(car_seq.nextval, '��ġ��', 'MINI', '���� ��ġ��', '����', '���ָ�', '2024', 'RED', 200, 'Scar01.png');

insert into c_car(c_num, c_name, c_brand, c_type, c_type2, c_oil, c_year, c_color, c_price, c_img)
values(car_seq.nextval, '�ڳ�', '����', '���� SUV', '����', '���ָ�', '2023', 'GRAY', 200, 'Scar02.JPG');

-- ���� ����
insert into c_car(c_num, c_name, c_brand, c_type, c_type2, c_oil, c_year, c_color, c_price, c_img)
values(car_seq.nextval, 'K5', 'KIA', '���� ����', '���� ����', 'LPG, ���ָ�', '2022', 'BLACK', 250, 'Jcar01.png');

insert into c_car(c_num, c_name, c_brand, c_type, c_type2, c_oil, c_year, c_color, c_price, c_img)
values(car_seq.nextval, '�Ÿ', '����', '���� ����', '���� ����', 'LPG, ���ָ�', '2019', 'LIGHTGRAY', 250, 'Jcar02.JPG');

insert into c_car(c_num, c_name, c_brand, c_type, c_type2, c_oil, c_year, c_color, c_price, c_img)
values(car_seq.nextval, '3 �ø���', 'BMW', '���� ����', '���� ����', '���ָ�, ����', '2019', 'WHITE', 300, 'Jcar03.png');

insert into c_car(c_num, c_name, c_brand, c_type, c_type2, c_oil, c_year, c_color, c_price, c_img)
values(car_seq.nextval, '���׿�', '�����ٰ�', '���� ����', '���� ����', '����', '2019', 'BLUE', 300, 'Jcar04.JPG');

insert into c_car(c_num, c_name, c_brand, c_type, c_type2, c_oil, c_year, c_color, c_price, c_img)
values(car_seq.nextval, 'A4', '�ƿ��', '���� ����', '���� ����', '���ָ�, ����', '2019', 'BLACK', 300, 'Jcar05.png');

-- ���� SUV
insert into c_car(c_num, c_name, c_brand, c_type, c_type2, c_oil, c_year, c_color, c_price, c_img)
values(car_seq.nextval, '��Ÿ�� ���̺긮��', '����', '���� SUV', '���� SUV', '���ָ�, ���̺긮��', '2023', 'WHITE', 350, 'Jcar06.png');

insert into c_car(c_num, c_name, c_brand, c_type, c_type2, c_oil, c_year, c_color, c_price, c_img)
values(car_seq.nextval, '���', 'KIA', '���� SUV', '���� SUV', '���ָ�, ����', '2023', 'WHITE', 350, 'Jcar07.png');

insert into c_car(c_num, c_name, c_brand, c_type, c_type2, c_oil, c_year, c_color, c_price, c_img)
values(car_seq.nextval, 'GV70', '���׽ý�', '���� SUV', '���� SUV', '���ָ�, ����', '2022', 'BLACK', 350, 'Jcar08.png');

insert into c_car(c_num, c_name, c_brand, c_type, c_type2, c_oil, c_year, c_color, c_price, c_img)
values(car_seq.nextval, 'X3', 'BMW', '���� SUV', '���� SUV', '���ָ�, ����', '2022', 'BLACK', 350, 'Jcar09.png');

insert into c_car(c_num, c_name, c_brand, c_type, c_type2, c_oil, c_year, c_color, c_price, c_img)
values(car_seq.nextval, 'SQ5', '�ƿ��', '���� SUV', '���� SUV', '���ָ�', '2021', 'WHITE', 350, 'Jcar10.png');

-- ������
insert into c_car(c_num, c_name, c_brand, c_type, c_type2, c_oil, c_year, c_color, c_price, c_img)
values(car_seq.nextval, '�ڳ� Electric', '����', '���� SUV', '������', '����', '2023', 'RED', 400, 'Icar01.JPG');

insert into c_car(c_num, c_name, c_brand, c_type, c_type2, c_oil, c_year, c_color, c_price, c_img)
values(car_seq.nextval, '���̿���6', '����', '���� ����', '������', '����', '2023', 'GRAY', 400, 'Icar02.JPG');

insert into c_car(c_num, c_name, c_brand, c_type, c_type2, c_oil, c_year, c_color, c_price, c_img)
values(car_seq.nextval, '�Ϸ� EV', 'KIA', '���� SUV', '������', '����', '2024', 'RED', 400, 'Icar03.png');

-- admin���� �߰�
insert into c_member (m_id,m_birth,m_email,m_name,m_phone,m_pwd,m_state,m_tel,regdate)
values('admin01','','','','','admin01',9,'',sysdate);

select * from c_member;
select * from c_car;
select * from c_rental;
select * from c_order_info;
select * from c_service;
select * from c_qna;


commit;