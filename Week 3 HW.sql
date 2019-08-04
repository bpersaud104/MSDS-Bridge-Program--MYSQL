# I have created a new schema(database) called keycards and have set it to default
Create Schema If Not Exists Keycards;
Use Keycards;

# Create a table for the users
Drop Table If Exists Users;
Create Table Users
(
	User_id int Primary Key,
    Users_name varchar(20) Not Null
);
Insert Into Users(user_id, users_name) Values(1, 'Modesto');
Insert Into Users(user_id, users_name) Values(2, 'Ayine');
Insert Into Users(user_id, users_name) Values(3, 'Christohper');
Insert Into Users(user_id, users_name) Values(4, 'Cheng Woo');
Insert Into Users(user_id, users_name) Values(5, 'Saulat');
Insert Into Users(user_id, users_name) Values(6, 'Heidy');
Select *
From Users;

# Create a table for the groups
Drop Table If Exists Table_Groups;
Create Table Table_Groups
(
	Group_id int Primary Key,
    Group_name varchar(20) Not Null
);
Insert Into Table_Groups(group_id, group_name) Values(10, 'I.T'); 
Insert Into Table_Groups(group_id, group_name) Values(20, 'Sales');
Insert Into Table_Groups(group_id, group_name) Values(30, 'Administration');
Insert Into Table_Groups(group_id, group_name) Values(40, 'Operations');
Select *
From Table_Groups;

# Create a table for the rooms
Drop Table If Exists Rooms;
Create Table Rooms
(
	Room_id int Primary Key,
    Room_name varchar(20) Not Null
);
Insert Into Rooms(room_id, room_name) Values(100, '101');
Insert Into Rooms(room_id, room_name) Values(200, '102');
Insert Into Rooms(room_id, room_name) Values(300, 'Auditorium A');
Insert Into Rooms(room_id, room_name) Values(400, 'Auditorium B');
Select *
From Rooms;

# Create a table showing each users in their assigned groups
Drop Table If Exists Users_Groups;
Create Table Users_Groups
(
	User_id int References Users,
    Group_id int References Table_Groups
);
Insert Into Users_Groups(user_id, group_id) Values(1, 10);
Insert Into Users_Groups(user_id, group_id) Values(2, 10);
Insert Into Users_Groups(user_id, group_id) Values(3, 20);
Insert Into Users_Groups(user_id, group_id) Values(4, 20);
Insert Into Users_Groups(user_id, group_id) Values(5, 30);
Insert Into Users_Groups(user_id, group_id) Values(6, Null);
Insert Into Users_Groups(user_id, group_id) Values(Null, 40);
Select *
From Users_Groups;

# Create a table showing the rooms each group has access to
Drop Table If Exists Room_Access;
Create Table Room_Access
(
	Room_id int References Rooms,
    Group_id int References Table_Groups
);
Insert Into Room_Access(room_id, group_id) Values(100, 10);
Insert Into Room_Access(room_id, group_id) Values(200, 10);
Insert Into Room_Access(room_id, group_id) Values(200, 20);
Insert Into Room_Access(room_id, group_id) Values(300, 20);
Insert Into Room_Access(room_id, group_id) Values(Null, 30);
Insert Into Room_Access(room_id, group_id) Values(400, Null);
Select *
From Room_Access;

# Select Statement showing all groups and users in each group
Select U.user_id As 'ID', U.users_name As 'Name', TG.group_name As 'Group'
From Users_Groups As UG
Left Join Users As U  
On U.user_id = UG.user_id
Left Join Table_Groups As TG
On TG.group_id = UG.group_id;

# Select Statement showing all rooms and groups assigned to each room
Select R.room_id As 'ID', R.room_name As 'Room', TG.group_name As 'Group'
From Room_Access As RA
Right Join Rooms As R
On R.room_id = RA.room_id
Left Join Table_Groups As TG
On TG.group_id = RA.group_id;

# Select statement showing all users, the groups they belong to, and the rooms to which they are assigned
Select U.user_id As 'ID', U.users_name As 'Name', TG.group_name As 'Group', R.room_name As 'Room'
From Users As U
Left Join Users_Groups As UG
On U.user_id = UG.user_id
Left Join Table_Groups As TG
On TG.group_id = UG.group_id
Left Join Room_Access As RA
On TG.group_id = RA.group_id
Left Join Rooms As R
On R.room_id = RA.room_id
Group by U.user_id, TG.group_id, R.room_id
Order by U.users_name, TG.group_name, R.room_name  