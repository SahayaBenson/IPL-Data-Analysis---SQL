--- 1. Create a table named 'matches' with appropriate data types for columns

create table matches (id int, city varchar(30), date date, player_of_match varchar(30), venue varchar(50),
					 neutral_venue int, team1 varchar(50), team2 varchar(50), toss_winner varchar(50), 
					 toss_decission varchar(10), winner varchar(50), results varchar(10), result_margin varchar(10),
					 eliminator varchar(10), methods varchar(10), umpire1 varchar(30), umpire2 varchar(30));
					 
--- 2. Create a table named 'deliveries' with appropriate data types for columns

create table deliveries (id int, inning int, overs int, ball int, batsman varchar(30), non_stricker varchar(30), 
						 bowler varchar(30), batsman_run int, extra_runs int, total_runs int, is_wicket int, 
						 dismissal_kind varchar(10), player_dismissed varchar(10), fielder varchar(10), extras_type varchar(10),
						 batting_team varchar(30), bowling_team VARCHAR(30));
						 
--- 3. Import data from CSV file 'IPL_matches.csv' attached in resources to 'matches'

alter table matches alter column venue type varchar(255); 
copy matches from 'C:\Program Files\PostgreSQL\14\data\Data_copy\IPL_matches.csv' delimiter ',' csv header;

--- 4. Import data from CSV file 'IPL_Ball.csv' attached in resources to 'deliveries'

alter table deliveries alter column fielder type varchar(50);
alter table deliveries alter column player_dismissed type varchar(50);
alter table deliveries alter column dismissal_kind type varchar(50);
copy deliveries from 'C:\Program Files\PostgreSQL\14\data\Data_copy\IPL_Ball.csv' delimiter ',' csv header;

--- 5. Select the top 20 rows from the deliveries table

select * from deliveries limit 20;

--- 6. Select the top 20 rows from the matches table

select * from matches limit 20;

--- 7. Fetch data of all the matches played on 2nd May 2013

select * from matches where date= '02-05-2013';

--- 8. Fetch data of all the matches where the margin of victory is more han 100 runs

alter table matches alter column result_margin type int using result_margin::integer;
SELECT * from matches where results='runs' and result_margin > 100;

--- 9. Fetch data of all the matches where the final scores of both teams tied and order it in descending order of the date
select * from matches where results='tie' order by date desc;
--- 10. Get the count of cities that have hosted an IPL match
select distinct count(*) from matches where city is not null;