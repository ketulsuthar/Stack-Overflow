-- Create database
set hive.cli.print.current.db = true;
create database stackoverflow;
use stackoverflow;

--  Created exernal table posts
create external table posts(postid bigint, posttype_id int,created date, score int, viewcount int, owneruserid int, title string, answercount int,commentcount int)
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

