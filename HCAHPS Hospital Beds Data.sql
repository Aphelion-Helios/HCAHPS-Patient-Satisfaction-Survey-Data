select * from "postgres"."Hospital_Data". hcahps_data

with hospital_beds_prep as
(
  
select  lpad (cast (provider_ccn as text) ,6, '@') as provider_ccn 
       ,hospital_name
       ,to_date (fiscal_year_begin_date, 'MM/DD/YYYY') as fiscal_year_begin_date 
       ,to_date(fiscal_year_end_date,'MM/DD/YYYY') as fiscal_year_end_date 
       ,number_of_beds
       ,row_number) over (partition by provider_ccn order by to_date(fiscal_year_end _date, 'MM/DD/YYYY') desc) as nth_row
from "postgres"."Hospital_Data".hospital_beds
)

select   lpad (cast (facility_id as text) ,6,'0') as provider_ccn 
               ,to_date (start_date, 'MN/DD/YYVY') as start_date_ converted 
               ,to_date (end_date, 'MM/DD/YVYY') as end_date_converted 
               ,hcahps. *
               ,beds.number_of_beds

from "postgres" , "Hospital_Data".hcahps_data as hcahps
left join hospital_beds_prep as beds
  on lpad (cast (facility_id as text) ,6, '0') = beds-provider_ccn
 and beds.nth_row = 1