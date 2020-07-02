-- Create database
set hive.cli.print.current.db = true;
create database stackoverflow;
use stackoverflow;

--  Created exernal table posts
create external table posts(postid bigint, posttype_id int,created datetime, score int, viewcount int, owneruserid int, title string, answercount int,commentcount int)
row format delimited
fields terminated by ','
stored as textfile
location '/user/edureka_85838/posts';

--Created external table posttypes
create external table posttypes(posttype_id int, posttype_name string)
row format delimited
fields terminated by ','
stored as textfile
location '/user/edureka_85838/posttypes';

-- Created external table comments
create external table comments(comments_id bigint, userid bigint)
row format delimited
fields terminated by ','
stored as textfile
location '/user/edureka_85838/comments';

-- Created external table users
create external table users(userid bigint,reputation int, displayname string, loc string, age int)
row format delimited
fields terminated by ','
stored as textfile
location '/user/edureka_85838/users';


-- A. Find the display name and no. of posts created by the user who has got maximum reputation.
select u.displayname, u.reputation, Count(*) as count from users u join posts p on u.userid = p.owneruserid group by u.displayname,u.reputation order by u.reputation desc limit 1;

--B. Find the average age of users on the Stack Overflow site.
select avg(age) from users;

--C. Find the display name of user who posted the oldest post on Stack Overflow (in terms of date).
select u.displayname, p.created from users u join posts p on u.userid = p.owneruserid group by u.displayname,p.created order by p.created limit 1;

--D. Find the display name and no. of comments done by the user who has got maximum reputation.
select u.displayname, u.reputation, Count(*) as count from users u join comments c on u.userid = c.userid group by u.displayname,u.reputation order by u.reputation desc limit 1;

