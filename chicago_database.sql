\c project4;

CREATE TABLE crimes (
    id integer PRIMARY KEY,
    case_number varchar,
    date date,
    block varchar,
    iucr varchar,
    primary_type varchar,
    description varchar,
    location_description varchar,
    arrest boolean,
    domestic boolean,
    beat integer,
    district integer,
    ward integer,
    community_area integer,
    fbi_code varchar,
    x_coordinate integer,
    y_coordinate integer,
    year integer,
    updated_on date,
    latitude numeric,
    longitude numeric,
    location varchar,
    computed_region_awaf_s7ux integer,
    computed_region_6mkv_f3dw integer,
    computed_region_vrxf_vc4k integer,
    computed_region_bdys_3d7i integer,
    computed_region_43wa_7qmu integer,
    computed_region_rpca_8um6 integer,
    computed_region_d9mm_jgwp integer,
    computed_region_d3ds_rm58 integer
);

\copy  crimes (id, case_number, date, block, iucr, primary_type, description, location_description, arrest, domestic, beat, district, ward, community_area, fbi_code, x_coordinate, y_coordinate, year, updated_on, latitude, longitude, location, computed_region_awaf_s7ux, computed_region_6mkv_f3dw, computed_region_vrxf_vc4k, computed_region_bdys_3d7i, computed_region_43wa_7qmu, computed_region_rpca_8um6, computed_region_d9mm_jgwp, computed_region_d3ds_rm58) FROM '.\data\crime.csv' WITH (FORMAT csv, HEADER);


CREATE TABLE clinics (
    organization varchar,
    site_name varchar,
    site_type varchar,
    address varchar,
    zip varchar,
    main_phone varchar,
    service_request_phone varchar,
    evening_hours_availability boolean,
    evening_hours_detail varchar,
    weekend_hours_availability boolean,
    ticc_site varchar,
    all_community_areas_served varchar,
    wards_served varchar,
    police_districts_served varchar,
    accepts_uninsured_patients boolean,
    sliding_scale_fees varchar,
    insurance_accepted varchar,
    age_range_served varchar,
    primary_care_availability boolean,
    bhs_service_availability_primary_care varchar,
    telehealth_services_availability boolean,
    other_languages varchar,
    language_line_availability boolean,
    behavioral_services_types varchar,
    crisis_services boolean,
    mental_health_services_type_special_needs_availability varchar,
    school_based_services_availability boolean,
    grief_services_availability boolean,
    first_episode_psychosis_programming_availability boolean,
    substance_use_services_availability boolean,
    location varchar,
    computed_region_rpca_8um6 integer,
    computed_region_vrxf_vc4k integer,
    computed_region_6mkv_f3dw integer,
    computed_region_bdys_3d7i integer,
    computed_region_43wa_7qmu integer,
    weekend_hours_detail varchar,
    grief_bereavement_services_types varchar,
    substance_use_services_type varchar,
    mar_medications_opioid varchar,
    harm_reduction_services varchar,
    service_request_alternative_availability boolean,
    service_request_alternative_detail varchar,
    hours varchar,
    mental_health_services_type_special_needs_detail varchar,
    ticc_areas_served varchar,
    mar_medications_alcohol varchar,
    crisis_intake_phone varchar,
    crisis_services_hours varchar,
    crisis_services_types varchar,
    first_episode_psychosis_programming_detail varchar
);

