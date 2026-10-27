# QGIS project dependencies

`Assignment2 Map.qgz` is an unchanged copy of the original project. It is included to document project organization and styling. It is not a self-contained map package.

The original project was stored in `data/processed/` and references:

- `../boundaries/gadm41_BWA.gpkg`, `gadm41_NAM.gpkg`, and `gadm41_ZAF.gpkg` (administrative levels 0 and 1).
- `../Merged_level_0_Admin.gpkg`.
- `../../koppen-geiger-fixed.shp` and its companion files.
- Files beside the original project: `clipped_three countries.gpkg`, `conflict_count.gpkg`, `conflict_points_3countries.csv`, `intersects.gpkg`, `kg_dissolved_by_climate.gpkg`, `outside_climate.gpkg`, and `study_area_dissolved.gpkg`.

Those files are excluded from this package. Moving the project to `qgis/` changes the base for its relative paths. Obtain the required data under the applicable terms and relink layers in QGIS, or open the original project in its original local folder. Renaming or moving the QGZ alone does not restore its dependencies.

Use the JPEG in `../maps/` to view the final map without restoring the QGIS environment.
