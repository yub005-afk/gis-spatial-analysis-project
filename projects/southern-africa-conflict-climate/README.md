# Conflict Events Across Climate Zones in Southern Africa

A spatial analysis and cartographic project completed for **GPEC 443**, examining recorded conflict events across Köppen–Geiger climate zones in **South Africa, Namibia, and Botswana**.

![Conflict events across climate zones](maps/southern_africa_conflict_climate.jpeg)

## Project overview

This project combines R-based data preparation with QGIS spatial analysis to map conflict events and summarize their distribution across climate zones. The processed event dataset contains **2,928 records spanning 1989–2025**. The climate-zone summary accounts for all 2,928 records.

## Methods and skills

- Filtered conflict-event data by country using R, `readr`, and `dplyr`.
- Checked coordinate completeness and exported individual event records for QGIS.
- Combined administrative boundaries, climate zones, and conflict-event locations.
- Used spatial overlays and aggregation to summarize events by climate zone.
- Designed a map with a legend, scale bar, geographic context, and source attribution.

## Selected results

| Climate zone | Recorded events |
|---|---:|
| Cfa — Temperate, no dry season, hot summer | 1,242 |
| Cwb — Temperate, dry winter, warm summer | 825 |
| Cfb — Temperate, no dry season, warm summer | 412 |

The dataset is dominated by events recorded in South Africa: 2,908 records, compared with 19 in Namibia and 1 in Botswana.

These descriptive counts are not adjusted for population, land area, or reporting coverage and do not establish a causal relationship between climate and conflict. The summary tables list climate zones with recorded events. The map legend also includes Aw, which is absent from the summary tables; whether to include an explicit zero row remains to be confirmed.

## Repository contents

- `maps/`: Final map export.
- `code/`: R scripts for country filtering, coordinate checks, and event export.
- `data/processed/`: Climate-zone summary tables.
- `qgis/`: Original QGIS project file and dependency notes.
- `DATA_SOURCES.md`: Source provenance, publication status, and required local inputs.

## Reproducibility

Install `readr` and `dplyr`, then run the scripts from this project directory:

```r
source("code/02_filter_conflict_data.R")
source("code/03_export_conflict_points.R")
```

Both scripts expect the original conflict dataset at `data/raw/GEDEvent_v26_1.csv`. Script 03 writes `data/processed/conflict_points_3countries.csv` and validates the expected 2,928 records. The source dataset and event-level export are excluded from this portfolio package.

The R scripts cover event preparation. Spatial overlays, aggregation, and map layout were completed in QGIS and are not automated by these scripts. The included QGIS project requires external files and path repair; see [QGIS dependency notes](qgis/README.md).

## Data sources and publication status

Sources are UCDP GED v26.1, Köppen–Geiger climate classification, and GADM v4.1. Exact climate-data provenance and redistribution terms remain to be verified. Original datasets and intermediate spatial layers are excluded. Third-party data are subject to their respective source terms; no blanket data license is asserted here. See [data source notes](DATA_SOURCES.md).
