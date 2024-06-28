-- 2-fans.sql

-- Ensure we are using the correct database
USE holberton;

-- Rank country origins by number of fans
SELECT origin, SUM(nb_fans) AS nb_fans
FROM metal_bands
GROUP BY origin
ORDER BY nb_fans DESC;
