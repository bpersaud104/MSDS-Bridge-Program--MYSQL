# I created a database(schema) called videos

# Question 1
Drop Table if Exists Videos;
Create Table Videos
(
  Video_id int Primary Key,
  Title varchar(50) Not Null,
  Length int Not Null,
  URL varchar(50) Not null
);
Insert into Videos(video_id, title, length, url) Values(100, 'How to Install MySQL on Windows 10', 24, 'https://www.youtube.com/watch?v=WuBcTJnIuzo');
Insert into Videos(video_id, title, length, url) Values(200, 'How to Install MySQL Server on Windows', 14, 'https://www.youtube.com/watch?v=UgHRay7gN1g');
Insert into Videos(video_id, title, length, url) Values(300, 'How to create a MySQL Database', 17, 'https://www.youtube.com/watch?v=K6w0bZjl_Lw');
Select *
From Videos;

# Question 2
Drop Table If Exists Reviews;
Create Table Reviews
(
  Review_id int Primary Key,
  Video_id int Not Null References Videos,
  Users_name varchar(20) Not Null,
  Rating int, # Ratings are from 1 to 5
  Text_review varchar(40) Not null
);
Insert Into Reviews(review_id, video_id, users_name, rating, text_review) Values(1, 100, 'Alexis', 5, 'Very helpful!');
Insert Into Reviews(review_id, video_id, users_name, rating, text_review) Values(2, 100, 'Colin', 3, 'At least it worked for me');
Insert Into Reviews(review_id, video_id, users_name, rating, text_review) Values(3, 200, 'George', 1, 'Did not work for me!');
Insert Into Reviews(review_id, video_id, users_name, rating, text_review) Values(4, 200, 'Bart', 5, 'Really great video!');
Insert Into Reviews(review_id, video_id, users_name, rating, text_review) Values(5, 300, 'Emma', 4, 'Thanks');
Insert Into Reviews(review_id, video_id, users_name, rating, text_review) Values(6, 300, 'Tiffany', 2, 'Not helpful at all');
Select *
From Reviews;  

# Question 3
Select *
From Videos 
Join Reviews
Using(video_id); 
