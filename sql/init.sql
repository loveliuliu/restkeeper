create table application(
	application_id int auto_increment primary key comment '系统ID',
	name varchar(64) not null comment '系统名称',
    description varchar(255) comment '系统描述',
    host_name varchar(255) comment '系统域名'
);

create table function(
	function_id int auto_increment primary key comment '功能Id',
    application_id int not null comment '系统ID',
    name varchar(64) not null comment '功能名称',
    description varchar(255) comment '功能描述',
    url varchar(255) not null comment '请求业务系统Url',
    http_method varchar(16) not null comment '提交请求的HttpMethod',
    content_type varchar(32) not null comment '请求Body的ContentType',
    author varchar(32) not null comment '功能创建者',
    create_time datetime not null comment '功能创建时间',
    update_time datetime not null comment '功能修改时间'
);
create index Idx_Function_ApplicationId on Function(application_id);


create table function_param(
	param_id int auto_increment primary key comment '功能参数Id',
    function_id int not null comment '功能Id',
    name varchar(32) not null comment '参数名称',
    type varchar(32) not null comment '参数类型：number, string, time',
	format varchar(32) comment '参数格式',
	is_array boolean not null comment '参数是否是多个',
	description varchar(255) comment '参数描述',
	default_value varchar(255) comment '默认值'
);

create table user(
	user_id int auto_increment primary key comment '用户ID',
    user_name varchar(32) not null comment '用户名',
    email varchar(32) comment '用户邮箱',
    password varchar(64) comment '用户密码，SSO登录时为空',
    role int not null comment '用户角色'
);

create table operation_log(
	log_id int auto_increment primary key comment '操作日志ID',
    user_id int not null comment '执行操作的用户ID',
    user_name varchar(32) not null comment '执行操作的用户名',
	function_id int not null comment '操作的功能ID',
    operate_time datetime comment '操作时间',
    request varchar(1024) comment '操作的请求参数',
    response varchar(1024) comment '操作的应答报文'
);
create index Idx_OperationLog_FunctionId on operation_log(function_id);
create index Idx_OperationLog_UserId on operation_Log(user_id);
