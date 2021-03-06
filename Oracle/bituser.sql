2/*
[1일차 수업]
1. 오라클 소프트웨어 다운로드
https://www.oracle.com/technetwork/database/enterprise-edition/downloads/index.html

2. Oracle Database 11g Release 2 Express Edition for Windows 64

3. Oracle 설치(SYS, SYSTEM 계정의 대한 암호 : 1004)

4. Sqlplus 프로그램 제공(CMD): GUI 환경 일반개발자 사용 불편

5. 별도의 Tool 설치 무료(SqlDeveloper), 유료(토드 , 오렌지, SqlGate)

6. SqlDeveloper 툴을 통해서 Oracle Server 접속 ....
  >> HR 계정 : 암호 1004, Unlock 2가지 사용가능 ....(사원관리 실습 테이블)
  >> 새로운 계정 : bituser
  
  -- USER SQL
CREATE USER bituser IDENTIFIED BY 1004 
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

-- QUOTAS
ALTER USER bituser QUOTA UNLIMITED ON USERS;

-- ROLES
GRANT "CONNECT" TO bituser WITH ADMIN OPTION;
GRANT "RESOURCE" TO bituser WITH ADMIN OPTION;
ALTER USER bituser DEFAULT ROLE "CONNECT","RESOURCE";

-- SYSTEM PRIVILEGES
7. 현재 접속 계정 확인 : show user;  >>  USER이(가) "BITUSER"입니다.

CREATE TABLE EMP
(EMPNO number not null,
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
MGR number ,
HIREDATE date,
SAL number ,
COMM number ,
DEPTNO number );
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,'1980-12-17',800,null,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,200,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,'1981-04-02',2975,30,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,300,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,'1981-04-01',2850,null,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,'1981-06-01',2450,null,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,'1982-10-09',3000,null,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',null,'1981-11-17',5000,3500,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,'1983-01-12',1100,null,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,'1981-10-03',950,null,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,'1981-10-3',3000,null,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,'1982-01-23',1300,null,10);

COMMIT;

CREATE TABLE DEPT
(DEPTNO number,
DNAME VARCHAR2(14),
LOC VARCHAR2(13) );

INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');

COMMIT;



CREATE TABLE SALGRADE
( GRADE number,
LOSAL number,
HISAL number );

INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
COMMIT;

*/
/*
SELECT [DISTINCT] {*, column [alias], . . .}
FROM table_name
[WHERE condition]
[ORDER BY {column, expression} [ASC | DESC]];
*/

select * from emp;

select * from dept;

select * from salgrade;

--1. 사원테이블에서 모든 데이터를 출력하세요
select * from emp; -- 쿼리문장은 대소문자를 구별하지 않습니다
SELECT * FROM DEPT;
select * from salgrade;

--2. 특정 컬럼 데이터 출력하기
select empno, ename, sal from emp;

--3. 컬럼에 가명칭(별칭)(alias) 부여하기
select empno 사번 , ename 이름
from emp;

select empno "사    번" , ename "이    름"
from emp;

--정식(ansi 문법) as를 보면 아하 별칭이구나 !!
select empno as "사    번" , ename as "이    름"
from emp;

-- Oracle 데이터 문자열 (문자열 데이터는 대소문자 구분)
-- 문자열 표기 '문자열'
-- 소문자 : a  대문자 : A 다른 문자 취급
select empno, ename from emp where ename='king';
select empno, ename from emp where ename='KING';
-- 데이터만 '' 이거고, alias는 "" 이겁니다


-- Oracle SQL : 연산자 (결합연산자(||)와 산술연산자(+) 구분)
-- Java : +(숫자 + 숫자 연산)
-- Java : +(문자열 + 문자열 결합)
-- TIP) ms-sql + (연산, 결합)

select '사원의 이름은 ' || ename || ' 입니다' as "사원정보"
from emp;

-- 테이블 칼럼은 기본 타입
-- 컬럼의 타입 숫자, 문자, 날짜 ...

desc emp; -- 테이블의 타입 기본정보를 조회 할 수 있다

select empno || ename -- number || varchar 올래 말이 안되는데 내부적으로 형변환 (숫자 -> 문자)로 바꿔서 결합
from emp;

select empno + ename -- "invalid number" 타입이 맞지 않아서 산술연산은 불가하다
from emp;

-- 사장님 우리 회사에 직종이 몇개나 있나
-- distinct : 중복 데이터 제거
-- distinct 원리 : grouping (중복이되는 얘들을 하나로묶고 출력)
select distinct job from emp;

-- 재미삼아서 ... (group 에 group 의 데이터)
select distinct job, deptno from emp order by job;

select distinct deptno, job from emp order by deptno;

---------------------------------------------------------------------

-- Oracle (SQL 언어)
-- JAVA 언어(연산자)
-- JAVA 거의 동일 ( +, *, - ...) : % 나머지  >> 오라클에선 % 검색 패턴  >> 나머지 구하는 연산자(X) : Mod() 함수

-- 산술연산 (+, *, -, / .....), Mod() 함수 나머지를 구한다
-- 사원 테이블에서 사원의 급여를 100달라 인상한 결과를 출력해보세요
desc emp;
select empno, sal, sal + 100 as "인상급여" from emp;

select 100 + 100 from dual; -- dual 임시 테이블 ...
select 100 || 100 from dual; -- 100100 (형변환)
select '100' + 100 from dual; -- 오라클에서 + 는 무조건 산술 (문자를 숫자로바꿈)
select 'A100' + 100 from dual; -- Error ....

-- 비교 연산자
-- >, <, <=
-- Java 같다 (==) (=)
-- Oracle 같다 (=) 같지 않다 (!=)

-- 논리 연산자
-- AND, OR, NOT

-- 조건절 (원하는 row만 가지고 오겠다)
select * from emp where sal >= 3000;

select empno, ename, sal from emp where sal >= 3000;

-- 이상, 이하 (= 포함)
-- 초과, 미만 (= 포함 아님)

-- 사번이 7788인 사원의 사번, 이름, 직종, 입사일을 출력하세요
-- 실행순서  : 
select * from emp;
select empno, ename, job, hiredate      -- 3
from emp                                -- 1 
where empno = 7788;                     -- 2

-- 사원의 이름이 king 사원의 사번, 이름, 급여정보를 출력하세요
select empno, ename, sal from emp where ename = 'KING';

-- 급여가 2000달러 이상이면서 직종이 manager인 사원의 모든 정보를 출력하세요
-- 두개의 조건을 모두 만족 (둘다 참인)
select * 
from emp 
where sal >=2000 and job = 'MANAGER';

-- 급여가 2000달러 이상이거나 직종이 manager인 사원의 모든 정보를 출력하세요
select * 
from emp
where sal >=2000 or job = 'MANAGER';

-- 오라클 날짜 (DB서버의 날짜)
-- 오라클 날짜 (sysdate)
-- 모든 시스템은 날짜 정보
-- 게시판 글쓰기
-- insert into board(writer, title, content, regdate) values('홍길동', '방가', '배고파요', sysdate);
-- TIP) ms -sql : select getdate();




select sysdate from dual;

alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS'; -- 접속한 session을 기준으로 날짜가 나온다

select hiredate from emp;

-- 오라클 시스템 테이블 ...

select * from SYS.NLS_SESSION_PARAMETERS;
-- NLS_DATE_FORMAT	YYYY-MM-DD HH24:MI:SS
-- NLS_LANGUAGE	KOREAN
-- NLS_TIME_FORMAT	HH24:MI:SSXFF

-- 오라클 날짜 조회 : '2019-12-12'
select * from emp
where hiredate = '1980-12-17';

select * from emp
where hiredate = '1980/12/17';
select * from emp;
select * from emp
where hiredate = '80/12/17'; -- 형식은 인정이 안되요
-- 형식 : RR-MM-DD >> YYYY-MM-DD 로 바꿔놓았기 때문에 조회가 되지 않는다

-- 사원의 급여가 2000 이상이고 4000 이하인 모든 사원의 정보를 출력하세요
select *
from emp
where sal >= 2000 and sal <=4000;
-- 연산자 : between A and B (= 포함)
-- 주의사항 : 미만 초과의 사용 금지

select *
from emp
where sal between 2000 and 4000;

-- 사원의 급여가 2000 이상이고 4000 이하인 모든 사원의 정보를 출력하세요
select *
from emp
where sal > 2000 and sal < 4000;

-- 부서번호가 10번 또는 20번 또는 30번인 사원의 사번, 이름, 급여, 부서번호 출력하세요
select empno, ename, sal, deptno
from emp
where deptno = 10 or deptno = 20 or deptno = 30;
-- IN연산자 (조건 or 조건 or 조건 ...)

select empno, ename, sal, deptno
from emp
where deptno in(10,20,30); -- (오라클 내부적으로는) deptno = 10 or deptno = 20 or deptno = 30;

-- 부서번호가 10번 또는 20번이 아닌 사원의 사번, 이름, 급여, 부서번호 출력하세요

select empno, ename, sal, deptno
from emp
where deptno != 10 and deptno !=20;

-- NOT IN 연산자(부정값 and 부정값 and ...)
select empno, ename, sal, deptno
from emp
where deptno not in(10,20); -- deptno != 10 and deptno != 20;

-- POINT : Oracle 값이 없다 (데이터 없다) >> null
-- null (필요악)

create table member(
  userid varchar2(20) not null, -- 필수 입력 사항 
  name varchar2(20) not null, -- 필수 입력 사항
  hobby varchar2(50)         -- default null (null 값을 허용하겠다)
);

desc member;
select empno, ename, sal, deptno
from emp
where deptno not in(10,20);

select empno, ename, sal, deptno
from emp
where deptno != 10 and deptno !=20;

select empno, ename, sal, deptno
from emp
where deptno != 10 or deptno !=20;

insert into member(userid, hobby) values('hong', '농구'); -- 실행 안됨 (name 컬럼에 데이터를 넣지 않아서)
insert into member(userid, name) values('hong', '홍길동'); -- hobby 컬럼의 데이터는 null 값으로 채워진다
select * from member;
insert into member(userid, name, hobby) values('kim', '김씨', '게임');
select * from member;

-- 실제반영
commit;

-- 수당을 받지 않는 모든 사원의 정보를 출력하세요
-- 0도 데이터 취급(받는 조건 포함)
select *
from emp
where comm = null; -- (X) 안되는거임

-- null 의 비교는 (is null, is not null)
select *
from emp
where comm is null;

-- 수당(comm)을 받는 모든 사원의 정보를 출력하세요
select *
from emp
where comm is not null;

-- 사원테이블에서 사번, 이름, 급여, 수당, 총 급여를 출력하세요
-- 총 급여(급여 + 수당)

select empno, ename, sal, comm, sal + comm as "총 급여"
from emp;

select empno, ename, sal, comm, sal + nvl(comm, 0) as "총 급여" -- comm컬럼에서 null값을 만나면 0으로 바꿔라
from emp;

-- POINT null
-- 1. null 과의 모든 연산은 그 결과가 : null

-- 2. 위 문제 해결 : 함수 nvl(), nv12() >> TIP ms-sql : convert(), my-sql : IFNULL() : null 값 대체 ...

select 1000 + null from dual;

select 1000 + nvl(null, 0) from dual;

select comm, nvl(comm, 11111) from emp;

-- 사원의 급여가 1000 이상이고 수당을 받지않는 사원의 사번, 이름, 직종, 급여, 수당을 출력하세요
select empno, ename, job, sal, comm
from emp
where sal >= 1000 and comm is null;

---------------------------------------------------------
--DQL(data query language): SELECT
--DDL(데이터 정의어) : create, alter, drop ... (객체 생성, 수정,삭제)

