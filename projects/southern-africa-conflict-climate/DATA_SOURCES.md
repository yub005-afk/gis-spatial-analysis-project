# Data sources and publication notes

| Source | Local input | Status |
|---|---|---|
| UCDP GED v26.1 | `data/raw/GEDEvent_v26_1.csv` | Original CSV excluded. Confirm exact release provenance, citation, and redistribution conditions before publishing event-level extracts. |
| Köppen–Geiger climate classification | `koppen-geiger-fixed.shp` and companion files | Original source, version, and license unverified. Source and derived spatial layers excluded pending verification. |
| GADM v4.1 | `data/boundaries/gadm41_BWA.gpkg`, `gadm41_NAM.gpkg`, `gadm41_ZAF.gpkg` | Original boundary files excluded. Verify applicable terms before redistributing boundaries or derived spatial files. |

The final map and aggregate tables are staged as portfolio candidates for review. Inclusion in this local package does not establish redistribution permission. Check source attribution and applicable terms before public release; do not apply a blanket repository license to third-party data.

No final report PDF was located in the inspected Assignment 2 Data folder. The Koubi (2019) PDF is a reference article and is excluded.

The original QGIS project expects source and derived files in the original Assignment 2 Data directory structure. See `qgis/README.md` for its file dependencies.