\copy  clinics (organization, site_name, site_type, address, zip, main_phone, service_request_phone, evening_hours_availability, evening_hours_detail, weekend_hours_availability, ticc_site, all_community_areas_served, wards_served, police_districts_served, accepts_uninsured_patients, sliding_scale_fees, insurance_accepted, age_range_served, primary_care_availability, bhs_service_availability_primary_care, telehealth_services_availability, other_languages, language_line_availability, behavioral_services_types, crisis_services, mental_health_services_type_special_needs_availability, school_based_services_availability, grief_services_availability, first_episode_psychosis_programming_availability, substance_use_services_availability, location, computed_region_rpca_8um6, computed_region_vrxf_vc4k, computed_region_6mkv_f3dw, computed_region_bdys_3d7i, computed_region_43wa_7qmu, weekend_hours_detail, grief_bereavement_services_types, substance_use_services_type, mar_medications_opioid, harm_reduction_services, service_request_alternative_availability, service_request_alternative_detail, hours, mental_health_services_type_special_needs_detail, ticc_areas_served, mar_medications_alcohol, crisis_intake_phone, crisis_services_hours, crisis_services_types, first_episode_psychosis_programming_detail) FROM '.\data\clinics.csv' WITH (FORMAT csv, HEADER);

CREATE TABLE data_div (
    case_id	bigint	REFERENCES crimes,
    case_participant_id	bigint,
    received_date date,
    offense_category varchar,	
    diversion_program varchar,	
    referral_date date,	
    diversion_count	varchar,	
    primary_charge_offense_title varchar,	
    statute	varchar,
    race varchar,	
    gender varchar,	
    diversion_result date,	
    diversion_closed_date date
);

\copy  data_div (case_id, case_participant_id, received_date, offense_category, diversion_program, referral_date, diversion_count, primary_charge_offense_title, statute, race, gender, diversion_result, diversion_closed_date) FROM '.data\data_div.csv' WITH (FORMAT csv, HEADER);

CREATE TABLE div (
    id integer PRIMARY KEY,
    case_id	integer	REFERENCES crimes,
    case_participant_id	integer REFERENCES crimes,
    received_date date,
    offense_category varchar,	
    diversion_program varchar,	
    referral_date date,	
    diversion_count	varchar,	
    primary_charge_offense_title varchar,	
    statute	varchar,
    race varchar,	
    gender varchar,	
    diversion_result date,	
    diversion_closed_date date
);

\copy  div (id, case_id, case_participant_id, received_date, offense_category, diversion_program, referral_date, diversion_count, primary_charge_offense_title, statute, race, gender, diversion_result, diversion_closed_date) FROM '.\div.csv' WITH (FORMAT csv, HEADER);


CREATE TABLE disp (
    id	integer	PRIMARY KEY,
    case_id	integer	REFERENCES crimes,
    case_participant_id	integer REFERENCES crimes,	
    received_date date,	
    offense_category varchar,	
    primary_charge varchar,	
    charge_id integer,	
    charge_version_id integer,	
    disposition_charged_offense_title varchar,	
    charge_count integer,	
    disposition_date date,	
    disposition_charged_chapter	varchar,	
    disposition_charged_act	integer,	
    disposition_charged_section	varchar,	
    disposition_charged_class varchar,	
    disposition_charged_aoic integer,	
    charge_disposition varchar,	
    judge varchar,	
    court_name varchar,	
    court_facility	varchar,	
    age_at_incident	integer,	
    race varchar,	
    gender varchar,	
    incident_begin_date	date,	
    law_enforcement_agency	varchar,	
    arrest_date	date,	
    felony_review_date	date,	
    felony_review_result date,	
    arraignment_date date,	
    updated_offense_category	varchar,	
    charge_disposition_reason varchar,		
    incident_end_date	date,	
    incident_city	varchar,	
    unit	varchar
);

\copy  disp (id, case_id, case_participant_id, received_date, offense_category, primary_charge, charge_id, charge_version_id, disposition_charged_offense_title, charge_count, disposition_date, disposition_charged_chapter, disposition_charged_act, disposition_charged_section, disposition_charged_class, disposition_charged_aoic, charge_disposition, judge, court_name, court_facility, age_at_incident, race, gender, incident_begin_date, law_enforcement_agency, arrest_date, felony_review_date, felony_review_result, arraignment_date, updated_offense_category, charge_disposition_reason, incident_end_date, incident_city, unit) FROM '.\disp.csv' WITH (FORMAT csv, HEADER);


