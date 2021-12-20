
SELECT u.institution AS "University",
	state AS "State",
	wranking AS "World Ranking",
	nranking AS "National Ranking",
	year AS "Year",
	CASE
		WHEN wranking > 0
			AND wranking <= 5 THEN 10
		WHEN wranking > 5
			AND wranking <= 10 THEN 9
		WHEN wranking > 10
			AND wranking <= 50 THEN 8
		WHEN wranking > 50
			AND wranking <= 100 THEN 7
		WHEN wranking > 100
			AND wranking <= 200 THEN 6
		WHEN wranking > 200 
			AND wranking <= 400 THEN 5
		WHEN wranking > 400
			AND wranking <= 750 THEN 4
		ELSE 3
	END "Coeficient" 
FROM ranking r
INNER JOIN loc l
ON r.i_id = l.i_id
INNER JOIN universities u
ON l.i_id = u.id
ORDER BY wranking, year, state;