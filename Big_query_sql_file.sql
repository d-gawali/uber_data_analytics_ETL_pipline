create or replace table uber-391221.uber_data_engineering.table_analytics as(
select 
f.VendorID,
d.tpep_pickup_datetime,
d.tpep_dropoff_datetime,
dr.dropoff_longitude,
dr.dropoff_latitude,
p.passenger_count,
pay.payment_type_name,
pick.pickup_longitude,
pick.pickup_latitude,
r.rate_code_name,
t.trip_distance,
f.fare_amount,
f.extra,
f.mta_tax,
f.tip_amount,
f.tolls_amount,
f.improvement_surcharge,
f.total_amount

from 

uber-391221.uber_data_engineering.fact_table f
join
uber-391221.uber_data_engineering.datetime_dim d 
on f.datetime_id=d.datetime_id
join
uber-391221.uber_data_engineering.passenger_count_dim p
on p.passenger_count_id=f.passenger_count_id
join
uber-391221.uber_data_engineering.trip_distance_dim t
on t.trip_distance_id=f.trip_distance_id
join
uber-391221.uber_data_engineering.rate_code_dim r
on r.rate_code_id=f.rate_code_id
join
uber-391221.uber_data_engineering.pickup_location_dim pick
on pick.pickup_location_id=f.pickup_location_id
join
uber-391221.uber_data_engineering.dropoff_location_dim dr
on dr.dropoff_location_id=f.dropoff_location_id
join
uber-391221.uber_data_engineering.payment_type_dim pay
on pay.payment_type_id=f.payment_type_id
)
;