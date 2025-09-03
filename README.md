# Flight Delay Analysis Project - John Yoon

In my first SQL project, I explored flight delays in the US by using SQL to clean and integrate datasets and used Power BI to visualize those results. My goal was to see which airports had the highest delays, and why that happened and how those patterns changed over time.

---

## Overview

- **Objective**: Identify the causes and trends of delays in airports based in the US
- **Steps for Project**:
  1. Loaded raw datasets into SQLite
  2. Cleaned and standardized data into structured tables
  3. Built a master dataset (delays_master) with delay statistics, airport metadata, and passenger traffic
  4. Run SQL queries to analyze key questions
  5. Visualize results with Power BI

---

## Datasets Used

I used publicly available data from the Bureau of Transportation Statistics (BTS), OurAirports.com, and the FAA.

1. **BTS Airline On-Time Statistics and Delay Causes**

   - Source: [Bureau of Transportation Statistics (BTS)](https://www.transtats.bts.gov/OT_Delay/OT_DelayCause1.asp)
   - Contains monthly flight operations, delays, and causes per U.S. airport
   - Key columns: `year`, `month`, `airport`, `arr_flights`, `arr_del15`, `carrier_delay`, `weather_delay`, etc.

2. **OurAirports Database**

   - Source: [OurAirports.com](https://ourairports.com/data/)
   - Metadata for airports (IATA/ICAO codes, name, municipality, state, latitude/longitude)
   - Used to map BTS airport codes to actual airport locations and states.

3. **FAA Preliminary CY2024 Commercial Service Enplanements**
   - Source: [FAA Enplanement Data](https://www.faa.gov/airports/planning_capacity/passenger_allcargo_stats)
   - Provides passenger volumes for U.S. commercial service airports
   - Useful for adding traffic context to delays (big hubs vs. smaller airports)
  

**I'm currently in the process of implementing a Power BI dashboard for this project. As a Mac user, accessing Power BI requires additional setup, including licensing through my university. I'm actively working through these steps and will update the project with visualizations as soon as possible.**

## License

This project is for educational and portfolio purposes.  
Data © BTS, OurAirports, and the FAA.
