# Question 1
Select Distinct flight, origin, dest, distance 
From flights.flights
Where distance in (Select max(distance) From flights.flights);

#Question 2
Select engines, max(seats), manufacturer
From flights.planes
Group by engines
Order by engines;

#Question 3
Select count(*)
From flights;

#Question 4
Select carrier, count(*)
From flights
Group by carrier;

#Question 5
Select carrier, count(*) countflights
From flights
Group by carrier
Order by countflights Desc;

#Question 6
Select carrier, count(*) countflights
From flights
Group by carrier
Order by countflights Desc Limit 5;

#Question 7
Select carrier, count(*) countflights
From flights
Where distance >= 1000
Group by carrier
Order by countflights Desc Limit 5;

#Question 8
# Q: What is the average temperature for the month of may?
#(Round to the nearest decimal)
# Answer:
Select round(avg(temp), 1) avgtemp
From weather
Where month = 5;