-- Note, before you run this step, you should create a schema called Hopsital Data --
CREATE TABLE IF NOT EXISTS "postgres"."Hospital_Data".hospital_beds
(
     provider_ccn integer
    ,hospital_name character varying(255)
    ,fiscal_year_begin_date character varying(10)
    ,fiscal_year_end_date character varying(10)
    ,number_of_beds integer
);

CREATE TABLE IF NOT EXISTS "postgres"."Hospital_Data".HCAHPS_data
(
    facility_id character varying(10),
    facility_name character varying(255),
    address character varying(255),
    city character varying(50),
    state character varying(2),
    zip_code character varying(10),
    county_or_parish character varying(50),
    telephone_number character varying(20),
    hcahps_measure_id character varying(255),
    hcahps_question character varying(255),
    hcahps_answer_description character varying(255),
    hcahps_answer_percent integer,
    num_completed_surveys integer,
    survey_response_rate_percent integer,
    start_date character varying(10),
    end_date character varying(10)
);