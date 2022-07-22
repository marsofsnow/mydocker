\c lemmydb;
create table t_test (
      id serial primary key,
      name varchar(20) not null unique,
      title varchar(100) not null,
      description text,
      removed boolean default false not null,
      create_time timestamptz default now() not null ,
      utime timestamptz default now() not null
);