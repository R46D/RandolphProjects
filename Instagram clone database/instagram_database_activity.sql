-- FINDING 5 OLDEST USERS

    SELECT username,created_at as 'JOINING DATE'
    FROM users
    ORDER BY created_at DESC
    LIMIT 5;
    
-- MOST POPULAR REGISTRATION DAY OF THE WEEK

    SELECT DAYNAME(created_at), COUNT(*) as 'NUMBER OF USERS'
    FROM users
    GROUP BY DAYNAME(created_at)
    ORDER BY COUNT(*)
    LIMIT 2;
    
-- IDENTIFY INACTIVE USERS

    SELECT username
    FROM users
    LEFT JOIN photos
        ON users.id=photos.user_id
    WHERE photos.id IS NULL;
    
-- IDENTIFY THE MOST POPULAR PHOTO

    SELECT username,photos.id,count(likes.created_at) as 'NUMBER OF LIKES'
    FROM users
    INNER JOIN photos 
        ON users.id=photos.user_id
    INNER JOIN likes
        ON photos.id=likes.photo_id
    GROUP by likes.photo_id
    ORDER BY count(likes.created_at) DESC
    LIMIT 1;
    
-- CALCULATE AVERAGE NUMBER OF POSTS PER USER

    SELECT (SELECT Count(*) 
            FROM   photos) / (SELECT Count(*) 
                              FROM   users) AS avg;
                              
-- FIVE MOST POPULAR HASHTAGS 

    SELECT tag_name, count(tag_id) AS TOTAL
    FROM tags
    INNER JOIN photo_tags 
        ON tags.id=photo_tags.tag_id
    GROUP by tags.id
    ORDER BY TOTAL DESC
    LIMIT 5;
    
-- FINDING BOTS (PEOPLE WHO HAVE LIKED EVERY PHOTO)  
    
    SELECT username,count(likes.user_id) as TOTAL
    FROM users
    INNER JOIN likes 
        ON users.id=likes.user_id
    GROUP BY likes.user_id
    HAVING TOTAL=(SELECT COUNT(*) from photos);
   
    