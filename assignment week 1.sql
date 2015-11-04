-- SQL Week 1 assignment - Rob Hodde - 10/28/2015

/*
1. Which destination in the flights database is the furthest distance away, based on information in the flights table.
Show the SQL query(s) that support your conclusion
*/

SELECT		origin, dest, distance  
FROM		flights  
ORDER BY	distance DESC  
LIMIT		1;    


/*
2. What are the different numbers of engines in the planes table? For each number of engines, which aircraft have
the most number of seats? Show the SQL statement(s) that support your result.

Note: I'm not seeing CTE capability in MySQL.
The following query gets us close, but does not account for the 'ties' - where various models all have the same number of seats
*/

SELECT		p.engines, p.manufacturer, p.model, ms.maxSeats
FROM		planes p,
			(SELECT engines, MAX(seats) maxSeats
			FROM planes
			GROUP BY engines) ms
WHERE		ms.engines = p.engines AND ms.maxSeats = p.seats
GROUP BY	p.engines;



-- 3. Show the total number of flights

SELECT		COUNT(1) 
FROM		flights;   


-- 4. Show the total number of flights by airline (carrier)

SELECT		carrier, COUNT(1) TotalFlights
FROM		flights
GROUP BY	carrier;


-- 5. Show all of the airlines, ordered by number of flights in descending order.

SELECT		f.carrier, MAX(a.name) CarrierName, COUNT(1) TotalFlights
FROM		flights f 
INNER JOIN	airlines a ON f.carrier = a.carrier
GROUP BY	carrier
ORDER BY	COUNT(1) DESC;


-- 6. Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order.

SELECT		f.carrier, MAX(a.name) CarrierName, COUNT(1) TotalFlights
FROM		flights f 
INNER JOIN	airlines a ON f.carrier = a.carrier
GROUP BY	carrier
ORDER BY	COUNT(1) DESC
LIMIT		5;


-- 7. Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of flights in descending order

SELECT		f.carrier, MAX(a.name) CarrierName, COUNT(1) TotalFlightsAtLeast1000Miles
FROM		flights f 
INNER JOIN	airlines a ON f.carrier = a.carrier
WHERE		f.distance >= 1000 
GROUP BY	carrier
ORDER BY	COUNT(1) DESC
LIMIT		5;


-- 8. Create a question that (a) uses data from the flights database, and (b) requires aggregation to answer it, and write down both the question, and the query that answers the question.

-- My question: "Which New York airport sends the most traffic into Miami?"

SELECT		a.faa AirportCode, MAX(a.Name) AirportName, COUNT(1) TotalFlightsToMiami
FROM		airports a
INNER JOIN	flights f ON a.faa = f.origin	
WHERE 		f.dest = 'MIA' 
GROUP BY 	a.faa
ORDER BY	COUNT(1) DESC
LIMIT		1;
