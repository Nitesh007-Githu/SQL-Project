create database SQL_exam;
use SQL_exam;
select * from actor;
select * from cast;
select * from director;
select * from genres;
select * from movie;
select * from movie_direction;
select * from movie_genres;
select * from ratings;
select * from reviewer;

/*
 Q1 . Write a query where it should contain all the data of the movies which were released after 1995 having their movie 
 duration greater than 120 and should be including A in their movie title.
*/
-- Answer
SELECT 
    *
FROM
    movie
WHERE
    mov_year > 1995 AND mov_time > 120
        AND mov_title LIKE '%a%';
        
/*
Q2 . Write an SQL query to find the actors who played a role in the movie 'Chinatown'. Fetch all the fields of actor table. 
(Hint: Use the IN operator)
*/
-- Answer 
 SELECT 
    *
FROM
    actor
        JOIN
    cast ON actor.act_id = cast.act_id
        JOIN
    movie ON cast.mov_id = movie.mov_id
WHERE
    mov_title = 'chinatown';   
    
/*
Q3 . Write an SQL query for extracting the data from the ratings table for the movie who got the maximum number of ratings.
*/
-- Answer
SELECT 
    *
FROM
    ratings
WHERE
    num_o_ratings = (SELECT 
            MAX(num_o_ratings)
        FROM
            ratings);

/*
Q4 . Write an SQL query to determine the Top 7 movies which were released in United Kingdom. Sort the data in ascending order of the movie year.
*/
-- Answer
SELECT 
    *
FROM
    movie
WHERE
    mov_rel_country = 'UK'
ORDER BY mov_year ASC
LIMIT 7;

/*
Q5 . Set the language of movie language as 'Chinese' for the movie which has its existing language as Japanese and their movie year was 2001.
*/
-- Answer
UPDATE movie 
SET 
    mov_lang = 'Chinese'
WHERE
    mov_lang = 'Japanese'
        AND mov_year = 2001;

-- To Check 
SELECT 
    *
FROM
    movie;

/*
Q6 . Print genre title, maximum movie duration and the count the number of movies in each genre.
*/
-- Answer
SELECT 
    genres.gen_title,
    MAX(mov_time) AS maximum_movie_duration,
    COUNT(*) AS count_movies
FROM
    genres
        JOIN
    movie_genres ON genres.gen_id = movie_genres.gen_id
        JOIN
    movie ON movie_genres.mov_id = movie.mov_id
GROUP BY gen_title; 

/*
Q7 . Create a view which should contain the first name, last name, title of the movie & role played by particular actor.
*/
-- Answer
CREATE VIEW actor_roles AS
    SELECT 
        actor.act_fname, actor.act_lname, movie.mov_title, cast.role
    FROM
        actor,
        cast,
        movie
    WHERE
        actor.act_id = cast.act_id
            AND cast.mov_id = movie.mov_id;

/*
Q8 . Display the movies that were released before 31st March 1995. 
*/
-- Answer
SELECT 
    *
FROM
    movie
WHERE
    mov_year < 1995
        OR (mov_year < 1995
        AND mov_dt_rel < 3 / 31 / 1995);            
            
/* 
Q9 . Write a query which fetch the first name, last name & role played by the actor where output should all exclude Male actors. 
*/
-- Answer
SELECT 
    actor.act_fname, act_lname, cast.role
FROM
    actor
        JOIN
    cast ON actor.act_id = cast.act_id
WHERE
    act_gender <> 'm';

/*
Q10 . Insert five rows into the cast table where the ids for movie should be 936,939,942,930,941 and their respective roles should be Darth 
Vader, Sarah Connor, Ethan Hunt, Travis Bickle, Antoine Doinel & their actor ids should be set up as 126,140,135,131,144.    
*/
-- Answer
insert into cast (mov_id,act_id,role) values 
(936, 126, "Darth Vader"),
(939, 140, "Sarah Connor"),
(942, 135, "Ethan Hunt"),
(930, 131, "Travis Bickle"),
(941, 144, "Antoine Doinel");
