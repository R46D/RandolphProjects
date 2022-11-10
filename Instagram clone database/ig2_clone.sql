/* creating first the database */

CREATE database instagram_clone;
USE instagram_clone;

/* now creating the users schema */

CREATE TABLE users
    ( id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      username VARCHAR(255) UNIQUE NOT NULL,
      created_at TIMESTAMP DEFAULT NOW()
    );

/* creating the phothos schema */

 CREATE TABLE photos
     ( id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
       user_id INT NOT NULL,
       image_url VARCHAR(255) UNIQUE NOT NULL,
       created_at TIMESTAMP DEFAULT NOW(),
       FOREIGN KEY(user_id) REFERENCES users(id)
     );

/* creating the comments schema */

 CREATE TABLE comments
     ( id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
       user_id INT NOT NULL,
       photo_id INT NOT NULL,
       comment_text VARCHAR(255) NOT NULL,
       created_at TIMESTAMP DEFAULT NOW(),
       FOREIGN KEY(user_id) REFERENCES users(id),
       FOREIGN KEY(photo_id) REFERENCES photos(id)
     );

/* creating the likes schema */

 CREATE TABLE likes
     ( user_id INT NOT NULL,
       photo_id INT NOT NULL,
       liked_at TIMESTAMP DEFAULT NOW(),
       FOREIGN KEY(user_id) REFERENCES users(id),
       FOREIGN KEY(photo_id) REFERENCES photos(id),
       PRIMARY KEY(user_id,photo_id)
     );

/* creating the follows schema */

 CREATE TABLE follows 
     (  follower_id INTEGER NOT NULL,
        followee_id INTEGER NOT NULL,
        created_at TIMESTAMP DEFAULT NOW(),
        FOREIGN KEY(follower_id) REFERENCES users(id),
        FOREIGN KEY(followee_id) REFERENCES users(id),
        PRIMARY KEY(follower_id, followee_id)
    );


/* creating hashtags schema */
 
 CREATE TABLE tags 
    ( id INTEGER AUTO_INCREMENT PRIMARY KEY,
      tag_name VARCHAR(255) UNIQUE,
      created_at TIMESTAMP DEFAULT NOW()
    );
 CREATE TABLE photo_tags 
    (   photo_id INTEGER NOT NULL,
        tag_id INTEGER NOT NULL,
        FOREIGN KEY(photo_id) REFERENCES photos(id),
        FOREIGN KEY(tag_id) REFERENCES tags(id),
        PRIMARY KEY(photo_id, tag_id)
    );
