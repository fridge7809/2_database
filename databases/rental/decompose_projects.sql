/*
 R1(ID, MID)
R2(MID, MN)
R3(PID, PN)
R4(SID, SN)
R5(ID, PID, SID)
 */

drop table if exists r1;
drop table if exists r2;
drop table if exists r4;
drop table if exists r3;
drop table if exists r5;


create table r2 (
                    mid integer primary key,
                    mn  varchar(50) not null
                );

insert into r2
select distinct mid, mn
from projects;

create table r1 (
                    id  integer primary key,
                    mid integer not null references r2 (mid)
                );

insert into r1
select distinct id, mid
from projects;

create table r3 (
                    pid integer primary key,
                    pn  varchar(50) not null
                );

insert into r3
select distinct pid, pn
from projects;

create table r4 (
                    sid integer primary key,
                    sn  varchar(50) not null
                );

insert into r4
select distinct sid, sn
from projects;

create table r5 (
                    id  integer references r1 (id),
                    pid integer references r3 (pid),
                    sid integer references r4 (sid),
                    primary key (id, pid, sid)
                );

insert into r5
select distinct id, pid, sid
from projects;

select count(*)
from r5; -- 9051

select count(*)
from projects
--9051
/*
                      Table "public.projects"
 Column |         Type          | Collation | Nullable | Default
--------+-----------------------+-----------+----------+---------
 id     | integer               |           | not null |
 pid    | integer               |           | not null |
 sid    | integer               |           | not null |
 sn     | character varying(50) |           | not null |
 pn     | character varying(50) |           | not null |
 mid    | integer               |           | not null |
 mn     | character varying(50) |           | not null |
Indexes:
    "projects_pkey" PRIMARY KEY, btree (id, pid, sid)
 */