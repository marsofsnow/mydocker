use privatedb;
create table t_accounts
(
    id int auto_increment comment 'pk'
        primary key,
    number varchar(40) not null,
    uuid varchar(60) not null,
    data text null,
    create_time datetime default CURRENT_TIMESTAMP null,
    update_time datetime default CURRENT_TIMESTAMP null,
    delete_time datetime null,
    constraint t_acconts_number_uindex
        unique (number),
    constraint t_acconts_uuid_uindex
        unique (uuid)
)
    comment '账户表';

alter table t_accounts
    add iid varchar(16) not null after number;

create unique index t_accounts_iid_uindex
    on t_accounts (iid);


create table t_group
(
    id          bigint auto_increment
        primary key,
    groupId     varchar(256)                       not null,
    groupPf     text                               null,
    groupMan    text                               null,
    create_time datetime default CURRENT_TIMESTAMP null,
    update_time datetime default CURRENT_TIMESTAMP null,
    constraint t_group_groupId_uindex
        unique (groupId)
);

create table t_group_change
(
    id bigint auto_increment  primary key,
    group_id varchar(520) not null,
    version int not null,
    group_change text not null,
    group_state text not null,
    create_time datetime default CURRENT_TIMESTAMP null,
    update_time datetime default CURRENT_TIMESTAMP null
);
create index t_group_change_group_id_index
    on t_group_change (group_id);





create table t_keys
(
    id bigint auto_increment
        primary key,
    number varchar(255) not null,
    key_id bigint not null,
    public_key text not null,
    last_resort smallint default 0 not null,
    device_id bigint default 1 not null,
    create_time timestamp default CURRENT_TIMESTAMP not null,
    signed_prekey varchar(1024) default '' not null,
    identity_key varchar(1024) default '' not null
);

create index keys_number_index
    on t_keys (number);

create table t_messages
(
    id bigint auto_increment
        primary key,
    type smallint not null,
    relay varchar(256) not null,
    timestamp bigint not null,
    source varchar(256) null,
    source_device int null,
    destination varchar(256) not null,
    destination_device int not null,
    message blob null,
    content blob null,
    guid varchar(36) null,
    server_timestamp bigint null,
    source_uuid varchar(36) null,
    ctime datetime default CURRENT_TIMESTAMP null
);

create index destination_and_type_index
    on t_messages (destination, destination_device, type);

create index destination_index
    on t_messages (destination, destination_device);

create table t_pending_accounts
(
    id int auto_increment comment 'pk
'
        primary key,
    number varchar(64) not null comment '手机号',
    verification_code varchar(10) not null comment '验证码',
    push_code varchar(10) not null comment '推送码',
    timestamp bigint not null,
    create_time datetime default CURRENT_TIMESTAMP not null,
    update_time datetime default CURRENT_TIMESTAMP null,
    deleted_at datetime null,
    constraint t_pending_accounts_number_uindex
        unique (number),
    constraint t_pending_accounts_verification_code_uindex
        unique (verification_code)
)
    comment '待注册帐号';

create table privatedb.t_pending_devices
(
    id bigint auto_increment comment 'pk'
        primary key,
    number varchar(64) not null comment 'user account,unique',
    verification_code varchar(255) null,
    timestamp bigint null comment 'millsecode',
    create_time datetime default CURRENT_TIMESTAMP null,
    constraint t_pending_devices_number_uindex
        unique (number)
);

create table t_profilekey
(
    id int auto_increment
        primary key,
    account_name varchar(64) not null,
    profile_key varchar(1024) default '' not null,
    constraint t_profilekey_account_name_uindex
        unique (account_name)
);

create table t_profiles
(
    id bigint auto_increment
        primary key,
    uuid varchar(64) not null comment 'uuid',
    version varchar(1024) not null comment 'prekey version',
    name text not null comment 'name',
    avatar varchar(128) null comment '头像文件相对路径',
    commitment text null,
    create_time datetime default CURRENT_TIMESTAMP null,
    update_time datetime default CURRENT_TIMESTAMP null
);

create index t_profiles_uuid_index
    on t_profiles (uuid);

create table t_register
(
    id bigint auto_increment primary key ,
    uuid varchar(36) not null comment 'uuid',
    uid varchar(16) null comment 'uid',
    chain_name varchar(12) not null comment 'adx chain account,最多12个字符,允许的字符有：abcdefghijklmnopqrstuvwxyz.12345',
    create_time datetime default CURRENT_TIMESTAMP null,
    constraint t_regediter_uuid_index
        unique (uuid),
    constraint t_regediter_uid_index
        unique (uid),
    constraint t_register_chain_name_index
        unique (chain_name)
);


create table t_usernames
(
    id bigint auto_increment primary key,
    uuid varchar(64) not null,
    username varchar(256) not null,
    create_time datetime default CURRENT_TIMESTAMP null,
    update_time datetime default CURRENT_TIMESTAMP null,
    constraint t_usernames_username_uindex
        unique (username),
    constraint t_usernames_uuid_uindex
        unique (uuid)
)
    comment 'uuid与用户昵称的映射表';