--create Board( boardno numbeer ...
-- JAVA: class Board{ private boardno int}

create table Board(
boardid number not null, -- 숫자, 필수입력
title varchar2(20) not null, -- 한글 10자 , 영문자, 특수문자, 공백20자, 필수입력
content varchar2(2000) not null, -- 필수입력
hp varchar2(20) -- default null 허용 필수입력사항이 아닙니다(x)
);

desc Board;

--DML(데이터 조작어)반영 여부에서 결정(실반영(commit),취소(rollback) 반드시 수행
-- insert, update, delete 작업 

insert into board(boardid,title, content)
values(100,'오라클','할만하네');

select *from board;

rollback;
commit;

--begin
insert into board(boardid,title, content)
values(200,'자바','그립다');

insert into board(boardid,title, content)
values(300,'자바2','그립다2');

--commit 둘다반영
-- rollback 둘다 취소 

select * from board;

select boardid, nvl(hp,'EMPTY')as "hp" from board;
-- nvl 함수는 숫자, 날짜, 문자열 모두 적용 가능하다... 

------------------------------------------------------
-- 문자열 검색 
-- 주소검색 검색어 '역삼' -> 역삼단어가 있는 모든 문장이 다나옴 (like 검색)
-- 문자열 패턴 검색 (Like 연산자)
-- like 연산자( 와일드 카드 문자( %: 모든것, _: 한문자) 결합 .... 

select ename
from emp
where ename like '%A%'; --ename 컬럼에 데이터에 A가 들어가있는 모든 이름을 검색하세요 

select ename
from emp
where ename like '%a%'; -- 문자열 데이터 대소문자 엄격히 구분 

select ename 
from emp
where ename like 'A%'; -- 이름의 첫 글자가 A로 시작하는 모든 사람 검색

select ename
from emp
where ename like '%S';

select ename
from emp
where ename like '%LL%';

select ename
from emp
where ename like '%A%A%'; -- 붙어있던 떨어져 있던 A가 두개만 있으면 검색해줌 

select ename
from emp
where ename like '_A%'; -- 첫글자는 어떤것이 와도 상관없고 두번째 글자는 A가 와야함 

-- 오라클 과제( regexp.like) 상세 검색
--select*from emp where regexp_like(ename,'[A-C]');
-- 정규표현식(java -> oracle -> javascript)
-- 과제: 정규표현예제 5개 만들기 
------------------------------------------------------
--데이터 정렬하기 
--order by 컬럼명: 문자, 숫자, 날짜
-- 오름차순: asc: 낮은순 
-- 내림차순: desc : 높은순

select*from emp order by sal; -- default asc
select*from emp order by sal asc;
select*from emp order by sal desc;
select ename from emp order by ename asc; -- 문자열 데이터도 정렬가능

-- 입사일이 가장 늦은 순으로 정렬해서 사번, 이름,급여,입사일 데이터를 출력하세요

select empno, ename, sal, hiredate 
from emp 
order by hiredate desc;

/*
실행순서 
SELECT   3
FROM     1
WHERE    2
ORDER BY 4( select 결과를 정렬)

*/

select empno, ename, sal,job,hiredate
from emp
where job = 'MANAGER'
order by hiredate desc;

--order by 컬럼명 desc, 컬럼명 asc, 컬럼명 desc 
select job, deptno
from emp
order by job asc, deptno desc;

-------------------------------------------------

-- 연산자 
-- 합집합(union): 테이블과 테이블의 데이터를 합치는것(중복값은 배제
-- 합집합(union all ): 중복값 허용

create table uta(name varchar(20));
insert into uta(name) values('AAA');
insert into uta(name) values('BBB');
insert into uta(name) values('CCC');
insert into uta(name) values('DDD');
commit;

select*from uta;

create table ut(name varchar2(20));
insert into ut(name) values('AAA');
insert into ut(name) values('BBB');
insert into ut(name) values('CCC');

commit;

select*from ut;

--union : 중복데이터 제거 
select*from ut
union
select*from uta;


select*from ut
union all
select*from uta;

-- union 규칙
-- 1. 대응되는 컬럼의 타입이 동일 
select empno, ename from emp
union
select dname, deptno from dept;-- 대응되는 타입이 틀리다 , 앞에 있는 집에 뒤에 있는 놈이 놀러감


select empno, ename from emp
union
select deptno, dname from dept;

--실무 >  subquery(in line view) .. tip

select empno,ename
from(
select empno, ename from emp
union
select deptno, dname from dept
)order by empno desc;

---2. 대응되는 컬럼의 개수가 동일해야 한다.(null 착한일)
select empno, ename,job,sal from emp
union
select deptno, dname,loc,null from dept;

----- 초보 개발자가 의무적으로 해야하는 작업(단일 테이블) 대상으로 ... 
-- 오라클 함수 .... 


create table student(

studentNo number,
studentName varchar2(20),
subject varchar2(30),
grade number(10),
phoneNo varchar2(20)

);

insert into student values(993355,'강희영','자료구조',2,'010-1111-1111');
insert into student values(984104,'한국산','정보학개론',3,'050-1234-1234');
insert into student values(004188,'홍길동','디지털논리회로',1,'010-2222-2222');

select* from student where grade >=2;
select*from student;

select* from student where studentNo like '9%';

select distinct 과목 from student where 학년>=3;


-------------------------------------------------------------

----[2일차] 
--- 오라클 함수 

/*
1.2.2 단일 행 함수의 종류
1) 문자형함수:문자를입력받고문자와숫자값모두를RETURN할수있다.
2) 숫자형함수:숫자를입력받고숫자를RETURN한다.
3) 날짜형 함수 : 날짜형에 대해 수행하고 숫자를 RETURN 하는 MONTHS_BETWEEN 함수를
제외하고 모두 날짜 데이터형의 값을 RETURN 한다.
4) 변환형 함수 : 어떤 데이터형의 값을 다른 데이터형으로 변환한다.
5) 일반적인 함수 : NVL, DECODE
*/

-- 문자열 함수 

select initcap('the super man') from dual; -- The Super Man
select lower('AAA'), upper('aaaa')from dual; 
select ename, lower(ename) as "ename" from emp;

select*from emp where lower(ename) ='king';

--문자열 개수 
select length('abcd') from dual; --4개
select length('홍길동') from dual;--3개

select length('홍 a길 동')from dual; --공백도 문자로 취급

--결합연산자 
--concat()

select 'a'||'b'||'c' as "data" from dual;

select concat('a','b')from dual; -- 파라미터 개수에 제한이 없음 

select concat(ename,job) from emp; -- 띄어쓰기가 안됨 
select ename||'   '|| job from emp;

--부분 문자열 추출
--java(substring) 
--oracle(substr)
select substr('ABCDE',2,3) from dual; -- BCD

select substr('ABCDE',1,1) from dual; -- 자기자신: A

select substr('ABCDE',3,1) from dual; --C

select substr('ABCDE',3) from dual; --CDE(3~~~ )

select substr('ABCDE',-2,3) from dual; --DE
select substr('ABCDE',-2,2) from dual; --DE


/*
사원 테이블에서 ename 컬럼 데이터에 대해서 첫글자는 소문자로 나머지는 문자는 대문자로 출력하되 하나의 컬럼으로 출력하세요 .
컬럼의 가명칭은 : fullname
-- 첫글자와 나머지 문자사이에 공백하나를 넣으세요 
*/
select lower(substr(ename,1,1))||' '||upper(substr(ename,2)) as "fullname" from emp;

-- lpad,  rpad (채우기)
 select lpad('ABC',10,'*') from dual;
  select rpad('ABC',10,'*') from dual;
  
  -- 사용자 비번: hong1006
  -- 화면: ho****** 출력하고 싶음 ( 비번이 :1004 -> 10**)
  
  select rpad(substr('1004',1,2),length('1004'),'*')from dual;
  
  --emp 테이블에서 ename 컬럼의 데이터를 출력 첫글자만 출력하고 나머지는 * 로
  
  
select rpad(substr(ename,1,1),length(ename),'*')from emp;

create table member2(
id number,
jumin varchar2(14)
);
insert into member2(id,jumin) values(100,'123456-1234567');
insert into member2(id,jumin) values(200,'123456-1234567');
commit;

select * from member2;


--Quiz
-- 출력결과 
-- 하나의 컬럼으로 출력:
--100: 123456-*******
--200: 234567-*******
-- 컬럼 가명칭 "juminnumber"
select rpad(substr(ename,1,1),length(ename),'*')from emp;

select id ||':'||rpad(substr(jumin,1,7),length(jumin),'*')as "juminnumber" from member2;

--rtrim 함수 
--[오른쪽 문자] 지워라
select rtrim('MILLER', 'ER') from dual; -- MILL
select ltrim('MILLLLLLLLER','MIL')from dual; --ER
select '>' || rtrim('MILLER    ',' ')||'<' from dual; -- >MILLER< 공백제거 

-- 치환함수(replace)

select ename, replace(ename,'A','와우') from emp;


------ 문자열 함수 End -------------
-- [숫자함수]
-- round (반올림 함수)
-- trunc (절삭 함수)
-- 나머지 구하는 함수 (mod())


--- -3 -2 -1 0(정수) 1 2 3 
select round(12.345,0) as "r" from dual; --12  정수 부분만 남겨라 

select round(12.567,0) as "r" from dual; --13 

select round(12.345,1) as "r" from dual; -- 12.3

select round(12.567,1) as "r" from dual; --12.6

select round(12.345,-1) as "r" from dual; --10 

select round(15.345,-1) as "r" from dual;--20

select round(15.345,-2) as "r" from dual;---0 

-- trunc ( 반올림 하지 않고 버려요 ) 


select trunc(12.345,0) as "r" from dual; --12  정수 부분만 남겨라 

select trunc(12.567,0) as "r" from dual; --12 

select trunc(12.345,1) as "r" from dual; -- 12.3

select trunc(12.567,1) as "r" from dual; --12.5

select trunc(12.345,-1) as "r" from dual; --10 

select trunc(15.345,-1) as "r" from dual;--10

select trunc(15.345,-2) as "r" from dual;---0 


--- 나머지 

select 12/10 from dual; --1.2

select mod(12,10) from dual; -- 나머지(2)

select mod(0,0) from dual; --0 

-------------------------------

--날짜 함수 

select sysdate from dual; 
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
-- 날짜 연수(POINT) 
-- Date + number >> Date 
-- Date - Number >> Date 
-- Date - Date >> Number(일수)


select *from SYS.nls_session_parameters;

select hiredate from emp;

select MONTHS_BETWEEN('2018-02-27','2010-02-27') from dual; -- 개월의차 96개월

select round(MONTHS_BETWEEN(sysdate, '2010-01-01'),1) from dual; -- 110.6
select trunc(MONTHS_BETWEEN(sysdate, '2010-01-01'),1) from dual; --  110.6

select to_date('2019-03-20')+ 100 from dual; --2019-06--28 00:00:00

select to_date('2019-03-20')+ 1000 from dual; --2019-06--28 00:00:00

select sysdate +1000 from dual; 

-- 사원 테이블에서 사원들의 입사일에서 현재날짜까지 근속월수를 구하세요 
-- 단 근속월수는 정수부분만 출력하세요

-- 한달이 31이라는 기준에서 근속월수를 구하세요 

select ename, trunc(MONTHS_BETWEEN(sysdate, hiredate),0) as "근속월수" from emp;

select ename, trunc((sysdate-hiredate)/31,0)as "근속월수" from emp;



------------------------------------------------------------

--[변환함수] Today Point
--Oracle: 문자 , 숫자 ,날짜 
-- to_char(): 숫자-> 문자(1000-> $1000), 날짜 -> 문자(2019-03-03 -> 2019년 03월 03일) 형식 (format)
-- to_date(): 문자 -> 날짜 select'2019-03-03' +1000 -> select to_date('2019-03-03')+1000 
-- to_number():문자 -> 숫자(자동 형변환) , 자동형변환이 있어서 활용 빈도는 낮음 

select to_number('100')+100 from dual;


/*
오라클 기본 데이터 타입 
create table 테이블명( 컬러명 타입) 
create table member(age number) -> 1건 insert.. 1000건 

java: class person...>> person p = new person() 1건
      List<person> personlist = new AraayList();
      personlist.add(new person);
Oracle: create person... 

문자타입 
char(20)>> 20Byte >> 한글 10, 영문자, 특수문자 , 공백 20자 : 고정길이 문자열 
varchar2(20)>> 20Byte >> 한글 10자, 영문자 ,특수문자 공백 20자: 가변길이 문자열 

char(20) >> '홍길동'>> 6byte >> 홍길동 20Byte 안에 저장 
varchar2(20) >> '홍길동'>> 데이터 크기만큼 공간 확보 >> 6Byte

고정길이 데이터: 남,여 

char(2) >> 

성능상의 문제) 
char() -> varchar() 검색 우선 

결국 문제는 한글 ... 
unicode(2byte) : 한글, 영문자, 특수문자, 공백 >> 2Byte

nchar(20) >> 20글자 >>20개 2*20 40Byte 
nvarchar(30) >> 30 글자 .... 


*/
--1. to_number: 문자를 숫자로 
select '1'+1 from dual;

select to_number('1') +1 from dual;

--2. to_char(): 숫자 -> 형식문자, 날짜 -> 형식문자.. 

select sysdate ||'일'from dual;

select to_char(sysdate) ||'일'from dual;

select sysdate, to_char(sysdate,'YYYY')||'년' as "YYYY",
to_char(sysdate,'YYYY'),
to_char(sysdate,'MM'),
to_char(sysdate,'DD'),
to_char(sysdate,'DAY'),
to_char(sysdate,'DY'),
to_char(sysdate,'YY')

from dual;

-- 입사일이 12월인 사원들의 사번 이름 입사일 입사년도 입사월을 출력하세요

select empno, ename, to_char(hiredate,'DD'), to_char(hiredate,'YYYY')as "YYYY", to_char(hiredate,'MM') as"MM"
from emp 
where to_char(hiredate,'MM')= '12';

select to_char(hiredate,'YYYY MM DD')from emp;
select to_char(hiredate,'YYYY"년" MM"월" DD"일"')from emp;


-----------------------------------------------------

--to_char(): 숫자 -> 형식문자 
-- 1000000 -> $1,000,000,000 ( 문자형태로)
-- 표 오라클.pdf 71page

select '>'|| to_char(12345,'99999999')||'<' from dual;
select '>'|| to_char(12345,'099999999')||'<' from dual;
---> 000000012345

select '>'|| to_char(12345,'$9,999,999,999')||'<' from dual;



select sal, to_char(sal,'$999,999')from emp;

------------------------------------------------
--to_date() 문자를 -> 날짜로 

select'2019-03-03' + 100 from dual;
select to_date('2019-03-03') +100 from dual;
---------------------------------------------------

---일반함수(프로그램적인 성격이 강한 함수)
---nvl(), nvl2()>> null 처리 함수 
---decode() 함수 >> java if 문
-- case() 함수 >> java switch 문

select comm,NVL(comm,0) from emp;

create table t_emp(
  id number(6),
  job varchar2(20)
  );
  
  select*from t_emp;
  Insert into t_emp(id,job) values(100,'IT');
  Insert into t_emp(id,job) values(200,'SALES');
  Insert into t_emp(id,job) values(300,'MGR'); 
  Insert into t_emp(id) values(400);
  Insert into t_emp(id,job) values(500,'MGR');
  
  commit;
  
--1.nvl 
select id, job, nvl(job,'empty....')as "job" from t_emp;

--2.nvl2 >> null이 아닌경우와 null인 경우를 모두를 처리 
select id,job, nvl2(job, job||'입니다','empty') from t_emp;

select id,job, nvl2(job, 'AAA','BBB') from t_emp;

--3.decode point(통계 데이터:if, switch)
--decode(표현식, 조건1,결과1, 조건2,결과2, 조건3, 결과3...)

select id, job, 
                   decode(id,100,'IT...',
                          200,'SALES...',
                          300,'MGR...',
                          'ETC...')as"decodejob"
                          from t_emp;

select job, decode(job,'IT',1) from t_emp;

select count(decode(job,'IT',1)) as "IT",
count(decode(job,'SALES',1)) as "SALES",
count(decode(job,'MGR',1)) as "MGR"
from t_emp;


-- emp 테이블에서 부서번호가 10이면 인사부 , 20이면 관리부 30 이면 회계부 나머지 부서는 기타부서라고 출력되는 쿼리문

select *from emp;


select deptno, decode(deptno,10,'인사부',
                20,'관리부',
                30,'회계부', 
                '기타부서') 
                from emp;


create table t_emp2(
id number(2),
jumin char(7)
);

insert into t_emp2(id,jumin) values(1,'1234567');
insert into t_emp2(id,jumin) values(2,'2234567');
insert into t_emp2(id,jumin) values(3,'3234567');
insert into t_emp2(id,jumin) values(4,'4234567');
insert into t_emp2(id,jumin) values(5,'5234567');
commit;

select * from t_emp2;
-- t_emp2 테이블에서 id, jumin 데이터를 출력하되 jumin 컬럼의 앞자리가 1이면 '남성'출력 2이면 '여성'출력 3이면 '중성' 그외는 '기타'
   -- 컬럼명은 성별 
   

select  jumin, decode(substr(jumin,1,1),1,'남성',
                2,'여성',
                3,'중성',
                '기타') as "성별"
                from t_emp2;

/*
부서번호가 20번인 사원중에 스미스 라는 이름은 가진 사원이라면 헬로 문자 출력 
부서번호가 20번인 사원중에 스미스라는 이름을 가진 사원이 아니라면 월드 문자출력
부서번호가 20번인 사원이 아니라면 기타 문자 출력 

*/

select *from emp;
select deptno, ename, decode(deptno , 20, decode(ename,'SMITH','HELLO','WORLD'),'ETC')from emp;

--case문 
--java : switch
/*
  case 조건식 when 결과1 then 출력 1
            when 결과2 then 출력 2
            when 결과3 then 출력 3
            else 출력 4
            end "컬럼명 
            
*/

create table t_zip(
   zipcode number(10)
   );
   
   insert into t_zip(zipcode) values(2);
    insert into t_zip(zipcode) values(31);
    insert into t_zip(zipcode) values(32);
    insert into t_zip(zipcode) values(33);
     insert into t_zip(zipcode) values(41);
     commit;
     
     select *from t_zip;
     
   select '0' || to_char(zipcode) as"지역번호",  
       case zipcode when 2 then '서울'
                         when 31 then '경기'
                         when 32 then '강원'
                        when 41 then '제주'
                        else '기타지역'
                  end "regionname"
                  from t_zip; 
 /*
사원 테이블에서 사원급여가 1000달라 이하면 '4급'
1001달러 2000달러 이하면 '3급'
2001달러 3000달러 이하면 '2급'
3001달러 4000달러 이하면 '1급'
4001달라 이상이면 '특급'
*/ 
-- 1. case 컬럼명 when 결과 tehn 출력 (=) 조건
-- 2. case when 컬럼명 조건 비교식 then
select sal ,case when sal<=1000 then '4급' 
         when sal between 1001 and 2000 then '3급' 
         when sal between 2001 and 3000 then '2급' 
         when sal between 3001 and 4000 then '1급' 
         else '특급'
         end "급여등급"
         
         from emp;
         
         select sal ,case when sal<=1000 then '4급' 
         when sal >=1001 and sal <=2000 then '3급' 
         when sal between 2001 and 3000 then '2급' 
         when sal between 3001 and 4000 then '1급' 
         else '특급'
         end "급여등급"
         
         from emp;
         -- 문자함수
         -- 숫자함수 
         -- 날짜함수 
         -- 변환함수(to_char(), to_date(), to_number())
         -- 일반함수(nvl(), decode(), case()....) 
         
    --집계 함수 -- 
    --1. count(*) > row 수, count(컬럼명) >> 데이터 건수 (null 을 포함하지 않는다 )
    --2. sum()
    --3. avg()
    --4. max()
    --5. min()
    --등등 
    
    /*
    1. 집계함수는 group by  절과 같이 사용 
    2. 모든 집계 함수는 null 값을 무시 
    3. select 절에 집계함수 이외에 다른 컬럼이 오면 반드시 그 컬럼은 group by 절에 명시되어야한다 
    */
     select * from emp;
    select count(*) from emp;
    select count(comm) from emp; --6건(null값을 무시)
    select count(empno)from emp;
    
    -- select count(comm)from emp; 데이터가 14건 출력 하게 .. 
    select count (nvl(comm,0)) from emp;
    
    select sum(sal) as"급여의 합" from emp; --29025
    
    --평균 급여 
    select round(avg(sal),0) as"평균 급여" from emp;--2073
    
    --사장님이 회사 총수당이 얼마나 지급 되나 ... 
    
     select trunc(avg(comm),0) from emp; --721 
     select trunc(sum(comm)/6,0) from emp;--721
    
    select sum(comm)from emp; --4330
    select trunc(sum(comm)/14,0)from emp ; --309
   -- 회사의 규정이 ( 전체 사원수로 나눈다... 309
   --- 회사의 규정이( 받는 사원수 나눈다.. 721
   
    select trunc(avg((nvl(comm,0))),0) from emp;
    
    select count(*)from emp where comm is null; -- 데이터 처리 null 검증 처리
    
     desc emp;
    
    select max(sal) from emp;
    
    select min(sal)  from emp;
    
    
    
    select empno, count(empno) from emp; --(x) empno 14건 , count 는 1건
    
    select sum(sal), avg(sal), max(sal), count(sal), count(*) from emp;
    
    
    
    -- 부서별 평균 급여를 구하세요 
    select deptno,avg(sal)
    from emp
    group by deptno;
    
    -- 직종별 평균 급여를 구하세요 .
    
    select job, avg(sal)
    from emp
    group by job;
    -- 직종별 평균급여 급여합 최대급여 최소급여 건수를 출력하세요 
    
    
    
    select  job, avg(sal), max(sal),min(sal), count(sal)
    from emp 
    group by job;
    
 -- grouping 원리 
 /*
 distinct 컬럼명1, 컬럼명2 
 order by 컬럼명1, 컬럼명2
 group by 컬럼명1, 컬럼명2
 */
 
 
 -- 부서별, 직종별 급여의 합을 구하세요 
 select deptno, job, sum(sal), count(sal)
 from emp
 group by deptno, job
 order by deptno;
 
 /*
 select 5
 from 1 
 where2
 group by 3 
 having 4
 order by 6
 
 */
 
 -- 직종별 평균급여가 3000달러 이상인 사원의 직종과 평균급여를 출력하세요. 
 select * from emp;
 
 select job, avg(sal) 
 from emp 
 -- where 가 순서상 group by 우선 ... 
 --where avg(sal) >3000 
 group by job 
 having avg(sal)>=3000;
 
 /*
 from 의 조건절 where 
 group by 조건절 having
 */
 
 /*
 select 5
 from 1 
 where2
 group by 3 
 having 4
 order by 6
 
 */
 
     
/*
1. 사원테이블에서 직종별 급여합을 출력하되 수당은 지급받고 급여의 합이 5000 이상인 사원들의 목록을 출력하세요 
-- 급여의 합은 낮은 순으로 출력하세요 



2. 사원테이블에서 부서 인원이 4명보다 많은 부서의 부서번호 인원수 급여의 합을 출력하세요 



3. 사원테이블에서 직종별 급여의 합이 5000를 초과하는 직종과 급여의 합을 출력하세요
단 판매직종(salesman)은 제외하고 급여합으로 내림차순 정렬하세요


*/



select * from emp;

 select job, sum(sal) 
 from emp 
 where comm is not null
 group by job 
 having sum(sal)>=5000
 order by sum(sal) asc;
 
 select deptno,count(*),sum(sal) 
 from emp
 group by deptno
 having count(*) >4;
 
 
--사원테이블에서 직종별 급여의 합이 5000를 초과하는 직종과 급여의 합을 출력하세요
--단 판매직종(salesman)은 제외하고 급여합으로 내림차순 정렬하세요
 select job, sum(sal)
 from emp
 where job != 'SALESMAN'
 group by job 
 having sum(sal)>5000
 order by sum(sal) desc;
 
create table student3(
 name varchar2(20) not null,
 age number not null,
 phone number(30),
 birthday date not null
);
insert into student3 (name, age, phone, birthday) values ('김민지', 16, 01012341234, '2004-08-04');
insert into student3 (name, age, phone, birthday) values ('강소심', 15, 01023456789, '2004-01-04');
insert into student3 (name, age, phone, birthday) values ('김나나', 15, 01034567890, '2005-01-02');
insert into student3 (name, age, phone, birthday) values ('장윤지', 15, 01056789012, '2005-01-17');
insert into student3 (name, age, birthday) values ('홍래경', 15, '2005-07-04');
insert into student3 (name, age, birthday) values ('문소진', 15, '2005-11-04');
insert into student3 (name, age, phone, birthday) values ('김지석', 14, 01067890123, '2006-01-01');
insert into student3 (name, age, phone, birthday) values ('김나나', 14, 01078901234, '2006-06-06');
insert into student3 (name, age, phone, birthday) values ('장석규', 14, 01089012345, '2006-05-04');
insert into student3 (name, age, phone, birthday) values ('김민지', 16, 01012341234, '2004-08-04');
/*
문제1)
-전체 테이블을 name 오름차순으로 출력하세요.
-name칼럼을 ‘학생 이름‘으로 바꾸세요
-학생테이블에서 학생들에 나이에 10씩 더해서 출력하세요.
*/
select * from student3;

select name as "학생이름", age +10 , phone, birthday from student3 order by name asc;











--문제2)
---성이 김씨거나, 장씨, 문씨인 학생들을 출력하고, 이름 앞에 나이, 이름 뒤에 ‘착한 학생’이라는 단어를 붙이세요. (or 사용, 정규표현식 사용)

select * from student3;

select age ||name || '착한 학생' 
from student3 
where name like '김%' or name like '장%'or name like '문%';


--문제3)
---이름과 나이가 중복되는 값이 없게 나이과 이름을 내림차순으로 출력하세요. (로우중복이 안되면 된다)

select distinct age, name 
from student3
order by age, name desc;


--문제4)
---dual 테이블에서 2000 /3의 나머지를 출력하세요

select mod(2000,3) from dual;


--문제5)
--- 생일이 2005년도~2006년에 태어난 학생들을 출력하세요. (번호없는 학생은 ‘0’으로 같이 출력되게..)
select name, age, nvl(phone,0),birthday
from student3
where birthday between to_date('05/01/01') and to_date('06/12/31'); 

---------------------------------------------------

--[JOIN] 다중 테이블로부터 데이터 검색 
--- oracle.pdf
--조인 실습 테이블 구성하기--
create table M (M1 char(6) , M2 char(10));
create table S (S1 char(6) , S2 char(10));
create table X (X1 char(6) , X2 char(10));

insert into M values('A','1');
insert into M values('B','1');
insert into M values('C','3');
insert into M values(null,'3');
commit;

insert into S values('A','X');
insert into S values('B','Y');
insert into S values(null,'Z');
commit;

insert into X values('A','DATA');
commit;

select * from m;
select * from s;
select * from x;

-- 종류 
--1. 등가조인(equi join) 70%
-- 원테이블과 대응되는 테이블에 있는 컬럼의 데이터를 1:1 맵핑 
-- SQL JOIN 문법
-- ANSI 문법(권장) [inner] join on ~ 조건절 

--SQL JOIN
select * 
from m,s
where m.m1 =s.s1;


select m.m1, m.m2, s.s2
from m,s
where m.m1 =s.s1;


---ANSI 문법(권장
-- where(from 절의 조건절
-- where Join 조건절로 사용(어떤것이 JOIN 조건이고 어떤것이 FROM 절의 조건절인지 혼동)
-- ANSI JOIN의 조건절은 ON 표기 
select*
from m inner join s
on m.m1 = s.s1;

select m.m1, s.s1, s.s2
from m join s  -- inner 는 생략 가능 
on m.m1 = s.s1;


select m.m2, x.x1, x.x2
from  m join x 
on m.m1 = x.x1;

--사원번호, 사원이름, 사원 부서번호, 사원 부서명을 알고싶어요.
select emp.empno, emp.ename, emp.deptno, dept.dname
from emp join dept
on emp.deptno = dept.deptno;

--JOIN에서 테이블에 별칭부여... 
select e.empno, e.ename, d.deptno, d.dname
from emp e join dept d
on e.deptno = d.deptno;

--SQL JOIN 문법(3개 테이블 조인)
select*
from m,s,x
where m.m1 = s.s1 and x.x1 = s.s1;
-- A = B, B=C >> A =C

--ANSI JOIN 문법
select m.m1, s.s2, x.x2
from m join s on m.m1 =s.s1
join x on x.x1 = s.s1;

select * from employees;
select * from departments;
select * from locations;
 
 
 --1. 사번, 이름(last_name), 부서번호, 부서이름을 출력하세요 .
 
 select e.employee_id,e.last_name,e.department_id,d.dept_name
 from employees e join departments d on
 e.department_id = d.department_id;


-- 문제점:
  select count(*) from employees; --107명 
  -- 위 join 쿼리의 결과는:106 명 (누군가는 누락..)
  -- 등가조인으로 해결불가. outer Join으로 해결

--2. 사번, 이름 , 부서번호, 부서명, 지역코드, 도시명 출력 


select e.employee_id,e.last_name,e.department_id,d.department_name,l.location_id, l.city
 from employees e join departments d on e.department_id = d.department_id
                  join locations l on d.location_id = l.location_id;
                  
------------------------------------------------
-- 2. 비등가조인(non -euqi join) => 문법 등가조인 
   -- 원테이블과 대응되는 테이블에 있는 컬럼이 1:1 매핑이 되지 않는경우 
     --ex) emp, salgrade 급여등급( emp:sal >> salgrade losal, hisal 2개 비교 
     
     
     select*from emp;
     select*from salgrade;
     
     select e.empno, e.ename, e.sal, s.grade
     from emp e join salgrade s
     on e.sal between s.losal and s.hisal; --on조건절
     
     ------------------------------------------------
     --3.outer join(equi join + null)
     -- outer join(주종관계 파악) >> 주가 되는 테이블의 데이터를 가져오는 방법 (equi join하고 남는 데이터)
     -- 문법) left outer join( 왼쪽주)
     --    right outer join(오른쪽주)
     -- full outer join(left,right join>> union)
     
     select*
     from m join s
     on m.m1 =s.s1;
     
     select*
     from m left join s
     on m.m1 =s.s1;
     
     select*
     from m right join s
     on m.m1 =s.s1;
     
     select*
     from m full outer join s
     on m.m1 =s.s1;
     -------------- HR  계정으로 이동 -------------
     select count(*) from employees;
     select e.employee_id,e.last_name,e.department_id,d.department_name,l.location_id, l.city
 from employees e left outer join departments d on e.department_id = d.department_id
                  join locations l on d.location_id = l.location_id; 
                  
                  
                  select e.employee_id, e.last_name, e.department_id, d.department_name
from employees e left outer join departments d
on e.department_id = d.department_id
order by e.employee_id asc;
     
     select * from employees where department_id is null;
     -- grant >> department_id null 가지고 있다 
     
    ---------------------------------
    --- self join(자기 참조) -> 문법 -> 등가조인 
    -- 하나의 테이블에서 특정컬럼이 다른컬럼을 참조하는 경우 
    
    select * from emp;
    
    --- 문제점: 테이블이 하나... >> 가명칭 >> 테이블 여러개 처럼 사용 가능 ... 
    
    
    ---- null>> outer join >> null 데이터 확인은 의무적으로 해야함. 
    select e.empno, e.ename , m.empno,m.ename
    from emp e left join emp m
    on e.mgr = m.empno;
    
    
    select * 
    from m,s;
-------------------------------------------------------------------
-- 1. 사원들의 이름, 부서번호, 부서이름을 출력하라.

    

    select e.ename, e.deptno, d.dname
    from emp e join dept d 
    on e.deptno = d. deptno;



 
-- 2. DALLAS에서 근무하는 사원의 이름, 직위, 부서번호, 부서이름을
-- 출력하라.

  
    
    
select e.ename, e.job, d.dname, e.deptno
    from emp e join dept d 
    on e.deptno = d. deptno
    where d.loc = 'DALLAS';



 
-- 3. 이름에 'A'가 들어가는 사원들의 이름과 부서이름을 출력하라.

 select * from emp;
    select * from dept;
      
  select e.ename, d.dname
    from emp e join dept d 
    on e.deptno = d. deptno
    where e.ename like '%A%';



-- 4. 사원이름과 그 사원이 속한 부서의 부서명, 그리고 월급을
--출력하는데 월급이 3000이상인 사원을 출력하라.

 select * from emp;
    select * from dept;

select e.ename, d.dname, e.sal
    from emp e join dept d 
    on e.deptno = d. deptno
    where e.sal >= 3000;




 
-- 5. 직위(직종)가 'SALESMAN'인 사원들의 직위와 그 사원이름, 그리고
-- 그 사원이 속한 부서 이름을 출력하라

select * from emp;
    select * from dept;

select e.ename, d.dname, e.job
    from emp e join dept d 
    on e.deptno = d. deptno
    where e.job = 'SALESMAN';



 
-- 6. 커미션이 책정된 사원들의 사원번호, 이름, 연봉, 연봉+커미션,
-- 급여등급을 출력하되, 각각의 컬럼명을 '사원번호', '사원이름',
-- '연봉','실급여', '급여등급'으로 하여 출력하라.
--(비등가 ) 1 : 1 매핑 대는 컬럼이 없다

select * from emp;
    select * from dept;
    select * from salgrade;

select e.empno, e.ename, e.sal*12,e.sal*12+e.comm,s.grade
    from emp e
    join salgrade s on e.sal between s.losal and s.hisal;
    

 
-- 7. 부서번호가 10번인 사원들의 부서번호, 부서이름, 사원이름,
-- 월급, 급여등급을 출력하라.
    select * from emp;
    select * from dept;
    select * from salgrade;
    
    select e.deptno,d.dname, e.ename, e.sal,s.grade
    from emp e
    join salgrade s on e.sal between s.losal and s.hisal
    join dept d on e.deptno = d.deptno
    where e.deptno = '10';
    
    
    
 
 
-- 8. 부서번호가 10번, 20번인 사원들의 부서번호, 부서이름,
-- 사원이름, 월급, 급여등급을 출력하라. 그리고 그 출력된
-- 결과물을 부서번호가 낮은 순으로, 월급이 높은 순으로
-- 정렬하라.
     select * from emp;
    select * from dept;
    select * from salgrade;
    
    select e.deptno,d.dname, e.ename, e.sal,s.grade
    from emp e
    join salgrade s on e.sal between s.losal and s.hisal
    join dept d on e.deptno = d.deptno
    where e.deptno = '10' or e.deptno = '20'
    order by e.deptno asc, e.sal desc;
    


 
 
 
-- 9. 사원번호와 사원이름, 그리고 그 사원을 관리하는 관리자의
-- 사원번호와 사원이름을 출력하되 각각의 컬럼명을 '사원번호',
-- '사원이름', '관리자번호', '관리자이름'으로 하여 출력하라.
--SELF JOIN (자기 자신테이블의 컬럼을 참조 하는 경우)
   select * from emp;
    select * from dept;
    select * from salgrade;
    
    select  e.empno as "사원번호" , e.ename as"사원이름", d.empno as "관리자번호", d.ename as"관리자이름"
    from emp e left join emp d
     on e.mgr = d.empno;
   
 
    
           select  ename, mgr from emp;        
           
---------------------------
-- subquery 오라클.pdf 100page
-- sql 의 꽃이다 .. sql 만능해결사

--- 함수 >> 조인 >> subquery
-- 사원테이블에서 사원들의 평균 월급보다 더많은 급여를 받는 사원의 사번, 이름, 급여를 출력하세요.

select avg(sal) from emp; -- 2073

select*
from emp where sal >2073;

select*
from emp 
where sal > (select avg(sal) from emp);-- subquery... 

--subquery
--1.single row subquery: subquery 의 결과가 1개의 row(단일값) : 한개의 값 (단일컬럼)
--2.multi row subquery: subquery 의 결과가 1개 이상의 row : 여러개의 값 (단일컬럼)
-- 구분하는 이유는 사용되는 연산자의 차이 
-- multi fow(IN,NOT IN)(ANY,ALL)
--ALL: sal> 1000 and sal>2000 and.... 
--ANY: sal >1000 or sal>2000 or .... 

--정의(subquery)
--1. 괄호 안에 있어야 한다(select avg(sal) from emp)
--2. 단일 컬럼으로 구성 >>(select sal, deptno from emp>> (x) 단일 컬럼이 아니다.
--3. 단독으로 실행이 가능해야 한다 

--실행순서 
--1.subquery 먼저 실행 
--2.subquery 의 결과를 가지고 main query 실행

-- 사원테이블에서 jones의 급여보다 더 많은 급여를 받는 사원의 사번, 이름, 급여를 출력하세요 

select sal from emp where ename ='JONES';

select empno, ename,sal
from emp
where sal> (select sal from emp where ename ='JONES'); -- single fow 

--급여가 2000이상인...
select sal from emp where sal >2000; --결과 row 1개이상...

select*
from emp;
--where sal = (select sal from emp where sal >2000);(x)

select*
from emp
where sal in (select sal from emp where sal >2000); -- multi row
--sal  =2001 or sal = 3000 or....

select*
from emp
where sal not in(select sal from emp where sal >2000);
--sal ! = 2001 sal != 3000 and....


--부하직원이 있는 사원의 사번과 이름을 출력하세요.

select empno, ename
from emp
where empno in( select mgr from emp);
--empno =7902 or empno = 7698 or empno =7839 or empno is null
           
-- 부하직원이 없는 사원의 사번과 이름을 출력하세요       (not in>> != and >> null 영향)    
select empno, ename 
from emp
where empno not in( select nvl(mgr,0)from emp);
 -- empno != 7902 and empno!= 7698 and empno is not null          
           
--king에게 보고하는 즉 직속상관이 king 인 사원의 사번, 이름, 직종, 관리자 사번을 출력하세요 ..

select empno, ename, job, mgr
from emp
where mgr=(select empno from emp where ename ='KING');
           
--20 번 부서의 사원중에서 가장 많은 급여를 받는 사원보다 더많은 급여를 받는 사원의 사번, 이름, 급여, 부서번호를 출력하세요.

select empno, ename, sal, deptno
from emp
where sal > (select max(sal) from emp where deptno = 20);


------ 
select*
from emp
where deptno in(select deptno from emp where job = 'SALESMAN')
and sal in (select sal from emp where job = 'SALESMAN');



---quiz
-- 자기부서에 평균 월급보다 더 많은 월급을 받는 사원의 사번 이름 부서번호 부서별 평균 월급을 구하세요 .


select deptno, round(avg(sal),0) as avgsal from emp group by deptno;

select e.empno, e.ename, e.deptno, e.sal,s.avgsal
from emp e join(select deptno, round(avg(sal),0) as avgsal from emp group by deptno) s
on e.deptno = s.deptno
where e.sal>s.avgsal;

--in(select sal from emp);


--1. 'SMITH'보다 월급을 많이 받는 사원들의 이름과 월급을 출력하라.

    select ename, sal from emp where sal >(select sal from emp where ename = 'SMITH');
 
 
 
 
--2. 10번 부서의 사원들과 같은 월급을 받는 사원들의 이름, 월급,
-- 부서번호를 출력하라.
   select ename, sal, deptno
   from emp
   where sal in( select sal from emp where deptno = 10);





 
--3. 'BLAKE'와 같은 부서에 있는 사원들의 이름과 고용일을 뽑는데
-- 'BLAKE'는 빼고 출력하라.

  select ename, hiredate 
  from emp
  where ename != 'BLAKE' and deptno in(select deptno from emp where ename = 'BLAKE');
    




--4. 평균급여보다 많은 급여를 받는 사원들의 사원번호, 이름, 월급을
-- 출력하되, 월급이 높은 사람 순으로 출력하라.

    
    
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL>(SELECT  AVG(SAL)  FROM EMP)
ORDER BY SAL DESC;

 
--5. 이름에 'T'를 포함하고 있는 사원들과 같은 부서에서 근무하고
-- 있는 사원의 사원번호와 이름을 출력하라.

     select empno, ename 
     from emp
     where deptno in(select deptno from emp where ename like '%T%');
     
     





--6. 30번 부서에 있는 사원들 중에서 가장 많은 월급을 받는 사원보다
-- 많은 월급을 받는 사원들의 이름, 부서번호, 월급을 출력하라.
--(단, ALL(and) 또는 ANY(or) 연산자를 사용할 것)

  select ename, deptno, sal 
  from emp
  where sal >( select max(sal) from emp where deptno = 30);
  
  

 
 
--7. 'DALLAS'에서 근무하고 있는 사원과 같은 부서에서 일하는 사원의
-- 이름, 부서번호, 직업을 출력하라.
   
   
   select e.ename, e.deptno, e.job
   from emp e join dept d 
   on e.deptno = d.deptno
   where d.loc = 'DALLAS';


--8. SALES 부서에서 일하는 사원들의 부서번호, 이름, 직업을 출력하라.

    select e.deptno, e.ename, e.job
    from emp e join dept d
    on e.deptno = d.deptno
    where d.dname = 'SALES';


 
--9. 'KING'에게 보고하는 모든 사원의 이름과 급여를 출력하라
--king 이 사수인 사람 (mgr 데이터가 king 사번)
    
    
    select ename, sal 
    from emp 
    where mgr= (select empno from emp where ename = 'KING');
    
    


 
--10. 자신의 급여가 평균 급여보다 많고, 이름에 'S'가 들어가는
-- 사원과 동일한 부서에서 근무하는 모든 사원의 사원번호, 이름,
-- 급여를 출력하라.
    
   select empno, ename, sal 
   from emp
   where sal >(select round(avg(sal),0) as salavg from emp) and deptno in (select deptno from emp where ename like '%S%');
    


 
--11. 커미션을 받는 사원과 부서번호, 월급이 같은 사원의
-- 이름, 월급, 부서번호를 출력하라.
  
 select ename, sal , deptno 
 from emp
 where deptno in(select deptno from emp where comm is not null) and sal in(select sal from emp where comm is not null);
 
 
 



--12. 30번 부서 사원들의 월급과 커미션이 같지 않은
-- 사원들의 이름, 월급, 커미션을 출력하라.

select ename, sal, comm
from emp 
where sal not in ( select sal from emp where deptno = 30) and comm not in ( select nvl(comm,0) from emp where deptno = 30 and comm is not null);


----------------------------
--[INSERT] , [UPDATE] , [DELETE]
/*
오라클 기준 
DDL(데이터 정의어): create, alter, drop, trncate(rename, modify)
DML(데이터 조작어: insert, update, delete
DQL(데이터 질의어: select
DCL(데이터 제어어: 권한(grant, revoke)
TCL(트랜잭션): commit, rollback savepoint



DML( 트랜잭션: 하나의 논리적인 작업단위)
A 은행에서 출금 B라는 은행입금(하나의 논리적인 단위)
A 라는 계좌(100) 출금: update...

B라는 계좌(100) 입금 | update...

둘다 성공: commit
둘중에 하나라도 실패: rollback


테이블 정보보기           
*/                
desc emp;

select * from tab; -- 사용자가 만든(계정 테이블 목록 출력)

select* from tab where tname = 'BOARD'; --데이터가 있다는 것은 이미 존재

select* from col;

select * from col where tname = 'EMP';
select*from user_tables; -- 시스템관리자 

select*from user_tables where table_name='DEPT';
----------------------------------------------------
--DML( 오라클.pdf 168 page)

/*
INSERT INTO table_name [(column1[, column2, . . . . . ])] 
VALUES (value1[, value2, . . . . . . ]);
*/

create table temp(
id number primary key, -- id 컬럼에는 null(x), 중복데이터(x),유일한 데이터 1건 보장, where id =10
name varchar2(20) -- default null 허용
);
--1. 가장 일반적인 INSERT 
insert into temp(id, name)
values(100,'홍길동');

select*from temp;
-- 실반영
commit;

--2. 컬럼 목록 생략(...) 컬럼 리스트는 생략이 가능 
insert into temp values(200,'김유신');
commit;
select*from temp;


--1.문제(id 컬럼에 PK 제약 정보)
insert into temp(id,name)
values(100,'아무개');

insert into temp(name)
values('아무개');

------------------------
-- 일반 SQL은 프로그램적인 요소(X)
--PL- SQL(변수, 제어문) 

--pl-sql
create table temp2( id varchar2(20));


--pl-sql사용
/*
BEGIN
 FOR i IN 1..1000 LOOP
 insert into temp2(id) values('A'||to_char(i));
 END LOOP;
END;
*/
select*from temp2;

select*from temp2 order by id desc;

------------------------------------


create table temp3(
 memberid number(3) not null,
 name varchar2(10), --null 허용 
 regdate date default sysdate -- 기본값 설정하기( regdate을 insert 하지 않으면 자동으로 시스템날짜가 들어감)
 );

select sysdate from dual;
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

insert into temp3(memberid,name,regdate)
values(100,'홍길동','2019-03-21');

commit;
rollback;
insert into temp3(memberid, name)
values(200,'아무개'); -- regdate date default sysdate

select * from temp3;

insert into temp3(memberid)
values(300);

select *from temp3;

commit;

insert into temp3(name)--cannot insert NULL into
values('아무개'); -- (x)


------------------------------------------------------


--1. 직책(Job Title)이 Sales Manager인 사원들의 입사년도와 입사년도(hire_date)별 평균 급여를 출력하시오. 
--   출력 시 년도를 기준으로 오름차순 정렬하시오. 

select * from employees;
select * from jobs;

select to_char(e.hire_date,'YYYY') , avg(e.salary)
from employees e join jobs j on e.job_id = j.job_id 
where j.job_title = 'Sales Manager'
group by to_char(e.hire_date,'YYYY')
order by to_char(e.hire_date,'YYYY') asc;

------------------------------------------

---- insert(TIP)

--1.대량의 데이터 insert하기 

create table temp4 (id number);
create table temp5 (num number);


insert into temp4(id) values(1);
insert into temp4(id) values(2);
insert into temp4(id) values(3);
insert into temp4(id) values(4);
insert into temp4(id) values(5);
insert into temp4(id) values(6);
insert into temp4(id) values(7);
insert into temp4(id) values(8);
insert into temp4(id) values(9);
insert into temp4(id) values(10);
commit;
select * from temp4;

--요구사항: temp4에 있는 있는 모든데이터를 temp5에 넣고 싶어요.
--insert into 테이블명(컬럼리스트) values(값리스트) 
--insert into 테이블명(컬럼리스트) select 구문... (단 컬럼의 개수와 타입이 동일)

insert into temp5(num)
select id from temp4; -- values 구문 대신에 select 문 

select * from temp5;
commit;

--2 insert
-- 테이블이 없는 상황에서 [테이블을 생성] + [대량 데이터 삽입]
-- 단 복사개념 (제약 정보는 복사 안되요 (PK, FK))
-- 순수한 구조정보 (컬럼이름, 타입) 만 복사가 가능하다
-- create table 테이블명 (컬럼명 타입정보)
create table copyemp
as 
select * from emp; -- emp 테이블에 있는 모든 틀을 복사한다 (데이터포함)
select * from copyemp;

create table copyemp2
as
 select empno, ename, sal
 from emp
 where deptno=30;
 
 select *from copyemp2;
 
 --질문) 구조(들) 만 복사하고 데이터는 복사하고 싶지 않아요 .. 
 create table copyemp3
 as
   select*from emp where 1=2;
 
 select*from copyemp3;
 desc copyemp3;
 
 --TIP) 
 --오라클 시스템 테이블(다양한 정보)
 --제약 정보( PK, FK....) 
 select*from user_constraints where table_name='EMP';
 select*from user_constraints where table_name='COPYEMP';
 
 create table pktest(id number primary key); -- not null 하고 unique

select*from user_constraints where table_name= 'PKTEST';
insert into pktest(id)values(100);
commit;

--제약정보는 복사되지 않아요 검증
create table pktest2
as
  select*from pktest;
  
  select*from pktest2;
  --pk 제약정보는 복사 되지 않았다(검증)
select*from user_constraints where table_name= 'PKTEST2';

------------------------- [insert end] -----------------

---[UPDATE]

/*
update table_name

set column1 = value1, column2 = value2....

where 조건

update table_name
set column1 = (subquery)
where 조건

*/

select*from copyemp;
update copyemp
set sal = 0;

rollback;

update copyemp
set sal = 0
where deptno =20;
select * from copyemp where deptno = 20;
commit;

--update(set 구문에 subquery 사용)
update copyemp
set sal = (select sum(sal) from emp);

select* from copyemp;
rollback;

--여러개 컬럼 update
update copyemp
set ename='AAA' , job ='BBB',hiredate= sysdate, sal = (select sum(sal) from emp)
where deptno =10;

select * from copyemp where deptno = 10;
commit;

------------------------ update end-------

--[DELETE]
--원칙: delete -> commit -> 복원불가 -> 백업 데이터가 있다면 복원가능 ... 
delete from copyemp;
select * from copyemp;

rollback;

select*from copyemp;

delete from copyemp where deptno in(10,20);

select*from copyemp;
rollback;

--------------------[delete end]----------
/*
 APP(JAVA) -> JDBC API -> DB 작업(ORACLE)
 
 CRUD
 
 create:insert
 
 read: select(전체, 조건조회(1건)
 update:update
 delete:delete
 
 (DML: create, update, delete) 트랜잭션: commit, rollback 강제)
 
 JDBC -> oracle
 -- 전체 조회(함수) , 조건 조회(함수), 삭제, 수정(함수), 삽입(함수) -> 개발자 
 
 
 -- public List<EMP> getEmpAllList(){ select * from emp...}
 -- public Emp getEmpListByEmpno(int empno){ select * from emp where empno = 7788}
 -- public int insertEmp(Emp emp){insert into emp(...) values(...)}
 
*/

--[DDL]
-- create, alter, drop(테이블 기준)


drop table board;

create table board(
boardid number,
title varchar2(50),
content varchar2(4000),
regdate date
);

-- 개발자 편하게 살기 ----

select * from user_tables where lower(table_name)='board';
select * from user_constraints where lower(table_name) = 'board';

--Oracle 11g 가상컬럼 (조합컬럼)
-- 학생성적 테이블: 국어 영어 수학 총점 칼럼 

--국어, 영어, 수학 데이터만 insert 하면 자동으로 총점이 구해졌으면 ....
create table vtable(
   no1 number,
   no2 number,
   no3 number GENERATED ALWAYS as (no1 + no2) Virtual
   
);

insert into vtable(no1,no2) values(100,50);
select * from vtable;
insert into vtable(no1,no2) values(80,60);

insert into vtable(no1,no2,no3) values(80,60,10); -- no3에 직접 값을 입력할수는 없다

--컬럼의 정보보기 
select COLUMN_NAME, DATA_TYPE,DATA_DEFAULT
from user_tab_columns where table_name = 'VTABLE';

--실무에서 활용하는 코드 
--제품정보( 입고일) 분기별 데이터(4분기)
--입고일 2019-03-01 >> 1분기

create table vtable2
(

  no number, -- 순번 
  p_code char(4), -- 제품코드(A001, B002)
  p_date char(8), --입고일(20190303)
  p_qty number, --수량
  p_bungi number(1) GENERATED ALWAYS as(
  CASE WHEN substr(p_date,5,2) IN('01','02','03') THEN 1
       WHEN substr(p_date,5,2) IN('04','05','06') THEN 2
       WHEN substr(p_date,5,2) IN('07','08','09') THEN 3
       ELSE 4
       END
       
  )VIRTUAL
  );
  
  select COLUMN_NAME, DATA_TYPE, DATA_DEFAULT
from user_tab_columns where table_name = 'VTABLE2';

insert into vtable2(p_date) values('20180101');
insert into vtable2(p_date) values('20180126');  
insert into vtable2(p_date) values('20190301');
insert into vtable2(p_date) values('20191225');

select * from vtable2;
select * from vtable2 where p_bungi = 1;

--DDL 테이블 다루기 (오라클.pdf 138 page)

--1. 테이블 생성하기 
create table temp6(id number);

--2. 테이블 생성했는데 컬럼 추가하기 
-- 기존 테이블에 컬럼 추가하기 
desc temp6;

alter table temp6
add ename varchar2(20);

--3.기존 테이블에 있는 컬럼의 이름을 잘못표기( ename -> username)
-- 기존 테이블에 있는 기존 컬럼의 이름 바꾸기( rename)
alter table temp6
rename column ename to username;

desc temp6;
-- 기존 테이블에 있는 기존 컬럼의 타입 정보 수정하기 
-- (modify)

alter table temp6
modify(username varchar2(2000));

alter table temp6
modify(username varchar2(2000) default '0');

insert into temp6(id) values(1);
select * from temp6;
desc temp6;

--5. 기존 테이블에 있는 기존 컬럼 삭제  

alter table temp6
drop column username;

desc temp6;

--6.테이블 삭제 
--6.1 데이터만 삭제 : delete

--테이블 처음 만들면 처음크기 >> 데이터를 넣으면 >> 데이터 크기 증가 
--ex) 처음에는 1M >> 10 만건 >> 100M >> delete 해서 10 만건 삭제 >> 여전히 테이클의 크기는 100M 

-- 테이블 데이터 삭제 [공간의 크기를 줄일수 있을까]
-- truncate( where 절을 사용 못해요)
--ex) 처음 1M >> 10 만건> 100M >> truncate 10 만건 삭제 >> 여전히 테이클의 크기는 1M

