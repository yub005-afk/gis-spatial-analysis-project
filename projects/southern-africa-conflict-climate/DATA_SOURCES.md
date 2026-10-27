# Data sources and publication notes

| Source | Local input | Availability and terms |
|---|---|---|
| [UCDP GED v26.1](https://ucdp.uu.se/downloads/) | `data/raw/GEDEvent_v26_1.csv` | Conflict observation period: 1989–2025. UCDP lists its datasets under CC BY 4.0, with the required source citations. Original CSV and event-level extract are excluded from this repository. |
| [Köppen–Geiger classification, 1976–2000](https://datacatalog.worldbank.org/search/dataset/0042325/world-maps-of-the-k-ppen-geiger-climate-classification) | `koppen-geiger-fixed.shp` and companion files | Corresponds to the public World Bank download, listed under CC BY 4.0. See comparison notes below. Source and derived spatial layers are excluded. |
| [GADM v4.1](https://gadm.org/license.html) | `data/boundaries/gadm41_BWA.gpkg`, `gadm41_NAM.gpkg`, `gadm41_ZAF.gpkg` | Original boundary files excluded. GADM permits academic and other non-commercial use, restricts data redistribution without permission, and explicitly permits maps in academic research articles. Do not assume unrestricted reuse of the source boundaries. |

## Climate-layer verification

The local climate layer was compared with `c1976_2000` from the World Bank public download. Both contain 2,259 features. Attribute contents match apart from DBF header metadata, and all corresponding features have matching vertex-coordinate sets and bounding boxes. Geometry organization and coordinate-reference metadata differ. These findings strongly support correspondence with the public dataset, but do not establish the local file's complete processing history or verify the correctness of its CRS metadata changes.

The [original authors' data page](https://koeppen-geiger.vu-wien.ac.at/shifts.htm) provides the corresponding historical classification and citation. The 1976–2000 climate baseline is distinct from the 1989–2025 conflict observation period; this project does not measure annual climate changes.

## Attribution

- Rubel, F., & Kottek, M. (2010). Observed and projected climate shifts 1901–2100 depicted by world maps of the Köppen–Geiger climate classification. *Meteorologische Zeitschrift, 19*, 135–141. https://doi.org/10.1127/0941-2948/2010/0430
- Sundberg, R., & Melander, E. (2013). Introducing the UCDP Georeferenced Event Dataset. *Journal of Peace Research, 50*(4), 523–532. https://doi.org/10.1177/0022343313484347
- For the UCDP release-specific citation, see the [official download page](https://ucdp.uu.se/downloads/).

[CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) requires appropriate attribution, a license link, and an indication of changes. The project filters conflict events, aggregates them by climate zone, and displays a study-area map. Third-party materials retain their respective terms; no blanket repository license overrides those terms.

No final report PDF was located in the inspected Assignment 2 Data folder. The Koubi (2019) PDF is a reference article and is excluded.

The original QGIS project expects source and derived files in the original Assignment 2 Data directory structure. See [QGIS dependency notes](qgis/README.md).
