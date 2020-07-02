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