CREATE TABLE init (
    id	integer	PRIMARY KEY,
    case_id	integer	REFERENCES crimes,
    case_participant_id	integer REFERENCES crimes,	
    received_date date,	
    offense_category varchar,	
    primary_charge varchar,	
    charge_id integer,	
    charge_version_id integer,	
    disposition_charged_offense_title varchar,	
    charge_count integer,	
    disposition_date date,	
    disposition_charged_chapter	varchar,	
    disposition_charged_act	integer,	
    disposition_charged_section	varchar,	
    disposition_charged_class	varchar,	
    disposition_charged_aoic	integer,	
    charge_disposition	varchar,	
    judge	varchar,	
    court_name	varchar,	
    court_facility	varchar,	
    age_at_incident	integer,	
    race	varchar,	
    gender	varchar,	
    incident_begin_date	date,	
    law_enforcement_agency	varchar,	
    arrest_date	date,	
    felony_review_date	date,	
    felony_review_result	date,	
    arraignment_date	date,	
    updated_offense_category	varchar,	
    charge_disposition_reason varchar,		
    incident_end_date	date,	
    incident_city	varchar,	
    unit	varchar
);

\copy  init (id, case_id, case_participant_id, received_date, offense_category, primary_charge, charge_id, charge_version_id, disposition_charged_offense_title, charge_count, disposition_date, disposition_charged_chapter, disposition_charged_act, disposition_charged_section, disposition_charged_class, disposition_charged_aoic, charge_disposition, judge, court_name, court_facility, age_at_incident, race, gender, incident_begin_date, law_enforcement_agency, arrest_date, felony_review_date, felony_review_result, arraignment_date, updated_offense_category, charge_disposition_reason, incident_end_date, incident_city, unit) FROM '.\init.csv' WITH (FORMAT csv, HEADER);


CREATE TABLE intake (
    id	integer	PRIMARY KEY,
    case_id	integer	REFERENCES crimes,
    case_participant_id	integer REFERENCES crimes,	
    received_date date,	
    offense_category varchar,	
    primary_charge varchar,	
    charge_id integer,	
    charge_version_id integer,	
    disposition_charged_offense_title varchar,	
    charge_count integer,	
    disposition_date date,	
    disposition_charged_chapter	varchar,	
    disposition_charged_act	integer,	
    disposition_charged_section	varchar,	
    disposition_charged_class	varchar,	
    disposition_charged_aoic	integer,	
    charge_disposition	varchar,	
    judge	varchar,	
    court_name	varchar,	
    court_facility	varchar,	
    age_at_incident	integer,	
    race	varchar,	
    gender	varchar,	
    incident_begin_date	date,	
    law_enforcement_agency	varchar,	
    arrest_date	date,	
    felony_review_date	date,	
    felony_review_result	date,	
    arraignment_date	date,	
    updated_offense_category	varchar,	
    charge_disposition_reason varchar,		
    incident_end_date	date,	
    incident_city	varchar,	
    unit	varchar
);

\copy  intake (id,	case_id, case_participant_id, received_date, offense_category, primary_charge, charge_id, charge_version_id, disposition_charged_offense_title, charge_count, disposition_date, disposition_charged_chapter, disposition_charged_act, disposition_charged_section, disposition_charged_class, disposition_charged_aoic, charge_disposition, judge, court_name, court_facility, age_at_incident, race, gender, incident_begin_date, law_enforcement_agency, arrest_date, felony_review_date, felony_review_result, arraignment_date, updated_offense_category, charge_disposition_reason, incident_end_date, incident_city, unit) FROM '.\intake.csv' WITH (FORMAT csv, HEADER);


