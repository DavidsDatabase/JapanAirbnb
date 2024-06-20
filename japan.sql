select *
from japan

--making a copy of original dataset

select *
into japan1
from japan

select *
from japan1

--deleting unneccessary columns as they would not be useful for our analysis

alter table japan1
drop column listing_url, scrape_id, last_scraped, source, name, description, neighborhood_overview, picture_url, host_id, host_url, host_name, host_since, host_location, host_about, 
host_response_time, host_response_rate, host_acceptance_rate, host_is_superhost, host_thumbnail_url, host_picture_url, host_neighbourhood, host_listings_count,
host_total_listings_count, host_verifications, host_has_profile_pic, host_identity_verified, neighbourhood, neighbourhood_group_cleansed, property_type, bathrooms_text, amenities

alter table japan1
drop column minimum_minimum_nights, maximum_minimum_nights, minimum_maximum_nights, maximum_maximum_nights, minimum_nights_avg_ntm, maximum_nights_avg_ntm, calendar_updated, has_availability, 
availability_30, availability_60, availability_90, availability_365, calendar_last_scraped, number_of_reviews_l30d, first_review, last_review, license, instant_bookable, calculated_host_listings_count,
calculated_host_listings_count_entire_homes, calculated_host_listings_count_private_rooms, calculated_host_listings_count_shared_rooms

--converting price to usd (from yen)

select price, round(price/157,2) as price_usd
from japan1

alter table japan1
add price_usd int

update japan1
set price_usd = round(price/157,2)

--dataset is ready for analysis

--counting total listings per neighbourhood

select neighbourhood_cleansed, count(*) as total_listings
from japan1
group by neighbourhood_cleansed
order by total_listings desc

--counting total listings per room types

select room_type, count(*) as total_listings
from japan1
group by room_type
order by total_listings desc

--EDA

--average accomodations per room type

select room_type, round(avg(accommodates),2) as avg_accommodates
from japan1
group by room_type
order by avg_accommodates desc 

--average bathrooms, bedrooms, beds, per room type

select room_type, round(avg(bathrooms),2) as avg_bathrooms, round(avg(bedrooms),2) as avg_bedrooms, round(avg(beds),2) as avg_beds
from japan1
group by room_type
order by 1 

--min/max/avg prices per neighbourhood

select neighbourhood_cleansed, count(*) as total_listings, min(price_usd) as min_price, max(price_usd) as max_price, avg(price_usd) as avg_price
from japan1
group by neighbourhood_cleansed
order by total_listings desc, avg_price desc

--min/max/avg prices per room_type

select room_type, count(*) as total_listings, min(price_usd) as min_price, max(price_usd) as max_price, avg(price_usd) as avg_price
from japan1
group by room_type
order by total_listings desc, avg_price desc

--avg number of reviews and total number of reviews per neighbourhood to see which neighbourhoods are most popular

select neighbourhood_cleansed, count(*) as total_listings, round(avg(number_of_reviews),2) as avg_number_of_reviews, round(sum(number_of_reviews), 2) as total_number_of_reviews
from japan1
group by neighbourhood_cleansed
order by avg_number_of_reviews desc

--avg reviews per month and total reviews per month per neighbourhood

select neighbourhood_cleansed, round(avg(reviews_per_month),2) as avg_reviews_per_month, round(sum(reviews_per_month),2) as total_reviews_per_month
from japan1
group by neighbourhood_cleansed
order by avg_reviews_per_month desc

--avg review ratings, accuracy, cleanliness, checkin, communication, location, value per neighbourhood

select neighbourhood_cleansed, count(*) as total_listings, round(avg(review_scores_rating),2) as avg_rating_score, round(avg(review_scores_accuracy),2) as avg_accuracy_score, 
round(avg(review_scores_cleanliness),2) as avg_cleanliness_score, round(avg(review_scores_checkin),2) as avg_checkin_score, round(avg(review_scores_location),2) as avg_location_score, 
round(avg(review_scores_value),2) as avg_value_score
from japan1
group by neighbourhood_cleansed
order by avg_rating_score desc

--top 3 listings with highest pricing per neighbourhood and room types 

with cte as (
select neighbourhood_cleansed, room_type, price_usd,
dense_rank() over(partition by neighbourhood_cleansed order by price_usd desc) as ranking
from japan1
)
select *
from cte
where ranking <=3
and price_usd is not null
order by neighbourhood_cleansed asc, price_usd desc

--top 3 listings with highest accomodations per neighbourhood

with cte as (
select neighbourhood_cleansed, room_type, accommodates, bathrooms, bedrooms, beds, price_usd,
dense_rank() over(partition by neighbourhood_cleansed order by accommodates desc) as accommodates_ranking
from japan1
where price is not null
)
select *
from cte 
where accommodates_ranking <=3
order by 1 asc, 3 desc

--top 3 listings with highest number of reviews per neighbourhood and room type

with cte as (
select neighbourhood_cleansed, room_type, number_of_reviews, price_usd, 
dense_rank() over (partition by neighbourhood_cleansed order by number_of_reviews desc, price_usd asc) as total_reviews_ranking
from japan1
where price is not null
)
select *
from cte
where total_reviews_ranking <=3

--top 5 listings with highest reviews per month per neighbourhood

with cte as (
select neighbourhood_cleansed, reviews_per_month, price_usd,
DENSE_RANK() over(partition by neighbourhood_cleansed order by reviews_per_month desc) as reviews_per_month_ranking
from japan1
)
select *
from cte
where reviews_per_month_ranking <=5
and price_usd is not null


select *
from japan1