--7. 테이블 삭제 (drop)
drop table temp6;



----------------------------------------------
--테이블 제약 설정하기
--오라클.pdf( 144 Page)
--데이터 무결성 확보
--제약 (constraint) : insert , update  주로 적용
/*
*NOT NULL(NN)  : 열은 NULL 값을 포함할 수 없습니다. 
*UNIQUE key(UK) 테이블의 모든 행을 [유일하게 하는 값]을 가진 열(NULL 을 허용) 
--unique 제약은 null 값을 가질 수 있다 >> null 값을 못가지게 할려면 ( not null 포함)
*PRIMARY KEY(PK) 유일하게 테이블의 각행을 식별(NOT NULL 과 UNIQUE 조건을 만족) 
  not null 하고 unique 한 제약  ( 내부적으로  index 가 자동 설정)
  
*FOREIGN KEY(FK) 열과 참조된 열 사이의 외래키 관계를 적용하고 설정합니다. 
(참조제약)  [테이블]과 [테이블]간의 관계 설정  
*CHECK(CK) 참이어야 하는 조건을 지정함(대부분 업무 규칙을 설정) 
설정한 범위 내의 값만 입력받겠다  (gender : 컬럼에  '남' 또는 '여' 하는 데이터 만)
ex) where gender in ('남','여')
제약을 만드는 시점
1. 테이블 만들면서 바로 생성   (create table ....)
2. 테이블 생성 이후  ( alter table ...  add constraint....)  >> 자동 생성 툴 (exerd )
*/
--1.
select * from user_constraints where table_name ='EMP';
-- 오라클 not null 도 제약으로 본다.
-- "EMPNO" IS NOT NULL

