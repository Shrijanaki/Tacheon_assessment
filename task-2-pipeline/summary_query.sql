-- Summary: Weekly heat stress distribution and average temperature range
-- Project: carbide-cairn-357503
-- Table: weather_pipeline.chennai_forecast

SELECT
    heat_stress,
    COUNT(*) AS days_count,
    ROUND(AVG(temp_max_c), 2) AS avg_max_temp,
    ROUND(AVG(temp_min_c), 2) AS avg_min_temp,
    ROUND(AVG(temp_range_c), 2) AS avg_temp_range,
    ROUND(AVG(feels_like_delta), 2) AS avg_feels_like_delta
FROM `carbide-cairn-357503.weather_pipeline.chennai_forecast`
GROUP BY heat_stress
ORDER BY days_count DESC;
