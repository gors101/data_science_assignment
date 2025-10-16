/*1. 每天新注册用户数量*/
select signup_date, count(*)
from users_n_events.users
group by signup_date
order by signup_date ASC;


/*2. 最近七天每天活跃用户数*/
select DATE(timestamp), count(distinct user_id) as most_active_user_count
from
	(select *
	from users_n_events.events
	where timestamp <= 
		(select max(timestamp)
		from users_n_events.events)
	and timestamp >= 
		(select max(DATE(timestamp)) - interval 6 day
		from users_n_events.events)
	order by timestamp desc
    ) as latest_7_days
group by DATE(timestamp);

/*3. 查询每个用户的时间总数和最常见的事件类型*/
/*创建一个temp table用来储存每个用户每种活动的次数*/
create table temp as select user_id, event_type, count(*) as type_count
	from users_n_events.events
	group by user_id, event_type;


select 
	temp.user_id, 
    /*把不止一个的活动类型组合在一起*/
	group_concat(temp.event_type, '') as most_active_type,
	total_events.event_count
from 
	temp
/*这个表包含了每个用户最常活动的活动次数（仅包含次数不包含活动类型）*/
inner join 
	(select user_id, max(type_count) as max_count
	from temp
	group by user_id) as max_event
	on max_event.user_id = temp.user_id and max_event.max_count = temp.type_count
    
/*此表包含了每个用户的时间总数*/
inner join 
	(select user_id, count(user_id) as event_count
	from users_n_events.events
	group by user_id) as total_events
	on total_events.user_id = temp.user_id
group by temp.user_id;
/*删除temp table*/
drop table temp;

/*4. 查询男性与女性用户的平均事件数是否有差异*/
select gender, avg(event_count)
from
	(select users.user_id, users.gender, event_count
	from
		(select user_id, count(user_id) as event_count
			from users_n_events.events
			group by user_id) as total_event_count
	inner join users_n_events.users
	on users.user_id = total_event_count.user_id) as joint_table
group by gender