create table temp7
(
 --id number primary key -- 권장하지 않아요(줄임표현)
 id number constraint pk_tmep7_id primary key,--관용적 표현: pk_테이블명_컬럼명 
 name varchar2(20) not null,
 addr varchar2(50)
 );
 drop table temp7;
 
 select *from user_constraints where table_name ='TEMP7';
 
 insert into temp7(name, addr) values('홍길동','서울시 강남구'); --cannot insert NULL into ("BITUSER"."TEMP7"."ID")(x)
 
 insert into temp7(id,name, addr) values(10,'홍길동','서울시 강남구');
 insert into temp7(id,name, addr) values(10,'홍길동','서울시 강남구');--unique constraint (BITUSER.PK_TMEP7_ID) violated (x)
 commit;
 
 --1. primary key 는 테이블에 몇개 까지 걸수 있을까요? 1개 ...
 -- 여러개의 컬럼을 묶어서 1개 가능(ename, age) -> 복합키 ...
 
 create table temp8(
 id number constraint pk_temp8_id primary key,
 name varchar(20) not null,
 jumin char(6) constraint uk_temp8_jumin unique, -- 중복값(x) >> null 도 허용 >> not null constraints uk_temp8_jumin unique 
 addr varchar2(20)

 );
 drop table temp8;
 
 select *from user_constraints where table_name = 'TEMP8';
 alter table temp8 
 add constraint pk_temp8_id primary key(id);
 
 insert into temp8(id, name, jumin, addr)
 values(10,'홍길동','123456','경기도');
 commit;
 
 insert into temp8(id, name, jumin, addr)
 values(20,'김우신','123456','경기도');--unique constraint (BITUSER.UK_TEMP8_JUMIN) violated
 
 
 --null 값 허용 할까 
 
 insert into temp8(id, name, addr)
 values(20,'김우신','경기도');
 
 select*from temp8;
 
 
 
 insert into temp8(id, name,  addr)
 values(30,'아무개','강원도');  -- null 중복체크 안돼요 ! ( not null unique  두개의 제약을 같이 사용)
 
 ------------------------------------------------
 -- 테이블 생성후에 제약걸기 
 
 create table temp9(id number,
                username varchar2(30),
                 constraint fk_temp9_id foreign key(id) references temp8(id)
 );
 drop table temp9;
 --기존 테이블에 제약 추가하기 
 --주의)기존 데이터가 제약을 위반한다면 제약은 추가되지 않아요 -> 중복된 데이터가 -> 데이터 삭제 -> 제약걸기
 --제약 걸기전에 데이터검사작업을 수행함 
 alter table temp9
 add constraint pk_temp9_id primary key(id);
 --add constraint pk_temp9_id primary key(id,name); -- 복합키
 -- 2개 컬럽의 값을 합쳐서 중복값이 아니면 되요 
 
 
 select *from user_constraints where table_name = 'TEMP9';
 
 alter table temp9
 add ename varchar(20);
 
 desc temp9;
 
 --not null 제약 추가 
 
 alter table temp9
 modify(ename not null);
 
 desc temp9;
 
 select *from user_constraints where table_name = 'TEMP9';
 
 -------------------------------------------
 --[Check] 제약
 -- where 조건과 동일한 형태의 제약 >> where gender in ('남','여');
 create table temp10(
 id number constraint pk_temp10_id primary key,
 name varchar2(20) not null,
 jumin char(6) constraint uk_temp10_jumin unique,
 addr varchar2(20),
 age number constraint ck_temp10_age check(age >=19) -- where age >= 19
 );
 
 
 select *from user_constraints where table_name = 'TEMP10';
 insert into temp10(id,name, jumin,addr,age)
 values(100,'홍길동','123456','서울시',25);
 
 select *from temp10;
 
  insert into temp10(id,name, jumin,addr,age)
 values(200,'김유신','123456','부산시',18);--check constraint (BITUSER.CK_TEMP10_AGE) violated
 
 commit
 
 ----------------------------------------------
 --참조제약: 테이블과 테이블간의 제약 
 --EMP(deptno) 컬럼은 DEPT(deptno) 컬럼을 참조한다
 
 
 create table c_emp
 as
   select empno, ename, deptno from emp where 1=2;
 
 
 create table c_dept
 as 
 select deptno,dname from dept where 1=2;
 
 
 select *from c_emp;
  select *from c_dept;
  
  
  --1.참조제약 (c_emp 테이블에 있는 deptno 컬럼에 ....deptno 컬럼 insert 되는 데이터는 c_dept 테이블 deptno 가지는 
    -- 데이터 중에 하나가 insert, update 강제 
    
    alter table c_emp
    add constraint fk_emp_deptno foreign key(deptno) references c_dept(deptno);
    -- 위 코드 실행 error 발생
    -- c_dept>> deptno에서 데이터를 빌려쓸거야 .. (저 신용있어요 빌려가주세요 ...) 
    -- deptno 가지는 데이터는 중복데이터가 없고 null값이 없음 primary key
    
    --c_dept>> deptno>> primary key 가 선행
  ---1)
    alter table c_dept
    add constraint pk_dept_deptno primary key(deptno);
    
 ---2)
    alter table c_emp
    add constraint fk_emp_deptno foreign key(deptno) references c_dept(deptno);
 
 
    insert into c_dept(deptno,dname)values(100,'인사팀');
 insert into c_dept(deptno,dname)values(200,'관리팀');
 insert into c_dept(deptno,dname)values(300,'회계팀');
 commit;
 
 select*from c_dept;
 
  
 insert into c_emp(empno,ename)
 values(100,'홍길동');-- FK 는 not null 하지 않아요 (null 허용)
 --신입사원은 부서를 갖지 않을수 있다.
 --규칙: 신입사원은 무조건 부서를 가져야 한다( deptno not null constraint .. fk)
 select * from c_emp;
 
 insert into c_emp(empno,ename,deptno)
 values(200,'아무개',300);
 --integrity constraint (BITUSER.FK_EMP_DEPTNO) violated - parent key not found
 ---------------------
 ----테이블( 부모, 자식 테이블)
 ----테이블( master, detail)
 
 --두개 테이블 deptno 관계에서 ... (부모 : c_dept(PK), master)
 --                           (자식 c_emp(FK),detail)
 --c_emp 테이블
