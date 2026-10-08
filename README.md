# Nordic New-Car Sales by Fuel Type

How fast are the Nordic countries switching from petrol and diesel cars to electric ones? This project uses official Eurostat data on new passenger car registrations in Denmark, Finland, Norway and Sweden from 2014 to 2024. The data is cleaned in Excel and SQL Server and presented in an interactive Power BI dashboard.

## Dashboard
![Nordic car sales Power BI dashboard](images/nordic-car-sales-dashboard.png)

The dashboard shows total sales by fuel type, cars sold per year, each fuel type's share of sales over time, and year-over-year growth. The year and country filters on the right update every visual.

## Key findings
- **9 million new cars were sold** across the four countries from 2014 to 2024: 3.13M petrol, 2.13M diesel, 1.57M hybrid and 1.51M electric.
- **Electric cars went from niche to mainstream:** about 3% of new cars sold in 2014 were electric, about 9% in 2019 and almost half (49%) in 2024.
- **Diesel collapsed and petrol lost its lead:** diesel's share fell steadily from about a third of sales to only a few percent, and petrol was overtaken by electric and hybrid cars around 2020–2021.
- **Norway is far ahead:** 88% of new cars sold in Norway in 2024 were electric, compared with 51% in Denmark, 35% in Sweden and 30% in Finland.

## Data
[Eurostat](https://ec.europa.eu/eurostat): new passenger car registrations by type of motor energy (petrol, diesel, hybrid, plug-in hybrid, electric, gas, biofuels and others), by country and year.

## What I did
- **Excel:** removed blank rows and fixed inconsistent formatting in the raw export
- **SQL Server:** replaced Eurostat's `:` missing-value marker with NULL and then 0, removed the spaces used as thousand separators, and converted every column from text to numbers
- **SQL analysis:** calculated totals and percentage shares of electric, hybrid, petrol and diesel cars by country and year
- **Power BI:** built DAX measures for totals, shares and year-over-year growth, and designed the dashboard with year and country filters

## Files
| File | Description |
|---|---|
| `NewCarQuery.sql` | All cleaning and analysis queries, with comments |
| `PowerBI+ExcelLink` | Link to the Power BI report and Excel data on [Google Drive](https://drive.google.com/drive/folders/1QsdTC17PSaWR3OZGw4CO2YNTYl9VO-XH?usp=sharing) |
| `images/` | Dashboard screenshot |

## Tools
Excel, SQL Server (SSMS), Power BI (DAX)
