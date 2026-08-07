/*
 Could do creating tiers, but I'd need to go back to the notes/slides and add some examples.GROUP BY
 
 SELECT 
 CASE 
 WHEN duration_in_minutes < 100 THEN 'Short Feature (Under 1h 40m)'
 WHEN duration_in_minutes BETWEEN 100 AND 150 THEN 'Standard Runtime'
 ELSE 'Epic / Long Feature (Over 2h 30m)'
 END AS runtime_category,
 COUNT(*) AS total_count,
 ROUND((COUNT(*)::NUMERIC / (SELECT COUNT(*) FROM movies) * 100), 1) || '%' AS percentage_of_collection
 FROM movies
 GROUP BY runtime_category
 ORDER BY total_count DESC;
 
 */