--c_dept 테이블 
 
 --주의점 
 select*from c_emp;
 select*from c_dept;
 
 --이때 c_dept 테이블에서 300 데이터 삭제 불가능( 빌려쓰고 있는 데이터는 삭제 불가)
 delete from c_dept where deptno = 300; --integrity constraint (BITUSER.FK_EMP_DEPTNO) violated - child record found
 
 delete from c_dept where deptno =100; -- 빌려쓰고 있지 않은 데이터는 삭제 가능
 
 commit;
 
 
 --학생 성적 테이블
--학번의 데이터는 중복되거나 NULL 값을 허용하면 안된다
--이름 NULL 값을 허용하지 않는다
--국어
--영어
--수학 점수 컬럼은 숫자 타입이고 NULL 값을 허용
--는 값을 입력하지 않으면  default로 0값을 갖는다
--총점 ,평균 컬럼은 가상컬럼으로(조합컬럼) 생성한다
--학과코드는 학과 테이블에 학과코드를 참조한다
--학번 , 이름 , 국어 , 영어 , 수학 , 총점 , 평균 , 학과코드

--학과 테이블
--학과코드 데이터는 중복되거나 NULL 값을 허용하면 안된다,
--학과명 은 null값을 허락하지 않는다

--학과코드 , 학과명

