create or replace view v_generated_dates as
select gs::date as generate_date from generate_series('2022-01-01', '2022-01-31', interval '1 day') as gs;