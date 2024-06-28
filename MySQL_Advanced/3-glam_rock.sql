-- List bands with Glam rock as their main style, ranked by longevity
SELECT band_name, 
       YEAR(FROM_UNIXTIME(MAX(unix_timestamp(year_end, '2024')) - MIN(unix_timestamp(year_start, '2024')))) AS lifespan
FROM metal_bands
WHERE style LIKE '%Glam rock%'
GROUP BY band_name
ORDER BY lifespan DESC;