--그리고 select 결과는
--학번 , 이름  총점, 평균 , 학과코드 , 학과명 을 출력하세요
 
create table student_grade(
student_num number constraint pk_student_grade_student_num primary key,
name varchar2(20) not null,
korean number default 0,
english number default 0,
math number default 0,
total_score number GENERATED ALWAYS as (korean + english + math) Virtual,
avg_score number GENERATED ALWAYS as (round(korean + english + math/3,0)) Virtual,
subject_code number
);
drop table student_grade;
create table subject(
subject_code number constraint pk_subject_subject_code primary key,
subject_name varchar(30) not null
);
alter table student_grade
add constraint fk_student_grad_subject_code foreign key(subject_code) references subject(subject_code);


insert into subject(subject_code,subject_name)values(13,'컴퓨터공학과');
insert into subject(subject_code,subject_name)values(14,'사회체육학과');
insert into subject(subject_code,subject_name)values(15,'시각디자인과');

insert into student_grade(student_num, name,korean,english,math,subject_code)values(11111,'강기훈',99,45,23,13);
insert into student_grade(student_num, name,korean,math,subject_code)values(22222,'정성윤',56,11,13);
insert into student_grade(student_num, name,korean,english,math,subject_code)values(33333,'곽호원',88,57,77,15);

select * from student_grade;


create table emp2(
emp_no number(8) constraint pk_emp2_emp_no primary key,
emp_name varchar(10) not null,
emp_hdate date default sysdate,
emp_mgr_no number(8) constraint fk_emp2_emp_mgr_no references emp2(emp_no)
);
drop table emp2;

select * from emp;
select * from dept;



select d.dname as "부서이름", d.deptno as "부서번호",sum(e.sal) as "부서급여총액" ,round(avg(e.sal),0) as "부서평균급여"
from emp e join dept d on
e.deptno = d.deptno
group by d.dname,d.deptno
having avg(e.sal)>=1800;


select d.dname, d.deptno
from emp e join dept d on
e.deptno = d.deptno;


select e.deptno,sum(e.sal),round(avg(e.sal),0)
from emp e
where e.sal>= 1800
group by e.deptno;


create table s_emp(
name varchar(30),
age number,
level2 number,
dept_id number
);

select * from s_emp;

insert into s_emp values('홍길동',27,4,20);
insert into s_emp values('강감찬',40,7,30);
insert into s_emp values('이순신',52,7,40);
insert into s_emp values('계백',32,6,10);
insert into s_emp values('이성계',57,8,50);

create table s_dept(
dept_id number,
dept_name varchar(30),
number2 number
);

insert into s_dept values(10,'기획팀',4);
insert into s_dept values(20,'영업팀',6);
insert into s_dept values(30,'개발팀',30);
insert into s_dept values(40,'경영지원팀',5);
insert into s_dept values(50,'디자인팀',7);

select e.name, e.dept_id,d.dept_name
from s_emp e join s_dept d on
e.dept_id = d.dept_id
order by e.age;

-------------------------------------------------
--View 객체... (가상테이블)
-- 오라클.pdf PAGE 192
-- View 객체(create...)
-- create view 뷰이름 as[select 구문] (view 통해서 볼수 있는 데이터 목록 )
-- view 는 테이블 처럼 사용가능 (가상테이블) -> emp, dept 같은 논리로 접근해서 사용한다 
-- view 메모리상에만 존재하는 가상테이블이다. in line view -> from(select deptno, avg(sal)...)

-- view 가상테이블 
-- 사용법: 일반 테이블과 사용법이 동일( select.. where ...)
-- DML( insert, update, delete)-> view통해서 dml 가능 -> view가 가지고 있는( 볼수 있는 ) -> 실테이블 데이터를 변경 
-- view는 별도의 권한이 필요
create view v_001 
as
  select empno, ename from emp;
  
  select* from v_001; -- view가 가지고 있는 sql 문장을 실행한다.
  
  create view v_emp 
  as 
    select empno, ename, job,hiredate from emp;

