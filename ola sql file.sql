create database Ola;
use Ola;

-- 1. Retrieve all successful bookings:
SELECT * from bookings1
where Booking_Status = 'Success';

-- 1. Retrieve all successful bookings:
SELECT * FROM Successful_Bookings;

-- 2. Find the average ride distance for each vehicle type:
Create view ride_distance_for_each_vehicle As 
SELECT 
    Vehicle_Type, AVG(Ride_Distance) AS avg_distance
FROM
    bookings1
GROUP BY Vehicle_Type;

-- 2. Find the average ride distance for each vehicle type:
select * from ride_distance_for_each_vehicle ;

-- 3. Get the total number of cancelled rides by customers:
Create view canceled_rides_by_customers As
SELECT count(*) from Bookings1 where Booking_Status = "Canceled by Customer";

-- 3. Get the total number of cancelled rides by customers:
select * from canceled_rides_by_customers;

-- 4. List the top 5 customers who booked the highest number of rides:
create View top_5_customers As
SELECT Customer_ID, count(Booking_ID) as total_rides
from bookings1
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;

-- 4. List the top 5 customers who booked the highest number of rides:
select * from top_5_customers;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Create View Rides_Canceled_by_Drivers_P_C_Issue As
SELECT count(*) from bookings1
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

select * from Rides_Canceled_by_Drivers_P_C_Issue ;

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view Max_Min_Driver_Rating As
SELECT MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
from bookings1 where Vehicle_Type = 'Prime sedan';

select * from Max_Min_Driver_Rating ;
 
-- 7. Retrieve all rides where payment was made using UPI:
create view UPI_Payment As
SELECT * from bookings1
where Payment_Method = 'UPI';

select * from UPI_Payment ;

-- 8. Find the average customer rating per vehicle type:
create view AVG_Cust_Rating As
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating
from bookings1
GROUP by Vehicle_Type;

select * from AVG_Cust_Rating;

-- 9. Calculate the total booking value asof rides completed successfully:
create view total_Successful_ride_value As
SELECT SUM(Booking_Value) as total_Successful_ride_value
from bookings1
where Booking_Status ='Success';

select * from total_Successful_ride_value;

-- 10. List all incomplete rides along with the reason: 
create view Incomplete_Rides_Reason As
SELECT Booking_ID, Incomplete_Rides_Reason
from bookings1
where Incomplete_Rides = 'Yes';

select * from Incomplete_Rides_Reason ;
