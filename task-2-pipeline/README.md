# Task 2: Data Pipeline — Open-Meteo to BigQuery

## What This Pipeline Does
Fetches 7-day weather forecast data for Chennai from the Open-Meteo API,
transforms it into a clean analytical format, and loads it into BigQuery
for querying.

## Why Open-Meteo
- Free, no API key required — zero setup friction
- Returns clean structured JSON — ideal for demonstrating transformation logic
- Weather data has a natural marketing relevance — campaign performance
  can correlate with weather patterns (outdoor events, seasonal products etc.)

## How to Run
1. Open `pipeline.ipynb` in Google Colab
2. Run all cells in order
3. When Cell 5 prompts authentication, sign in with your Google account
4. Data will load into BigQuery automatically

## Parameters You Can Change
| Parameter | Default | Description |
|---|---|---|
| city | Chennai | City name label |
| latitude | 13.0827 | Latitude coordinate |
| longitude | 80.2707 | Longitude coordinate |
| days | 7 | Number of forecast days |

## BigQuery Setup
- Platform: BigQuery Sandbox (free, no billing required)
- Project ID: `carbide-cairn-357503`
- Dataset: `weather_pipeline`
- Table: `chennai_forecast`

## Schema
| Field | Type | Description |
|---|---|---|
| date | DATE | Forecast date |
| city | STRING | City name |
| temp_max_c | FLOAT | Max temperature (°C) |
| temp_min_c | FLOAT | Min temperature (°C) |
| apparent_temp_max_c | FLOAT | Feels-like max temp (°C) |
| apparent_temp_min_c | FLOAT | Feels-like min temp (°C) |
| precipitation_mm | FLOAT | Total precipitation (mm) |
| windspeed_max_kmh | FLOAT | Max wind speed (km/h) |
| temp_range_c | FLOAT | Derived: max minus min temp |
| feels_like_delta | FLOAT | Derived: apparent minus actual max temp |
| heat_stress | STRING | Derived: High / Moderate / Low |
| ingested_at | STRING | Pipeline run timestamp |

## Derived Fields
- **temp_range_c** — daily temperature swing; useful for identifying
  volatile weather days
- **feels_like_delta** — difference between how hot it feels vs actual
  temperature; a direct human comfort signal
- **heat_stress** — categorical label derived from feels_like_delta:
  High (>3°C), Moderate (>1°C), Low (≤1°C)

## SQL Summary Query
Located in `summary_query.sql`. Sample output:

| heat_stress | days_count | avg_max_temp | avg_temp_range | avg_feels_like_delta |
|---|---|---|---|---|
| High | 7 | 37.99 | 9.71 | 6.56 |

## Production Thinking

### How would you schedule this pipeline to run automatically?
Use **Google Cloud Scheduler** to trigger a **Cloud Function** or
**Cloud Run job** on a daily schedule (e.g. 6am IST). The function
runs the pipeline script and loads fresh data into BigQuery.
Alternatively, Apache Airflow with a DAG on a daily interval works
well if the team already uses it.

### How would you know if it failed?
- The script uses Python logging throughout — logs can be