--VIEW 사용 목적
-- 1. 개발자의 편리성( join, subquery) >> 가상테이블 개념 ... 
-- 2. 편리성(쿼리 단순화) -> 복잡한 쿼리를 미리 만들어 두고 사용 
-- 3. 보안( 권한처리) -> 노출하고 싶은 데이터만 모아서 view 생성 -> view 권한 부여 
    
   select * from v_emp;
   select empno,ename from v_emp;
   
   select * from v_emp where empno =7788;
   
   --편리성 ( 쿼리 단순화) 
   create view v_OO2
   as
      select e.empno, e.ename, d.deptno, d.dname
       from emp e join dept d
       on e.deptno = d.deptno;
       
    select * from v_OO2;
    select * from v_OO2 where deptno = 30;
    
    create view v_OO3 --view 는 가상테이블 (나름 자존심: 나도 컬럼명 만들어줘야지 )
    as
     select deptno, avg(sal) as avgsal
     from emp
     group by deptno;
     
     select *
     from emp e join v_OO3 s
     on e.deptno = s.deptno
     where e.sal> s.avgsal;
     
     -- 테이블 1개 이상 ... join안되면 ... subquery ... 가상테이블(view)
     
/*     
CREATE [OR REPLACE] [FORCE | NOFORCE] VIEW view_name [(alias[,alias,...])] AS Subquery
[WITH CHECK OPTION [CONSTRAINT constraint ]]
[WITH READ ONLY]
 OR  REPLACE
  FORCE
  NOFORCE
  view_name
  Alias
  Subquery
  WITH CHECK OPTION
  Constraint
  WITH READ ONLY
이미 존재한다면 다시 생성한다.
Base Table 유무에 관계없이 VIEW 을 만든다.
기본 테이블이 존재할 경우에만 VIEW 를 생성한다.
VIEW 의 이름
Subquery 를 통해 선택된 값에 대한 Column 명이 된다.
SELECT 문장을 기술한다.
VIEW 에 의해 액세스 될 수 있는 행만이 입력,갱신될 수 있다. CHECK OPTON 제약 조건에 대해 지정된 이름이다.
이VIEW에서 DML이 수행될 수 없게 한다.

 */
 
 drop view v_007;
 
 create or replace view v_007
 as 
  select avg(sal) as avgsal from emp; 
  select* from v_007;
    

 create or replace view v_007
 as 
  select round(avg(sal),0) as avgsal from emp; 
  
  select * from v_007;
  
  -- VIEW  통한 DML 가능(insert, update, delete)
  -- 단 view 테이블이 아니기 때문에 view 통해서 볼수 있는 데이터에 대해서만 
  -- 복합 view( 1 개 이상의 테이블 구성) --> DML(불가)
  -- 단순 view( 테이블 1 개로) 만든 view 
  
  select * from v_emp;-- view 통해서 볼수 있는 데이터(empno, ename.job, hiredate)
  update v_emp -- view 를 통해서 sal 볼수 없다
  set sal = 0;
  
  
  update v_emp -- 원본 테이블가서 .. 데이터를 update -- 결국 emp 테이븗 데이터 변경 
  set job ='IT';
  
  select * from emp;
  
  rollback;
  
  create or replace view v_emp2
  as
    select*from emp where deptno=20;
    
    select * from v_emp2;
    
    --1.
    update v_emp2 -- 지가 볼수 있는 데이터만 update ... 
    set sal=0;

    select * from emp;
    select * from emp where deptno = 20;
    
    rollback;
    
    select * from user_views;
    ------------------------------------------------
    
    
  
  --1. 30번 부서 사원들의 직위, 이름, 월급을 담는 VIEW를 만들어라.
  
    create view v_emp8
    as
       select job, ename, sal
       from emp
       where deptno = 30;
       
     select * from v_emp8;  

 
 
--2. 30번 부서 사원들의  직위, 이름, 월급을 담는 VIEW를 만드는데,
-- 각각의 컬럼명을 직위, 사원이름, 월급으로 ALIAS를 주고 월급이
-- 300보다 많은 사원들만 추출하도록 하라.
-- create or replace view view001 (컬럼명, 컬럼명, .....)  
    
    create view view_001
    as
       select job as "직위", ename as"사원이름", sal as"월급"
       from emp
       where sal > 300;

 select * from view_001;

 
--3. 부서별 최대월급, 최소월급, 평균월급을 담는 VIEW를 만들어라.
   
   create view view_002
     as
       select deptno, max(sal)as "maxsal", min(sal)as"minsal", round(avg(sal),0)as"avgsal"
       from emp
       group by deptno;
      
      drop view view_002;
     select * from view_002;


       
--4. 부서별 평균월급을 담는 VIEW를 만들되, 평균월급이 2000 이상인
-- 부서만 출력하도록 하라.
      create view view_003
       as 
          select deptno, round(avg(sal),0)as "avgsal"
          from emp
          group by deptno 
          having avg(sal) >=2000;
    drop view view_003;
  select * from view_003;

 
--5. 직위별 총월급을 담는 VIEW를 만들되, 직위가 MANAGER인
-- 사원들은 제외하고 총월급이 3000이상인 직위만 출력하도록 하라.

   create or replace view view_004
   as 
     select sum(sal) as "sumsal", job
    from emp
    group by job
    having job != 'MANAGER' and sum(sal) > 3000;
    
    select * from view_004;
    
    ----------------------------------------------
    -- 시퀀스
    -- oracle.pdf 185 page
    -- 자동으로 번호를 생성하는 객체
    /*
    CREATE SEQUENCE sequence_name 
    [INCREMENT BY n]
    [START WITH n] 
    [{MAXVALUE n | NOMAXVALUE}] 
    [{MINVALUE n | NOMINVALUE}] 
    [{CYCLE | NOCYCLE}] 
    [{CACHE | NOCACHE}];
    
sequence_name INCREMENT BY n
START WITH n
  MAXVALUE n
  NOMAXVALUE
  MINVALUE n
  NOMINVALUE
  CYCLE | NOCYCLE
  CACHE | NOCACHE
SEQUENCE 의 이름입니다. 정수값인n으로SEQUENCE번호사이의간격을지정.
이 절이 생략되면 SEQUENCE는 1씩 증가.
생성하기 위해 첫번째 SEQUENCE 를 지정.
이 절이 생략되면 SEQUENCE는 1로 시작.
SEQUENCE 를 생성할 수 있는 최대 값을 지정.
오름차순용 10^27 최대값과 내림차순용-1 의 최소값을 지정. 최소 SEQUENCE 값을 지정.
오름차순용 1 과 내림차순용-(10^26)의 최소값을 지정.
최대 또는 최소값에 도달한 후에 계속 값을 생성할 지의 여부를 지정. NOCYCLE 이 디폴트.
얼마나 많은 값이 메모리에 오라클 서버가 미리 할당하고 유지 하는가를 지정. 디폴트로 오라클 서버는 20 을 CACHE.
 */
 drop table board;
 
 create table board(
 boardid number constraint pk_board_id primary key ,
 title varchar2(100)
 );
 
 -- boardid 컬럼(not null, unique, index 구성된다)
 -- 개발자: boardid 데이터는... 
 -- 개발자: where boardid = ? 무조건 1건 .. return 
 
 -- insert into board(boardid , title) values (...)
 -- 그러면 중복되지않고 null값이 아니다라는 보장.. 
 
 -- 조건: 처음 글을 쓰면 1 이라는 값을 insert ... 그 다음글부터는 2,3,4, 순차적인 값을 insert
 -- 쿼리문
 
     insert into board(boardid, title) values(select nvl(max(boardid),0)+1 from board ,'제목');
     
-----------------------------------------------
--sequence 번호 추출 (규칙) : 중복값이 없고 순차적인 값(공유객체)

create sequence board_num;

select* from user_sequences;
/*
1)NEXTVAL는다음사용가능한SEQUENCE값을반환한다.
2) SEQUENCE가참조될때마다,다른사용자에게조차도유일한값을반환한다. 
3) CURRVAL은현재SEQUENCE값을얻는다.
4) CURRVAL이참조되기전에NEXTVAL이사용되어야한다.
*/

--실채번
select board_num.nextval from dual; --1 return 

-- 몇번 까지 했지 ..? (현재값) 채번하지 않고 정보만 줌
 select board_num.currval from dual;-- 니가 마지막으로 추출한 번호는 2
------------------------------------------

create sequence kboard_num;
create table kboard(
 num number constraint pk_kboard_id primary key ,
 title varchar2(100)
 );
 
 insert into kboard(num, title)
 values (kboard_num.nextval,'처음 글');
 
 select * from kboard;
 
 select kboard_num.currval from dual;
 
 insert into kboard(num, title)
 values (kboard_num.nextval,'두번째 글');
 
 insert into kboard(num, title)
 values (kboard_num.nextval,'세번째 글');
 
  select * from kboard;
  
  -------------------------------------
  --1.sequence 객체 하나 >> 여러개의 테이블에서 사용 가능 (가능하다)
  --A(1)(4) , B(2) , C(3)
  
  
  -- 사이트(게시판) 10개 
  -- 상품 게시판, 관리자 게시판, 회원게시판
  -- sequence 따로 만들어서 사용.. 하나의 sequence 를 공유해도 된다 
  
  --Tip)
  --ms-sql: create table board(boardnum in identify(1,1), title varchar(20))
  -- insert into board(title) values('방가')--> boardnum 1 값이 자동으로 insert
  --ms-sql  2012 버전부터 (sequence) 

  --my-sql: create table board(boardnum int auto _increment, title varchar(20));
    
  -- 마리아 디비 sequence 객체 존재 
  
  ----------------------------------------------------
  -- sequence 객체 옵션
  create sequence seq_num
  start with 10
  increment  by 2;
  
  select seq_num.nextval from dual;
  
  select seq_num.currval from dual;
  
  --게시판 글을 insert
  -- 게시판 최신글 순으로 보이기 
  select* from board order by boardnum desc;
  --------------------------------------------------
  -- 개발자 필수 2
  
  --rownum 의사컬럼 : 실제 물리적으로 존재하는 컬럼이 아니고 논리적인 존재 
  -- ROWNUM: 실제로 테이블에 컬럼으로 존재하지 않지만 내부적으로 행의 번호를 부여할수 있는 가상 컬럼 
  --ROWID: 주소값( 행이 실제로 저장되는 내부 주소값) - > 인덱스 만들때 사용 
  select * from emp;
  select rownum as 순번, empno, ename from emp; --select한 결과를 가지고 순번을 붙여준다.
  
  --Top-n 쿼리 
  --테이블에서 조건에 맞는 상위 (TOP) 레코드(row) n개 추출해라 
  --MS-SQL 서버 
  -- select top 10,* from emp order by sla desc
  
  -- Qracle
  --rownum(의사컬럼): 기준을 정의 
  ----------------------------------------
  -- rownum 사용 
  --1. 정열의 기준을 정의 하는 작업(선행)
  --2. 정렬이 된 상황에서 앞에서 순번 조건절 제시 데이터 추출 
  
  
  --1단계 
   
  
  select *
  from(
     select*
    from emp order by sal desc
  
  
   )e;
    
--2단계 ( 번호표 부여)

  
  select rownum as"num", e.*
  from(
     select*
    from emp order by sal desc
  
  
   ) e;
   
   --3단계 ( 급여 많이 받는 사원 5명..)
   
   
   
 select rownum as"num", e.*
  from(
     select*
    from emp order by sal desc
   )e
   where rownum<=5;
   
   ---------------------------------------
   
select*
from
(
 select rownum as num, e.*
  from(
     select*
    from emp order by sal desc
   )e
  
)n
 where num<10;

--------------------------------------------
-- emp테이블에서 급여를 많이 받는 사원 5명 출력하세요. 

select rownum as"num", e.*
  from(
     select*
    from emp order by sal desc
   )e
   where rownum<=5;
   
-------------------------------------------
-- 게시판(페이징 처리)
--100건 데이터 
--10건씩 나누어 보여주기 
-- 총 100건 
-- pagesize = 10 ( 한화면에 (페이지) 보여줄 데이터 건수 row 수)
-- page 개수 >> 10  
-- 1~10 1page (DB에서 1~10 글까지 select 가지고 App 출력)
--11 ~20 2page 
-- ...'
--91~100 10page 
-------------------------------------------
--HR 계정 이동 
select * from employees;

--41번 부터 50번째 사원데이터 출력하세요 ( 조건 : 사번이 낮은순으로) 
--pagesize =10 
--1~10, 11~20, 21~30 


select*
from
(
 select rownum as num, e.*
  from(
     select*
    from employees order by employee_id asc
   ) e
  
) n
 where num between 41 and 50;
 
 ---------------------------------------------
 -- sql 기본과정 end 
 -- sql 고급과정(3차 프로젝트 전에 )
 -- 고급 쿼리 (순위)
  -- pl-sql
  --(변수 제어문 커서 함수 프로시저 트리거 스케줄 )
  

--1> 부서테이블의 모든 데이터를 출력하라.
 
 
--2> EMP테이블에서 각 사원의 직업, 사원번호, 이름, 입사일을 출력하라.
     select job,empno, ename, hiredate from emp;



 
--3> EMP테이블에서 직업을 출력하되, 각 항목(ROW)가 중복되지 않게
-- 출력하라.

 
 
