use youtube_db;

drop view numbers_per_country;
create view numbers_per_country as 
				select 
					countries.country,
					count(channels.channel_id) as numbers_of_channels,
					countries.unemployment_rate
				from 
					countries
				left join 
					channels on channels.country_id = countries.country_id
				group by 
					countries.country,
					countries.unemployment_rate
				order by
					numbers_of_channels desc
				limit 10;

select * from numbers_per_country;


drop view uploads_subscribers_view;
create view uploads_subscribers_view as
				select 
					category, 
					avg(channels.subscribers) as avg_subscribers,
					avg(channels.uploads) as avg_uploads
				from 
					channels
				left join 
					categories on categories.category_id = channels.category_id
				group by
					category;
                    
                    
drop view views_subscribers_new;				
create view views_subscribers_new as
				select 
					youtuber,
					subscribers,
					round((video_views/1000000), 2) as video_views
				from
					channels
				limit 15;
    
                    
                    
select * from views_subscribers;