---FIRST VIEW; HOW DOES OUR DATA LOOK LIKE? WHAT ARE THE COLUMNS?---
SELECT *
FROM `shaped-infusion-456503-u0.trip_data.data-2024` 
LIMIT 1000;

---RIDEABLE TYPE COUNT BY MEMBER STATUS---
SELECT COUNT(rideable_type) AS count_type, rideable_type, member_casual
FROM `shaped-infusion-456503-u0.trip_data.data-2024`
GROUP BY member_casual, rideable_type;

---FIVE MOST COMMON START STATIONS---
SELECT COUNT(start_station_name) AS start_station_count, start_station_name
FROM `shaped-infusion-456503-u0.trip_data.data-2024`
WHERE start_station_name!= "NA"
GROUP BY start_station_name
ORDER BY start_station_count DESC
LIMIT 5;

---FIVE MOST COMMON END STATIONS---
SELECT COUNT(end_station_name) AS end_station_count, end_station_name
FROM `shaped-infusion-456503-u0.trip_data.data-2024`
WHERE end_station_name!= "NA"
GROUP BY end_station_name
ORDER BY end_station_count DESC
LIMIT 5; 


--HOW DO THE START AND END STATIONS DIFFER AMONG USER TYPES?---
---What are the top five start stations for casual riders?---
SELECT COUNT(start_station_name) AS start_station_count,start_station_name, member_casual
FROM `shaped-infusion-456503-u0.trip_data.data-2024`
WHERE start_station_name!= "NA" AND member_casual= "casual"
GROUP BY start_station_name, member_casual
ORDER BY start_station_count DESC
LIMIT 5; 


---HOW DO THE START AND END STATIONS DIFFER AMONG USER TYPES?---
---What are the top five end stations for casual riders?---
SELECT COUNT(end_station_name) AS end_station_count,end_station_name, member_casual
FROM `shaped-infusion-456503-u0.trip_data.data-2024`
WHERE end_station_name!= "NA" AND member_casual= "casual"
GROUP BY end_station_name, member_casual
ORDER BY end_station_count DESC
LIMIT 5; 


---What are the top five start stations for members?---
SELECT COUNT(start_station_name) AS start_station_count,start_station_name, member_casual
FROM `shaped-infusion-456503-u0.trip_data.data-2024`
WHERE start_station_name!= "NA" AND member_casual= "member"
GROUP BY start_station_name, member_casual
ORDER BY start_station_count DESC
LIMIT 5; 


---What are the top five end stations for members?---
SELECT COUNT(end_station_name) AS end_station_count,end_station_name, member_casual
FROM `shaped-infusion-456503-u0.trip_data.data-2024`
WHERE end_station_name!= "NA" AND member_casual= "member"
GROUP BY end_station_name, member_casual
ORDER BY end_station_count DESC
LIMIT 5; 


---WHAT ARE THE COMPLIMENTARY START-END STATIONS FOR DIFFERENT USERS---
SELECT COUNT(end_station_name) AS end_station_count,end_station_name, COUNT(start_station_name) AS start_station_count,start_station_name, member_casual
FROM `shaped-infusion-456503-u0.trip_data.data-2024`
WHERE end_station_name!= "NA"
GROUP BY end_station_name,start_station_name, member_casual
ORDER BY end_station_count DESC, start_station_count DESC
LIMIT 10; 
