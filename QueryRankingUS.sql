
SELECT u.institution AS University,
	state AS state,
	wranking AS "World Ranking",
	nranking AS "National Ranking",
	year AS "Year"
FROM ranking r
INNER JOIN loc l
ON r.i_id = l.i_id
INNER JOIN universities u
ON l.i_id = u.id
WHERE wranking < 300
ORDER BY wranking, year, state;