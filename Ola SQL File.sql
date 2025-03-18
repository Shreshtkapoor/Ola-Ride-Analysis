Create Database Ola;
Use Ola;
select * from bookings

# 1. Retrieve all successful bookings:
Create view Successful_Booking As
SELECT * FROM BOOKINGS
WHERE Booking_Status = 'Success'

SELECT * FROM Successful_Booking 


# 2. Find the average ride distance for each vehicle type:
CREATE VIEW ride_distance_for_each_vehicle AS
SELECT Vehicle_Type, AVG(Ride_Distance)
FROM BOOKINGS
GROUP BY Vehicle_Type

SELECT * FROM ride_distance_for_each_vehicle

# 3. Get the total number of cancelled rides by customers:
CREATE VIEW Canceled_Rides_by_Customer As
SELECT COUNT(Canceled_Rides_by_Customer) 
FROM BOOKINGS

SELECT * FROM Canceled_Rides_by_Customer
select * from Bookings
# 4. List the top 5 customers who booked the highest number of rides:
CREATE VIEW Top_5_Customers AS
SELECT Customer_ID, COUNT(Booking_ID) as Total_Rides
FROM BOOKINGS 
GROUP BY Customer_ID
ORDER BY Total_Rides DESC LIMIT 5

SELECT * FROM Top_5_Customers

# 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
CREATE VIEW rides_cancelled_by_drivers AS
SELECT COUNT(Canceled_Rides_by_Driver) 
FROM Bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue'

SELECT * FROM rides_cancelled_by_drivers

# 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE VIEW Max_min_Driver_Ratings AS
SELECT MAX(Driver_Ratings) as Max_Rating,
Min(Driver_Ratings) as Min_Rating
FROM BOOKINGS WHERE Vehicle_Type = "Prime Sedan"

SELECT * FROM Max_min_Driver_Ratings

# 7. Retrieve all rides where payment was made using UPI:
CREATE VIEW Payment_Made_by_UPI AS
SELECT * FROM BOOKINGS
WHERE Payment_Method = 'UPI'

SELECT * FROM Payment_Made_by_UPI

# 8. Find the average customer rating per vehicle type:
CREATE VIEW Avg_Cust_Rat_by_Vehicl_Type AS
SELECT Vehicle_Type, AVG(Customer_Rating) As Avg_Customer_Rating
FROM Bookings
GROUP BY Vehicle_Type

SELECT * FROM Avg_Cust_Rat_by_Vehicl_Type

# 9. Calculate the total booking value of rides completed successfully:
CREATE VIEW Total_Booking_Value_of_Successfull_Rides AS
SELECT SUM(Booking_Value)
FROM Bookings
WHERE Booking_Status = 'Success'

SELECT * FROM Total_Booking_Value_of_Successfull_Rides

# 10. List all incomplete rides along with the reason:
CREATE VIEW Incomplete_Rides_Reason AS
SELECT Booking_ID, Incomplete_Rides_Reason 
FROM Bookings 
Where Incomplete_Rides = 'Yes'

SELECT * FROM Incomplete_Rides_Reason