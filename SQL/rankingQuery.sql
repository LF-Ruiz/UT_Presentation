-- Comprobations
-- SELECT * FROM ranking
-- order by wranking, year;

-- Select * from universities
-- WHERE institution = 'Harvard University'
-- order by institution


SELECT institution,
		wranking,
		nranking,
		year,
		city,
		state,
		zip
FROM ranking r
INNER JOIN universities u
ON r.i_id = id
INNER JOIN loc l
ON r.i_id = l.i_id
ORDER BY wranking, year;