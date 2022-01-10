-- Fetching number of unique minerals available in Africa
select count(distinct dsgattr01) as mineral_types 
from p220008.africa_mineral_deposits_trans

-- Ranking the countries based on the diversity minerals available
with base as(
select country,count(distinct dsgattr01) as total_mineral_types 
	from p220008.africa_mineral_deposits_trans group by country)
SELECT
	country,
	total_mineral_types,
	DENSE_RANK () OVER ( 
		ORDER BY total_mineral_types  DESC
	) ranking 
FROM base;

-----------