CREATE TABLE sent (
    id	integer	PRIMARY KEY,
    case_id	integer	REFERENCES crimes,
    case_participant_id	integer REFERENCES crimes,	
    received_date date,	
    offense_category varchar,	
    primary_charge varchar,	
    charge_id integer,	
    charge_version_id integer,	
    disposition_charged_offense_title varchar,	
    charge_count integer,	
    disposition_date date,	
    disposition_charged_chapter	varchar,	
    disposition_charged_act	integer,	
    disposition_charged_section	varchar,	
    disposition_charged_class	varchar,	
    disposition_charged_aoic	integer,	
    charge_disposition	varchar,	
    judge	varchar,	
    court_name	varchar,	
    court_facility	varchar,	
    age_at_incident	integer,	
    race	varchar,	
    gender	varchar,	
    incident_begin_date	date,	
    law_enforcement_agency	varchar,	
    arrest_date	date,	
    felony_review_date	date,	
    felony_review_result	date,	
    arraignment_date	date,	
    updated_offense_category	varchar,	
    charge_disposition_reason varchar,		
    incident_end_date	date,	
    incident_city	varchar,	
    unit	varchar
);

\copy  sent (id,	case_id, case_participant_id, received_date, offense_category, primary_charge, charge_id, charge_version_id, disposition_charged_offense_title, charge_count, disposition_date, disposition_charged_chapter, disposition_charged_act, disposition_charged_section, disposition_charged_class, disposition_charged_aoic, charge_disposition, judge, court_name, court_facility, age_at_incident, race, gender, incident_begin_date, law_enforcement_agency, arrest_date, felony_review_date, felony_review_result, arraignment_date, updated_offense_category, charge_disposition_reason, incident_end_date, incident_city, unit) FROM '.\sent.csv' WITH (FORMAT csv, HEADER);


CREATE TABLE HCSBDP (
    se	numeric,	
    g	varchar,	
    l	varchar,	
    a	varchar,	
    p	varchar,	
    d	varchar,	
    v	numeric	
);

\copy  HCSBDP (se, g, l, a, p, d, v) FROM '.\HCSBDP.csv'WITH (FORMAT csv, HEADER);
iconv -c -t utf8 C:\Users\HyeOL\OneDrive - CUNY\GitHub\project_4\chicago_mh\data\HCSBDP.csv > C:\Users\HyeOL\OneDrive - CUNY\GitHub\project_4\chicago_mh\data\HCSBDP.utf8.csv

CREATE TABLE HCSBHP (
    se	numeric,	
    g	varchar,	
    l	varchar,	
    a	varchar,	
    p	varchar,	
    d	varchar,	
    v	numeric	
);

\copy  HCSBHP (se, g, l, a, p, d, v) FROM '.\HCSBHP.csv' WITH (FORMAT csv, HEADER);


CREATE TABLE HDBHR (
    se	numeric,	
    g	varchar,	
    l	varchar,	
    a	varchar,	
    p	varchar,	
    d	varchar,
    v	numeric	
);

\copy  HDBHR (id, se, g, l, a, p, d, v) FROM '.\HDBHR.csv' WITH (FORMAT csv, HEADER);


CREATE TABLE HDDRR (
    se	numeric,	
    g	varchar,	
    l	varchar,	
    a	varchar,	
    p	varchar,	
    d	varchar,	
    v	numeric	
);

\copy  HDDRR (se, g, l, a, p, d, v) FROM '.\HDDRR.csv' WITH (FORMAT csv, HEADER);


CREATE TABLE HDSZR (
    se	numeric,	
    g	varchar,	
    l	varchar,	
    a	varchar,	
    p	varchar,	
    d	varchar,	
    v	numeric	
);

\copy  HDSZR (se, g, l, a, p, d, v) FROM '.\HDSZR.csv' WITH (FORMAT csv, HEADER);


CREATE TABLE YRDEP (
    id	integer	PRIMARY KEY,
    se	numeric,	
    g	varchar,	
    l	varchar,	
    a	varchar,	
    p	varchar,	
    d	date,	
    v	numeric	
);

\copy  YRDEP (id, se, g, l, a, p, d, v) FROM '.\YRDEP.csv' WITH (FORMAT csv, HEADER);