--4> 급여가 2850 이상인 사원의 이름 및 급여를 출력하라.
     select ename, sal 
     from emp
     where sal >=2850;
 
 
--5> 사원번호가 7566인 사원의 이름 및 부서번호를 출력하라.

 
 
--6> 급여가 1500이상 ~ 2850이하의 범위에 속하지 않는 모든 사원의 이름
-- 및 급여를 출력하라.
    
      select ename, sal 
      from emp
      where sal < 1500 or sal >2850;
    
    
 
--7> 1981년 2월 20일 ~ 1981년 5월 1일에 입사한 사원의 이름,직업 및 
--입사일을 출력하라. 입사일을 기준으로 해서 오름차순으로 정렬하라.
 
 
--8> 10번 및 30번 부서에 속하는 모든 사원의 이름과 부서 번호를
-- 출력하되, 이름을 알파벳순으로 정렬하여 출력하라.
     select ename , empno
     from emp
     where deptno = 10 or deptno =30 
     order by ename asc;
     


 
--9> 10번 및 30번 부서에 속하는 모든 사원 중 급여가 1500을 넘는
-- 사원의 이름 및 급여를 출력하라.
--(단 컬럼명을 각각 employee 및 Monthly Salary로 지정하시오)
 
--10> 관리자가 없는 모든 사원의 이름 및 직위를 출력하라.
     select ename, job
     from emp
     where mgr is null;
 
 
--11> 커미션을 받는 모든 사원의 이름, 급여 및 커미션을 출력하되, 
-- 급여를 기준으로 내림차순으로 정렬하여 출력하라.
 
 
--12> 이름의 세 번째 문자가 A인 모든 사원의 이름을 출력하라.
      select ename 
      from emp
      where ename like '__A%';
 
--13> 이름에 L이 두 번 들어가며 부서 30에 속해있는 사원의 이름을 
--출력하라.
 
 
--14> 직업이 Clerk 또는 Analyst 이면서 급여가 1000,3000,5000 이 
-- 아닌 모든 사원의 이름, 직업 및 급여를 출력하라.
    select * from emp;
    
     select ename, job, sal
     from emp
     where job in ('CLERK','ANALYST' ) and sal in(1000,3000,5000);
     
 
--15> 사원번호, 이름, 급여 그리고 15%인상된 급여를 정수로 표시하되 
--컬럼명을 New Salary로 지정하여 출력하라.
 
 
--16> 15번 문제와 동일한 데이타에서 급여 인상분(새 급여에서 이전 
-- 급여를 뺀 값)을 추가해서 출력하라.(컬럼명은 Increase로 하라). 
    select empno, ename, sal, round(sal*1.5,0) as "New Salary", round(sal*1.5,0) - sal as "Increase"
     from emp;



 
 
 
 
 
--18> 모든 사원의 이름(첫 글자는 
-- 대문자로, 나머지 글자는 소문자로 표시) 및 이름 길이를 표시하는
-- 쿼리를 작성하고 컬럼 별칭은 적당히 넣어서 출력하라.
    
    select substr(ename,1,1)||lower(substr(ename,2)) as "사원이름" , length(ename) as "이름길이"
    from emp;
    
    
 
 
--19> 사원의 이름과 커미션을 출력하되, 커미션이 책정되지 않은 
-- 사원의 커미션은 'no commission'으로 출력하라.
   
 
 
--20> 모든 사원의 이름,부서번호,부서이름을 표시하는 질의를 작성하라.
      select e.ename, e.deptno, d.dname
      from emp e join dept d on 
      e.deptno = d.deptno;
      
 
 
--21> 30번 부서에 속한 사원의 이름과 부서번호 그리고 부서이름을 출력하라.
 
 
--22> 30번 부서에 속한 사원들의 모든 직업과 부서위치를 출력하라.
--(단, 직업 목록이 중복되지 않게 하라.)
    

    select distinct e.job, d.dname
    from emp e join dept d on
    e.deptno = d.deptno
    where e.deptno =30;
    
 
 
--23> 커미션이 책정되어 있는 모든 사원의 이름, 부서이름 및 위치를 출력하라.
 
 
--24> 이름에 A가 들어가는 모든 사원의 이름과 부서 이름을 출력하라.
      select e.ename, d.dname
      from emp e join dept d on 
      e.deptno = d.deptno
      where e.ename like '%A%';
    
 
 
--25> Dallas에서 근무하는 모든 사원의 이름, 직업, 부서번호 및 부서이름을 
-- 출력하라.
 
 
--26> 사원이름 및 사원번호, 해당 관리자이름 및 관리자 번호를 출력하되,
-- 각 컬럼명을 employee,emp#,manager,mgr#으로 표시하여 출력하라.
     select e.ename as "employee",e.empno as "emp#",d.ename as "manager",d.empno as"mgr#"
      from emp e join emp d on 
      e.mgr = d.empno;

--27> 모든 사원의 이름,직업,부서이름,급여 및 등급을 출력하라.
      select e.empno, e.ename, d.dname, s.grade
     from emp e join dept d on
     e.deptno = d.deptno
     join salgrade s
     on e.sal between s.losal and s.hisal;
      
      select * from salgrade;
      
 
--28> Smith보다 늦게 입사한 사원의 이름 및 입사일을 출력하라.
 
 
 
--29> 자신의 관리자보다 먼저 입사한 모든 사원의 이름, 입사일, 
-- 관리자의 이름, 관리자의 입사일을 출력하되 각각 컬럼명을 
-- Employee,EmpHiredate, Manager,MgrHiredate로 표시하여 
-- 출력하라.
 
 
--30> 모든 사원의 급여 최고액,최저액,총액 및 평균액을 출력하되 
-- 각 컬럼명을 Maximum,Minimum,Sum,Average로 지정하여 출력하라.
     select max(sal) as "Maximum" , min(sal) as "Minimum", sum(sal)as "Sum" , round(avg(sal),0) as"Average"
     from emp;
     

 
--31> 각 직업별로 급여 최저액.최고액,총액 및 평균액을 출력하라.
 
--32> 직업이 동일한 사람 수를 직업과 같이 출력하라.
       select job,count(job) as " 직업이 동일한 사람수"
       from emp
       group by job;
    

       

 
--33> 관리자의 수를 출력하되, 관리자 번호가 중복되지 않게하라.
-- 그리고, 컬럼명을 Number of Manager로 지정하여 출력하라.
select count(distinct mgr) as "Number of Manager"
from emp;

 
 
--34> 최고 급여와 최저 급여의 차액을 출력하라.
     select max(sal), min(sal), max(sal) - min(sal) as "차액"
     from emp;

 
--35> 관리자 번호 및 해당 관리자에 속한 사원들의 최저 급여를 출력하라.
-- 단, 관리자가 없는 사원 및 최저 급여가 1000 미만인 그룹은 제외시키고 
-- 급여를 기준으로 출력 결과를 내림차순으로 정렬하라.
 
 
--36> 부서별로 부서이름, 부서위치, 사원 수 및 평균 급여를 출력하라.
-- 그리고 각각의 컬럼명을 부서명,위치,사원의 수,평균급여로 표시하라.
     select * from dept;
     select d.dname as"부서명", d.loc as"위치", count(e.empno) as"사원의 수", avg(e.sal) as"평균급여"
     from emp e join dept d on
     e.deptno = d.deptno
     group by d.dname,d.loc;
     
 
 
 
--37> Smith와 동일한 부서에 속한 모든 사원의 이름 및 입사일을 출력하라.
-- 단, Smith는 제외하고 출력하시오
 
 
--38> 자신의 급여가 평균 급여보다 많은 모든 사원의 사원 번호, 이름, 급여를 
--    표시하는 질의를 작성하고 급여를 기준으로 결과를 내림차순으로 정렬하라.
      select empno, ename, sal
      from emp
      where (select avg(sal) from emp) < sal
      order by sal desc;
      
   
 
 
--39> 이름에 T가 들어가는 사원의 속한 부서에서 근무하는 모든 사원의 사원번호
-- 및 이름을 출력하라.
 
 
--40> 부서위치가 Dallas인 모든 사원의 이름,부서번호 및 직위를 출력하라.
      select e.ename, d.deptno , e.job 
      from emp e join dept d on
      e.deptno = d.deptno
      where d.loc = 'DALLAS';
      
      
      
      
 
 
--41> KING에게 보고하는 모든 사원의 이름과 급여를 출력하라.
 
 
--42> Sales 부서의 모든 사원에 대한 부서번호, 이름 및 직위를 출력하라.
      select e.deptno, e.ename, e.job 
      from emp e join dept d on
      e.deptno = d.deptno
      where d.dname = 'SALES';
 
    
--43> 자신의 급여가 평균 급여보다 많고 이름에 T가 들어가는 사원과 동일한
-- 부서에 근무하는 모든 사원의 사원 번호, 이름 및 급여를 출력하라.
 
 
--44> 커미션을 받는 사원과 급여가 일치하는 사원의 이름,부서번호,급여를 
-- 출력하라.
     select ename, deptno, sal 
     from emp 
     where sal in (select sal from emp where comm is not null);
 
 
--45> Dallas에서 근무하는 사원과 직업이 일치하는 사원의 이름,부서이름,
--     및 급여를 출력하시오
 
 
--46> Scott과 동일한 급여 및 커미션을 받는 모든 사원의 이름, 입사일 및 
-- 급여를 출력하시오
    select ename, hiredate, sal 
    from emp
    where sal = (select sal from emp where ename ='SCOTT') and ename != 'SCOTT';
 
 
--47> 직업이 Clerk 인 사원들보다 더 많은 급여를 받는 사원의 사원번호,
-- 이름, 급여를 출력하되, 결과를 급여가 높은 순으로 정렬하라.
 
  
--48> 이름에 A가 들어가는 사원과 같은 직업을 가진 사원의 이름과
-- 월급, 부서번호를 출력하라.
       select ename, sal, deptno
       from emp 
       where job in (select job from emp where ename like '%A%');
 
--49> New  York 에서 근무하는 사원과 급여 및 커미션이 같은 사원의 
-- 사원이름과 부서명을 출력하라.
 
 
 
--50> Dallas에서 근무하는 사원과 직업 및 관리자가 같은 사원의 사원번호,사원이름,
--    직업,월급,부서명,커미션을 출력하되 커미션이 책정되지 않은 사원은 NoCommission
--    으로 표시하고, 커미션의 컬럼명은 Comm으로 나오게 출력하시오.
--    단, 최고월급부터 출력되게 하시오
     select e.job , e.sal, d.dname ,nvl(to_char(e.comm), 'NoCommission')
     from emp e join dept d on 
     e.deptno = d.deptno
     where e.job in( select e.job 
     from emp e join dept d on
      e.deptno = d.deptno
     where d.loc= 'DALLAS') and e.mgr in(select e.mgr 
     from emp e join dept d on
      e.deptno = d.deptno
     where d.loc= 'DALLAS')
     order by e.sal desc;
 -------------------------------
 create table dmlemp
 as 
    select * from emp;
    
    select * from dmlemp;
    
    alter table dmlemp
    add constraint pk_dmlemp_empno primary key(empno);
    
    select * from SYS.USER_CONSTRAINTS where TABLE_NAME = 'DMLEMP';
    
    
     select*from dmlemp;
      select* from dmlemp where deptno = 30;
      select*from dmlemp ;
      commit;
      
    
  create table trans_A(
  num number,
  name varchar(20)
  );
  
  
  create table trans_B(
  num number constraint pk_trans_B_num primary key,
  name varchar2(20)
  );
   
    select * from trans_A;
    select * from trans_B;
 
 
create table department(
    deptno number,
    dname varchar2(50)
);
 insert into department(deptno,dname) values(10,'IT');
 insert into department(deptno,dname) values(20,'SALES');
 insert into department(deptno,dname) values(10,'MANAGER');
  commit; 
  
  
  CREATE TABLE EMP
(EMPNO number not null,
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
MGR number ,
HIREDATE date,
SAL number ,
COMM number ,
DEPTNO number );
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,'1980-12-17',800,null,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,200,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,'1981-04-02',2975,30,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,300,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,'1981-04-01',2850,null,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,'1981-06-01',2450,null,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,'1982-10-09',3000,null,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',null,'1981-11-17',5000,3500,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,'1983-01-12',1100,null,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,'1981-10-03',950,null,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,'1981-10-3',3000,null,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,'1982-01-23',1300,null,10);

COMMIT;

CREATE TABLE DEPT
(DEPTNO number,
DNAME VARCHAR2(14),
LOC VARCHAR2(13) );

INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');

COMMIT;



CREATE TABLE SALGRADE
( GRADE number,
LOSAL number,
HISAL number );

INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
COMMIT;

CREATE TABLE koreaMember
(
  id VARCHAR2(50) PRIMARY KEY ,
  pwd VARCHAR2(50) NOT NULL,
  NAME VARCHAR2(50) NOT NULL,
  age NUMBER ,
  gender CHAR(4),
  email VARCHAR2(50),
  ip   VARCHAR2(50)
);
commit;
select*from koreaMember;

select id, pwd from koreaMember where id ='alkalisummer';

select id, pwd , name, age , gender , email from koreamember where id='hong';

