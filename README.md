# Japan's Airbnb Analysis as of March 2024

### Project Overview

This project's objective is to provide insights on the number of listings Tokyo, Japan has to offer. Prices vary depending on where the listing is located and what type of room the listing is. We will dive into the dataset to find which areas are generally lower than the average price or which ones are above. Prices are per night. We will also look to see which areas are generally more popular than others. These findings could lead to strong decision-making for locals and tourists in finding rooms for their vacation. Prices may flucuate at times so prices may not be 100% accurate from March 2024 onwards. 

### About the Data

The primary dataset can be found on <https://insideairbnb.com/get-the-data/>. The provided csv file is labeled listings.csv.gz

### Tools Used

- Excel - Data Cleaning
- SQL - Data Cleaning & Data Analysis
- Tableau - Data Visualization

### Data Cleaning/Preparation

1. Data loading and Joining
2. Data Cleaning and Sorting
3. Data Formatting and Transforming

### Exploratory Data Analysis (EDA)

EDA was performed to answer key questions, such as, but not limited to:

1. Which areas have the most amount of listings, which have the least?
2. What are the average prices per listing in Tokyo, Japan?
3. Which area has more reviews per month?
4. Which area has the most reviews?

### Results/Findings

1. Shinjuku Ku has a total of 2,838 listings, while Hinohara Mura only has 1 listing. This indicates that Shinjuku is probably a very popular area for tourists and locals to stay at, whereas Hinohara is not.
2. Hinohara has the highest average pricing of 499$ per night, but it is only 1 listing in the Ku. A more reliable answer would be Chuo Ku being at 232$ per night. Musashimurayama Shi has the lowest average price at 24$ per night. 
3. Shinjuku Ku has the most reviews per month being 4,343 reviews from all of it's 2,838 listings. Following that are Taito Ku and Sumida Ku being slightly under 3,000 total reviews. These top 3 Kus are very popular amongst locals/tourists as they have nearly over 3,000 reviews per month.

![image](https://github.com/DavidsDatabase/JapanAirbnb/assets/156726833/a072c585-80ab-481f-896e-414db6fd5a7d)

4. Shinjuku Ku has the most total reviews at 104,190 reviews. Next are Taito Ku at 74,555 reviews and Sumida Ku at 66,100 reviews. This strongly suggests that listings in these 3 Ku are very popular and people would most likely want to stay here. Having the most reviews lifetime and most reviews per month is a strong indicator for popularity. 

![image](https://github.com/DavidsDatabase/JapanAirbnb/assets/156726833/1d485e39-bce9-49f2-a697-a60193d9c1ac)


### Recommendations

Based on the analysis, we recommend the following actions:

Booking an airbnb in the areas of **Shinjuku**, **Taito**, or **Sumida** may be the best choice. All 3 of these Ku are popular as they have the most reviews per month and overall. Average prices for these 3 are around mid compared to the rest of the areas Tokyo has to offer. There are over 1,800 listings for all 3 of these Ku, so options are there. Filtering your choices based on your preferred location, accommodation, beds, bathrooms even further may strengthen your decision-making, but in doing so, may change the pricing per night either upwards or downwards. 

### Limitations

This dataset did not provide any dates/timestamps so it was hard to make comparative analyses. We would need to find data regarding **time** to make a more induced analysis for decision-making. Having this data would be useful in finding price changes from time to time in certain areas and room types, total amount of reviews per month per neighbourhood, or making monthly, quarterly, seasonal analyses. 

### Complimentary Visualization

[<https://public.tableau.com/app/profile/david.lee7724/viz/Book1_17166825704740/MainDB>](https://public.tableau.com/app/profile/david.lee7724/viz/Book1_17185811811610/Dashboard1)











