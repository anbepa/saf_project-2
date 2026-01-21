-- schsaf.consecutives_payment_application definition

-- Drop table

-- DROP TABLE schsaf.consecutives_payment_application;

CREATE TABLE schsaf.consecutives_payment_application (
	id serial4 NOT NULL,
	consecutivo text NOT NULL,
	fecha date DEFAULT CURRENT_DATE NOT NULL,
	CONSTRAINT consecutives_payment_application_pkey PRIMARY KEY (id)
);


-- schsaf.shedlock definition

-- Drop table

-- DROP TABLE schsaf.shedlock;

CREATE TABLE schsaf.shedlock (
	"name" varchar(64) NOT NULL,
	lock_until timestamp(3) NULL,
	locked_at timestamp(3) NULL,
	locked_by varchar(255) NULL,
	CONSTRAINT shedlock_pkey PRIMARY KEY (name)
);


-- schsaf.tbl_accounting_account definition

-- Drop table

-- DROP TABLE schsaf.tbl_accounting_account;

CREATE TABLE schsaf.tbl_accounting_account (
	id bigserial NOT NULL,
	currency varchar(20) NULL,
	last_update timestamp NULL,
	"name" varchar(100) NULL,
	nature varchar(10) NULL,
	"number" varchar(255) NULL,
	state varchar(20) NULL,
	CONSTRAINT tbl_accounting_account_pkey PRIMARY KEY (id)
);
CREATE INDEX account_number_index ON schsaf.tbl_accounting_account USING btree (number);


-- schsaf.tbl_accounting_balance definition

-- Drop table

-- DROP TABLE schsaf.tbl_accounting_balance;

CREATE TABLE schsaf.tbl_accounting_balance (
	id bigserial NOT NULL,
	account_number varchar(255) NOT NULL,
	value float8 NOT NULL,
	created_at date NOT NULL,
	nit varchar NOT NULL,
	nature varchar(7) NOT NULL,
	movement_value float8 NULL,
	last_update timestamp NULL,
	CONSTRAINT tbl_tbl_accounting_balance_pkey PRIMARY KEY (id)
);


-- schsaf.tbl_accounting_concept definition

-- Drop table

-- DROP TABLE schsaf.tbl_accounting_concept;

CREATE TABLE schsaf.tbl_accounting_concept (
	id int8 NOT NULL,
	description varchar(255) NULL,
	CONSTRAINT tbl_accounting_concept_pkey PRIMARY KEY (id)
);


-- schsaf.tbl_accounting_event definition

-- Drop table

-- DROP TABLE schsaf.tbl_accounting_event;

CREATE TABLE schsaf.tbl_accounting_event (
	id int8 NOT NULL,
	description varchar(255) NULL,
	CONSTRAINT tbl_accounting_event_pkey PRIMARY KEY (id)
);


-- schsaf.tbl_accounting_process definition

-- Drop table

-- DROP TABLE schsaf.tbl_accounting_process;

CREATE TABLE schsaf.tbl_accounting_process (
	id int8 NOT NULL,
	description varchar(60) NULL,
	CONSTRAINT tbl_accounting_process_pkey PRIMARY KEY (id)
);


-- schsaf.tbl_accounting_scenario definition

-- Drop table

-- DROP TABLE schsaf.tbl_accounting_scenario;

CREATE TABLE schsaf.tbl_accounting_scenario (
	id int8 NOT NULL,
	description varchar(255) NULL,
	CONSTRAINT tbl_accounting_scenario_pkey PRIMARY KEY (id)
);


-- schsaf.tbl_agreement definition

-- Drop table

-- DROP TABLE schsaf.tbl_agreement;

CREATE TABLE schsaf.tbl_agreement (
	id serial4 NOT NULL,
	code_agreement int4 NOT NULL,
	description varchar NOT NULL,
	CONSTRAINT tbl_agreement_pk PRIMARY KEY (id)
);


-- schsaf.tbl_applicative definition

-- Drop table

-- DROP TABLE schsaf.tbl_applicative;

CREATE TABLE schsaf.tbl_applicative (
	initial_code varchar(50) NOT NULL,
	"name" varchar(100) NOT NULL,
	description varchar(150) NULL,
	CONSTRAINT schsaf_tbl_applicative_pk PRIMARY KEY (initial_code)
);


-- schsaf.tbl_assessment_historical definition

-- Drop table

-- DROP TABLE schsaf.tbl_assessment_historical;

CREATE TABLE schsaf.tbl_assessment_historical (
	id bigserial NOT NULL,
	value int8 NULL,
	created_at timestamp NULL,
	update_at timestamp NULL,
	is_percentage bool DEFAULT false NOT NULL,
	assessment_id int8 NULL,
	assessment_type int8 NULL,
	CONSTRAINT pk_tbl_assessment_historical PRIMARY KEY (id)
);


-- schsaf.tbl_assessment_type definition

-- Drop table

-- DROP TABLE schsaf.tbl_assessment_type;

CREATE TABLE schsaf.tbl_assessment_type (
	id serial4 NOT NULL,
	description varchar(255) NOT NULL,
	created_at timestamp NOT NULL,
	updated_at timestamp NOT NULL,
	CONSTRAINT tbl_assessment_type_pkey PRIMARY KEY (id)
);


-- schsaf.tbl_audit_log definition

-- Drop table

-- DROP TABLE schsaf.tbl_audit_log;

CREATE TABLE schsaf.tbl_audit_log (
	id bigserial NOT NULL,
	log_type varchar(20) NOT NULL,
	username varchar NOT NULL,
	action_date timestamp NOT NULL,
	origin_process varchar NOT NULL,
	target_process varchar NOT NULL,
	stage varchar(30) NOT NULL,
	"action" varchar(30) NOT NULL,
	process_type varchar NULL,
	final_object varchar NOT NULL,
	init_object varchar NULL,
	CONSTRAINT tbl_audit_log_pk PRIMARY KEY (id)
);
CREATE INDEX audit_log_common_columns_index ON schsaf.tbl_audit_log USING btree (action_date, target_process, process_type);


-- schsaf.tbl_automatic_debit definition

-- Drop table

-- DROP TABLE schsaf.tbl_automatic_debit;

CREATE TABLE schsaf.tbl_automatic_debit (
	id serial4 NOT NULL,
	document_client varchar(255) NULL,
	automatic_debit_enabled bool NULL,
	created timestamp(0) NULL,
	updated timestamp(0) NULL,
	CONSTRAINT tbl_automatic_debit_pk PRIMARY KEY (id)
);


-- schsaf.tbl_automatic_debit_code_response definition

-- Drop table

-- DROP TABLE schsaf.tbl_automatic_debit_code_response;

CREATE TABLE schsaf.tbl_automatic_debit_code_response (
	code varchar(50) NULL,
	description varchar(512) NULL
);


-- schsaf.tbl_automatic_debit_header definition

-- Drop table

-- DROP TABLE schsaf.tbl_automatic_debit_header;

CREATE TABLE schsaf.tbl_automatic_debit_header (
	id bigserial NOT NULL,
	"type" int4 NOT NULL,
	nit varchar(15) NOT NULL,
	"name" varchar(20) NULL,
	code varchar(15) NOT NULL,
	"date" varchar(8) NOT NULL,
	"sequence" varchar NOT NULL,
	application_date varchar(8) NOT NULL,
	number_records varchar(8) NOT NULL,
	total_value numeric(22, 4) NOT NULL,
	reserved varchar(76) NULL,
	state varchar NULL,
	CONSTRAINT tbl_automatic_debit_header_pk PRIMARY KEY (id)
);


-- schsaf.tbl_automatic_debit_historical definition

-- Drop table

-- DROP TABLE schsaf.tbl_automatic_debit_historical;

CREATE TABLE schsaf.tbl_automatic_debit_historical (
	id serial4 NOT NULL,
	document_client varchar NULL,
	type_change varchar NULL,
	date_change_debit_automatic date NULL,
	created timestamp(0) NULL,
	full_name varchar NULL,
	agreement varchar NULL,
	agreement_name varchar NULL,
	bank_account varchar NULL,
	bank_account_type varchar NULL,
	CONSTRAINT tbl_automatic_debit_historical_pk PRIMARY KEY (id)
);


-- schsaf.tbl_bank_account definition

-- Drop table

-- DROP TABLE schsaf.tbl_bank_account;

CREATE TABLE schsaf.tbl_bank_account (
	id bigserial NOT NULL,
	account_name varchar(255) NULL,
	account_number varchar(255) NULL,
	account_status varchar(255) NULL,
	account_type varchar(255) NULL,
	allow_credit bool NULL,
	allow_debit bool NULL,
	bank_city varchar(255) NULL,
	bank_code varchar(255) NULL,
	bank_name varchar(255) NULL,
	currency varchar(255) NULL,
	customer_identification_number varchar(255) NULL,
	customer_identification_type varchar(255) NULL,
	customer_name varchar(255) NULL,
	is_closed bool NULL,
	is_account_manual bool NULL,
	has_news bool NULL,
	self_management bool DEFAULT false NOT NULL,
	created_at timestamp DEFAULT now() NULL,
	CONSTRAINT tbl_bank_account_pkey PRIMARY KEY (id)
);


-- schsaf.tbl_bank_account_rejection_types definition

-- Drop table

-- DROP TABLE schsaf.tbl_bank_account_rejection_types;

CREATE TABLE schsaf.tbl_bank_account_rejection_types (
	id int8 NOT NULL,
	"order" numeric(10) NOT NULL,
	description varchar(255) NOT NULL,
	created_at timestamp DEFAULT now() NOT NULL,
	inactivated_at timestamp NULL,
	CONSTRAINT tbl_bank_account_rejection_types_pkey PRIMARY KEY (id)
);


-- schsaf.tbl_bank_code definition

-- Drop table

-- DROP TABLE schsaf.tbl_bank_code;

CREATE TABLE schsaf.tbl_bank_code (
	code int4 NOT NULL,
	"name" varchar NOT NULL,
	ach_code varchar(6) NULL
);


-- schsaf.tbl_blocks_type definition

-- Drop table

-- DROP TABLE schsaf.tbl_blocks_type;

CREATE TABLE schsaf.tbl_blocks_type (
	code varchar(10) NOT NULL,
	is_automatic bool NOT NULL,
	is_disable_in_form bool NOT NULL,
	description varchar(50) NOT NULL,
	CONSTRAINT pk_tbl_locks_type PRIMARY KEY (code)
);


-- schsaf.tbl_business_relationships_rejection_reasons definition

-- Drop table

-- DROP TABLE schsaf.tbl_business_relationships_rejection_reasons;

CREATE TABLE schsaf.tbl_business_relationships_rejection_reasons (
	id bigserial NOT NULL,
	"order" numeric(10) NOT NULL,
	description varchar(255) NOT NULL,
	created_at timestamp DEFAULT now() NOT NULL,
	inactivated_at timestamp NULL,
	CONSTRAINT pk_bsnss_rltnshps_rjctn_rsns PRIMARY KEY (id)
);


-- schsaf.tbl_category_historical definition

-- Drop table

-- DROP TABLE schsaf.tbl_category_historical;

CREATE TABLE schsaf.tbl_category_historical (
	category varchar(3) NOT NULL,
	nit varchar(200) NOT NULL,
	value numeric(22, 6) NOT NULL,
	gmf numeric(22, 6) NULL,
	rft numeric(22, 6) NULL,
	created_at date NOT NULL,
	id_relation int8 NOT NULL,
	CONSTRAINT tbl_category_historical_category_nit_value_gmf_rft_created__key UNIQUE (category, nit, value, gmf, rft, created_at, id_relation)
);


-- schsaf.tbl_causal_annulment definition

-- Drop table

-- DROP TABLE schsaf.tbl_causal_annulment;

CREATE TABLE schsaf.tbl_causal_annulment (
	id int4 NOT NULL,
	causal varchar NULL,
	CONSTRAINT tbl_causal_annulment_pk PRIMARY KEY (id)
);


-- schsaf.tbl_cities definition

-- Drop table

-- DROP TABLE schsaf.tbl_cities;

CREATE TABLE schsaf.tbl_cities (
	city_code varchar(20) NOT NULL,
	city_name varchar(100) NOT NULL,
	country_code varchar(10) NOT NULL,
	country_name varchar(50) NOT NULL,
	state_code varchar(20) NOT NULL,
	state_name varchar(100) NOT NULL,
	CONSTRAINT tbl_cities_pkey PRIMARY KEY (city_code)
);


-- schsaf.tbl_client definition

-- Drop table

-- DROP TABLE schsaf.tbl_client;

CREATE TABLE schsaf.tbl_client (
	id bigserial NOT NULL,
	authorize_sharing_information varchar(2) NULL,
	customer_status varchar(20) NOT NULL,
	date_last_update timestamp NULL,
	document_number varchar(255) NULL,
	document_type varchar(50) NULL,
	full_name varchar(220) NULL,
	mdm_key varchar(20) NOT NULL,
	regime_iva varchar(255) NULL,
	role_ varchar(20) NULL,
	self_retainer_other_income varchar(255) NULL,
	short_name varchar(20) NULL,
	special_dial varchar(20) NULL,
	status varchar(255) NULL,
	type_customer varchar(255) NULL,
	with_holding_agent varchar(255) NULL,
	blocked_payment bool NULL,
	vinculation_date timestamp NULL,
	registration_date timestamp NULL,
	city_code varchar(20) NULL,
	global_quota numeric(22, 4) DEFAULT 0.0 NULL,
	verification_digit bpchar(1) NULL,
	user_name varchar NULL,
	is_simple_regime bool DEFAULT false NULL,
	has_life_insurance bool DEFAULT false NOT NULL,
	gender varchar NULL,
	birth_date date NULL,
	CONSTRAINT tbl_client_pkey PRIMARY KEY (id),
	CONSTRAINT tbl_client_un_document_client UNIQUE (document_number, document_type),
	CONSTRAINT uk_gddf48fxayxpsw12ff47k2h95 UNIQUE (mdm_key)
);


-- schsaf.tbl_client_payment_instruction definition

-- Drop table

-- DROP TABLE schsaf.tbl_client_payment_instruction;

CREATE TABLE schsaf.tbl_client_payment_instruction (
	client_id int8 NOT NULL,
	last_update timestamp NULL,
	payment_application varchar(255) NULL,
	payment_application_date date NULL,
	type_application_id int8 NULL,
	CONSTRAINT tbl_client_payment_instruction_pkey PRIMARY KEY (client_id)
);


-- schsaf.tbl_code_response definition

-- Drop table

-- DROP TABLE schsaf.tbl_code_response;

CREATE TABLE schsaf.tbl_code_response (
	id serial4 NOT NULL,
	code varchar(100) NOT NULL,
	description varchar(100) NOT NULL,
	prenotification bool NOT NULL,
	novel bool NOT NULL,
	debit bool NOT NULL,
	sucess bool NOT NULL,
	CONSTRAINT tbl_code_response_pkey PRIMARY KEY (id)
);


-- schsaf.tbl_countries definition

-- Drop table

-- DROP TABLE schsaf.tbl_countries;

CREATE TABLE schsaf.tbl_countries (
	id serial4 NOT NULL,
	country_code varchar NOT NULL,
	country_name varchar NOT NULL,
	country_state varchar NOT NULL,
	created_at timestamp NULL,
	updated_at timestamp NULL,
	created_by varchar NOT NULL,
	updated_by varchar NULL,
	risk_qualitative varchar NOT NULL,
	CONSTRAINT tbl_countries_pk PRIMARY KEY (id)
);


-- schsaf.tbl_cxref_historical definition

-- Drop table

-- DROP TABLE schsaf.tbl_cxref_historical;

CREATE TABLE schsaf.tbl_cxref_historical (
	id_cxref int8 DEFAULT nextval('schsaf.tbl_cxref_historical_id_seq'::regclass) NOT NULL,
	id_client int8 NOT NULL,
	document_type varchar(20) NULL,
	document_number varchar(25) NULL,
	city varchar(50) NULL,
	type_customer varchar(25) NULL,
	id_obligation int8 NOT NULL,
	holder varchar(255) NOT NULL,
	state varchar(100) NULL,
	homologation_consecutive int8 NOT NULL,
	report_date date DEFAULT CURRENT_DATE NOT NULL,
	CONSTRAINT pk_tbl_cxref_historical PRIMARY KEY (id_cxref)
);


-- schsaf.tbl_daily_report definition

-- Drop table

-- DROP TABLE schsaf.tbl_daily_report;

CREATE TABLE schsaf.tbl_daily_report (
	id bigserial NOT NULL,
	"name" varchar(100) NOT NULL,
	description varchar(100) NOT NULL,
	endpoint varchar(250) NOT NULL,
	created_at timestamp DEFAULT CURRENT_DATE NOT NULL,
	CONSTRAINT tbl_daily_report_pkey PRIMARY KEY (id)
);


-- schsaf.tbl_disbursement_devolution_causals definition

-- Drop table

-- DROP TABLE schsaf.tbl_disbursement_devolution_causals;

CREATE TABLE schsaf.tbl_disbursement_devolution_causals (
	id serial4 NOT NULL,
	description varchar NULL,
	CONSTRAINT tbl_disbursement_devolution_causals_pk PRIMARY KEY (id)
);


-- schsaf.tbl_disbursement_ibr_calculus definition

-- Drop table

-- DROP TABLE schsaf.tbl_disbursement_ibr_calculus;

CREATE TABLE schsaf.tbl_disbursement_ibr_calculus (
	id bigserial NOT NULL,
	product varchar NOT NULL,
	application_number varchar NOT NULL,
	operation_term int4 NULL,
	lower_term int4 NULL,
	upper_term int4 NULL,
	lower_rate numeric NULL,
	upper_rate numeric NULL,
	interpolated_rate numeric NULL,
	provider_rate_ea numeric NULL,
	rem_operation_term int4 NULL,
	rem_lower_term int4 NULL,
	rem_upper_term int4 NULL,
	rem_lower_rate numeric NULL,
	rem_upper_rate numeric NULL,
	rem_interpolated_rate numeric NULL,
	CONSTRAINT tbl_disbursement_ibr_calculus_pk PRIMARY KEY (id),
	CONSTRAINT tbl_disbursement_ibr_calculus_unique_key UNIQUE (product, application_number)
);


-- schsaf.tbl_disbursement_lt_quota_consumption definition

-- Drop table

-- DROP TABLE schsaf.tbl_disbursement_lt_quota_consumption;

CREATE TABLE schsaf.tbl_disbursement_lt_quota_consumption (
	id bigserial NOT NULL,
	created_at timestamp NOT NULL,
	state varchar NOT NULL,
	requested_quota float8 NOT NULL,
	available_quota float8 NOT NULL,
	consumed_quota float8 NULL,
	freed_quota float8 NULL,
	updated_at timestamp NULL,
	CONSTRAINT tbl_disbursement_lt_quota_consumption_pk PRIMARY KEY (id)
);


-- schsaf.tbl_disbursement_rejection_causals definition

-- Drop table

-- DROP TABLE schsaf.tbl_disbursement_rejection_causals;

CREATE TABLE schsaf.tbl_disbursement_rejection_causals (
	id serial4 NOT NULL,
	description varchar NULL,
	is_after_validations bool NULL,
	CONSTRAINT tbl_disbursement_rejection_causals_pk PRIMARY KEY (id)
);


-- schsaf.tbl_e2e_data definition

-- Drop table

-- DROP TABLE schsaf.tbl_e2e_data;

CREATE TABLE schsaf.tbl_e2e_data (
	id bigserial NOT NULL,
	process_name varchar(20) NULL,
	type_value varchar(20) NULL,
	key_value varchar(50) NOT NULL,
	value_object varchar NULL,
	CONSTRAINT tbl_e2e_data_pk PRIMARY KEY (id),
	CONSTRAINT tbl_e2e_data_unique UNIQUE (key_value)
);


-- schsaf.tbl_enriched_accounts_receivable definition

-- Drop table

-- DROP TABLE schsaf.tbl_enriched_accounts_receivable;

CREATE TABLE schsaf.tbl_enriched_accounts_receivable (
	id bigserial NOT NULL,
	accounting_date date NOT NULL,
	document_number_digit varchar(50) NOT NULL,
	document_number varchar(50) NOT NULL,
	current_balance numeric(22, 6) NOT NULL,
	"source" varchar(5) NOT NULL,
	created_at timestamp DEFAULT now() NOT NULL,
	updated_at timestamp DEFAULT now() NOT NULL,
	CONSTRAINT tbl_enriched_accounts_receivable_pkey PRIMARY KEY (id)
);


-- schsaf.tbl_enriched_agreement_processed definition

-- Drop table

-- DROP TABLE schsaf.tbl_enriched_agreement_processed;

CREATE TABLE schsaf.tbl_enriched_agreement_processed (
	id serial4 NOT NULL,
	type_agreement varchar(50) NOT NULL,
	name_agreement varchar(50) NULL,
	created_at timestamp DEFAULT now() NOT NULL,
	CONSTRAINT tbl_enriched_agreement_processed_pkey PRIMARY KEY (id)
);


-- schsaf.tbl_enriched_obligation definition

-- Drop table

-- DROP TABLE schsaf.tbl_enriched_obligation;

CREATE TABLE schsaf.tbl_enriched_obligation (
	id int8 DEFAULT nextval('schsaf.tbl_obligations_enriched_id_seq'::regclass) NOT NULL,
	document_number_obliged_digit varchar(20) NOT NULL,
	document_number_obliged varchar(20) NOT NULL,
	name_obliged varchar(50) NULL,
	document_number_payer_digit varchar(20) NULL,
	document_number_payer varchar(20) NULL,
	name_payer varchar(50) NULL,
	document_number_provider_digit varchar(20) NULL,
	document_number_provider varchar(20) NULL,
	name_provider varchar(50) NULL,
	homologation_consecutive varchar(50) NULL,
	product varchar(50) NULL,
	modality varchar(30) NULL,
	plan varchar(5) NULL,
	obligation_number varchar(18) NULL,
	issuance_date date NULL,
	net_due_date date NULL,
	total_due_date date NULL,
	remunerative_balance numeric(22, 6) NULL,
	moratorium_balance numeric(22, 6) NULL,
	principal_balance numeric(22, 6) NULL,
	total_balance numeric(22, 6) NULL,
	outstanding_balance numeric(22, 6) NULL,
	type_application_payment varchar(5) NULL,
	vpd_active varchar(5) NULL,
	automatic_debit_marker varchar(2) NULL,
	"source" varchar(5) NULL,
	state varchar(20) NULL,
	created_at timestamp NULL,
	updated_at timestamp NULL,
	selected_instruction bool DEFAULT false NULL,
	vpd_value numeric(22, 2) NULL,
	CONSTRAINT tbl_enriched_obligation_pkey PRIMARY KEY (id)
);
CREATE INDEX tbl_enriched_obligation_obligation_number_idx ON schsaf.tbl_enriched_obligation USING btree (obligation_number);


-- schsaf.tbl_events definition

-- Drop table

-- DROP TABLE schsaf.tbl_events;

CREATE TABLE schsaf.tbl_events (
	id bigserial NOT NULL,
	description varchar(255) NULL,
	dual_control bool NULL,
	CONSTRAINT tbl_events_pkey PRIMARY KEY (id)
);


-- schsaf.tbl_exchange_rate definition

-- Drop table

-- DROP TABLE schsaf.tbl_exchange_rate;

CREATE TABLE schsaf.tbl_exchange_rate (
	id serial4 NOT NULL,
	effective_date_from date NOT NULL,
	effective_date_to date NOT NULL,
	created_at timestamp NOT NULL,
	updated_at timestamp NULL,
	rate int8 NOT NULL,
	currency_type varchar NOT NULL,
	created_by varchar NOT NULL,
	updated_by varchar NOT NULL
);


-- schsaf.tbl_finance_charge_types definition

-- Drop table

-- DROP TABLE schsaf.tbl_finance_charge_types;

CREATE TABLE schsaf.tbl_finance_charge_types (
	id serial4 NOT NULL,
	"name" varchar(50) NOT NULL,
	CONSTRAINT tbl_finance_charge_types_pkey PRIMARY KEY (id)
);


-- schsaf.tbl_financing_plan_payment_condition definition

-- Drop table

-- DROP TABLE schsaf.tbl_financing_plan_payment_condition;

CREATE TABLE schsaf.tbl_financing_plan_payment_condition (
	id serial4 NOT NULL,
	"name" varchar(100) NOT NULL,
	code varchar(100) NOT NULL,
	CONSTRAINT tbl_financing_plan_payment_condition_code_unique UNIQUE (code),
	CONSTRAINT tbl_financing_plan_payment_condition_pk PRIMARY KEY (id)
);


-- schsaf.tbl_global_quota_factoring definition

-- Drop table

-- DROP TABLE schsaf.tbl_global_quota_factoring;

CREATE TABLE schsaf.tbl_global_quota_factoring (
	id serial4 NOT NULL,
	start_date date NOT NULL,
	end_date date NOT NULL,
	act_number varchar(50) NULL,
	client_id int8 NULL,
	created_at timestamp NOT NULL,
	updated_at timestamp NULL,
	state varchar(255) NULL
);


-- schsaf.tbl_holidays definition

-- Drop table

-- DROP TABLE schsaf.tbl_holidays;

CREATE TABLE schsaf.tbl_holidays (
	id bigserial NOT NULL,
	"day" date NULL,
	description varchar(50) NULL,
	updated_at timestamp NULL,
	state varchar(30) NULL,
	CONSTRAINT tbl_holidays_pkey PRIMARY KEY (id)
);


-- schsaf.tbl_inbox_payment definition

-- Drop table

-- DROP TABLE schsaf.tbl_inbox_payment;

CREATE TABLE schsaf.tbl_inbox_payment (
	id bigserial NOT NULL,
	consecutive_payment varchar(255) NULL,
	nit_beneficiary varchar(255) NULL,
	shift numeric(22, 4) NULL,
	created_at timestamp NULL,
	updated_at timestamp NULL,
	CONSTRAINT tbl_inbox_payment_pkey PRIMARY KEY (id)
);


-- schsaf.tbl_invoice_lt_aggrupation_consecutive definition

-- Drop table

-- DROP TABLE schsaf.tbl_invoice_lt_aggrupation_consecutive;

CREATE TABLE schsaf.tbl_invoice_lt_aggrupation_consecutive (
	year_month bpchar(4) NOT NULL,
	last_consecutive int4 NOT NULL,
	CONSTRAINT tbl_invoice_lt_aggrupation_consecutive_pkey PRIMARY KEY (year_month)
);


-- schsaf.tbl_invoice_lt_discount_days definition

-- Drop table

-- DROP TABLE schsaf.tbl_invoice_lt_discount_days;

CREATE TABLE schsaf.tbl_invoice_lt_discount_days (
	plan_id int8 NOT NULL,
	net_due_date date NOT NULL,
	day_number int4 NOT NULL,
	discount_date date NOT NULL,
	discount_value numeric NOT NULL,
	CONSTRAINT tbl_invoice_lt_discount_days_pkey PRIMARY KEY (plan_id, net_due_date, day_number)
);


-- schsaf.tbl_json_report definition

-- Drop table

-- DROP TABLE schsaf.tbl_json_report;

CREATE TABLE schsaf.tbl_json_report (
	id serial4 NOT NULL,
	start_date date NOT NULL,
	end_date date NOT NULL,
	description text NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	json_data text NULL,
	CONSTRAINT tbl_json_report_pkey PRIMARY KEY (id)
);
CREATE INDEX idx_tbl_json_report_description_start_end ON schsaf.tbl_json_report USING btree (description, start_date, end_date);


-- schsaf.tbl_life_insurance definition

-- Drop table

-- DROP TABLE schsaf.tbl_life_insurance;

CREATE TABLE schsaf.tbl_life_insurance (
	id bigserial NOT NULL,
	start_date date NOT NULL,
	state varchar NOT NULL,
	creation_date timestamp DEFAULT now() NOT NULL,
	approved_date timestamp NULL,
	updated_date timestamp NULL,
	executor_user varchar NOT NULL,
	approved_user varchar NULL,
	CONSTRAINT tbl_life_insurance_pk PRIMARY KEY (id)
);


-- schsaf.tbl_maintenance_account_type definition

-- Drop table

-- DROP TABLE schsaf.tbl_maintenance_account_type;

CREATE TABLE schsaf.tbl_maintenance_account_type (
	id serial4 NOT NULL,
	type_code varchar(10) NOT NULL,
	description varchar(255) NOT NULL,
	CONSTRAINT tbl_maintenance_account_type_pkey PRIMARY KEY (id)
);


-- schsaf.tbl_maintenance_category_type definition

-- Drop table

-- DROP TABLE schsaf.tbl_maintenance_category_type;

CREATE TABLE schsaf.tbl_maintenance_category_type (
	id bigserial NOT NULL,
	"name" varchar(100) NULL,
	category_code varchar(20) NOT NULL,
	state varchar(20) NULL,
	CONSTRAINT tbl_maintenance_category_type_pk PRIMARY KEY (id)
);


-- schsaf.tbl_maintenance_causal definition

-- Drop table

-- DROP TABLE schsaf.tbl_maintenance_causal;

CREATE TABLE schsaf.tbl_maintenance_causal (
	id bigserial NOT NULL,
	"name" varchar(255) NULL,
	init_effective_date date NULL,
	end_effective_date date NULL,
	state varchar(20) NULL,
	deleted_date date NULL,
	CONSTRAINT tbl_maintenance_causal_pkey PRIMARY KEY (id)
);


-- schsaf.tbl_maintenance_devolution_type definition

-- Drop table

-- DROP TABLE schsaf.tbl_maintenance_devolution_type;

CREATE TABLE schsaf.tbl_maintenance_devolution_type (
	id bigserial NOT NULL,
	description varchar(150) NULL,
	CONSTRAINT tbl_maintenance_devolution_type_pk PRIMARY KEY (id)
);


-- schsaf.tbl_mock_external_apis definition

-- Drop table

-- DROP TABLE schsaf.tbl_mock_external_apis;

CREATE TABLE schsaf.tbl_mock_external_apis (
	id int8 NOT NULL,
	code varchar(255) NOT NULL,
	endpoint varchar NOT NULL,
	response varchar NOT NULL,
	CONSTRAINT tbl_mock_external_apis_pkey PRIMARY KEY (id),
	CONSTRAINT tbl_mock_external_apis_uk UNIQUE (code, endpoint)
);


-- schsaf.tbl_obligation_historical definition

-- Drop table

-- DROP TABLE schsaf.tbl_obligation_historical;

CREATE TABLE schsaf.tbl_obligation_historical (
	id serial4 NOT NULL,
	nit varchar NOT NULL,
	obligation_id int8 NOT NULL,
	state varchar NOT NULL,
	fixed_remunerative_rate numeric(10, 4) NOT NULL,
	remunerative_rate numeric(10, 4) NOT NULL,
	remunerative_rate_adjust numeric(10, 4) NOT NULL,
	product_modality int8 NOT NULL,
	created timestamp(0) NOT NULL,
	date_adjust timestamp(0) NOT NULL,
	causal_adjust varchar NOT NULL,
	start_date_rate date NOT NULL,
	end_date_rate date NOT NULL,
	slack_point numeric(4) NULL,
	CONSTRAINT tbl_obligation_historical_pk PRIMARY KEY (id)
);


-- schsaf.tbl_obligation_historical_report definition

-- Drop table

-- DROP TABLE schsaf.tbl_obligation_historical_report;

CREATE TABLE schsaf.tbl_obligation_historical_report (
	id bigserial NOT NULL,
	obligation_id varchar(20) NOT NULL,
	document_provider varchar(20) NULL,
	name_provider varchar(255) NULL,
	document_payer varchar(20) NULL,
	name_payer varchar(255) NULL,
	document_holder varchar(20) NULL,
	name_holder varchar(255) NULL,
	name_product varchar(50) NULL,
	modality varchar(15) NULL,
	currency varchar(15) NULL,
	number_obligation varchar NULL,
	number_obligation_homologated varchar NULL,
	number_document varchar NULL,
	remunerative_rate numeric(7, 4) NULL,
	remunerative_rate_type varchar(30) NULL,
	refund_rate numeric(7, 4) NULL,
	refund_rate_type varchar(30) NULL,
	isrefundavailable bool NULL,
	discount_rate numeric(22, 4) NULL,
	value_usury_rate numeric(7, 4) NULL,
	created_at_obligation date NULL,
	total_due_date date NULL,
	net_due_date date NULL,
	date_last_payment date NULL,
	age_obligation int4 NULL,
	obligation_state varchar(100) NULL,
	disbursement_value numeric(22, 4) NULL,
	discount_value numeric(22, 4) NULL,
	accrued_amortized numeric(22, 4) NULL,
	rft_value numeric(22, 4) NULL,
	principal_balance numeric(22, 4) NULL,
	remunerative_balance numeric(22, 4) NULL,
	moratorium_balance numeric(22, 4) NULL,
	creation_date date NULL,
	id_product int8 NULL,
	early_payment_discount numeric(22, 4) NULL,
	transfer_date date NULL,
	disbursement_date date NULL,
	last_update timestamp NULL,
	issuance_date date NULL,
	invoice_value numeric(22, 4) NULL,
	accrued_remunerative numeric(22, 4) NULL,
	accrued_moratorium numeric(22, 4) NULL,
	provider_rate numeric(22, 4) NULL,
	product_modality_id int8 NULL,
	gmf_value numeric(22, 4) NULL,
	prepayment_rate numeric(11, 8) NULL,
	receivables_balance numeric(20, 4) NULL,
	account_payable numeric(20, 4) NULL,
	vpd_active bool NULL,
	vpd_refund_value numeric(22, 4) NULL,
	CONSTRAINT pk_tbl_obligation_historical_report PRIMARY KEY (id)
);
CREATE INDEX creation_date_obligation_historical_index ON schsaf.tbl_obligation_historical_report USING btree (creation_date);


-- schsaf.tbl_output_consolidated_movements_accountants definition

-- Drop table

-- DROP TABLE schsaf.tbl_output_consolidated_movements_accountants;

CREATE TABLE schsaf.tbl_output_consolidated_movements_accountants (
	identificador varchar(20) NULL,
	fechdcto varchar(8) NOT NULL,
	fechcont varchar(8) NOT NULL,
	grledger varchar(4) NULL,
	referenc varchar(16) NOT NULL,
	txtcabec varchar(25) NOT NULL,
	clasedoc varchar(2) NOT NULL,
	sociedad varchar(4) NOT NULL,
	currency varchar(5) NOT NULL,
	clavcont varchar(2) NOT NULL,
	ctacontb varchar(17) NOT NULL,
	impomtrx numeric(22, 2) NOT NULL,
	impomsoc numeric(22, 2) NOT NULL,
	centroco varchar(10) NOT NULL,
	ordenint varchar(12) NULL,
	fechvalo varchar(8) NOT NULL,
	asignacn varchar(18) NOT NULL,
	txtposcn varchar(50) NOT NULL,
	vencimto varchar(8) NULL,
	centrobe varchar(10) NOT NULL,
	segmento varchar(10) NOT NULL,
	objcosto varchar(12) NULL,
	clavref1 varchar(12) NULL,
	clavref2 varchar(12) NULL,
	clavref3 varchar(20) NULL,
	sociedgl varchar(6) NOT NULL,
	material varchar(18) NULL,
	pospresup varchar(14) NULL,
	centroge varchar(16) NOT NULL
);


-- schsaf.tbl_param_report definition

-- Drop table

-- DROP TABLE schsaf.tbl_param_report;

CREATE TABLE schsaf.tbl_param_report (
	id bigserial NOT NULL,
	"name" varchar(100) NOT NULL,
	description varchar(100) NOT NULL,
	endpoint varchar(250) NOT NULL,
	creation_date date NOT NULL,
	CONSTRAINT tbl_param_report_pkey PRIMARY KEY (id)
);


-- schsaf.tbl_parameterization_process definition

-- Drop table

-- DROP TABLE schsaf.tbl_parameterization_process;

CREATE TABLE schsaf.tbl_parameterization_process (
	initial_code varchar(100) NOT NULL,
	"name" varchar(100) NOT NULL,
	description varchar(150) NULL,
	CONSTRAINT schsaf_tbl_parameterization_process_pk PRIMARY KEY (initial_code)
);


-- schsaf.tbl_parameterization_subprocess definition

-- Drop table

-- DROP TABLE schsaf.tbl_parameterization_subprocess;

CREATE TABLE schsaf.tbl_parameterization_subprocess (
	initial_code varchar(100) NOT NULL,
	"name" varchar(100) NOT NULL,
	description varchar(150) NULL,
	CONSTRAINT schsaf_tbl_parameterization_subprocess_pk PRIMARY KEY (initial_code)
);


-- schsaf.tbl_payback_drafts_types definition

-- Drop table

-- DROP TABLE schsaf.tbl_payback_drafts_types;

CREATE TABLE schsaf.tbl_payback_drafts_types (
	id bigserial NOT NULL,
	description varchar(100) NOT NULL,
	CONSTRAINT tbl_payback_drafts_types_id_key UNIQUE (id)
);


-- schsaf.tbl_payment_agreement_enriched definition

-- Drop table

-- DROP TABLE schsaf.tbl_payment_agreement_enriched;

CREATE TABLE schsaf.tbl_payment_agreement_enriched (
	id serial4 NOT NULL,
	type_agreement varchar(50) NOT NULL,
	name_agreement varchar(50) NULL,
	created_at timestamp DEFAULT now() NOT NULL,
	CONSTRAINT tbl_payment_agreement_enriched_pkey PRIMARY KEY (id)
);


-- schsaf.tbl_payment_application definition

-- Drop table

-- DROP TABLE schsaf.tbl_payment_application;

CREATE TABLE schsaf.tbl_payment_application (
	id bigserial NOT NULL,
	application_type varchar(20) NULL,
	state varchar(20) NOT NULL,
	applied_value numeric(22, 4) NULL,
	remaining_value numeric(22, 4) NULL,
	user_applied varchar(50) NULL,
	created_at timestamp NULL,
	payment_id int8 NULL,
	surplus_value numeric(22, 4) NULL,
	payment_income_distributed bool NULL,
	distribution_consecutive int4 NULL,
	payment_value numeric(22, 4) NULL,
	client_document varchar(100) NULL,
	payment_date date NULL,
	consecutive varchar(20) NULL,
	missing_value numeric(22, 4) NULL,
	fault_description varchar(500) NULL,
	external_reference int8 NULL,
	payment_status varchar(50) NULL,
	CONSTRAINT tbl_payment_application_pkey PRIMARY KEY (id)
);
CREATE UNIQUE INDEX tbl_payment_application_id_uindex ON schsaf.tbl_payment_application USING btree (id);


-- schsaf.tbl_payment_channel definition

-- Drop table

-- DROP TABLE schsaf.tbl_payment_channel;

CREATE TABLE schsaf.tbl_payment_channel (
	id int8 NOT NULL,
	description varchar(200) NULL,
	agreement_code varchar(10) NULL,
	channel_code varchar(10) NULL,
	CONSTRAINT tbl_payment_channel_pkey PRIMARY KEY (id)
);


-- schsaf.tbl_payment_pse definition

-- Drop table

-- DROP TABLE schsaf.tbl_payment_pse;

CREATE TABLE schsaf.tbl_payment_pse (
	id bigserial NOT NULL,
	nit_payer varchar(20) NULL,
	name_payer varchar(50) NULL,
	transaction_date date NULL,
	application_date date NULL,
	transaction_value numeric(20, 2) NULL,
	state varchar(25) NULL,
	nit_beneficiary varchar(20) NULL,
	name_beneficiary varchar(50) NULL,
	transaction_time time NULL,
	CONSTRAINT paymentpse_pk PRIMARY KEY (id)
);


-- schsaf.tbl_payment_response_output definition

-- Drop table

-- DROP TABLE schsaf.tbl_payment_response_output;

CREATE TABLE schsaf.tbl_payment_response_output (
	id serial4 NOT NULL,
	payer_nit int8 NOT NULL,
	payer_name_nit varchar NOT NULL,
	payer_account_bank int8 NOT NULL,
	account_number_debited int8 NOT NULL,
	type_transaction int8 NOT NULL,
	transaction_value numeric NOT NULL,
	"indicator" varchar NOT NULL,
	reference_1 varchar NOT NULL,
	reference_2 varchar NOT NULL,
	payment_value numeric NOT NULL,
	commission_value numeric NOT NULL,
	response_code varchar NOT NULL,
	expiration_application_date date NOT NULL,
	period_billed int8 NOT NULL,
	"cycle" varchar NOT NULL,
	payment_channel int8 NOT NULL,
	payment_place int8 NOT NULL,
	payment_office int8 NOT NULL,
	generation_date date NULL,
	sequence_output varchar NOT NULL,
	CONSTRAINT tbl_payment_response_output_pk PRIMARY KEY (id)
);


-- schsaf.tbl_payment_schedule_order definition

-- Drop table

-- DROP TABLE schsaf.tbl_payment_schedule_order;

CREATE TABLE schsaf.tbl_payment_schedule_order (
	channel int8 NOT NULL,
	end_time time NULL,
	execution_day varchar(40) NULL,
	initial_time time NULL,
	updated_at timestamp NULL,
	num_order int4 NULL,
	CONSTRAINT tbl_payment_schedule_order_pkey PRIMARY KEY (channel)
);


-- schsaf.tbl_payment_temp definition

-- Drop table

-- DROP TABLE schsaf.tbl_payment_temp;

CREATE TABLE schsaf.tbl_payment_temp (
	id serial4 NOT NULL,
	origin numeric(1) NOT NULL,
	nit varchar(15) NOT NULL,
	cnname varchar(60) NOT NULL,
	num302 numeric(3) NOT NULL,
	fectrans numeric(8) NOT NULL,
	fecapli numeric(8) NOT NULL,
	secuenc varchar(2) NULL,
	nroctac varchar(17) NOT NULL,
	vlrtrans numeric(17, 2) NOT NULL,
	horproce numeric(8) NOT NULL,
	nombrep varchar(50) NOT NULL,
	nitben varchar(15) NOT NULL,
	estado varchar(1) NULL,
	created_at timestamp NOT NULL,
	updated_at timestamp NULL,
	referencia varchar(80) NULL,
	CONSTRAINT tbl_payment_temp_pkey PRIMARY KEY (id)
);


-- schsaf.tbl_payment_tolerance definition

-- Drop table

-- DROP TABLE schsaf.tbl_payment_tolerance;

CREATE TABLE schsaf.tbl_payment_tolerance (
	id serial4 NOT NULL,
	currency varchar(50) NOT NULL,
	"type" varchar(40) NOT NULL,
	missing_value numeric(4) NULL,
	surplus_value numeric(4) NULL,
	last_update timestamp NULL,
	CONSTRAINT tbl_payment_tolerance_pkey PRIMARY KEY (id)
);


-- schsaf.tbl_periodicity definition

-- Drop table

-- DROP TABLE schsaf.tbl_periodicity;

CREATE TABLE schsaf.tbl_periodicity (
	id bigserial NOT NULL,
	abbr varchar(10) NOT NULL,
	created_at timestamp NOT NULL,
	inactivated_at timestamp NULL,
	modality_days int4 NOT NULL,
	"name" varchar(100) NOT NULL,
	updated_at timestamp NOT NULL,
	CONSTRAINT tbl_periodicity_pkey PRIMARY KEY (id)
);


-- schsaf.tbl_platform definition

-- Drop table

-- DROP TABLE schsaf.tbl_platform;

CREATE TABLE schsaf.tbl_platform (
	id bigserial NOT NULL,
	mdm_key varchar(20) NULL,
	document_type varchar(5) DEFAULT 'NIT'::character varying NOT NULL,
	document_number varchar(20) NOT NULL,
	acronym varchar(10) NOT NULL,
	full_name varchar(80) NOT NULL,
	short_name varchar(40) NOT NULL,
	disbursement_instruction varchar(10) NOT NULL,
	created_at timestamp DEFAULT now() NOT NULL,
	updated_at timestamp DEFAULT now() NOT NULL,
	CONSTRAINT tbl_platform_pkey PRIMARY KEY (id)
);


-- schsaf.tbl_process_log definition

-- Drop table

-- DROP TABLE schsaf.tbl_process_log;

CREATE TABLE schsaf.tbl_process_log (
	id serial4 NOT NULL,
	process_name varchar(100) NOT NULL,
	process_date date NOT NULL,
	process_status varchar(100) NOT NULL,
	process_date_init timestamp NOT NULL,
	process_date_fin timestamp NULL,
	message_log varchar(500) NULL,
	CONSTRAINT tbl_process_log_pkey PRIMARY KEY (id)
);


-- schsaf.tbl_products definition

-- Drop table

-- DROP TABLE schsaf.tbl_products;

CREATE TABLE schsaf.tbl_products (
	id bigserial NOT NULL,
	accounting_frequency varchar(30) NULL,
	base int4 NULL,
	business_day_setting bool NULL,
	calculation_days int4 NULL,
	calculation_type varchar(30) NULL,
	calculation_way varchar(30) NULL,
	created_at timestamp NULL,
	currency varchar(15) NULL,
	liability varchar(30) NULL,
	"name" varchar(50) NULL,
	operation_type varchar(30) NULL,
	payment_type varchar(30) NULL,
	rate_change varchar(30) NULL,
	state varchar(20) NULL,
	CONSTRAINT tbl_products_pkey PRIMARY KEY (id)
);


-- schsaf.tbl_quota_bulk_load definition

-- Drop table

-- DROP TABLE schsaf.tbl_quota_bulk_load;

CREATE TABLE schsaf.tbl_quota_bulk_load (
	id uuid DEFAULT gen_random_uuid() NOT NULL,
	document_type varchar NOT NULL,
	document_number varchar NOT NULL,
	product_modality varchar NOT NULL,
	supplier varchar NULL,
	value numeric NULL,
	executed bool NOT NULL,
	reason varchar NULL,
	file_name varchar NOT NULL,
	execute_user varchar NOT NULL,
	created_at timestamp NOT NULL,
	old_value numeric NULL,
	CONSTRAINT tbl_quota_bulk_load_pkey PRIMARY KEY (id)
);


-- schsaf.tbl_quota_extra_type definition

-- Drop table

-- DROP TABLE schsaf.tbl_quota_extra_type;

CREATE TABLE schsaf.tbl_quota_extra_type (
	id bigserial NOT NULL,
	description varchar(255) NOT NULL,
	created_at timestamp NOT NULL,
	update_at timestamp NULL,
	CONSTRAINT pk_tbl_quota_extra_type PRIMARY KEY (id)
);


-- schsaf.tbl_quota_factoring_exclusive_limit definition

-- Drop table

-- DROP TABLE schsaf.tbl_quota_factoring_exclusive_limit;

CREATE TABLE schsaf.tbl_quota_factoring_exclusive_limit (
	id bigserial NOT NULL,
	approved_limit numeric(19, 2) NULL,
	client_id int8 NULL,
	consumed_limit numeric(19, 2) NULL,
	end_date_quota date NULL,
	modality_id int8 NULL,
	product_id int8 NULL,
	start_date_quota date NULL,
	quota_state varchar(255) NULL,
	supplier_id int8 NULL,
	updated timestamp NULL,
	product_modality_id int8 NULL,
	created timestamp(0) NULL,
	CONSTRAINT tbl_quota_factoring_exclusive_limit_pkey PRIMARY KEY (id)
);


-- schsaf.tbl_rate_historical definition

-- Drop table

-- DROP TABLE schsaf.tbl_rate_historical;

CREATE TABLE schsaf.tbl_rate_historical (
	id bigserial NOT NULL,
	created timestamp NULL,
	created_rate timestamp NULL,
	end_date date NULL,
	"name" varchar(255) NULL,
	rate_id int8 NULL,
	start_date date NULL,
	status varchar(255) NULL,
	updated_rate timestamp NULL,
	value numeric(19, 2) NULL,
	CONSTRAINT tbl_rate_historical_pkey PRIMARY KEY (id)
);


-- schsaf.tbl_reference definition

-- Drop table

-- DROP TABLE schsaf.tbl_reference;

CREATE TABLE schsaf.tbl_reference (
	id bigserial NOT NULL,
	name_table varchar(50) NULL,
	code_table varchar(20) NULL,
	CONSTRAINT tbl_reference_pk PRIMARY KEY (id)
);


-- schsaf.tbl_rejection_reason definition

-- Drop table

-- DROP TABLE schsaf.tbl_rejection_reason;

CREATE TABLE schsaf.tbl_rejection_reason (
	id serial4 NOT NULL,
	description varchar(150) NOT NULL,
	process varchar(100) NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT tbl_rejection_reason_pkey PRIMARY KEY (id)
);


-- schsaf.tbl_rejection_reasons definition

-- Drop table

-- DROP TABLE schsaf.tbl_rejection_reasons;

CREATE TABLE schsaf.tbl_rejection_reasons (
	id bigserial NOT NULL,
	reason varchar(100) NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	CONSTRAINT tbl_rejection_reasons_pkey PRIMARY KEY (id)
);


-- schsaf.tbl_slack_page definition

-- Drop table

-- DROP TABLE schsaf.tbl_slack_page;

CREATE TABLE schsaf.tbl_slack_page (
	id serial4 NOT NULL,
	title varchar(100) NULL,
	subtitle varchar(100) NULL,
	image1 varchar NOT NULL,
	update_at timestamp NOT NULL,
	image2 varchar NULL,
	image3 varchar NULL,
	vertical_align bool DEFAULT false NOT NULL
);


-- schsaf.tbl_slack_point definition

-- Drop table

-- DROP TABLE schsaf.tbl_slack_point;

CREATE TABLE schsaf.tbl_slack_point (
	id bigserial NOT NULL,
	start_date date NOT NULL,
	end_date date NOT NULL,
	last_saved_date timestamp NOT NULL,
	value numeric(10, 4) NOT NULL,
	status varchar(20) NOT NULL,
	CONSTRAINT tbl_slack_point_pkey PRIMARY KEY (id)
);


-- schsaf.tbl_system_actions definition

-- Drop table

-- DROP TABLE schsaf.tbl_system_actions;

CREATE TABLE schsaf.tbl_system_actions (
	id serial4 NOT NULL,
	"name" varchar(30) NOT NULL,
	CONSTRAINT tbl_system_actions_pkey PRIMARY KEY (id)
);


-- schsaf.tbl_system_groups definition

-- Drop table

-- DROP TABLE schsaf.tbl_system_groups;

CREATE TABLE schsaf.tbl_system_groups (
	id bigserial NOT NULL,
	description varchar(100) NOT NULL,
	state varchar(20) NOT NULL,
	object_guid varchar(40) NULL,
	CONSTRAINT tbl_system_groups_pkey PRIMARY KEY (id)
);


-- schsaf.tbl_system_modules definition

-- Drop table

-- DROP TABLE schsaf.tbl_system_modules;

CREATE TABLE schsaf.tbl_system_modules (
	id serial4 NOT NULL,
	"name" varchar(30) NOT NULL,
	icon varchar(50) NOT NULL,
	"order" int4 NULL,
	CONSTRAINT tbl_system_modules_pkey PRIMARY KEY (id)
);


-- schsaf.tbl_system_operation_time definition

-- Drop table

-- DROP TABLE schsaf.tbl_system_operation_time;

CREATE TABLE schsaf.tbl_system_operation_time (
	id serial4 NOT NULL,
	start_time time NOT NULL,
	end_time time NOT NULL,
	state varchar NOT NULL,
	created_at timestamp NOT NULL,
	username varchar NOT NULL,
	CONSTRAINT tbl_system_operation_time_pkey PRIMARY KEY (id)
);


-- schsaf.tbl_system_options definition

-- Drop table

-- DROP TABLE schsaf.tbl_system_options;

CREATE TABLE schsaf.tbl_system_options (
	id serial4 NOT NULL,
	"name" varchar(50) NOT NULL,
	"order" int4 NULL,
	CONSTRAINT tbl_system_options_pkey PRIMARY KEY (id)
);


-- schsaf.tbl_technical_log definition

-- Drop table

-- DROP TABLE schsaf.tbl_technical_log;

CREATE TABLE schsaf.tbl_technical_log (
	id bigserial NOT NULL,
	action_date timestamp NOT NULL,
	origin_process varchar NOT NULL,
	application_number varchar NOT NULL,
	api_url varchar NOT NULL,
	api_name varchar NOT NULL,
	saf_request varchar NULL,
	api_response varchar NOT NULL,
	CONSTRAINT tbl_technical_log_pk PRIMARY KEY (id)
);
CREATE INDEX technical_log_common_columns_index ON schsaf.tbl_technical_log USING btree (action_date, origin_process, application_number, api_name);


-- schsaf.tbl_type_payment_application definition

-- Drop table

-- DROP TABLE schsaf.tbl_type_payment_application;

CREATE TABLE schsaf.tbl_type_payment_application (
	id varchar(20) NOT NULL,
	description varchar(255) NOT NULL,
	CONSTRAINT tbl_type_payment_instruction_applicationkey PRIMARY KEY (id)
);


-- schsaf.tbl_type_payment_instruction definition

-- Drop table

-- DROP TABLE schsaf.tbl_type_payment_instruction;

CREATE TABLE schsaf.tbl_type_payment_instruction (
	id bigserial NOT NULL,
	description varchar(40) NULL,
	CONSTRAINT tbl_type_payment_instruction_pkey PRIMARY KEY (id)
);


-- schsaf.total_deleted definition

-- Drop table

-- DROP TABLE schsaf.total_deleted;

CREATE TABLE schsaf.total_deleted (
	count int8 NULL
);


-- schsaf.tbl_accounting_balance_by_account definition

-- Drop table

-- DROP TABLE schsaf.tbl_accounting_balance_by_account;

CREATE TABLE schsaf.tbl_accounting_balance_by_account (
	id bigserial NOT NULL,
	created_at timestamp NOT NULL,
	current_balance numeric(22, 8) DEFAULT 0 NOT NULL,
	updated_at timestamp NULL,
	client_id int8 NULL,
	nit_client varchar(255) NOT NULL,
	name_client varchar(255) NULL,
	account_number varchar(255) NOT NULL,
	debits_value numeric(22, 8) DEFAULT 0 NOT NULL,
	credits_value numeric(22, 8) DEFAULT 0 NOT NULL,
	accrued_debits_value numeric(22, 8) DEFAULT 0 NOT NULL,
	accrued_credits_value numeric(22, 8) DEFAULT 0 NOT NULL,
	process_date date NOT NULL,
	is_generated_again bool DEFAULT false NOT NULL,
	CONSTRAINT tbl_accounting_balance_by_account_pk PRIMARY KEY (id),
	CONSTRAINT tbl_accounting_balance_by_account_tbl_client_fk FOREIGN KEY (client_id) REFERENCES schsaf.tbl_client(id)
);


-- schsaf.tbl_accounting_transaction definition

-- Drop table

-- DROP TABLE schsaf.tbl_accounting_transaction;

CREATE TABLE schsaf.tbl_accounting_transaction (
	id bigserial NOT NULL,
	event_id int8 NOT NULL,
	process_id int8 NOT NULL,
	product_id int8 NOT NULL,
	scenario_id int8 NOT NULL,
	CONSTRAINT tbl_accounting_transaction_pkey PRIMARY KEY (id),
	CONSTRAINT fk8uip6vxm12mxmlf50ilmlsofc FOREIGN KEY (scenario_id) REFERENCES schsaf.tbl_accounting_scenario(id),
	CONSTRAINT fkd3u9tghnhd75j7fi791e6vhm FOREIGN KEY (product_id) REFERENCES schsaf.tbl_products(id),
	CONSTRAINT fkkd0s05vs5ojrfv1tfv59xnrrq FOREIGN KEY (process_id) REFERENCES schsaf.tbl_accounting_process(id),
	CONSTRAINT fkqb2u4iook87dm8ndn6f90mjyg FOREIGN KEY (event_id) REFERENCES schsaf.tbl_accounting_event(id)
);


-- schsaf.tbl_age_bonus_range definition

-- Drop table

-- DROP TABLE schsaf.tbl_age_bonus_range;

CREATE TABLE schsaf.tbl_age_bonus_range (
	id bigserial NOT NULL,
	life_insurance_id int8 NOT NULL,
	age_from int8 NOT NULL,
	age_up_to int8 NOT NULL,
	bonus numeric NOT NULL,
	CONSTRAINT tbl_age_bonus_range_pk PRIMARY KEY (id),
	CONSTRAINT tbl_age_bonus_range_tbl_life_insurance_fk FOREIGN KEY (life_insurance_id) REFERENCES schsaf.tbl_life_insurance(id)
);


-- schsaf.tbl_assessment definition

-- Drop table

-- DROP TABLE schsaf.tbl_assessment;

CREATE TABLE schsaf.tbl_assessment (
	id serial4 NOT NULL,
	created_at timestamp NOT NULL,
	description varchar(255) NOT NULL,
	end_date_validity date NOT NULL,
	is_percentage bool DEFAULT false NOT NULL,
	start_date_validity date NOT NULL,
	updated_at timestamp NOT NULL,
	assessment_value numeric(20, 4) NOT NULL,
	assessment_type_id int8 NOT NULL,
	status varchar(25) NOT NULL,
	points_uvt int8 NULL,
	value_uvt numeric NULL,
	CONSTRAINT pk_tbl_assessment PRIMARY KEY (id),
	CONSTRAINT fk_tbl_assessment_to_tbl_assessment_type FOREIGN KEY (assessment_type_id) REFERENCES schsaf.tbl_assessment_type(id),
	CONSTRAINT fka780g48j3nkn0j0uqw4hd8ry8 FOREIGN KEY (assessment_type_id) REFERENCES schsaf.tbl_assessment_type(id)
);


-- schsaf.tbl_automatic_debit_detail definition

-- Drop table

-- DROP TABLE schsaf.tbl_automatic_debit_detail;

CREATE TABLE schsaf.tbl_automatic_debit_detail (
	id bigserial NOT NULL,
	id_automatic_debit_header int8 NOT NULL,
	"type" int8 NOT NULL,
	document_number_payer varchar(13) NULL,
	name_payer varchar(20) NULL,
	bank_code varchar(9) NULL,
	number_account varchar(17) NULL,
	transaction_type int8 NULL,
	value_transaction numeric(22, 2) NOT NULL,
	nit_cta varchar(1) NOT NULL,
	reference1 varchar(30) NULL,
	reference2 varchar(30) NULL,
	expiration_date varchar(8) NULL,
	billed_period varchar(2) NULL,
	"cycle" varchar(3) NULL,
	reserved varchar(17) NULL,
	payment_value numeric(22, 4) NULL,
	bank_response varchar(50) NULL,
	response_date date NULL,
	client_id numeric NULL,
	CONSTRAINT tbl_automatic_debit_detail_pk PRIMARY KEY (id),
	CONSTRAINT tbl_automatic_debit_detail_tbl_automatic_debit_header_fk FOREIGN KEY (id_automatic_debit_header) REFERENCES schsaf.tbl_automatic_debit_header(id)
);


-- schsaf.tbl_bank_account_subscribe definition

-- Drop table

-- DROP TABLE schsaf.tbl_bank_account_subscribe;

CREATE TABLE schsaf.tbl_bank_account_subscribe (
	id bigserial NOT NULL,
	bank_account_state varchar(255) NOT NULL,
	client_id int8 NOT NULL,
	is_principal bool NOT NULL,
	bank_account_id int8 NULL,
	last_update timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	is_third bool DEFAULT false NULL,
	delete_at timestamp NULL,
	CONSTRAINT tbl_bank_account_subscribe_pkey PRIMARY KEY (id),
	CONSTRAINT fka2c22dwbrhvlk0oh77xwprdhd FOREIGN KEY (bank_account_id) REFERENCES schsaf.tbl_bank_account(id)
);


-- schsaf.tbl_book definition

-- Drop table

-- DROP TABLE schsaf.tbl_book;

CREATE TABLE schsaf.tbl_book (
	id serial4 NOT NULL,
	country_id int4 NULL,
	"name" varchar(100) NULL,
	code varchar(2) NULL,
	description text NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	last_consecutive varchar(100) NULL,
	CONSTRAINT tbl_book_pkey PRIMARY KEY (id),
	CONSTRAINT tbl_book_country_id_fkey FOREIGN KEY (country_id) REFERENCES schsaf.tbl_countries(id)
);


-- schsaf.tbl_client_blocks definition

-- Drop table

-- DROP TABLE schsaf.tbl_client_blocks;

CREATE TABLE schsaf.tbl_client_blocks (
	id bigserial NOT NULL,
	client_id int8 NOT NULL,
	is_administrative_block bool DEFAULT true NOT NULL,
	start_at date NOT NULL,
	end_at date NULL,
	state varchar(50) NOT NULL,
	CONSTRAINT pk_client_blocks PRIMARY KEY (id),
	CONSTRAINT tbl_client_blocks_fk FOREIGN KEY (client_id) REFERENCES schsaf.tbl_client(id)
);
CREATE INDEX idx_client_blocks_client_id ON schsaf.tbl_client_blocks USING btree (client_id);


-- schsaf.tbl_client_blocks_details definition

-- Drop table

-- DROP TABLE schsaf.tbl_client_blocks_details;

CREATE TABLE schsaf.tbl_client_blocks_details (
	id bigserial NOT NULL,
	client_block_id int8 NOT NULL,
	block_type_code varchar(10) NOT NULL,
	start_at date NOT NULL,
	end_at date NULL,
	created_at timestamp NOT NULL,
	updated_at timestamp NULL,
	execute_user varchar(200) NOT NULL,
	state varchar(20) NOT NULL,
	CONSTRAINT pk_client_blocks_details PRIMARY KEY (id),
	CONSTRAINT fk_client_blocks_details_01 FOREIGN KEY (client_block_id) REFERENCES schsaf.tbl_client_blocks(id),
	CONSTRAINT fk_client_blocks_details_02 FOREIGN KEY (block_type_code) REFERENCES schsaf.tbl_blocks_type(code)
);


-- schsaf.tbl_client_payment_application_config definition

-- Drop table

-- DROP TABLE schsaf.tbl_client_payment_application_config;

CREATE TABLE schsaf.tbl_client_payment_application_config (
	id_client int8 NOT NULL,
	last_update timestamp NULL,
	payment_application_start_date date NULL,
	id_type_application varchar(20) NOT NULL,
	CONSTRAINT tbl_client_payment_instruction_config_pkey PRIMARY KEY (id_client),
	CONSTRAINT fk_tbl_client_payment_application_config_client FOREIGN KEY (id_client) REFERENCES schsaf.tbl_client(id),
	CONSTRAINT fk_tbl_client_payment_application_config_type FOREIGN KEY (id_type_application) REFERENCES schsaf.tbl_type_payment_application(id)
);


-- schsaf.tbl_counterpart definition

-- Drop table

-- DROP TABLE schsaf.tbl_counterpart;

CREATE TABLE schsaf.tbl_counterpart (
	id serial4 NOT NULL,
	"name" varchar NOT NULL,
	document_number varchar NOT NULL,
	country_id int8 NOT NULL,
	created_at timestamp NOT NULL,
	created_by varchar NOT NULL,
	updated_at timestamp NOT NULL,
	updated_by varchar NULL,
	state varchar NOT NULL,
	CONSTRAINT tbl_counterpart_pk PRIMARY KEY (id),
	CONSTRAINT fk_countries FOREIGN KEY (country_id) REFERENCES schsaf.tbl_countries(id)
);
CREATE INDEX tbl_counterpart_document_number_idx ON schsaf.tbl_counterpart USING btree (document_number);
CREATE INDEX tbl_counterpart_name_idx ON schsaf.tbl_counterpart USING btree (name);


-- schsaf.tbl_disbursement_instruction definition

-- Drop table

-- DROP TABLE schsaf.tbl_disbursement_instruction;

CREATE TABLE schsaf.tbl_disbursement_instruction (
	id bigserial NOT NULL,
	"type" varchar NULL,
	bank_account_id int8 NULL,
	disbursement_type varchar(100) NULL,
	third_party bool NULL,
	third_party_document_number varchar(255) NULL,
	third_party_document_type varchar(50) NULL,
	third_party_full_name varchar(50) NULL,
	platform_id int4 NULL,
	platform_instruction varchar NULL,
	transfer_number varchar NOT NULL,
	automatic_transfer bool NULL,
	account_number varchar NULL,
	account_type varchar NULL,
	bank_code varchar NULL,
	CONSTRAINT tbl_disbursement_instruction_pkey PRIMARY KEY (id),
	CONSTRAINT transfer_number_id UNIQUE (transfer_number),
	CONSTRAINT fk_bank_account_id FOREIGN KEY (bank_account_id) REFERENCES schsaf.tbl_bank_account(id)
);


-- schsaf.tbl_enriched_payment definition

-- Drop table

-- DROP TABLE schsaf.tbl_enriched_payment;

CREATE TABLE schsaf.tbl_enriched_payment (
	id int8 DEFAULT nextval('schsaf.tbl_payments_enriched_id_seq'::regclass) NOT NULL,
	payment_origin varchar(50) NOT NULL,
	document_number_payer_digit varchar(20) NULL,
	document_number_payer varchar(20) NULL,
	name_payer varchar(50) NULL,
	document_number_beneficiary_digit varchar(50) NULL,
	document_number_beneficiary varchar(50) NULL,
	name_beneficiary varchar(50) NULL,
	type_agreement varchar(50) NULL,
	payment_date date NOT NULL,
	process_time time NOT NULL,
	payment_value numeric(22, 2) NOT NULL,
	payment_channel varchar(50) NULL,
	payment_branch_code varchar(4) NULL,
	sequence_send varchar(1) NULL,
	reference1 varchar(50) NULL,
	reference2 varchar(50) NULL,
	state_row varchar(50) NOT NULL,
	observation_row varchar(500) NULL,
	transaction_type int8 NULL,
	response_code varchar(3) NULL,
	city varchar(20) NULL,
	payment_state varchar(30) NOT NULL,
	date_payment_state timestamp NOT NULL,
	application_type varchar(20) NULL,
	created_at timestamp DEFAULT now() NOT NULL,
	key_join varchar(211) NULL,
	id_enriched_payment_parent int8 NULL,
	is_distributed bool DEFAULT false NULL,
	distributed_at timestamp NULL,
	parent_at int8 NULL,
	type_enriched_payment varchar NULL,
	CONSTRAINT tbl_enriched_payment_pkey PRIMARY KEY (id),
	CONSTRAINT tbl_enriched_payment_tbl_enriched_payment_fk FOREIGN KEY (id_enriched_payment_parent) REFERENCES schsaf.tbl_enriched_payment(id)
);


-- schsaf.tbl_enriched_resultant_data definition

-- Drop table

-- DROP TABLE schsaf.tbl_enriched_resultant_data;

CREATE TABLE schsaf.tbl_enriched_resultant_data (
	id bigserial NOT NULL,
	enriched_payment_id int8 NOT NULL,
	value numeric(22, 2) NULL,
	destination varchar(15) NULL,
	state varchar(30) NOT NULL,
	consecutive_payment varchar(20) NULL,
	created_at timestamp DEFAULT now() NOT NULL,
	updated_at timestamp NULL,
	concept int8 NULL,
	"source" int8 NULL,
	generated_file bool NULL,
	agreement_sent varchar(60) NULL,
	aplication_date_cp date NULL,
	CONSTRAINT tbl_enriched_resultant_data_pkey PRIMARY KEY (id),
	CONSTRAINT fk_enriched_payment_enriched_resultant_data FOREIGN KEY (enriched_payment_id) REFERENCES schsaf.tbl_enriched_payment(id)
);


-- schsaf.tbl_invoice_header definition

-- Drop table

-- DROP TABLE schsaf.tbl_invoice_header;

CREATE TABLE schsaf.tbl_invoice_header (
	id serial4 NOT NULL,
	payer_id int8 NOT NULL,
	provider_id int8 NOT NULL,
	obliged_payer bool NOT NULL,
	"sequence" int4 NOT NULL,
	application_number varchar NOT NULL,
	application_date date NOT NULL,
	value float8 NOT NULL,
	feedback varchar NULL,
	state varchar NOT NULL,
	"source" varchar NOT NULL,
	rejection_causal_id int8 NULL,
	refund_display varchar NULL,
	refund_rate numeric NULL,
	provider_rate numeric NULL,
	provider_rate_type int4 NULL,
	financing_rate numeric NULL,
	financing_rate_type int4 NULL,
	prepayment_rate numeric NULL,
	prepayment_rate_type int4 NULL,
	remunerative_rate numeric NULL,
	remunerative_rate_type int4 NULL,
	days_without_cost int4 NULL,
	days_with_cost int4 NULL,
	invoices_upload_date date NULL,
	application_dtf numeric NULL,
	provider_rate_ea numeric NULL,
	financing_rate_ea numeric NULL,
	prepayment_rate_ea numeric NULL,
	remunerative_rate_ea numeric NULL,
	disbursement_dtf numeric NULL,
	last_update_rates date NULL,
	rejecting_user varchar NULL,
	usury_rate_control bool NULL,
	last_update_disbursement_value date NULL,
	disbursement_instruction_id int8 NULL,
	consume_quota bool NOT NULL,
	CONSTRAINT application_number_id UNIQUE (application_number),
	CONSTRAINT tbl_invoice_header_pkey PRIMARY KEY (id),
	CONSTRAINT fk_client_payer_invoice_header FOREIGN KEY (payer_id) REFERENCES schsaf.tbl_client(id),
	CONSTRAINT fk_client_provider_invoice_header FOREIGN KEY (provider_id) REFERENCES schsaf.tbl_client(id),
	CONSTRAINT fk_disbursement_instruction_invoice_header FOREIGN KEY (disbursement_instruction_id) REFERENCES schsaf.tbl_disbursement_instruction(id),
	CONSTRAINT fk_disbursement_rejection_causals_invoice_header FOREIGN KEY (rejection_causal_id) REFERENCES schsaf.tbl_disbursement_rejection_causals(id)
);


-- schsaf.tbl_maintenance_rejection_type definition

-- Drop table

-- DROP TABLE schsaf.tbl_maintenance_rejection_type;

CREATE TABLE schsaf.tbl_maintenance_rejection_type (
	id bigserial NOT NULL,
	description varchar(150) NULL,
	maintenance_category_type_id int8 NULL,
	code varchar(20) NULL,
	CONSTRAINT tbl_maintenance_rejection_type_pk PRIMARY KEY (id),
	CONSTRAINT tbl_maintenance_category_type_fk FOREIGN KEY (maintenance_category_type_id) REFERENCES schsaf.tbl_maintenance_category_type(id)
);


-- schsaf.tbl_maintenance_type definition

-- Drop table

-- DROP TABLE schsaf.tbl_maintenance_type;

CREATE TABLE schsaf.tbl_maintenance_type (
	id bigserial NOT NULL,
	"name" varchar(255) NULL,
	code_type varchar(100) NULL,
	maintenance_category_type_id int8 NULL,
	full_name varchar(255) NULL,
	state varchar(20) NULL,
	CONSTRAINT tbl_maintenance_type_pkey PRIMARY KEY (id),
	CONSTRAINT tbl_maintenance_category_type_id_fk FOREIGN KEY (maintenance_category_type_id) REFERENCES schsaf.tbl_maintenance_category_type(id)
);


-- schsaf.tbl_parameterization definition

-- Drop table

-- DROP TABLE schsaf.tbl_parameterization;

CREATE TABLE schsaf.tbl_parameterization (
	id_parameter int8 DEFAULT nextval('schsaf.tbl_parameterization_id_seq'::regclass) NOT NULL,
	application varchar(50) NOT NULL,
	process varchar(100) NOT NULL,
	sub_process varchar(100) NOT NULL,
	param_key varchar(100) NOT NULL,
	param_value varchar(255) NOT NULL,
	description varchar(200) NULL,
	user_id varchar(50) NOT NULL,
	state varchar(20) NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT schsaf_tbl_parameterization_pk PRIMARY KEY (id_parameter),
	CONSTRAINT fk_tbl_parameterization_application FOREIGN KEY (application) REFERENCES schsaf.tbl_applicative(initial_code),
	CONSTRAINT fk_tbl_parameterization_process FOREIGN KEY (process) REFERENCES schsaf.tbl_parameterization_process(initial_code),
	CONSTRAINT fk_tbl_parameterization_subprocess FOREIGN KEY (sub_process) REFERENCES schsaf.tbl_parameterization_subprocess(initial_code)
);


-- schsaf.tbl_payment definition

-- Drop table

-- DROP TABLE schsaf.tbl_payment;

CREATE TABLE schsaf.tbl_payment (
	id serial4 NOT NULL,
	consecutive_payment varchar NULL,
	nit_payer varchar NULL,
	payment_date date NULL,
	payment_time time(0) NULL,
	nit_beneficiary varchar NULL,
	city varchar NULL,
	value numeric(20, 2) NULL,
	payment_channel int8 NULL,
	code_agreement varchar NULL,
	type_payment varchar NULL,
	currency varchar NULL,
	created timestamp(0) NULL,
	updated timestamp(0) NULL,
	status varchar NULL,
	justify varchar NULL,
	type_record varchar NULL,
	date_payment_application timestamp(0) NULL,
	date_payment_distribution timestamp(0) NULL,
	value_application numeric(20, 2) NULL,
	value_pending_application numeric(20, 2) NULL,
	remaining_amount_return numeric(20, 2) NULL,
	income_distributed bool NULL,
	justify_cancel varchar NULL,
	causal_annulment_id int4 NULL,
	payment_distribution_consecutive int4 NULL,
	payment_distribution_user varchar(100) NULL,
	income_centralized bool NULL,
	created_by_user varchar NULL,
	annulled_by_user varchar NULL,
	reference_document_number varchar NULL,
	reference_name varchar NULL,
	centralized_use_of_resource_date timestamp(0) NULL,
	decentralized_use_of_resource_date timestamp(0) NULL,
	CONSTRAINT paymentdata_pk PRIMARY KEY (id),
	CONSTRAINT paymentdata_un UNIQUE (consecutive_payment),
	CONSTRAINT tbl_payment_fk FOREIGN KEY (causal_annulment_id) REFERENCES schsaf.tbl_causal_annulment(id)
);


-- schsaf.tbl_payment_application_annulment definition

-- Drop table

-- DROP TABLE schsaf.tbl_payment_application_annulment;

CREATE TABLE schsaf.tbl_payment_application_annulment (
	id int8 DEFAULT nextval('schsaf.tbl_payment_annulment_id_seq'::regclass) NOT NULL,
	user_applied varchar(50) NULL,
	created_at timestamp NULL,
	id_causal_annulment int8 NULL,
	id_payment_application int8 NULL,
	description varchar(100) NULL,
	consecutive varchar(50) NULL,
	status varchar(50) NULL,
	CONSTRAINT tbl_payment_annulment_pkey PRIMARY KEY (id),
	CONSTRAINT tbl_payment_annulment_application_fk FOREIGN KEY (id_payment_application) REFERENCES schsaf.tbl_payment_application(id),
	CONSTRAINT tbl_payment_annulment_causal_fk FOREIGN KEY (id_causal_annulment) REFERENCES schsaf.tbl_causal_annulment(id)
);
CREATE UNIQUE INDEX tbl_payment_annulment_id_uindex ON schsaf.tbl_payment_application_annulment USING btree (id);


-- schsaf.tbl_payment_distribution definition

-- Drop table

-- DROP TABLE schsaf.tbl_payment_distribution;

CREATE TABLE schsaf.tbl_payment_distribution (
	id serial4 NOT NULL,
	payment_id int4 NOT NULL,
	distribution_consecutive int4 NOT NULL,
	client_id int4 NOT NULL,
	assigned_value numeric(22, 4) NOT NULL,
	status varchar(100) NOT NULL,
	justify_cancel varchar(250) NULL,
	causal_annulment_id int8 NULL,
	value_application numeric(20, 2) NULL,
	value_pending_application numeric(20, 2) NULL,
	remaining_amount_return numeric(20, 2) NULL,
	CONSTRAINT tbl_payment_distribution_pkey PRIMARY KEY (id),
	CONSTRAINT fk_payment_distribution_payment FOREIGN KEY (payment_id) REFERENCES schsaf.tbl_payment(id)
);


-- schsaf.tbl_products_modalities definition

-- Drop table

-- DROP TABLE schsaf.tbl_products_modalities;

CREATE TABLE schsaf.tbl_products_modalities (
	id bigserial NOT NULL,
	acronym varchar(20) NULL,
	counterpart varchar(20) NULL,
	holder varchar(20) NULL,
	modality varchar(30) NULL,
	refund_by_prepayment varchar(20) NULL,
	"sequence" int4 NULL,
	state varchar(20) NULL,
	third_party varchar(30) NULL,
	product_id int8 NULL,
	CONSTRAINT tbl_products_modalities_pkey PRIMARY KEY (id),
	CONSTRAINT uk_5qovwgm660crf6hrm5ve5hrw2 UNIQUE (sequence),
	CONSTRAINT fkq7v3cn8jwgsktc3d28hlhwuyn FOREIGN KEY (product_id) REFERENCES schsaf.tbl_products(id)
);


-- schsaf.tbl_provider definition

-- Drop table

-- DROP TABLE schsaf.tbl_provider;

CREATE TABLE schsaf.tbl_provider (
	id serial4 NOT NULL,
	client_id int8 NOT NULL,
	created_at timestamp NULL,
	CONSTRAINT tbl_provider_pkey PRIMARY KEY (id),
	CONSTRAINT tbl_provider_client_id_fkey FOREIGN KEY (client_id) REFERENCES schsaf.tbl_client(id)
);


-- schsaf.tbl_quota_factoring definition

-- Drop table

-- DROP TABLE schsaf.tbl_quota_factoring;

CREATE TABLE schsaf.tbl_quota_factoring (
	id bigserial NOT NULL,
	act_number varchar(255) NULL,
	approved_limit numeric(19, 2) NULL,
	available_limit numeric(19, 2) NULL,
	consumed_limit numeric(19, 2) NULL,
	created timestamp NULL,
	currency varchar(255) NULL,
	date_act date NULL,
	end_date_extra_quota date NULL,
	end_date_quota date NULL,
	extra_limit numeric(19, 2) NULL,
	is_administrative bool NULL,
	is_platform bool NULL,
	modality int4 NULL,
	platform varchar(255) NULL,
	platform_limit numeric(19, 2) NULL,
	start_date_extra_quota date NULL,
	start_date_quota date NULL,
	state varchar(255) NULL,
	updated timestamp NULL,
	id_client int8 NULL,
	id_product int8 NULL,
	quota_state varchar(255) NULL,
	id_product_modality int8 NULL,
	CONSTRAINT tbl_quota_factoring_pkey PRIMARY KEY (id),
	CONSTRAINT fk2ky3augr5am0f72jf4ycybr6h FOREIGN KEY (id_product) REFERENCES schsaf.tbl_products(id),
	CONSTRAINT fk2ox9by2momsw0jrxdwwi4536c FOREIGN KEY (id_product_modality) REFERENCES schsaf.tbl_products_modalities(id),
	CONSTRAINT fkc4ej55cs59bihd8qdjehshg2v FOREIGN KEY (id_client) REFERENCES schsaf.tbl_client(id)
);


-- schsaf.tbl_quota_global definition

-- Drop table

-- DROP TABLE schsaf.tbl_quota_global;

CREATE TABLE schsaf.tbl_quota_global (
	id bigserial NOT NULL,
	client_id int8 NOT NULL,
	start_date date NOT NULL,
	end_date date NOT NULL,
	act_number varchar(22) NOT NULL,
	value int8 NOT NULL,
	created_at timestamp NOT NULL,
	updated_at timestamp NULL,
	execute_user varchar NULL,
	is_edited_expired bool DEFAULT false NOT NULL,
	CONSTRAINT pk_tbl_quota_global PRIMARY KEY (id),
	CONSTRAINT fk_tbl_quota_global_client FOREIGN KEY (client_id) REFERENCES schsaf.tbl_client(id)
);


-- schsaf.tbl_quota_product definition

-- Drop table

-- DROP TABLE schsaf.tbl_quota_product;

CREATE TABLE schsaf.tbl_quota_product (
	id bigserial NOT NULL,
	product_modality_id int8 NOT NULL,
	quota_global_id int8 NOT NULL,
	start_date date NOT NULL,
	end_date date NOT NULL,
	value int8 NOT NULL,
	created_at timestamp NOT NULL,
	update_at timestamp NULL,
	status varchar(25) NOT NULL,
	available_value int8 DEFAULT '0'::bigint NOT NULL,
	consumed_value int8 DEFAULT '0'::bigint NOT NULL,
	execute_user varchar NULL,
	extra_new_client bool DEFAULT false NULL,
	delete_at timestamp NULL,
	CONSTRAINT pk_tbl_quota_product PRIMARY KEY (id),
	CONSTRAINT fk_tbl_quota_product_products_modalities FOREIGN KEY (product_modality_id) REFERENCES schsaf.tbl_products_modalities(id),
	CONSTRAINT fk_tbl_quota_product_quota_global FOREIGN KEY (quota_global_id) REFERENCES schsaf.tbl_quota_global(id)
);


-- schsaf.tbl_quota_product_providers definition

-- Drop table

-- DROP TABLE schsaf.tbl_quota_product_providers;

CREATE TABLE schsaf.tbl_quota_product_providers (
	id int8 DEFAULT nextval('schsaf.tbl_qt_prdct_prvdrs_id_seq'::regclass) NOT NULL,
	quota_product_id int8 NOT NULL,
	provider_id int8 NOT NULL,
	value int8 NOT NULL,
	available_value int8 DEFAULT '0'::bigint NOT NULL,
	consumed_value int8 DEFAULT '0'::bigint NOT NULL,
	execute_user varchar NULL,
	delete_at timestamp NULL,
	created_at timestamp NOT NULL,
	update_at timestamp NULL,
	CONSTRAINT pk_tbl_quota_product_1 PRIMARY KEY (id),
	CONSTRAINT fk_qt_prdct_prvdrs_qt_prdct_01 FOREIGN KEY (quota_product_id) REFERENCES schsaf.tbl_quota_product(id)
);


-- schsaf.tbl_rate_type definition

-- Drop table

-- DROP TABLE schsaf.tbl_rate_type;

CREATE TABLE schsaf.tbl_rate_type (
	id bigserial NOT NULL,
	type_code varchar(10) NOT NULL,
	description varchar(120) NULL,
	periodicity_id int8 NULL,
	"indicator" varchar(50) NULL,
	CONSTRAINT tbl_rate_type_pkey PRIMARY KEY (id),
	CONSTRAINT tbl_rate_type_type_code_key UNIQUE (type_code),
	CONSTRAINT periodicity_id_fk FOREIGN KEY (periodicity_id) REFERENCES schsaf.tbl_periodicity(id)
);


-- schsaf.tbl_roles definition

-- Drop table

-- DROP TABLE schsaf.tbl_roles;

CREATE TABLE schsaf.tbl_roles (
	id varchar(255) NOT NULL,
	"name" varchar(255) NULL,
	event_id int8 NULL,
	CONSTRAINT tbl_roles_pkey PRIMARY KEY (id),
	CONSTRAINT fk9my3m19x2r4nji67lay1swtwi FOREIGN KEY (event_id) REFERENCES schsaf.tbl_events(id)
);


-- schsaf.tbl_system_submodules definition

-- Drop table

-- DROP TABLE schsaf.tbl_system_submodules;

CREATE TABLE schsaf.tbl_system_submodules (
	id serial4 NOT NULL,
	"name" varchar(50) NOT NULL,
	system_module_id int4 NOT NULL,
	"order" int4 NULL,
	CONSTRAINT tbl_system_submodules_pkey PRIMARY KEY (id),
	CONSTRAINT fk_tbl_system_modules FOREIGN KEY (system_module_id) REFERENCES schsaf.tbl_system_modules(id)
);


-- schsaf.tbl_variable_rate definition

-- Drop table

-- DROP TABLE schsaf.tbl_variable_rate;

CREATE TABLE schsaf.tbl_variable_rate (
	id serial4 NOT NULL,
	approved_at timestamp NULL,
	created_at timestamp NOT NULL,
	end_date timestamp NOT NULL,
	inactivated_at timestamp NULL,
	"name" varchar(50) NOT NULL,
	rejected_at timestamp NULL,
	start_date timestamp NOT NULL,
	state varchar(50) NOT NULL,
	updated_at timestamp NULL,
	value float8 NOT NULL,
	periodicity_id int8 NULL,
	rate_indicator varchar(80) NULL,
	CONSTRAINT tbl_variable_rate_pkey PRIMARY KEY (id),
	CONSTRAINT fk6lr1n2smp5ahcvsblircwnis1 FOREIGN KEY (periodicity_id) REFERENCES schsaf.tbl_periodicity(id)
);


-- schsaf.tbl_accounting_movement definition

-- Drop table

-- DROP TABLE schsaf.tbl_accounting_movement;

CREATE TABLE schsaf.tbl_accounting_movement (
	id bigserial NOT NULL,
	nature varchar(255) NULL,
	state varchar(255) NULL,
	account_id int8 NULL,
	transaction_id int8 NULL,
	concept_id int8 NULL,
	CONSTRAINT tbl_accounting_movement_pkey PRIMARY KEY (id),
	CONSTRAINT fk2a9h7ff4myjwd9e534coxftaa FOREIGN KEY (concept_id) REFERENCES schsaf.tbl_accounting_concept(id),
	CONSTRAINT fkqk8u2m53x924sn7v1tiy8irfl FOREIGN KEY (account_id) REFERENCES schsaf.tbl_accounting_account(id),
	CONSTRAINT fkrgwpxwcuumabtg3y7ilpkqgl3 FOREIGN KEY (transaction_id) REFERENCES schsaf.tbl_accounting_transaction(id)
);


-- schsaf.tbl_acronym definition

-- Drop table

-- DROP TABLE schsaf.tbl_acronym;

CREATE TABLE schsaf.tbl_acronym (
	id serial4 NOT NULL,
	provider_id int8 NOT NULL,
	value varchar(30) NOT NULL,
	created_at timestamp NOT NULL,
	updated_at timestamp NOT NULL,
	status varchar(50) NULL,
	base varchar NULL,
	user_executed_reservation varchar NULL,
	user_executed_assignment varchar NULL,
	bank_account_id int8 NULL,
	user_added_account varchar NULL,
	CONSTRAINT tbl_acronym_pkey PRIMARY KEY (id),
	CONSTRAINT tbl_acronym_value_key UNIQUE (value),
	CONSTRAINT tbl_acronym_provider_id_fkey FOREIGN KEY (provider_id) REFERENCES schsaf.tbl_provider(id),
	CONSTRAINT tbl_acronym_tbl_bank_account_fk FOREIGN KEY (bank_account_id) REFERENCES schsaf.tbl_bank_account(id)
);


-- schsaf.tbl_bank_account_rejections definition

-- Drop table

-- DROP TABLE schsaf.tbl_bank_account_rejections;

CREATE TABLE schsaf.tbl_bank_account_rejections (
	id bigserial NOT NULL,
	bank_account_sub_id int8 NOT NULL,
	rejection_type_id int8 NOT NULL,
	created_at timestamp NOT NULL,
	execute_user varchar NOT NULL,
	"exception" text NULL,
	CONSTRAINT tbl_bank_account_rejections_pkey PRIMARY KEY (id),
	CONSTRAINT fk_bank_account_sub_id FOREIGN KEY (bank_account_sub_id) REFERENCES schsaf.tbl_bank_account_subscribe(id),
	CONSTRAINT fk_rejection_type_id FOREIGN KEY (rejection_type_id) REFERENCES schsaf.tbl_bank_account_rejection_types(id)
);


-- schsaf.tbl_business_relationships definition

-- Drop table

-- DROP TABLE schsaf.tbl_business_relationships;

CREATE TABLE schsaf.tbl_business_relationships (
	id bigserial NOT NULL,
	days_with_cost int4 NULL,
	days_without_cost int4 NULL,
	moratorium_rate varchar(30) NULL,
	moratorium_rate_type varchar(30) NULL,
	operational_flow varchar(100) NULL,
	provider_rate numeric(7, 4) NULL,
	provider_rate_type varchar(30) NULL,
	refund_display varchar(30) NULL,
	refund_negotiation varchar(30) NULL,
	refund_rate numeric(7, 4) NULL,
	refund_rate_type varchar(30) NULL,
	remunerative_rate numeric(7, 4) NULL,
	remunerative_rate_type varchar(30) NULL,
	special_business bool NULL,
	special_business_comments varchar(4000) NULL,
	business_day_setting bool NULL,
	calculation_type varchar(20) NULL,
	calculation_way varchar(20) NULL,
	end_date date NULL,
	liability varchar(100) NULL,
	rate_change varchar(100) NULL,
	refund_by_prepayment varchar(20) NULL,
	rejection_comment varchar(4000) NULL,
	start_date date NULL,
	state varchar(20) NULL,
	payer_id int8 NULL,
	productmodality_id int8 NULL,
	provider_id int8 NULL,
	thirdparty_id int8 NULL,
	base varchar(3) NULL,
	automatic_transfer bool NULL,
	bank_account_id int8 NULL,
	invoice_confirmation bool NULL,
	netting bool NULL,
	invoice_value_netting numeric(18, 4) NULL,
	isrefundavailable bool NULL,
	created_at timestamp DEFAULT now() NULL,
	updated_at timestamp DEFAULT now() NULL,
	rejection_reason_id int8 NULL,
	platform_id int4 NULL,
	disbursement_instruction varchar(10) NULL,
	filename_provider varchar NULL,
	filename_payer varchar NULL,
	days_without_cost_for_slack int4 NULL,
	is_massive bool NULL,
	is_sustainable_line bool NULL,
	CONSTRAINT tbl_business_relationships_pkey PRIMARY KEY (id),
	CONSTRAINT business_relationships_platform_id_pk FOREIGN KEY (platform_id) REFERENCES schsaf.tbl_platform(id) ON UPDATE CASCADE,
	CONSTRAINT fk1r77mk7css279tnsoxibi122 FOREIGN KEY (provider_id) REFERENCES schsaf.tbl_client(id),
	CONSTRAINT fk1wtim6yf606q7kqd0ox54yrdy FOREIGN KEY (thirdparty_id) REFERENCES schsaf.tbl_client(id),
	CONSTRAINT fk_bank_account_id FOREIGN KEY (bank_account_id) REFERENCES schsaf.tbl_bank_account(id),
	CONSTRAINT fk_bsnss_rltnshps_rjctn_rsn_id FOREIGN KEY (rejection_reason_id) REFERENCES schsaf.tbl_business_relationships_rejection_reasons(id),
	CONSTRAINT fkopsndml637kcmplwg57n4otv0 FOREIGN KEY (payer_id) REFERENCES schsaf.tbl_client(id),
	CONSTRAINT fksn2qneu2p8lg9p4uce4ufcssf FOREIGN KEY (productmodality_id) REFERENCES schsaf.tbl_products_modalities(id)
);


-- schsaf.tbl_business_relationships_files definition

-- Drop table

-- DROP TABLE schsaf.tbl_business_relationships_files;

CREATE TABLE schsaf.tbl_business_relationships_files (
	id bigserial NOT NULL,
	business_relationships_id int8 NOT NULL,
	client_id int8 NOT NULL,
	file_name varchar NOT NULL,
	is_approved bool NOT NULL,
	CONSTRAINT tbl_files_business_relationships_pk PRIMARY KEY (id),
	CONSTRAINT tbl_files_business_relationships_fk FOREIGN KEY (business_relationships_id) REFERENCES schsaf.tbl_business_relationships(id),
	CONSTRAINT tbl_files_business_relationships_fk_1 FOREIGN KEY (client_id) REFERENCES schsaf.tbl_client(id)
);


-- schsaf.tbl_business_relationships_massive definition

-- Drop table

-- DROP TABLE schsaf.tbl_business_relationships_massive;

CREATE TABLE schsaf.tbl_business_relationships_massive (
	id bigserial NOT NULL,
	days_with_cost int4 NULL,
	days_without_cost int4 NULL,
	operational_flow varchar(100) NULL,
	provider_rate numeric(7, 4) NULL,
	provider_rate_type varchar(30) NULL,
	refund_display varchar(30) NULL,
	refund_negotiation varchar(30) NULL,
	refund_rate numeric(7, 4) NULL,
	refund_rate_type varchar(30) NULL,
	remunerative_rate numeric(7, 4) NULL,
	remunerative_rate_type varchar(30) NULL,
	end_date date NULL,
	refund_by_prepayment varchar(20) NULL,
	rejection_comment varchar(4000) NULL,
	start_date date NULL,
	state varchar(20) NULL,
	payer_id int8 NULL,
	productmodality_id int8 NULL,
	base varchar(3) NULL,
	automatic_transfer bool NULL,
	isrefundavailable bool NULL,
	created_at timestamp DEFAULT now() NOT NULL,
	updated_at timestamp DEFAULT now() NOT NULL,
	platform_id int4 NULL,
	provider_filename varchar(250) NOT NULL,
	provider_result_filename varchar(250) NULL,
	support_filename text NULL,
	days_without_cost_for_slack int4 NULL,
	email varchar(250) NULL,
	is_sustainable_line bool NULL,
	CONSTRAINT tbl_business_relationships_massive_pkey PRIMARY KEY (id),
	CONSTRAINT fk_brm_payer_id_client FOREIGN KEY (payer_id) REFERENCES schsaf.tbl_client(id),
	CONSTRAINT fk_brm_platform_id_platform FOREIGN KEY (platform_id) REFERENCES schsaf.tbl_platform(id),
	CONSTRAINT fk_brm_productmodality_id_products_modalities FOREIGN KEY (productmodality_id) REFERENCES schsaf.tbl_products_modalities(id)
);


-- schsaf.tbl_business_relationships_rejections definition

-- Drop table

-- DROP TABLE schsaf.tbl_business_relationships_rejections;

CREATE TABLE schsaf.tbl_business_relationships_rejections (
	id bigserial NOT NULL,
	business_relationships_id int8 DEFAULT nextval('schsaf.tbl_business_relationships_reject_business_relationships_id_seq'::regclass) NOT NULL,
	rejection_reasons_id bigserial NOT NULL,
	created_at timestamp NOT NULL,
	deleted_at timestamp NULL,
	execute_user varchar NOT NULL,
	deleted_user varchar NULL,
	CONSTRAINT tbl_business_relationships_rejections_pk PRIMARY KEY (id),
	CONSTRAINT fk_business_relationships_rejections_01 FOREIGN KEY (business_relationships_id) REFERENCES schsaf.tbl_business_relationships(id),
	CONSTRAINT fk_business_relationships_rejections_02 FOREIGN KEY (rejection_reasons_id) REFERENCES schsaf.tbl_business_relationships_rejection_reasons(id)
);


-- schsaf.tbl_business_relationships_temp definition

-- Drop table

-- DROP TABLE schsaf.tbl_business_relationships_temp;

CREATE TABLE schsaf.tbl_business_relationships_temp (
	id bigserial NOT NULL,
	business_relationships_id int8 NOT NULL,
	days_with_cost int4 NULL,
	days_without_cost int4 NULL,
	moratorium_rate varchar(30) NULL,
	moratorium_rate_type varchar(30) NULL,
	operational_flow varchar(100) NULL,
	provider_rate numeric(7, 4) NULL,
	provider_rate_type varchar(30) NULL,
	refund_display varchar(30) NULL,
	refund_negotiation varchar(30) NULL,
	refund_rate numeric(7, 4) NULL,
	refund_rate_type varchar(30) NULL,
	remunerative_rate numeric(7, 4) NULL,
	remunerative_rate_type varchar(30) NULL,
	special_business bool NULL,
	special_business_comments varchar(4000) NULL,
	business_day_setting bool NULL,
	calculation_type varchar(20) NULL,
	calculation_way varchar(20) NULL,
	end_date date NULL,
	liability varchar(100) NULL,
	rate_change varchar(100) NULL,
	refund_by_prepayment varchar(20) NULL,
	rejection_comment varchar(4000) NULL,
	start_date date NULL,
	state varchar(20) NULL,
	payer_id int8 NULL,
	productmodality_id int8 NULL,
	provider_id int8 NULL,
	thirdparty_id int8 NULL,
	base varchar(3) NULL,
	automatic_transfer bool NULL,
	bank_account_id int8 NULL,
	invoice_confirmation bool NULL,
	netting bool NULL,
	invoice_value_netting numeric(18, 4) NULL,
	isrefundavailable bool NULL,
	created_at timestamp DEFAULT now() NOT NULL,
	updated_at timestamp DEFAULT now() NOT NULL,
	rejection_reason_id int8 NULL,
	platform_id int4 NULL,
	disbursement_instruction varchar(10) NULL,
	filename_provider varchar NULL,
	filename_payer varchar NULL,
	days_without_cost_for_slack int4 NULL,
	executor_user varchar NULL,
	is_massive bool NULL,
	is_sustainable_line bool NULL,
	CONSTRAINT tbl_business_relationships_temp_pkey PRIMARY KEY (id),
	CONSTRAINT business_relationships_platform_id_pk FOREIGN KEY (platform_id) REFERENCES schsaf.tbl_platform(id) ON UPDATE CASCADE,
	CONSTRAINT fk_brt_bankaccount_id FOREIGN KEY (bank_account_id) REFERENCES schsaf.tbl_bank_account(id),
	CONSTRAINT fk_brt_bussiness_relationships_id FOREIGN KEY (business_relationships_id) REFERENCES schsaf.tbl_business_relationships(id),
	CONSTRAINT fk_brt_bussiness_rrr_id FOREIGN KEY (rejection_reason_id) REFERENCES schsaf.tbl_business_relationships_rejection_reasons(id),
	CONSTRAINT fk_brt_client_payer_id FOREIGN KEY (payer_id) REFERENCES schsaf.tbl_client(id),
	CONSTRAINT fk_brt_client_provider_id FOREIGN KEY (provider_id) REFERENCES schsaf.tbl_client(id),
	CONSTRAINT fk_brt_client_thirdparty_id FOREIGN KEY (thirdparty_id) REFERENCES schsaf.tbl_client(id),
	CONSTRAINT fk_brt_product_modalities_id FOREIGN KEY (productmodality_id) REFERENCES schsaf.tbl_products_modalities(id)
);


-- schsaf.tbl_enriched_distribution_payment_instruction definition

-- Drop table

-- DROP TABLE schsaf.tbl_enriched_distribution_payment_instruction;

CREATE TABLE schsaf.tbl_enriched_distribution_payment_instruction (
	id serial4 NOT NULL,
	resultant_data_id int8 NOT NULL,
	applied_value numeric(22, 4) NOT NULL,
	user_applied varchar(255) NULL,
	obligation_number varchar(255) DEFAULT ''::character varying NOT NULL,
	CONSTRAINT tbl_enriched_distribution_payment_instruction_pkey PRIMARY KEY (id),
	CONSTRAINT tbl_enriched_distribution_payment_instru_resultant_data_id_fkey FOREIGN KEY (resultant_data_id) REFERENCES schsaf.tbl_enriched_resultant_data(id)
);


-- schsaf.tbl_enriched_massive_payment_application definition

-- Drop table

-- DROP TABLE schsaf.tbl_enriched_massive_payment_application;

CREATE TABLE schsaf.tbl_enriched_massive_payment_application (
	id serial4 NOT NULL,
	application_status varchar(20) NOT NULL,
	document_number varchar(50) NOT NULL,
	consecutive text NOT NULL,
	file_name varchar(100) NOT NULL,
	description text NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	id_enriched_payment int4 NULL,
	CONSTRAINT tbl_enriched_massive_payment_application_consecutive_key UNIQUE (consecutive),
	CONSTRAINT tbl_enriched_massive_payment_application_pkey PRIMARY KEY (id),
	CONSTRAINT fk_id_enriched_payment FOREIGN KEY (id_enriched_payment) REFERENCES schsaf.tbl_enriched_payment(id)
);


-- schsaf.tbl_financing_plan definition

-- Drop table

-- DROP TABLE schsaf.tbl_financing_plan;

CREATE TABLE schsaf.tbl_financing_plan (
	id bigserial NOT NULL,
	acronym_id int8 NOT NULL,
	plan_code varchar(5) NOT NULL,
	description varchar(100) NULL,
	state varchar(100) NOT NULL,
	plan_grants_days_without_cost bool NOT NULL,
	days_granted_without_cost int4 DEFAULT 0 NOT NULL,
	plan_grants_days_with_cost bool NOT NULL,
	days_granted_with_cost int4 DEFAULT 0 NOT NULL,
	days_granted_type varchar(20) DEFAULT 'FIXED'::character varying NOT NULL,
	days_granted_from_type varchar(30) NOT NULL,
	start_date date NOT NULL,
	end_date date NOT NULL,
	billing_period_type varchar(15) DEFAULT 'FIXED'::character varying NOT NULL,
	fixed_billing_period_days int4 DEFAULT 0 NOT NULL,
	variable_billing_period_min_days int4 DEFAULT 0 NOT NULL,
	variable_billing_period_max_days int4 DEFAULT 0 NOT NULL,
	discount_percent numeric(22, 4) DEFAULT 0 NOT NULL,
	base_discount_days int4 NOT NULL,
	payment_condition_id int8 NOT NULL,
	min_discount_days int4 DEFAULT 0 NOT NULL,
	max_discount_days int4 DEFAULT 0 NOT NULL,
	agreed_rate_type varchar(20) DEFAULT 'FIXED'::character varying NOT NULL,
	agreed_variable_rate_type varchar(20) NULL,
	agreed_spread_rate numeric(22, 4) DEFAULT 0 NOT NULL,
	provider_net_term int4 DEFAULT 0 NOT NULL,
	has_discount_prompt_payment bool NOT NULL,
	prompt_payment_refund_percent_or_spread numeric(22, 4) DEFAULT 0 NOT NULL,
	prompt_payment_min_discount_days int4 DEFAULT 0 NOT NULL,
	prompt_payment_max_discount_days int4 DEFAULT 0 NOT NULL,
	prompt_payment_discount_rate numeric(22, 4) DEFAULT 0 NOT NULL,
	agreed_rate_type_additional varchar(20) DEFAULT 'FIXED'::character varying NOT NULL,
	agreed_spread_rate_additional numeric(22, 4) DEFAULT 0 NOT NULL,
	agreed_variable_rate_type_additional varchar(20) NULL,
	financing_total_term int4 DEFAULT 0 NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	email varchar(250) NULL,
	prompt_payment_negotiated_rate_type varchar(20) DEFAULT 'FIXED'::character varying NOT NULL,
	provider_discount_calculus_type varchar NOT NULL,
	discount_factor_filename varchar NULL,
	agreed_variable_rate_type_prompt_payment varchar(20) NULL,
	is_sustainable_line bool NULL,
	CONSTRAINT tbl_financing_plan_pk PRIMARY KEY (id),
	CONSTRAINT fk_financing_plan_acronym FOREIGN KEY (acronym_id) REFERENCES schsaf.tbl_acronym(id),
	CONSTRAINT fk_financing_plan_payment_condition FOREIGN KEY (payment_condition_id) REFERENCES schsaf.tbl_financing_plan_payment_condition(id)
);


-- schsaf.tbl_financing_plan_discount_factors definition

-- Drop table

-- DROP TABLE schsaf.tbl_financing_plan_discount_factors;

CREATE TABLE schsaf.tbl_financing_plan_discount_factors (
	id bigserial NOT NULL,
	financing_plan_id int8 NOT NULL,
	discount_day int8 NOT NULL,
	discount_value numeric NOT NULL,
	days_remaining_for_net int8 DEFAULT 0 NOT NULL,
	CONSTRAINT tbl_financing_plan_discount_factors_pk PRIMARY KEY (id),
	CONSTRAINT tbl_financing_plan_discount_factors_unique UNIQUE (discount_day, financing_plan_id),
	CONSTRAINT tbl_financing_plan_discount_factors_tbl_financing_plan_fk FOREIGN KEY (financing_plan_id) REFERENCES schsaf.tbl_financing_plan(id)
);


-- schsaf.tbl_financing_plan_files definition

-- Drop table

-- DROP TABLE schsaf.tbl_financing_plan_files;

CREATE TABLE schsaf.tbl_financing_plan_files (
	id bigserial NOT NULL,
	financing_plan_id int4 NOT NULL,
	file_name varchar(100) NOT NULL,
	object_key varchar(255) NOT NULL,
	uploaded_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	deleted_at timestamp NULL,
	CONSTRAINT tbl_financing_plan_files_pkey PRIMARY KEY (id),
	CONSTRAINT tbl_financing_plan_files_financing_plan_id_fkey FOREIGN KEY (financing_plan_id) REFERENCES schsaf.tbl_financing_plan(id)
);


-- schsaf.tbl_financing_plan_rejection definition

-- Drop table

-- DROP TABLE schsaf.tbl_financing_plan_rejection;

CREATE TABLE schsaf.tbl_financing_plan_rejection (
	id serial4 NOT NULL,
	financing_plan_id int8 NOT NULL,
	rejection_reason_id int8 NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT tbl_financing_plan_rejection_pkey PRIMARY KEY (id),
	CONSTRAINT fk_financing_plan FOREIGN KEY (financing_plan_id) REFERENCES schsaf.tbl_financing_plan(id),
	CONSTRAINT fk_rejection_reason FOREIGN KEY (rejection_reason_id) REFERENCES schsaf.tbl_rejection_reason(id)
);


-- schsaf.tbl_financing_request_header definition

-- Drop table

-- DROP TABLE schsaf.tbl_financing_request_header;

CREATE TABLE schsaf.tbl_financing_request_header (
	id serial4 NOT NULL,
	filing_number varchar(200) NOT NULL,
	client_id int4 NOT NULL,
	counterpart_id int4 NOT NULL,
	factor_id int4 NULL,
	product_modality_id int4 NOT NULL,
	book_id int4 NULL,
	factor_commission_percentage numeric(7, 4) NULL,
	sofr_rate_percentage numeric(7, 4) NULL,
	spread numeric(7, 4) NULL,
	amortization_percentage numeric(7, 4) NULL,
	remunerative_interest_percentage numeric(7, 4) NULL,
	dppp_percentage numeric(7, 4) NULL,
	provider_commission_percentage numeric(7, 4) NULL,
	disbursement_instruction text NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	created_by varchar(100) NOT NULL,
	updated_at timestamp NULL,
	updated_by varchar(100) NULL,
	status varchar(50) NULL,
	impediment_reason text NULL,
	CONSTRAINT tbl_financing_request_header_pkey PRIMARY KEY (id),
	CONSTRAINT tbl_financing_request_header_book_id_fkey FOREIGN KEY (book_id) REFERENCES schsaf.tbl_book(id),
	CONSTRAINT tbl_financing_request_header_client_id_fkey FOREIGN KEY (client_id) REFERENCES schsaf.tbl_client(id),
	CONSTRAINT tbl_financing_request_header_counterpart_id_fkey FOREIGN KEY (counterpart_id) REFERENCES schsaf.tbl_counterpart(id),
	CONSTRAINT tbl_financing_request_header_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES schsaf.tbl_client(id),
	CONSTRAINT tbl_financing_request_header_product_modality_id_fkey FOREIGN KEY (product_modality_id) REFERENCES schsaf.tbl_products_modalities(id)
);

-- Table Triggers

create trigger refresh_view_financing_request_header after
insert
    on
    schsaf.tbl_financing_request_header for each statement execute function schsaf.refresh_view_financing_request_header();


-- schsaf.tbl_foreign_currency_invoice definition

-- Drop table

-- DROP TABLE schsaf.tbl_foreign_currency_invoice;

CREATE TABLE schsaf.tbl_foreign_currency_invoice (
	id serial4 NOT NULL,
	financing_request_id int4 NULL,
	invoice_number varchar(100) NULL,
	issue_date date NULL,
	actual_due_date date NULL,
	net_date date NULL,
	total_date date NULL,
	value_usd numeric(26, 4) NULL,
	assignment_percentage numeric(7, 4) NULL,
	negotiated_value numeric(26, 4) NULL,
	disbursement_value numeric(26, 4) NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	invoice_obligation_number varchar(100) NULL,
	CONSTRAINT tbl_foreign_currency_invoice_pkey PRIMARY KEY (id),
	CONSTRAINT tbl_foreign_currency_invoice_financing_request_id_fkey FOREIGN KEY (financing_request_id) REFERENCES schsaf.tbl_financing_request_header(id)
);

-- Table Triggers

create trigger refresh_view_financing_request_header_with_invoices after
insert
    on
    schsaf.tbl_foreign_currency_invoice for each statement execute function schsaf.refresh_view_financing_request_header();


-- schsaf.tbl_invoice definition

-- Drop table

-- DROP TABLE schsaf.tbl_invoice;

CREATE TABLE schsaf.tbl_invoice (
	id serial4 NOT NULL,
	invoice_header_id int4 NOT NULL,
	"number" varchar NOT NULL,
	number_svf varchar NOT NULL,
	cufe varchar NULL,
	issuance_date date NOT NULL,
	due_date date NOT NULL,
	total_due_date date NOT NULL,
	net_due_date date NOT NULL,
	discount_rate float8 NOT NULL,
	value float8 NOT NULL,
	disbursement_value float8 NOT NULL,
	discount float8 NOT NULL,
	pay_percentage float8 NOT NULL,
	state varchar NOT NULL,
	expected_payment_date date NULL,
	net_date_without_adjustment date NULL,
	net_term int4 NULL,
	net_term_without_adjustment int4 NULL,
	new_disbursement_value float8 NULL,
	new_discount float8 NULL,
	new_pay_percentage float8 NULL,
	initial_disbursement_value float8 NULL,
	initial_discount float8 NULL,
	CONSTRAINT tbl_invoice_pkey PRIMARY KEY (id),
	CONSTRAINT uk_number_svf UNIQUE (number_svf),
	CONSTRAINT fk_invoice_header_invoice FOREIGN KEY (invoice_header_id) REFERENCES schsaf.tbl_invoice_header(id)
);


-- schsaf.tbl_invoice_header_lt definition

-- Drop table

-- DROP TABLE schsaf.tbl_invoice_header_lt;

CREATE TABLE schsaf.tbl_invoice_header_lt (
	id bigserial NOT NULL,
	provider_document_number varchar NOT NULL,
	acronym_id int8 NOT NULL,
	application_number varchar NOT NULL,
	application_date date NOT NULL,
	value float8 NOT NULL,
	state varchar NOT NULL,
	feedback varchar NULL,
	total_invoices int4 NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT tbl_invoice_header_lt_pk PRIMARY KEY (id),
	CONSTRAINT tbl_invoice_header_lt_unique UNIQUE (application_number),
	CONSTRAINT tbl_invoice_header_lt_tbl_acronym_fk FOREIGN KEY (acronym_id) REFERENCES schsaf.tbl_acronym(id)
);


-- schsaf.tbl_maintenance definition

-- Drop table

-- DROP TABLE schsaf.tbl_maintenance;

CREATE TABLE schsaf.tbl_maintenance (
	id int8 DEFAULT nextval('schsaf.tbl_maintenance_execution_id_seq'::regclass) NOT NULL,
	id_maintenance_causal int8 NOT NULL,
	state varchar(30) NOT NULL,
	created_at timestamp NOT NULL,
	executer_user varchar(150) NULL,
	approver_user varchar(150) NULL,
	updated_at timestamp NULL,
	maintenance_consecutive varchar(16) NULL,
	edited_at timestamp NULL,
	case_number varchar(20) NULL,
	id_maintenance_type int8 NULL,
	table_reference varchar(150) NULL,
	is_massive bool DEFAULT false NULL,
	CONSTRAINT tbl_maintenance_execution_pkey PRIMARY KEY (id),
	CONSTRAINT tbl_maintenance_execution_id_maintenance_causal_fkey FOREIGN KEY (id_maintenance_causal) REFERENCES schsaf.tbl_maintenance_causal(id),
	CONSTRAINT tbl_maintenance_tbl_maintenance_type_fk FOREIGN KEY (id_maintenance_type) REFERENCES schsaf.tbl_maintenance_type(id)
);


-- schsaf.tbl_maintenance_batch_process definition

-- Drop table

-- DROP TABLE schsaf.tbl_maintenance_batch_process;

CREATE TABLE schsaf.tbl_maintenance_batch_process (
	id bigserial NOT NULL,
	maintenance_id int8 NOT NULL,
	quantity_batch int8 NOT NULL,
	process_name varchar(100) NOT NULL,
	created_at timestamp NULL,
	size_batch int8 NOT NULL,
	state varchar(50) NOT NULL,
	updated_at timestamp NULL,
	finished_at timestamp NULL,
	CONSTRAINT tbl_maintenance_batch_process_pk PRIMARY KEY (id),
	CONSTRAINT tbl_maintenance_batch_process_tbl_maintenance_fk FOREIGN KEY (maintenance_id) REFERENCES schsaf.tbl_maintenance(id)
);


-- schsaf.tbl_maintenance_detail definition

-- Drop table

-- DROP TABLE schsaf.tbl_maintenance_detail;

CREATE TABLE schsaf.tbl_maintenance_detail (
	id int8 DEFAULT nextval('schsaf.tbl_maintenance_execution_detail_id_seq'::regclass) NOT NULL,
	id_maintenance_type int8 NOT NULL,
	id_maintenance int8 NOT NULL,
	value varchar(100) NOT NULL,
	CONSTRAINT tbl_maintenance_execution_detail_pkey PRIMARY KEY (id),
	CONSTRAINT tbl_maintenance_execution_detail_id_maintenance_execution_fkey FOREIGN KEY (id_maintenance) REFERENCES schsaf.tbl_maintenance(id),
	CONSTRAINT tbl_maintenance_execution_detail_id_maintenance_type_fkey FOREIGN KEY (id_maintenance_type) REFERENCES schsaf.tbl_maintenance_type(id)
);


-- schsaf.tbl_maintenance_devolution_category definition

-- Drop table

-- DROP TABLE schsaf.tbl_maintenance_devolution_category;

CREATE TABLE schsaf.tbl_maintenance_devolution_category (
	id bigserial NOT NULL,
	id_maintenance_type int8 NOT NULL,
	id_maintenance_devolution_type int8 NOT NULL,
	CONSTRAINT tbl_maintenance_devolution_category_pk PRIMARY KEY (id),
	CONSTRAINT fk_id_maintenance_devolution_type FOREIGN KEY (id_maintenance_devolution_type) REFERENCES schsaf.tbl_maintenance_devolution_type(id),
	CONSTRAINT fk_id_maintenance_type FOREIGN KEY (id_maintenance_type) REFERENCES schsaf.tbl_maintenance_type(id)
);


-- schsaf.tbl_maintenance_failure definition

-- Drop table

-- DROP TABLE schsaf.tbl_maintenance_failure;

CREATE TABLE schsaf.tbl_maintenance_failure (
	id bigserial NOT NULL,
	created_at timestamp NOT NULL,
	maintenance_id int8 NULL,
	maintenance_devolution_type_id int8 NULL,
	maintenance_rejection_type_id int8 NULL,
	CONSTRAINT tbl_maintenance_failure_pk PRIMARY KEY (id),
	CONSTRAINT tbl_maintenance_failure_devolution_type_id_fk FOREIGN KEY (maintenance_devolution_type_id) REFERENCES schsaf.tbl_maintenance_devolution_type(id),
	CONSTRAINT tbl_maintenance_failure_maintenance_id_fk FOREIGN KEY (maintenance_id) REFERENCES schsaf.tbl_maintenance(id),
	CONSTRAINT tbl_maintenance_failure_rejection_type_id_fk FOREIGN KEY (maintenance_rejection_type_id) REFERENCES schsaf.tbl_maintenance_rejection_type(id)
);


-- schsaf.tbl_maintenance_special_annulment definition

-- Drop table

-- DROP TABLE schsaf.tbl_maintenance_special_annulment;

CREATE TABLE schsaf.tbl_maintenance_special_annulment (
	id bigserial NOT NULL,
	user_applied varchar(255) NULL,
	maintenance_type_code varchar(255) NULL,
	created_at timestamp NULL,
	maintenance_id int8 NULL,
	payment_application_id int8 NULL,
	case_number varchar(100) NULL,
	status varchar(50) NULL,
	CONSTRAINT tbl_maintenance_special_annulment_pkey PRIMARY KEY (id),
	CONSTRAINT fk_maintenance FOREIGN KEY (maintenance_id) REFERENCES schsaf.tbl_maintenance(id),
	CONSTRAINT fk_payment_application FOREIGN KEY (payment_application_id) REFERENCES schsaf.tbl_payment_application(id)
);


-- schsaf.tbl_massive_payment_application definition

-- Drop table

-- DROP TABLE schsaf.tbl_massive_payment_application;

CREATE TABLE schsaf.tbl_massive_payment_application (
	id serial4 NOT NULL,
	payment_status varchar(20) NOT NULL,
	document_number varchar(50) NOT NULL,
	consecutive text NOT NULL,
	file_name varchar(100) NOT NULL,
	description text NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	id_payment int4 NULL,
	CONSTRAINT tbl_massive_payment_application_consecutive_key UNIQUE (consecutive),
	CONSTRAINT tbl_massive_payment_application_pkey PRIMARY KEY (id),
	CONSTRAINT fk_id_payment FOREIGN KEY (id_payment) REFERENCES schsaf.tbl_payment(id)
);


-- schsaf.tbl_obligations definition

-- Drop table

-- DROP TABLE schsaf.tbl_obligations;

CREATE TABLE schsaf.tbl_obligations (
	id bigserial NOT NULL,
	client_id int8 NOT NULL,
	business_relationship_id int8 NOT NULL,
	created_at date NOT NULL,
	invoice_due_date date NOT NULL,
	total_due_date date NOT NULL,
	net_due_date date NOT NULL,
	base int4 NOT NULL,
	discount_rate numeric(7, 4) NOT NULL,
	fixed_remunerative_rate numeric(22, 4) NOT NULL,
	remunerative_rate numeric(7, 4) NOT NULL,
	invoice_value numeric(22, 4) NOT NULL,
	disbursement_value numeric(22, 4) NOT NULL,
	discount_value numeric(22, 4) NOT NULL,
	tax_value numeric(22, 4) NOT NULL,
	transfer_value numeric(22, 4) NOT NULL,
	principal_balance numeric(22, 4) NOT NULL,
	accrued_amortized numeric(22, 6) NOT NULL,
	accrued_remunerative numeric(22, 6) NOT NULL,
	state varchar(100) NULL,
	accrued_moratorium numeric(22, 6) NULL,
	updated_at timestamp(0) NULL,
	homologation_consecutive int8 DEFAULT nextval('schsaf.tbl_obligations_homologation_sec'::regclass) NULL,
	remunerative_balance numeric(22, 6) NULL,
	moratorium_balance numeric(22, 6) NULL,
	receivables_balance numeric(22, 4) NULL,
	vpd_active bool NULL,
	vpd_refund_rate numeric(7, 4) NULL,
	vpd_refund_display varchar(30) NULL,
	vpd_refund_value numeric(22, 4) NULL,
	prepayment_rate numeric(11, 8) NULL,
	provider_rate numeric(11, 8) NULL,
	invoice_number varchar NOT NULL,
	lower_limit_date_dpp date NULL,
	upper_limit_date_dpp date NULL,
	CONSTRAINT invoice_number_id UNIQUE (invoice_number),
	CONSTRAINT tbl_obligations_pkey PRIMARY KEY (id),
	CONSTRAINT fk_business_relationships_obligations FOREIGN KEY (business_relationship_id) REFERENCES schsaf.tbl_business_relationships(id),
	CONSTRAINT fk_clients_obligations FOREIGN KEY (client_id) REFERENCES schsaf.tbl_client(id)
);


-- schsaf.tbl_obligations_foreign_invoice definition

-- Drop table

-- DROP TABLE schsaf.tbl_obligations_foreign_invoice;

CREATE TABLE schsaf.tbl_obligations_foreign_invoice (
	obligation_id int8 NOT NULL,
	foreign_id int4 NOT NULL,
	CONSTRAINT tbl_obligation_foreign_invoice_pkey PRIMARY KEY (obligation_id, foreign_id),
	CONSTRAINT fk_invoice_obligation_foreign FOREIGN KEY (foreign_id) REFERENCES schsaf.tbl_foreign_currency_invoice(id),
	CONSTRAINT fk_obligation_foreign_invoice FOREIGN KEY (obligation_id) REFERENCES schsaf.tbl_obligations(id)
);


-- schsaf.tbl_obligations_maintenance definition

-- Drop table

-- DROP TABLE schsaf.tbl_obligations_maintenance;

CREATE TABLE schsaf.tbl_obligations_maintenance (
	id bigserial NOT NULL,
	obligation_id int8 NULL,
	maintenance_id int8 NULL,
	created_at timestamp NULL,
	invoice_due_date date NULL,
	total_due_date date NULL,
	net_due_date date NULL,
	discount_rate numeric(7, 4) NULL,
	fixed_remunerative_rate numeric(22, 4) NULL,
	remunerative_rate numeric(7, 4) NULL,
	disbursement_value numeric(22, 4) NULL,
	discount_value numeric(22, 4) NULL,
	principal_balance numeric(22, 4) NULL,
	accrued_amortized numeric(22, 4) NULL,
	accrued_remunerative numeric(22, 4) NULL,
	state varchar(100) NULL,
	accrued_moratorium numeric(22, 4) NULL,
	remunerative_balance numeric(22, 4) NULL,
	moratorium_balance numeric(22, 4) NULL,
	receivables_balance numeric(22, 4) NULL,
	prepayment_rate numeric(22, 4) NULL,
	status_process_maintenance varchar(100) NULL,
	net_days int4 NULL,
	obligation_age int4 NULL,
	prepayment_discount numeric(22, 4) NULL,
	provider_rate numeric(11, 8) NULL,
	payable_balance numeric(22, 4) NULL,
	is_annulled bool NULL,
	CONSTRAINT tbl_obligations_maintenance_pk PRIMARY KEY (id),
	CONSTRAINT fk_maintenance_id FOREIGN KEY (maintenance_id) REFERENCES schsaf.tbl_maintenance(id),
	CONSTRAINT fk_obligation_id FOREIGN KEY (obligation_id) REFERENCES schsaf.tbl_obligations(id)
);


-- schsaf.tbl_payment_application_obligation definition

-- Drop table

-- DROP TABLE schsaf.tbl_payment_application_obligation;

CREATE TABLE schsaf.tbl_payment_application_obligation (
	id bigserial NOT NULL,
	created_at timestamp NULL,
	id_payment_application int4 NOT NULL,
	id_obigation int4 NOT NULL,
	obligation_number varchar(100) NOT NULL,
	obligation_order numeric(10) NOT NULL,
	application_value numeric(22, 4) NOT NULL,
	CONSTRAINT tbl_payment_application_obligation_pkey PRIMARY KEY (id),
	CONSTRAINT fk_tbl_payment_application_application FOREIGN KEY (id_payment_application) REFERENCES schsaf.tbl_payment_application(id),
	CONSTRAINT fk_tbl_payment_application_obligation_id FOREIGN KEY (id_obigation) REFERENCES schsaf.tbl_obligations(id)
);


-- schsaf.tbl_payment_instruction definition

-- Drop table

-- DROP TABLE schsaf.tbl_payment_instruction;

CREATE TABLE schsaf.tbl_payment_instruction (
	id bigserial NOT NULL,
	obligation_id int8 NOT NULL,
	principal_value numeric(22, 4) NULL,
	remunerative_value numeric(22, 4) NULL,
	moratorium_value numeric(22, 4) NULL,
	receivables_value numeric(22, 4) NULL,
	state varchar(20) NOT NULL,
	payment_id int8 NULL,
	payment_distribution_id int8 NULL,
	created_at timestamp NULL,
	updated_at timestamp NULL,
	payment_application_id int8 NULL,
	tolerance_value numeric(22, 4) NULL,
	product_modality_sequence int4 NULL,
	discount_for_amortize numeric(22, 4) NULL,
	order_number int2 NULL,
	total_value numeric(22, 4) NULL,
	portfolio_tolerance_value numeric(22, 4) NULL,
	vpd_refund_value numeric(22, 4) NULL,
	CONSTRAINT tbl_payment_instruction_pkey PRIMARY KEY (id),
	CONSTRAINT fk_obligation FOREIGN KEY (obligation_id) REFERENCES schsaf.tbl_obligations(id),
	CONSTRAINT fk_payment FOREIGN KEY (payment_id) REFERENCES schsaf.tbl_payment(id),
	CONSTRAINT fk_payment_application FOREIGN KEY (payment_application_id) REFERENCES schsaf.tbl_payment_application(id),
	CONSTRAINT fk_payment_distribution FOREIGN KEY (payment_distribution_id) REFERENCES schsaf.tbl_payment_distribution(id)
);


-- schsaf.tbl_quota_extra definition

-- Drop table

-- DROP TABLE schsaf.tbl_quota_extra;

CREATE TABLE schsaf.tbl_quota_extra (
	id bigserial NOT NULL,
	quota_extra_type_id int8 NOT NULL,
	quota_product_id int8 NOT NULL,
	start_date timestamp NOT NULL,
	end_date timestamp NOT NULL,
	value int8 NOT NULL,
	status varchar(25) NULL,
	available_value int8 NULL,
	consumed_value int8 NULL,
	created_at timestamp NOT NULL,
	update_at timestamp NULL,
	execute_user varchar NULL,
	quota_product_provider_id int8 NULL,
	CONSTRAINT pk_tbl_quota_extra PRIMARY KEY (id),
	CONSTRAINT fk_tbl_quota_extra_type FOREIGN KEY (quota_extra_type_id) REFERENCES schsaf.tbl_quota_extra_type(id),
	CONSTRAINT fk_tbl_quota_product FOREIGN KEY (quota_product_id) REFERENCES schsaf.tbl_quota_product(id),
	CONSTRAINT tbl_quota_extra_tbl_quota_product_providers_fk FOREIGN KEY (quota_product_provider_id) REFERENCES schsaf.tbl_quota_product_providers(id)
);


-- schsaf.tbl_rate definition

-- Drop table

-- DROP TABLE schsaf.tbl_rate;

CREATE TABLE schsaf.tbl_rate (
	id bigserial NOT NULL,
	created timestamp NULL,
	end_date date NULL,
	start_date date NULL,
	status varchar(20) NOT NULL,
	updated timestamp NULL,
	value numeric(10, 4) NOT NULL,
	value_point_slack numeric(10, 4) NULL,
	value_usury_rate numeric(10, 4) NULL,
	approved_at date NULL,
	rate_type_id int8 NULL,
	executor_user varchar(50) NULL,
	approver_user varchar(50) NULL,
	approved_date timestamp NULL,
	CONSTRAINT tbl_rate_pkey PRIMARY KEY (id),
	CONSTRAINT rate_type_id_fk FOREIGN KEY (rate_type_id) REFERENCES schsaf.tbl_rate_type(id)
);


-- schsaf.tbl_rate_validity_history definition

-- Drop table

-- DROP TABLE schsaf.tbl_rate_validity_history;

CREATE TABLE schsaf.tbl_rate_validity_history (
	id bigserial NOT NULL,
	obligation_id int8 NULL,
	start_date date NOT NULL,
	ending_date date NOT NULL,
	value numeric(22, 4) NULL,
	state varchar(50) NULL,
	finance_charge_type_id int4 NOT NULL,
	description varchar(100) NULL,
	created_at timestamp NULL,
	updated_at timestamp NULL,
	consecutive varchar(50) NULL,
	CONSTRAINT tbl_rate_validity_history_pkey PRIMARY KEY (id),
	CONSTRAINT fk_finance_charge_type FOREIGN KEY (finance_charge_type_id) REFERENCES schsaf.tbl_finance_charge_types(id),
	CONSTRAINT fk_obligation FOREIGN KEY (obligation_id) REFERENCES schsaf.tbl_obligations(id)
);


-- schsaf.tbl_receivable definition

-- Drop table

-- DROP TABLE schsaf.tbl_receivable;

CREATE TABLE schsaf.tbl_receivable (
	id bigserial NOT NULL,
	client_id int8 NOT NULL,
	obligation_id int8 NULL,
	value numeric(22, 4) NULL,
	paid_value numeric(22, 4) NULL,
	state varchar(50) NULL,
	"type" varchar(50) NULL,
	description varchar(100) NULL,
	created_at timestamp NULL,
	updated_at timestamp NULL,
	maintenance_id int8 NULL,
	payment_instruction_id int8 NULL,
	payment_id int8 NULL,
	currency varchar(20) NULL,
	foreign_invoice_id int8 NULL,
	CONSTRAINT tbl_receivables_pkey PRIMARY KEY (id),
	CONSTRAINT fk_clients FOREIGN KEY (client_id) REFERENCES schsaf.tbl_client(id),
	CONSTRAINT fk_maintenance FOREIGN KEY (maintenance_id) REFERENCES schsaf.tbl_maintenance(id),
	CONSTRAINT fk_obligation FOREIGN KEY (obligation_id) REFERENCES schsaf.tbl_obligations(id),
	CONSTRAINT fk_payment FOREIGN KEY (payment_id) REFERENCES schsaf.tbl_payment(id),
	CONSTRAINT fk_payment_instruction FOREIGN KEY (payment_instruction_id) REFERENCES schsaf.tbl_payment_instruction(id),
	CONSTRAINT tbl_receivable_tbl_foreign_currency_invoice_fk FOREIGN KEY (foreign_invoice_id) REFERENCES schsaf.tbl_foreign_currency_invoice(id)
);


-- schsaf.tbl_receivable_payment_details definition

-- Drop table

-- DROP TABLE schsaf.tbl_receivable_payment_details;

CREATE TABLE schsaf.tbl_receivable_payment_details (
	id serial4 NOT NULL,
	receivable_id int8 NULL,
	paid_value numeric(22, 6) NOT NULL,
	payment_date date NULL,
	state varchar(30) NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	payment_application_id int8 NULL,
	CONSTRAINT receivable_payment_details_pkey PRIMARY KEY (id),
	CONSTRAINT fk_constraint_tbl_payment_application FOREIGN KEY (payment_application_id) REFERENCES schsaf.tbl_payment_application(id),
	CONSTRAINT fk_constraint_tbl_receivable FOREIGN KEY (receivable_id) REFERENCES schsaf.tbl_receivable(id)
);


-- schsaf.tbl_system_options_actions definition

-- Drop table

-- DROP TABLE schsaf.tbl_system_options_actions;

CREATE TABLE schsaf.tbl_system_options_actions (
	id serial4 NOT NULL,
	system_option_id int4 NOT NULL,
	system_action_id int4 NOT NULL,
	system_submodule_id int4 NULL,
	url varchar(100) NULL,
	"role" varchar(50) NULL,
	CONSTRAINT tbl_system_options_actions_pkey PRIMARY KEY (id),
	CONSTRAINT fk_system_actions FOREIGN KEY (system_action_id) REFERENCES schsaf.tbl_system_actions(id),
	CONSTRAINT fk_system_options FOREIGN KEY (system_option_id) REFERENCES schsaf.tbl_system_options(id),
	CONSTRAINT fk_system_submodules FOREIGN KEY (system_submodule_id) REFERENCES schsaf.tbl_system_submodules(id)
);


-- schsaf.tbl_system_privileges definition

-- Drop table

-- DROP TABLE schsaf.tbl_system_privileges;

CREATE TABLE schsaf.tbl_system_privileges (
	id bigserial NOT NULL,
	system_option_action_id int8 NOT NULL,
	system_group_id int8 NULL,
	CONSTRAINT tbl_system_privileges_pkey PRIMARY KEY (id),
	CONSTRAINT fk_group_id FOREIGN KEY (system_group_id) REFERENCES schsaf.tbl_system_groups(id),
	CONSTRAINT fk_option_action_id FOREIGN KEY (system_option_action_id) REFERENCES schsaf.tbl_system_options_actions(id)
);


-- schsaf.tbl_account_payable definition

-- Drop table

-- DROP TABLE schsaf.tbl_account_payable;

CREATE TABLE schsaf.tbl_account_payable (
	id bigserial NOT NULL,
	client_id int8 NOT NULL,
	obligation_id int8 NULL,
	maintenance_id int8 NULL,
	created_at timestamp NOT NULL,
	value numeric(22, 4) NOT NULL,
	paid_value numeric(22, 4) NULL,
	state varchar(50) NOT NULL,
	code_maintenance_type varchar(50) NULL,
	description varchar(100) NOT NULL,
	updated_at timestamp NULL,
	gmf numeric(22, 4) NULL,
	bank_account_id int8 NULL,
	centralized_use_of_resource_date timestamp(0) NULL,
	decentralized_use_of_resource_date timestamp(0) NULL,
	currency varchar(20) NULL,
	foreign_invoice_id int8 NULL,
	CONSTRAINT tbl_account_payable_pkey PRIMARY KEY (id),
	CONSTRAINT fk_bank_account FOREIGN KEY (bank_account_id) REFERENCES schsaf.tbl_bank_account(id),
	CONSTRAINT fk_clients FOREIGN KEY (client_id) REFERENCES schsaf.tbl_client(id),
	CONSTRAINT fk_maintenance FOREIGN KEY (maintenance_id) REFERENCES schsaf.tbl_maintenance(id),
	CONSTRAINT fk_obligation FOREIGN KEY (obligation_id) REFERENCES schsaf.tbl_obligations(id),
	CONSTRAINT tbl_account_payable_tbl_foreign_currency_invoice_fk FOREIGN KEY (foreign_invoice_id) REFERENCES schsaf.tbl_foreign_currency_invoice(id)
);


-- schsaf.tbl_accounting_balance_by_obligation definition

-- Drop table

-- DROP TABLE schsaf.tbl_accounting_balance_by_obligation;

CREATE TABLE schsaf.tbl_accounting_balance_by_obligation (
	id bigserial NOT NULL,
	created_at timestamp NOT NULL,
	current_balance numeric(22, 8) DEFAULT 0 NOT NULL,
	updated_at timestamp NULL,
	client_id int8 NULL,
	nit_client varchar(255) NOT NULL,
	name_client varchar(255) NULL,
	account_number varchar(255) NOT NULL,
	debits_value numeric(22, 8) DEFAULT 0 NOT NULL,
	credits_value numeric(22, 8) DEFAULT 0 NOT NULL,
	accrued_debits_value numeric(22, 8) DEFAULT 0 NOT NULL,
	accrued_credits_value numeric(22, 8) DEFAULT 0 NOT NULL,
	process_date date NOT NULL,
	is_generated_again bool DEFAULT false NOT NULL,
	obligation_id int8 NOT NULL,
	CONSTRAINT tbl_accounting_balance_by_obligations PRIMARY KEY (id),
	CONSTRAINT tbl_accounting_balance_by_obligation_tbl_client_fk FOREIGN KEY (client_id) REFERENCES schsaf.tbl_client(id),
	CONSTRAINT tbl_accounting_balance_by_obligation_tbl_obligations_fk FOREIGN KEY (obligation_id) REFERENCES schsaf.tbl_obligations(id)
);


-- schsaf.tbl_accounting_movement_detail definition

-- Drop table

-- DROP TABLE schsaf.tbl_accounting_movement_detail;

CREATE TABLE schsaf.tbl_accounting_movement_detail (
	id bigserial NOT NULL,
	movement_id int8 NOT NULL,
	value float8 NOT NULL,
	created_at timestamp NULL,
	nit varchar(20) NULL,
	obligation_id int8 NULL,
	date_process timestamp NOT NULL,
	process_transactional_id int8 NULL,
	id_reference int8 NULL,
	CONSTRAINT tbl_accounting_movement_detail_pkey PRIMARY KEY (id),
	CONSTRAINT fk_ccntng_mvmnt_dtl_blgtn FOREIGN KEY (obligation_id) REFERENCES schsaf.tbl_obligations(id),
	CONSTRAINT fk_movement_id FOREIGN KEY (movement_id) REFERENCES schsaf.tbl_accounting_movement(id),
	CONSTRAINT fk_reference_id FOREIGN KEY (id_reference) REFERENCES schsaf.tbl_reference(id)
);


-- schsaf.tbl_bank_drafts_maintenance definition

-- Drop table

-- DROP TABLE schsaf.tbl_bank_drafts_maintenance;

CREATE TABLE schsaf.tbl_bank_drafts_maintenance (
	id bigserial NOT NULL,
	maintenance_id int8 NOT NULL,
	"sequence" varchar(50) NOT NULL,
	payer_document_type varchar(50) NOT NULL,
	payer_document_number varchar(255) NOT NULL,
	payer_account_type varchar(255) NOT NULL,
	payer_account_number varchar(255) NOT NULL,
	payment_type varchar(100) NOT NULL,
	transaction_type varchar(200) NOT NULL,
	bank_draft_value numeric(22, 4) NOT NULL,
	application_mode varchar(15) NOT NULL,
	application_date date NOT NULL,
	state varchar NOT NULL,
	answer_code varchar(5) NULL,
	"type" varchar(20) NULL,
	bank_account_id int8 NULL,
	response_date timestamp NULL,
	CONSTRAINT tbl_bank_drafts_maintenace_pkey PRIMARY KEY (id),
	CONSTRAINT fk_maintenance_bank_drafts_maintenance FOREIGN KEY (maintenance_id) REFERENCES schsaf.tbl_maintenance(id),
	CONSTRAINT tbl_bank_drafts_maintenance_tbl_bank_account_fk FOREIGN KEY (bank_account_id) REFERENCES schsaf.tbl_bank_account(id)
);


-- schsaf.tbl_functional_logs definition

-- Drop table

-- DROP TABLE schsaf.tbl_functional_logs;

CREATE TABLE schsaf.tbl_functional_logs (
	id bigserial NOT NULL,
	created_at timestamp NOT NULL,
	username varchar(50) NOT NULL,
	option_action_id int4 NOT NULL,
	old_object varchar NULL,
	new_object varchar NOT NULL,
	CONSTRAINT tbl_functional_logs_pkey PRIMARY KEY (id),
	CONSTRAINT fk_system_option_actions FOREIGN KEY (option_action_id) REFERENCES schsaf.tbl_system_options_actions(id)
);


-- schsaf.tbl_indexation_rates definition

-- Drop table

-- DROP TABLE schsaf.tbl_indexation_rates;

CREATE TABLE schsaf.tbl_indexation_rates (
	id serial4 NOT NULL,
	rate_id int4 NOT NULL,
	indexation varchar(50) NOT NULL,
	indicator_value numeric(10, 3) NULL,
	CONSTRAINT tbl_indexation_rates_pkey PRIMARY KEY (id),
	CONSTRAINT uq_rate_indexation UNIQUE (rate_id, indexation),
	CONSTRAINT fk_rate FOREIGN KEY (rate_id) REFERENCES schsaf.tbl_rate(id)
);


-- schsaf.tbl_invoice_lt_aggrupation definition

-- Drop table

-- DROP TABLE schsaf.tbl_invoice_lt_aggrupation;

CREATE TABLE schsaf.tbl_invoice_lt_aggrupation (
	id bigserial NOT NULL,
	application_at timestamp NOT NULL,
	provider_document_number varchar NOT NULL,
	payer_document_number varchar NOT NULL,
	plan_id int8 NOT NULL,
	issuance_date date NOT NULL,
	consultation_date date NOT NULL,
	expiration_date date NOT NULL,
	value numeric NULL,
	state varchar NOT NULL,
	feedback varchar NULL,
	disbursement_dtf numeric NULL,
	provider_rate_ea numeric NULL,
	amortization_rate_ea numeric NULL,
	remunerative_rate_ea numeric NULL,
	prepayment_rate_ea numeric NULL,
	last_update_rates date NULL,
	usury_rate_control bool NULL,
	last_update_disbursement_value date NULL,
	obligation_id int8 NULL,
	application_number varchar NULL,
	rejection_id int8 NULL,
	rejecting_user varchar NULL,
	net_due_date date NOT NULL,
	provider_discount_calculus_type varchar NOT NULL,
	discount_date date NOT NULL,
	discount_factor numeric NULL,
	CONSTRAINT tbl_invoice_lt_aggrupation_pk PRIMARY KEY (id),
	CONSTRAINT tbl_invoice_lt_aggrupation_unique_application_number UNIQUE (application_number),
	CONSTRAINT tbl_invoice_lt_aggrupation_unique_key UNIQUE (application_at, provider_document_number, payer_document_number, plan_id, issuance_date, consultation_date, expiration_date, discount_date),
	CONSTRAINT tbl_invoice_lt_aggrupation_tbl_obligations_fk FOREIGN KEY (obligation_id) REFERENCES schsaf.tbl_obligations(id)
);

-- Table Triggers

create trigger before_insert_tbl_invoice_lt_aggrupation before
insert
    on
    schsaf.tbl_invoice_lt_aggrupation for each row execute function schsaf.generate_lt_application_number();


-- schsaf.tbl_maintenance_initial_condition definition

-- Drop table

-- DROP TABLE schsaf.tbl_maintenance_initial_condition;

CREATE TABLE schsaf.tbl_maintenance_initial_condition (
	id bigserial NOT NULL,
	obligation_id int8 NULL,
	invoice_number varchar(100) NOT NULL,
	description varchar(255) NULL,
	is_valid bool NOT NULL,
	maintenance_id int8 NOT NULL,
	created_at timestamp NOT NULL,
	updated_at timestamp NULL,
	date_value date NULL,
	rate_value numeric(22, 4) NULL,
	process_state varchar(50) NOT NULL,
	fault_description_approve varchar(1000) NULL,
	is_saved_historical bool NULL,
	is_applied bool DEFAULT false NULL,
	CONSTRAINT tbl_maintenance_initial_condition_pk PRIMARY KEY (id),
	CONSTRAINT fk_obligation FOREIGN KEY (obligation_id) REFERENCES schsaf.tbl_obligations(id),
	CONSTRAINT tbl_maintenance_initial_condition_tbl_maintenance_fk FOREIGN KEY (maintenance_id) REFERENCES schsaf.tbl_maintenance(id)
);


-- schsaf.tbl_maintenance_massive definition

-- Drop table

-- DROP TABLE schsaf.tbl_maintenance_massive;

CREATE TABLE schsaf.tbl_maintenance_massive (
	id bigserial NOT NULL,
	obligation_id int8 NULL,
	invoice_number varchar(100) NULL,
	description varchar(10000) NULL,
	is_valid bool NOT NULL,
	maintenance_id int8 NULL,
	created_at timestamp NULL,
	updated_at timestamp NULL,
	CONSTRAINT tbl_tbl_maintenance_massive_pkey PRIMARY KEY (id),
	CONSTRAINT fk_maintenance FOREIGN KEY (maintenance_id) REFERENCES schsaf.tbl_maintenance(id),
	CONSTRAINT fk_obligation FOREIGN KEY (obligation_id) REFERENCES schsaf.tbl_obligations(id)
);


-- schsaf.tbl_maintenance_relationships definition

-- Drop table

-- DROP TABLE schsaf.tbl_maintenance_relationships;

CREATE TABLE schsaf.tbl_maintenance_relationships (
	id int8 DEFAULT nextval('schsaf.tbl_maintenance_execution_obligation_id_seq'::regclass) NOT NULL,
	id_maintenance int8 NOT NULL,
	id_relationship int8 NOT NULL,
	id_new_obligation int8 NULL,
	table_name varchar(60) NULL,
	process varchar(50) DEFAULT 'PENDING'::character varying NULL,
	description varchar(1000) NULL,
	CONSTRAINT tbl_maintenance_execution_obligation_key PRIMARY KEY (id),
	CONSTRAINT tbl_maintenance_execution_obligat_id_maintenance_execution_fkey FOREIGN KEY (id_maintenance) REFERENCES schsaf.tbl_maintenance(id),
	CONSTRAINT tbl_maintenance_execution_obligation_id_new_obligation_fkey FOREIGN KEY (id_new_obligation) REFERENCES schsaf.tbl_obligations(id)
);


-- schsaf.tbl_maintenance_special definition

-- Drop table

-- DROP TABLE schsaf.tbl_maintenance_special;

CREATE TABLE schsaf.tbl_maintenance_special (
	id bigserial NOT NULL,
	obligation_id int8 NULL,
	client_id int8 NULL,
	maintenance_id int8 NULL,
	remunerative_interest numeric(22, 4) NULL,
	moratorium_balance numeric(22, 4) NULL,
	discount numeric(22, 4) NULL,
	principal_balance numeric(22, 4) NULL,
	reimbursement bool NOT NULL,
	created_at timestamp NULL,
	updated_at timestamp NULL,
	payment_instruction_id int8 NULL,
	gmf numeric(22, 4) NULL,
	retention numeric(22, 4) NULL,
	reference_date date NULL,
	product_id int4 NULL,
	CONSTRAINT tbl_special_maintenance_pkey PRIMARY KEY (id),
	CONSTRAINT fk_client FOREIGN KEY (client_id) REFERENCES schsaf.tbl_client(id),
	CONSTRAINT fk_maintenance FOREIGN KEY (maintenance_id) REFERENCES schsaf.tbl_maintenance(id),
	CONSTRAINT fk_obligation FOREIGN KEY (obligation_id) REFERENCES schsaf.tbl_obligations(id),
	CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES schsaf.tbl_products(id),
	CONSTRAINT tbl_maintenance_special_fk FOREIGN KEY (payment_instruction_id) REFERENCES schsaf.tbl_payment_instruction(id)
);


-- schsaf.tbl_obligation_invoice definition

-- Drop table

-- DROP TABLE schsaf.tbl_obligation_invoice;

CREATE TABLE schsaf.tbl_obligation_invoice (
	obligation_id int8 NOT NULL,
	invoice_id int4 NOT NULL,
	CONSTRAINT tbl_obligation_invoice_pkey PRIMARY KEY (obligation_id, invoice_id),
	CONSTRAINT fk_invoice_obligation_invoice FOREIGN KEY (invoice_id) REFERENCES schsaf.tbl_invoice(id),
	CONSTRAINT fk_obligation_obligation_invoice FOREIGN KEY (obligation_id) REFERENCES schsaf.tbl_obligations(id)
);


-- schsaf.tbl_payback_drafts definition

-- Drop table

-- DROP TABLE schsaf.tbl_payback_drafts;

CREATE TABLE schsaf.tbl_payback_drafts (
	id bigserial NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	shared_discount_value numeric(22, 4) NULL,
	rft_value numeric(22, 4) NULL,
	gmf_value numeric(22, 4) NULL,
	payback_draft_value numeric(22, 4) NULL,
	state varchar(20) NULL,
	client_id int8 NULL,
	type_client_beneficiary varchar(20) NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	payback_draft_type_id int8 NULL,
	payment_instruction_id int8 NULL,
	maintenance_id int8 NULL,
	bank_account int8 NULL,
	centralized_use_of_resource_date timestamp(0) NULL,
	decentralized_use_of_resource_date timestamp(0) NULL,
	CONSTRAINT tbl_payback_drafts_pkey PRIMARY KEY (id),
	CONSTRAINT fk_client_id FOREIGN KEY (client_id) REFERENCES schsaf.tbl_client(id),
	CONSTRAINT fk_maintenance_id FOREIGN KEY (maintenance_id) REFERENCES schsaf.tbl_maintenance(id),
	CONSTRAINT fk_payback_draft_type_id FOREIGN KEY (payback_draft_type_id) REFERENCES schsaf.tbl_payback_drafts_types(id),
	CONSTRAINT fk_payment_instruction_id FOREIGN KEY (payment_instruction_id) REFERENCES schsaf.tbl_payment_instruction(id)
);


-- schsaf.tbl_process_centralization_history definition

-- Drop table

-- DROP TABLE schsaf.tbl_process_centralization_history;

CREATE TABLE schsaf.tbl_process_centralization_history (
	id bigserial NOT NULL,
	request_number varchar NOT NULL,
	old_state varchar NOT NULL,
	new_state varchar NOT NULL,
	payment_id int8 NULL,
	payback_drafts_id int8 NULL,
	account_payable_id int8 NULL,
	value numeric(22, 4) NULL,
	value_centralized_decentralized numeric(22, 4) NULL,
	created_at timestamp NULL,
	updated_at timestamp NULL,
	CONSTRAINT tbl_process_centralization_history_pkey PRIMARY KEY (id),
	CONSTRAINT fk_account_payable FOREIGN KEY (account_payable_id) REFERENCES schsaf.tbl_account_payable(id),
	CONSTRAINT fk_payback_drafts FOREIGN KEY (payback_drafts_id) REFERENCES schsaf.tbl_payback_drafts(id),
	CONSTRAINT fk_payment FOREIGN KEY (payment_id) REFERENCES schsaf.tbl_payment(id)
);
CREATE INDEX ix_tbl_centralization_request_number ON schsaf.tbl_process_centralization_history USING btree (request_number);


-- schsaf.tbl_bank_drafts definition

-- Drop table

-- DROP TABLE schsaf.tbl_bank_drafts;

CREATE TABLE schsaf.tbl_bank_drafts (
	id bigserial NOT NULL,
	invoice_header_id int4 NULL,
	"sequence" varchar(50) NOT NULL,
	payer_document_type varchar(50) NOT NULL,
	payer_document_number varchar(255) NOT NULL,
	payer_account_type varchar(255) NOT NULL,
	payer_account_number varchar(255) NOT NULL,
	payment_type varchar(100) NOT NULL,
	transaction_type varchar(200) NOT NULL,
	bank_draft_value numeric(22, 4) NOT NULL,
	application_mode varchar(15) NOT NULL,
	application_date date NOT NULL,
	state varchar NOT NULL,
	gmf_value numeric(22, 4) DEFAULT 0 NOT NULL,
	response_date date NULL,
	is_ach bool NOT NULL,
	aggrupation_id int8 NULL,
	CONSTRAINT tbl_bank_drafts_pkey PRIMARY KEY (id),
	CONSTRAINT uk_invoice_header UNIQUE (invoice_header_id),
	CONSTRAINT uk_invoice_lt_aggrupation UNIQUE (aggrupation_id),
	CONSTRAINT zk_invoice_header_invoice_lt_aggrupation CHECK ((((invoice_header_id IS NOT NULL) AND (aggrupation_id IS NULL)) OR ((invoice_header_id IS NULL) AND (aggrupation_id IS NOT NULL)))),
	CONSTRAINT fk_invoice_header_bank_drafts FOREIGN KEY (invoice_header_id) REFERENCES schsaf.tbl_invoice_header(id),
	CONSTRAINT fk_invoice_lt_aggrupation_bank_drafts FOREIGN KEY (aggrupation_id) REFERENCES schsaf.tbl_invoice_lt_aggrupation(id)
);


-- schsaf.tbl_invoice_lt definition

-- Drop table

-- DROP TABLE schsaf.tbl_invoice_lt;

CREATE TABLE schsaf.tbl_invoice_lt (
	id bigserial NOT NULL,
	ordinal_id int8 NOT NULL,
	invoice_header_lt_id int8 NOT NULL,
	"number" varchar NOT NULL,
	payer_document_number varchar NOT NULL,
	payer_id int8 NULL,
	plan_code varchar NOT NULL,
	plan_id int8 NULL,
	value float8 NOT NULL,
	issuance_date date NOT NULL,
	consultation_date date NOT NULL,
	expiration_date date NOT NULL,
	state varchar NULL,
	feedback varchar NULL,
	quota_consumption_id int8 NULL,
	subtracted_quota bool NULL,
	net_due_date date NULL,
	net_term int4 NULL,
	lower_limit_date date NULL,
	upper_limit_date date NULL,
	payment_date date NULL,
	disbursement_value numeric NULL,
	discount_value numeric NULL,
	pay_percentage numeric NULL,
	accrued_amortized numeric NULL,
	aggrupation_at timestamp NULL,
	aggrupation_id int8 NULL,
	base int4 NULL,
	discount_rate numeric NULL,
	disbursement_date date NULL,
	CONSTRAINT tbl_invoice_lt_pk PRIMARY KEY (id),
	CONSTRAINT tbl_invoice_lt_tbl_client_fk FOREIGN KEY (payer_id) REFERENCES schsaf.tbl_client(id),
	CONSTRAINT tbl_invoice_lt_tbl_disbursement_lt_quota_consumption_fk FOREIGN KEY (quota_consumption_id) REFERENCES schsaf.tbl_disbursement_lt_quota_consumption(id),
	CONSTRAINT tbl_invoice_lt_tbl_financing_plan_fk FOREIGN KEY (plan_id) REFERENCES schsaf.tbl_financing_plan(id),
	CONSTRAINT tbl_invoice_lt_tbl_invoice_header_lt_fk FOREIGN KEY (invoice_header_lt_id) REFERENCES schsaf.tbl_invoice_header_lt(id),
	CONSTRAINT tbl_invoice_lt_tbl_invoice_lt_aggrupation_fk FOREIGN KEY (aggrupation_id) REFERENCES schsaf.tbl_invoice_lt_aggrupation(id)
);


-- schsaf.tbl_finance_charges definition

-- Drop table

-- DROP TABLE schsaf.tbl_finance_charges;

CREATE TABLE schsaf.tbl_finance_charges (
	id bigserial NOT NULL,
	obligation_id int8 NOT NULL,
	created_at timestamp NOT NULL,
	rate numeric(7, 4) NOT NULL,
	finance_charge_value numeric(22, 6) NOT NULL,
	finance_charge_type_id int4 NOT NULL,
	principal_balance numeric(22, 4) NULL,
	days_number int2 NULL,
	process_type varchar(50) NULL,
	"uuid" varchar(100) NULL,
	accum_value numeric(22, 6) NULL,
	difference_value numeric(22, 6) DEFAULT 0 NULL,
	invoice_lt_id int8 NULL,
	CONSTRAINT tbl_obligation_finance_charges_pkey PRIMARY KEY (id),
	CONSTRAINT fk_finance_charge_type FOREIGN KEY (finance_charge_type_id) REFERENCES schsaf.tbl_finance_charge_types(id),
	CONSTRAINT fk_invoice_lt_finance_charges FOREIGN KEY (invoice_lt_id) REFERENCES schsaf.tbl_invoice_lt(id),
	CONSTRAINT fk_obligations_finance_charges FOREIGN KEY (obligation_id) REFERENCES schsaf.tbl_obligations(id)
);
CREATE INDEX created_at_finance_charges_index ON schsaf.tbl_finance_charges USING btree (created_at);


-- schsaf.view_accounting_balance_by_account source

CREATE OR REPLACE VIEW schsaf.view_accounting_balance_by_account
AS SELECT t.fecha_de_proceso,
    t.numero_de_la_cuenta_contable,
    t.naturaleza_de_la_cuenta,
    t.nit,
    t.nombre_del_cliente,
    t.saldo_actual
   FROM ( SELECT tabba.process_date AS fecha_de_proceso,
            taa.number AS numero_de_la_cuenta_contable,
            taa.nature AS naturaleza_de_la_cuenta,
            tabba.nit_client AS nit,
            tabba.name_client AS nombre_del_cliente,
            tabba.current_balance AS saldo_actual,
            row_number() OVER (PARTITION BY tabba.nit_client, taa.number ORDER BY tabba.process_date DESC) AS rn
           FROM schsaf.tbl_accounting_balance_by_account tabba
             JOIN schsaf.tbl_accounting_account taa ON taa.number::text = tabba.account_number::text) t
  WHERE t.rn = 1 AND (t.naturaleza_de_la_cuenta::text = 'DEBIT'::text AND t.saldo_actual < 0::numeric OR t.naturaleza_de_la_cuenta::text = 'CREDIT'::text AND t.saldo_actual > 0::numeric);


-- schsaf.view_accounting_balance_by_obligation source

CREATE OR REPLACE VIEW schsaf.view_accounting_balance_by_obligation
AS SELECT t.fecha_de_proceso,
    t.numero_de_la_cuenta_contable,
    t.naturaleza_de_la_cuenta,
    t.nit,
    t.nombre_del_cliente,
    t.obligation,
    t.saldo_actual
   FROM ( SELECT tabbo.process_date AS fecha_de_proceso,
            taa.number AS numero_de_la_cuenta_contable,
            taa.nature AS naturaleza_de_la_cuenta,
            tabbo.nit_client AS nit,
            tabbo.name_client AS nombre_del_cliente,
            to2.invoice_number AS obligation,
            tabbo.current_balance AS saldo_actual,
            row_number() OVER (PARTITION BY taa.number, to2.invoice_number, tabbo.nit_client ORDER BY tabbo.process_date DESC) AS rn
           FROM schsaf.tbl_accounting_balance_by_obligation tabbo
             JOIN schsaf.tbl_obligations to2 ON to2.id = tabbo.obligation_id
             JOIN schsaf.tbl_accounting_account taa ON taa.number::text = tabbo.account_number::text) t
  WHERE t.rn = 1 AND (t.naturaleza_de_la_cuenta::text = 'DEBIT'::text AND t.saldo_actual < 0::numeric OR t.naturaleza_de_la_cuenta::text = 'CREDIT'::text AND t.saldo_actual > 0::numeric);


-- schsaf.view_accounting_balance_info source

CREATE OR REPLACE VIEW schsaf.view_accounting_balance_info
AS SELECT row_number() OVER () AS id,
    tb_principal.account_number,
    tb_principal.created_at,
    tb_principal.nit,
    tb_debits.movement_value AS debit_movement,
    tb_credits.movement_value AS credit_movement,
    tbl_client.full_name AS name_client
   FROM schsaf.tbl_accounting_balance tb_principal
     LEFT JOIN ( SELECT tbl_accounting_balance.account_number,
            tbl_accounting_balance.created_at,
            tbl_accounting_balance.nit,
            tbl_accounting_balance.movement_value
           FROM schsaf.tbl_accounting_balance
          WHERE tbl_accounting_balance.nature::text = 'DEBIT'::text) tb_debits ON tb_debits.account_number::text = tb_principal.account_number::text AND tb_debits.created_at = tb_principal.created_at AND tb_debits.nit::text = tb_principal.nit::text
     LEFT JOIN ( SELECT tbl_accounting_balance.account_number,
            tbl_accounting_balance.created_at,
            tbl_accounting_balance.nit,
            tbl_accounting_balance.movement_value
           FROM schsaf.tbl_accounting_balance
          WHERE tbl_accounting_balance.nature::text = 'CREDIT'::text) tb_credits ON tb_credits.account_number::text = tb_principal.account_number::text AND tb_credits.created_at = tb_principal.created_at AND tb_credits.nit::text = tb_principal.nit::text
     LEFT JOIN schsaf.tbl_client ON tb_principal.nit::text = tbl_client.document_number::text
  GROUP BY tb_principal.account_number, tb_principal.created_at, tb_principal.nit, tb_debits.movement_value, tb_credits.movement_value, tbl_client.full_name;


-- schsaf.view_accounting_balance_report source

CREATE OR REPLACE VIEW schsaf.view_accounting_balance_report
AS SELECT DISTINCT tab_primary.account_number,
    COALESCE(tab_debito.value_a_month_ago, 0::double precision) - COALESCE(tab_credito.value_a_month_ago, 0::double precision) AS value_a_month_ago,
    COALESCE(tab_debitotwomonth.value_a_month_ago, 0::double precision) - COALESCE(tab_creditotwomonth.value_a_month_ago, 0::double precision) AS value_two_months_ago
   FROM schsaf.tbl_accounting_balance tab_primary
     LEFT JOIN ( SELECT c.account_number,
            sum(c.movement_value) AS value_a_month_ago
           FROM schsaf.tbl_accounting_balance c
          WHERE c.created_at >= date_trunc('month'::text, date_trunc('month'::text, now()) - '00:00:01'::interval) AND c.created_at <= (date_trunc('month'::text, date_trunc('month'::text, now()) - '00:00:00'::interval) - '00:00:01'::interval) AND c.nature::text = 'DEBIT'::text
          GROUP BY c.account_number) tab_debito ON tab_primary.account_number::text = tab_debito.account_number::text
     LEFT JOIN ( SELECT d.account_number,
            sum(d.movement_value) AS value_a_month_ago
           FROM schsaf.tbl_accounting_balance d
          WHERE d.created_at >= date_trunc('month'::text, date_trunc('month'::text, now()) - '00:00:01'::interval) AND d.created_at <= (date_trunc('month'::text, date_trunc('month'::text, now()) - '00:00:00'::interval) - '00:00:01'::interval) AND d.nature::text = 'CREDIT'::text
          GROUP BY d.account_number) tab_credito ON tab_primary.account_number::text = tab_credito.account_number::text
     LEFT JOIN ( SELECT cr.account_number,
            sum(cr.movement_value) AS value_a_month_ago
           FROM schsaf.tbl_accounting_balance cr
          WHERE cr.created_at >= (date_trunc('month'::text, date_trunc('month'::text, now()) - '00:00:01'::interval) - '1 mon'::interval) AND cr.created_at <= (date_trunc('month'::text, date_trunc('month'::text, now()) - '00:00:01'::interval) - '00:00:01'::interval) AND cr.nature::text = 'DEBIT'::text
          GROUP BY cr.account_number) tab_debitotwomonth ON tab_primary.account_number::text = tab_debitotwomonth.account_number::text
     LEFT JOIN ( SELECT de.account_number,
            sum(de.movement_value) AS value_a_month_ago
           FROM schsaf.tbl_accounting_balance de
          WHERE de.created_at >= (date_trunc('month'::text, date_trunc('month'::text, now()) - '00:00:01'::interval) - '1 mon'::interval) AND de.created_at <= (date_trunc('month'::text, date_trunc('month'::text, now()) - '00:00:01'::interval) - '00:00:01'::interval) AND de.nature::text = 'CREDIT'::text
          GROUP BY de.account_number) tab_creditotwomonth ON tab_primary.account_number::text = tab_creditotwomonth.account_number::text
  WHERE tab_debito.account_number IS NOT NULL OR tab_credito.account_number IS NOT NULL OR tab_debitotwomonth.account_number IS NOT NULL OR tab_debitotwomonth.account_number IS NOT NULL
  ORDER BY tab_primary.account_number;


-- schsaf.view_accounting_balances_obligation source

CREATE OR REPLACE VIEW schsaf.view_accounting_balances_obligation
AS WITH with_accounting_obligation AS (
         SELECT
                CASE
                    WHEN cre.year_accounting IS NOT NULL THEN cre.year_accounting
                    ELSE deb.year_accounting
                END AS year_accounting,
                CASE
                    WHEN cre.nit IS NOT NULL THEN cre.nit
                    ELSE deb.nit
                END AS nit,
                CASE
                    WHEN cre.account_number IS NOT NULL THEN cre.account_number
                    ELSE deb.account_number
                END AS account_number,
                CASE
                    WHEN cre.number_svf IS NOT NULL THEN cre.number_svf
                    ELSE deb.number_svf
                END AS number_svf,
            (COALESCE(deb.value, 0::double precision) - COALESCE(cre.value, 0::double precision))::numeric(15,2) AS current_balance
           FROM ( SELECT date_part('year'::text, tamd.created_at) AS year_accounting,
                    tamd.nit,
                    taa.number AS account_number,
                    ti.number_svf,
                    tam.nature AS nature_event,
                    count(tamd.id) AS count_moment,
                    sum(tamd.value) AS value
                   FROM schsaf.tbl_accounting_movement tam
                     JOIN schsaf.tbl_accounting_movement_detail tamd ON tam.id = tamd.movement_id
                     JOIN schsaf.tbl_accounting_account taa ON tam.account_id = taa.id
                     JOIN schsaf.tbl_obligations to2 ON tamd.obligation_id = to2.id
                     JOIN schsaf.tbl_obligation_invoice toi ON to2.id = toi.obligation_id
                     JOIN schsaf.tbl_invoice ti ON toi.invoice_id = ti.id
                     JOIN schsaf.tbl_client tc ON tamd.nit::text = tc.document_number::text
                  WHERE tam.nature::text = 'CREDIT'::text
                  GROUP BY (date_part('year'::text, tamd.created_at)), tamd.nit, taa.number, ti.number_svf, tam.nature) cre
             FULL JOIN ( SELECT date_part('year'::text, tamd.created_at) AS year_accounting,
                    tamd.nit,
                    taa.number AS account_number,
                    ti.number_svf,
                    tam.nature AS nature_event,
                    count(tamd.id) AS count_moment,
                    sum(tamd.value) AS value
                   FROM schsaf.tbl_accounting_movement tam
                     JOIN schsaf.tbl_accounting_movement_detail tamd ON tam.id = tamd.movement_id
                     JOIN schsaf.tbl_accounting_account taa ON tam.account_id = taa.id
                     JOIN schsaf.tbl_obligations to2 ON tamd.obligation_id = to2.id
                     JOIN schsaf.tbl_obligation_invoice toi ON to2.id = toi.obligation_id
                     JOIN schsaf.tbl_invoice ti ON toi.invoice_id = ti.id
                  WHERE tam.nature::text = 'DEBIT'::text
                  GROUP BY (date_part('year'::text, tamd.created_at)), tamd.nit, taa.number, ti.number_svf, tam.nature) deb ON deb.nit::text = cre.nit::text AND deb.account_number::text = cre.account_number::text AND deb.number_svf::text = cre.number_svf::text AND cre.year_accounting = deb.year_accounting
        ), with_accounting_obligation_day_moment AS (
         SELECT
                CASE
                    WHEN cre.year_accounting IS NOT NULL THEN cre.year_accounting
                    ELSE deb.year_accounting
                END AS year_accounting,
                CASE
                    WHEN cre.created_at > COALESCE(deb.created_at, '1990-01-01'::date) THEN cre.created_at
                    ELSE deb.created_at
                END AS created_at,
                CASE
                    WHEN cre.name_payer_provider_third IS NOT NULL THEN cre.name_payer_provider_third
                    ELSE deb.name_payer_provider_third
                END AS name_payer_provider_third,
                CASE
                    WHEN cre.document_type_payer_provider_third IS NOT NULL THEN cre.document_type_payer_provider_third
                    ELSE deb.document_type_payer_provider_third
                END AS document_type_payer_provider_third,
                CASE
                    WHEN cre.document_number_payer_provider_third IS NOT NULL THEN cre.document_number_payer_provider_third
                    ELSE deb.document_number_payer_provider_third
                END AS document_number_payer_provider_third,
                CASE
                    WHEN cre.name_payer IS NOT NULL THEN cre.name_payer
                    ELSE deb.name_payer
                END AS name_payer,
                CASE
                    WHEN cre.document_type_payer IS NOT NULL THEN cre.document_type_payer
                    ELSE deb.document_type_payer
                END AS document_type_payer,
                CASE
                    WHEN cre.document_number_payer IS NOT NULL THEN cre.document_number_payer
                    ELSE deb.document_number_payer
                END AS document_number_payer,
                CASE
                    WHEN cre.name_provider IS NOT NULL THEN cre.name_provider
                    ELSE deb.name_provider
                END AS name_provider,
                CASE
                    WHEN cre.document_type_provider IS NOT NULL THEN cre.document_type_provider
                    ELSE deb.document_type_provider
                END AS document_type_provider,
                CASE
                    WHEN cre.document_number_provider IS NOT NULL THEN cre.document_number_provider
                    ELSE deb.document_number_provider
                END AS document_number_provider,
                CASE
                    WHEN cre.account_number IS NOT NULL THEN cre.account_number
                    ELSE deb.account_number
                END AS account_number,
                CASE
                    WHEN cre.obligation_id IS NOT NULL THEN cre.obligation_id
                    ELSE deb.obligation_id
                END AS obligation_id,
                CASE
                    WHEN cre.number_svf IS NOT NULL THEN cre.number_svf
                    ELSE deb.number_svf
                END AS number_svf,
                CASE
                    WHEN cre.created_at = COALESCE(deb.created_at, '1990-01-01'::date) THEN COALESCE(deb.debit_movement, 0::double precision)
                    WHEN cre.created_at > COALESCE(deb.created_at, '1990-01-01'::date) THEN 0::double precision
                    ELSE COALESCE(deb.debit_movement, 0::double precision)
                END AS debit_movement,
                CASE
                    WHEN cre.created_at = COALESCE(deb.created_at, '1990-01-01'::date) THEN COALESCE(cre.credit_movement, 0::double precision)
                    WHEN cre.created_at > COALESCE(deb.created_at, '1990-01-01'::date) THEN COALESCE(cre.credit_movement, 0::double precision)
                    ELSE 0::double precision
                END AS credit_movement,
                CASE
                    WHEN cre.products IS NOT NULL THEN cre.products
                    ELSE deb.products
                END AS products,
                CASE
                    WHEN cre.modality IS NOT NULL THEN cre.modality
                    ELSE deb.modality
                END AS modality,
            cre.created_at AS created_at_cre,
            deb.created_at AS created_at_deb,
                CASE
                    WHEN deb.count_moment = 1 AND cre.count_moment = 1 AND cre.created_at = deb.created_at THEN 1::bigint
                    ELSE COALESCE(deb.count_moment, 0::bigint) + COALESCE(cre.count_moment, 0::bigint)
                END AS count_moment
           FROM ( SELECT max_deb.year_accounting,
                    max_deb.account_number,
                    max_deb.obligation_id,
                    max_deb.number_svf,
                    max_deb.nature_event,
                    max_deb.created_at,
                    max_deb.count_moment,
                    tc_payer_provider_third.full_name AS name_payer_provider_third,
                    hdoc_payer_provider_third.homo_document_type AS document_type_payer_provider_third,
                    max_deb.nit AS document_number_payer_provider_third,
                    tc_payer.full_name AS name_payer,
                    hdoc_payer.homo_document_type AS document_type_payer,
                    tc_payer.document_number AS document_number_payer,
                    tc_provider.full_name AS name_provider,
                    hdoc_provider.homo_document_type AS document_type_provider,
                    tc_provider.document_number AS document_number_provider,
                    tp.name AS products,
                    tpm.modality,
                    sum(tamd.value) AS debit_movement
                   FROM schsaf.tbl_accounting_movement tam
                     JOIN schsaf.tbl_accounting_movement_detail tamd ON tam.id = tamd.movement_id
                     JOIN schsaf.tbl_accounting_account taa ON tam.account_id = taa.id
                     JOIN schsaf.tbl_obligations to2 ON tamd.obligation_id = to2.id
                     JOIN schsaf.tbl_obligation_invoice toi ON to2.id = toi.obligation_id
                     JOIN schsaf.tbl_invoice ti ON toi.invoice_id = ti.id
                     JOIN schsaf.tbl_business_relationships tbr ON to2.business_relationship_id = tbr.id
                     JOIN schsaf.tbl_products_modalities tpm ON tbr.productmodality_id = tpm.id
                     JOIN schsaf.tbl_products tp ON tpm.product_id = tp.id
                     JOIN schsaf.tbl_invoice_header tih ON ti.invoice_header_id = tih.id
                     JOIN schsaf.tbl_client tc_payer_provider_third ON tamd.nit::text = tc_payer_provider_third.document_number::text
                     JOIN schsaf.tbl_client tc_payer ON tbr.payer_id = tc_payer.id
                     JOIN schsaf.tbl_client tc_provider ON tbr.provider_id = tc_provider.id
                     JOIN ( SELECT tbl_parameterization.param_key AS document_type,
                            tbl_parameterization.param_value AS homo_document_type
                           FROM schsaf.tbl_parameterization
                          WHERE tbl_parameterization.process::text = 'CLIENT'::text AND tbl_parameterization.sub_process::text = 'HOMOLOGATE_IDENTIFICATION_TYPE_SAF_SVF'::text) hdoc_payer ON tc_payer.document_type::text = hdoc_payer.document_type::text
                     JOIN ( SELECT tbl_parameterization.param_key AS document_type,
                            tbl_parameterization.param_value AS homo_document_type
                           FROM schsaf.tbl_parameterization
                          WHERE tbl_parameterization.process::text = 'CLIENT'::text AND tbl_parameterization.sub_process::text = 'HOMOLOGATE_IDENTIFICATION_TYPE_SAF_SVF'::text) hdoc_provider ON tc_provider.document_type::text = hdoc_provider.document_type::text
                     JOIN ( SELECT tbl_parameterization.param_key AS document_type,
                            tbl_parameterization.param_value AS homo_document_type
                           FROM schsaf.tbl_parameterization
                          WHERE tbl_parameterization.process::text = 'CLIENT'::text AND tbl_parameterization.sub_process::text = 'HOMOLOGATE_IDENTIFICATION_TYPE_SAF_SVF'::text) hdoc_payer_provider_third ON tc_payer_provider_third.document_type::text = hdoc_payer_provider_third.document_type::text
                     JOIN ( SELECT date_part('year'::text, tamd_1.created_at) AS year_accounting,
                            tamd_1.nit,
                            taa_1.number AS account_number,
                            tamd_1.obligation_id,
                            ti_1.number_svf,
                            tam_1.nature AS nature_event,
                            max(tamd_1.created_at)::date AS created_at,
                            count(tamd_1.id) AS count_moment
                           FROM schsaf.tbl_accounting_movement tam_1
                             JOIN schsaf.tbl_accounting_movement_detail tamd_1 ON tam_1.id = tamd_1.movement_id
                             JOIN schsaf.tbl_accounting_account taa_1 ON tam_1.account_id = taa_1.id
                             JOIN schsaf.tbl_obligations to2_1 ON tamd_1.obligation_id = to2_1.id
                             JOIN schsaf.tbl_obligation_invoice toi_1 ON to2_1.id = toi_1.obligation_id
                             JOIN schsaf.tbl_invoice ti_1 ON toi_1.invoice_id = ti_1.id
                          WHERE tam_1.nature::text = 'DEBIT'::text
                          GROUP BY (date_part('year'::text, tamd_1.created_at)), tamd_1.nit, taa_1.number, tamd_1.obligation_id, ti_1.number_svf, tam_1.nature) max_deb ON tamd.nit::text = max_deb.nit::text AND taa.number::text = max_deb.account_number::text AND date_part('year'::text, tamd.created_at) = max_deb.year_accounting AND ti.number_svf::text = max_deb.number_svf::text AND tamd.created_at::date = max_deb.created_at
                  WHERE tam.nature::text = 'DEBIT'::text
                  GROUP BY max_deb.year_accounting, max_deb.nit, max_deb.account_number, max_deb.obligation_id, max_deb.number_svf, max_deb.nature_event, max_deb.created_at, max_deb.count_moment, tc_payer_provider_third.full_name, hdoc_payer_provider_third.homo_document_type, tc_payer.full_name, hdoc_payer.homo_document_type, tc_payer.document_number, tc_provider.full_name, hdoc_provider.homo_document_type, tc_provider.document_number, tp.name, tpm.modality) deb
             FULL JOIN ( SELECT max_cre.year_accounting,
                    max_cre.account_number,
                    max_cre.obligation_id,
                    max_cre.number_svf,
                    max_cre.nature_event,
                    max_cre.created_at,
                    max_cre.count_moment,
                    tc_payer_provider_third.full_name AS name_payer_provider_third,
                    hdoc_payer_provider_third.homo_document_type AS document_type_payer_provider_third,
                    max_cre.nit AS document_number_payer_provider_third,
                    tc_payer.full_name AS name_payer,
                    hdoc_payer.homo_document_type AS document_type_payer,
                    tc_payer.document_number AS document_number_payer,
                    tc_provider.full_name AS name_provider,
                    hdoc_provider.homo_document_type AS document_type_provider,
                    tc_provider.document_number AS document_number_provider,
                    tp.name AS products,
                    tpm.modality,
                    sum(tamd.value) AS credit_movement
                   FROM schsaf.tbl_accounting_movement tam
                     JOIN schsaf.tbl_accounting_movement_detail tamd ON tam.id = tamd.movement_id
                     JOIN schsaf.tbl_accounting_account taa ON tam.account_id = taa.id
                     JOIN schsaf.tbl_obligations to2 ON tamd.obligation_id = to2.id
                     JOIN schsaf.tbl_obligation_invoice toi ON to2.id = toi.obligation_id
                     JOIN schsaf.tbl_invoice ti ON toi.invoice_id = ti.id
                     JOIN schsaf.tbl_business_relationships tbr ON to2.business_relationship_id = tbr.id
                     JOIN schsaf.tbl_products_modalities tpm ON tbr.productmodality_id = tpm.id
                     JOIN schsaf.tbl_products tp ON tpm.product_id = tp.id
                     JOIN schsaf.tbl_invoice_header tih ON ti.invoice_header_id = tih.id
                     JOIN schsaf.tbl_client tc_payer_provider_third ON tamd.nit::text = tc_payer_provider_third.document_number::text
                     JOIN schsaf.tbl_client tc_payer ON tbr.payer_id = tc_payer.id
                     JOIN schsaf.tbl_client tc_provider ON tbr.provider_id = tc_provider.id
                     JOIN ( SELECT tbl_parameterization.param_key AS document_type,
                            tbl_parameterization.param_value AS homo_document_type
                           FROM schsaf.tbl_parameterization
                          WHERE tbl_parameterization.process::text = 'CLIENT'::text AND tbl_parameterization.sub_process::text = 'HOMOLOGATE_IDENTIFICATION_TYPE_SAF_SVF'::text) hdoc_payer ON tc_payer.document_type::text = hdoc_payer.document_type::text
                     JOIN ( SELECT tbl_parameterization.param_key AS document_type,
                            tbl_parameterization.param_value AS homo_document_type
                           FROM schsaf.tbl_parameterization
                          WHERE tbl_parameterization.process::text = 'CLIENT'::text AND tbl_parameterization.sub_process::text = 'HOMOLOGATE_IDENTIFICATION_TYPE_SAF_SVF'::text) hdoc_provider ON tc_provider.document_type::text = hdoc_provider.document_type::text
                     JOIN ( SELECT tbl_parameterization.param_key AS document_type,
                            tbl_parameterization.param_value AS homo_document_type
                           FROM schsaf.tbl_parameterization
                          WHERE tbl_parameterization.process::text = 'CLIENT'::text AND tbl_parameterization.sub_process::text = 'HOMOLOGATE_IDENTIFICATION_TYPE_SAF_SVF'::text) hdoc_payer_provider_third ON tc_payer_provider_third.document_type::text = hdoc_payer_provider_third.document_type::text
                     JOIN ( SELECT date_part('year'::text, tamd_1.created_at) AS year_accounting,
                            tamd_1.nit,
                            taa_1.number AS account_number,
                            tamd_1.obligation_id,
                            ti_1.number_svf,
                            tam_1.nature AS nature_event,
                            max(tamd_1.created_at)::date AS created_at,
                            count(tamd_1.id) AS count_moment
                           FROM schsaf.tbl_accounting_movement tam_1
                             JOIN schsaf.tbl_accounting_movement_detail tamd_1 ON tam_1.id = tamd_1.movement_id
                             JOIN schsaf.tbl_accounting_account taa_1 ON tam_1.account_id = taa_1.id
                             JOIN schsaf.tbl_obligations to2_1 ON tamd_1.obligation_id = to2_1.id
                             JOIN schsaf.tbl_obligation_invoice toi_1 ON to2_1.id = toi_1.obligation_id
                             JOIN schsaf.tbl_invoice ti_1 ON toi_1.invoice_id = ti_1.id
                          WHERE tam_1.nature::text = 'CREDIT'::text
                          GROUP BY (date_part('year'::text, tamd_1.created_at)), tamd_1.nit, taa_1.number, tamd_1.obligation_id, ti_1.number_svf, tam_1.nature) max_cre ON tamd.nit::text = max_cre.nit::text AND taa.number::text = max_cre.account_number::text AND date_part('year'::text, tamd.created_at) = max_cre.year_accounting AND ti.number_svf::text = max_cre.number_svf::text AND tamd.created_at::date = max_cre.created_at
                  WHERE tam.nature::text = 'CREDIT'::text
                  GROUP BY max_cre.year_accounting, max_cre.nit, max_cre.account_number, max_cre.obligation_id, max_cre.number_svf, max_cre.nature_event, max_cre.created_at, max_cre.count_moment, tc_payer_provider_third.full_name, hdoc_payer_provider_third.homo_document_type, tc_payer.full_name, hdoc_payer.homo_document_type, tc_payer.document_number, tc_provider.full_name, hdoc_provider.homo_document_type, tc_provider.document_number, tp.name, tpm.modality) cre ON deb.document_number_payer_provider_third::text = cre.document_number_payer_provider_third::text AND deb.account_number::text = cre.account_number::text AND deb.number_svf::text = cre.number_svf::text AND cre.year_accounting = deb.year_accounting
        ), with_accounting AS (
         SELECT
                CASE
                    WHEN cre.year_accounting IS NOT NULL THEN cre.year_accounting
                    ELSE deb.year_accounting
                END AS year_accounting,
                CASE
                    WHEN cre.nit IS NOT NULL THEN cre.nit
                    ELSE deb.nit
                END AS nit,
                CASE
                    WHEN cre.account_number IS NOT NULL THEN cre.account_number
                    ELSE deb.account_number
                END AS account_number,
            (COALESCE(deb.value, 0::double precision) - COALESCE(cre.value, 0::double precision))::numeric(15,2) AS current_balance
           FROM ( SELECT date_part('year'::text, tamd.created_at) AS year_accounting,
                    tamd.nit,
                    taa.number AS account_number,
                    tam.nature AS nature_event,
                    count(tamd.id) AS count_moment,
                    sum(tamd.value) AS value
                   FROM schsaf.tbl_accounting_movement tam
                     JOIN schsaf.tbl_accounting_movement_detail tamd ON tam.id = tamd.movement_id
                     JOIN schsaf.tbl_accounting_account taa ON tam.account_id = taa.id
                  WHERE tam.nature::text = 'CREDIT'::text AND tamd.obligation_id IS NULL
                  GROUP BY (date_part('year'::text, tamd.created_at)), tamd.nit, taa.number, tam.nature) cre
             FULL JOIN ( SELECT date_part('year'::text, tamd.created_at) AS year_accounting,
                    tamd.nit,
                    taa.number AS account_number,
                    tam.nature AS nature_event,
                    count(tamd.id) AS count_moment,
                    sum(tamd.value) AS value
                   FROM schsaf.tbl_accounting_movement tam
                     JOIN schsaf.tbl_accounting_movement_detail tamd ON tam.id = tamd.movement_id
                     JOIN schsaf.tbl_accounting_account taa ON tam.account_id = taa.id
                  WHERE tam.nature::text = 'DEBIT'::text AND tamd.obligation_id IS NULL
                  GROUP BY (date_part('year'::text, tamd.created_at)), tamd.nit, taa.number, tam.nature) deb ON deb.nit::text = cre.nit::text AND deb.account_number::text = cre.account_number::text AND cre.year_accounting = deb.year_accounting
        ), with_accounting_day_moment AS (
         SELECT
                CASE
                    WHEN cre.year_accounting IS NOT NULL THEN cre.year_accounting
                    ELSE deb.year_accounting
                END AS year_accounting,
                CASE
                    WHEN cre.created_at > COALESCE(deb.created_at, '1990-01-01'::date) THEN cre.created_at
                    ELSE deb.created_at
                END AS created_at,
                CASE
                    WHEN cre.name_payer_provider_third IS NOT NULL THEN cre.name_payer_provider_third
                    ELSE deb.name_payer_provider_third
                END AS name_payer_provider_third,
                CASE
                    WHEN cre.document_type_payer_provider_third IS NOT NULL THEN cre.document_type_payer_provider_third
                    ELSE deb.document_type_payer_provider_third
                END AS document_type_payer_provider_third,
                CASE
                    WHEN cre.document_number_payer_provider_third IS NOT NULL THEN cre.document_number_payer_provider_third
                    ELSE deb.document_number_payer_provider_third
                END AS document_number_payer_provider_third,
            ''::text AS name_payer,
            ''::text AS document_type_payer,
            ''::text AS document_number_payer,
            ''::text AS name_provider,
            ''::text AS document_type_provider,
            ''::text AS document_number_provider,
                CASE
                    WHEN cre.account_number IS NOT NULL THEN cre.account_number
                    ELSE deb.account_number
                END AS account_number,
                CASE
                    WHEN cre.created_at = COALESCE(deb.created_at, '1990-01-01'::date) THEN COALESCE(deb.debit_movement, 0::double precision)
                    WHEN cre.created_at > COALESCE(deb.created_at, '1990-01-01'::date) THEN 0::double precision
                    ELSE COALESCE(deb.debit_movement, 0::double precision)
                END AS debit_movement,
                CASE
                    WHEN cre.created_at = COALESCE(deb.created_at, '1990-01-01'::date) THEN COALESCE(cre.credit_movement, 0::double precision)
                    WHEN cre.created_at > COALESCE(deb.created_at, '1990-01-01'::date) THEN COALESCE(cre.credit_movement, 0::double precision)
                    ELSE 0::double precision
                END AS credit_movement,
                CASE
                    WHEN deb.count_moment = 1 AND cre.count_moment = 1 AND cre.created_at = deb.created_at THEN 1::bigint
                    ELSE COALESCE(deb.count_moment, 0::bigint) + COALESCE(cre.count_moment, 0::bigint)
                END AS count_moment
           FROM ( SELECT max_deb.year_accounting,
                    tc.full_name AS name_payer_provider_third,
                    hdoc.homo_document_type AS document_type_payer_provider_third,
                    max_deb.nit AS document_number_payer_provider_third,
                    max_deb.account_number,
                    max_deb.nature_event,
                    max_deb.created_at,
                    max_deb.count_moment,
                    sum(tamd.value) AS debit_movement
                   FROM schsaf.tbl_accounting_movement tam
                     JOIN schsaf.tbl_accounting_movement_detail tamd ON tam.id = tamd.movement_id
                     JOIN schsaf.tbl_accounting_account taa ON tam.account_id = taa.id
                     JOIN schsaf.tbl_client tc ON tamd.nit::text = tc.document_number::text
                     JOIN ( SELECT tbl_parameterization.param_key AS document_type,
                            tbl_parameterization.param_value AS homo_document_type
                           FROM schsaf.tbl_parameterization
                          WHERE tbl_parameterization.process::text = 'CLIENT'::text AND tbl_parameterization.sub_process::text = 'HOMOLOGATE_IDENTIFICATION_TYPE_SAF_SVF'::text) hdoc ON tc.document_type::text = hdoc.document_type::text
                     JOIN ( SELECT date_part('year'::text, tamd_1.created_at) AS year_accounting,
                            tamd_1.nit,
                            taa_1.number AS account_number,
                            tam_1.nature AS nature_event,
                            max(tamd_1.created_at)::date AS created_at,
                            count(tamd_1.id) AS count_moment
                           FROM schsaf.tbl_accounting_movement tam_1
                             JOIN schsaf.tbl_accounting_movement_detail tamd_1 ON tam_1.id = tamd_1.movement_id
                             JOIN schsaf.tbl_accounting_account taa_1 ON tam_1.account_id = taa_1.id
                          WHERE tam_1.nature::text = 'DEBIT'::text AND tamd_1.obligation_id IS NULL
                          GROUP BY (date_part('year'::text, tamd_1.created_at)), tamd_1.nit, taa_1.number, tam_1.nature) max_deb ON tamd.nit::text = max_deb.nit::text AND taa.number::text = max_deb.account_number::text AND date_part('year'::text, tamd.created_at) = max_deb.year_accounting AND tamd.created_at::date = max_deb.created_at
                  WHERE tam.nature::text = 'DEBIT'::text
                  GROUP BY max_deb.year_accounting, tc.full_name, hdoc.homo_document_type, max_deb.nit, max_deb.account_number, max_deb.nature_event, max_deb.created_at, max_deb.count_moment) deb
             FULL JOIN ( SELECT max_cre.year_accounting,
                    tc.full_name AS name_payer_provider_third,
                    hdoc.homo_document_type AS document_type_payer_provider_third,
                    max_cre.nit AS document_number_payer_provider_third,
                    max_cre.account_number,
                    max_cre.nature_event,
                    max_cre.created_at,
                    max_cre.count_moment,
                    sum(tamd.value) AS credit_movement
                   FROM schsaf.tbl_accounting_movement tam
                     JOIN schsaf.tbl_accounting_movement_detail tamd ON tam.id = tamd.movement_id
                     JOIN schsaf.tbl_accounting_account taa ON tam.account_id = taa.id
                     JOIN schsaf.tbl_client tc ON tamd.nit::text = tc.document_number::text
                     JOIN ( SELECT tbl_parameterization.param_key AS document_type,
                            tbl_parameterization.param_value AS homo_document_type
                           FROM schsaf.tbl_parameterization
                          WHERE tbl_parameterization.process::text = 'CLIENT'::text AND tbl_parameterization.sub_process::text = 'HOMOLOGATE_IDENTIFICATION_TYPE_SAF_SVF'::text) hdoc ON tc.document_type::text = hdoc.document_type::text
                     JOIN ( SELECT date_part('year'::text, tamd_1.created_at) AS year_accounting,
                            tamd_1.nit,
                            taa_1.number AS account_number,
                            tam_1.nature AS nature_event,
                            max(tamd_1.created_at)::date AS created_at,
                            count(tamd_1.id) AS count_moment
                           FROM schsaf.tbl_accounting_movement tam_1
                             JOIN schsaf.tbl_accounting_movement_detail tamd_1 ON tam_1.id = tamd_1.movement_id
                             JOIN schsaf.tbl_accounting_account taa_1 ON tam_1.account_id = taa_1.id
                          WHERE tam_1.nature::text = 'CREDIT'::text AND tamd_1.obligation_id IS NULL
                          GROUP BY (date_part('year'::text, tamd_1.created_at)), tamd_1.nit, taa_1.number, tam_1.nature) max_cre ON tamd.nit::text = max_cre.nit::text AND taa.number::text = max_cre.account_number::text AND date_part('year'::text, tamd.created_at) = max_cre.year_accounting AND tamd.created_at::date = max_cre.created_at
                  WHERE tam.nature::text = 'CREDIT'::text
                  GROUP BY max_cre.year_accounting, tc.full_name, hdoc.homo_document_type, max_cre.nit, max_cre.account_number, max_cre.nature_event, max_cre.created_at, max_cre.count_moment) cre ON deb.document_number_payer_provider_third::text = cre.document_number_payer_provider_third::text AND deb.account_number::text = cre.account_number::text AND cre.year_accounting = deb.year_accounting
        )
 SELECT wabo.year_accounting,
    wabo.account_number,
    wabo.product_name,
    wabo.modality_name,
    wabo.name_payer_provider_third,
    wabo.document_type_payer_provider_third,
    wabo.document_number_payer_provider_third,
    wabo.name_payer,
    wabo.document_type_payer,
    wabo.document_number_payer,
    wabo.name_provider,
    wabo.document_type_provider,
    wabo.document_number_provider,
    wabo.obligation_number,
    wabo.previous_balance,
    wabo.debit_movement,
    wabo.credit_movement,
    wabo.current_balance,
    wabo.consultation_date,
    wabo.balance_date
   FROM ( SELECT obac_day.year_accounting::character varying AS year_accounting,
            now()::date AS consultation_date,
            obac_day.created_at AS balance_date,
            obac_day.name_payer_provider_third,
            obac_day.document_type_payer_provider_third,
            obac_day.document_number_payer_provider_third,
            obac_day.name_payer,
            obac_day.document_type_payer,
            obac_day.document_number_payer,
            obac_day.name_provider,
            obac_day.document_type_provider,
            obac_day.document_number_provider,
            obac_day.number_svf AS obligation_number,
            obac_day.account_number::character varying AS account_number,
                CASE
                    WHEN obac_day.count_moment > 1 THEN COALESCE(obac.current_balance, 0::numeric)::double precision + COALESCE(obac_day.credit_movement, 0::double precision) - COALESCE(obac_day.debit_movement, 0::double precision)
                    ELSE 0::double precision
                END::numeric(15,2)::double precision AS previous_balance,
            COALESCE(obac_day.debit_movement, 0::double precision)::numeric(19,2)::double precision AS debit_movement,
            COALESCE(obac_day.credit_movement, 0::double precision)::numeric(19,2)::double precision AS credit_movement,
            COALESCE(obac.current_balance, 0::numeric)::numeric(15,2)::double precision AS current_balance,
            obac_day.products::character varying AS product_name,
            obac_day.modality::character varying AS modality_name
           FROM with_accounting_obligation_day_moment obac_day
             LEFT JOIN with_accounting_obligation obac ON obac_day.document_number_payer_provider_third::text = obac.nit::text AND obac_day.account_number::text = obac.account_number::text AND obac_day.number_svf::text = obac.number_svf::text AND obac_day.year_accounting = obac.year_accounting
        UNION ALL
         SELECT obac_day.year_accounting::character varying AS year_accounting,
            now()::date AS consultation_date,
            obac_day.created_at AS balance_date,
            obac_day.name_payer_provider_third,
            obac_day.document_type_payer_provider_third,
            obac_day.document_number_payer_provider_third,
            obac_day.name_payer,
            obac_day.document_type_payer,
            obac_day.document_number_payer,
            obac_day.name_provider,
            obac_day.document_type_provider,
            obac_day.document_number_provider,
            ''::character varying AS obligation_number,
            obac_day.account_number::character varying AS account_number,
                CASE
                    WHEN obac_day.count_moment > 1 THEN COALESCE(obac.current_balance, 0::numeric)::double precision + COALESCE(obac_day.credit_movement, 0::double precision) - COALESCE(obac_day.debit_movement, 0::double precision)
                    ELSE 0::double precision
                END::numeric(15,2)::double precision AS previous_balance,
            COALESCE(obac_day.debit_movement, 0::double precision)::numeric(19,2)::double precision AS debit_movement,
            COALESCE(obac_day.credit_movement, 0::double precision)::numeric(19,2)::double precision AS credit_movement,
            COALESCE(obac.current_balance, 0::numeric)::numeric(15,2)::double precision AS current_balance,
            ''::character varying AS product_name,
            ''::character varying AS modality_name
           FROM with_accounting_day_moment obac_day
             LEFT JOIN with_accounting obac ON obac_day.document_number_payer_provider_third::text = obac.nit::text AND obac_day.account_number::text = obac.account_number::text AND obac_day.year_accounting = obac.year_accounting) wabo
  ORDER BY wabo.year_accounting, wabo.document_number_payer, wabo.account_number;


-- schsaf.view_accounting_movement source

CREATE OR REPLACE VIEW schsaf.view_accounting_movement
AS SELECT tam.id,
    tac.description AS concept_description,
    tac.id AS concept_id,
    tam.nature,
    tae.description AS event_description,
    tae.id AS event_id,
    tas.description AS scenario_description,
    tas.id AS scenario_id,
    tap.description AS process_description,
    tap.id AS process_id,
    tat.product_id
   FROM schsaf.tbl_accounting_transaction tat
     JOIN schsaf.tbl_accounting_process tap ON tat.process_id = tap.id
     JOIN schsaf.tbl_accounting_event tae ON tat.event_id = tae.id
     JOIN schsaf.tbl_accounting_scenario tas ON tat.scenario_id = tas.id
     JOIN schsaf.tbl_accounting_movement tam ON tat.id = tam.transaction_id
     JOIN schsaf.tbl_accounting_concept tac ON tam.concept_id = tac.id
  WHERE upper(tam.state::text) = 'ACTIVE'::text;


-- schsaf.view_accounting_movement_detail_data source

CREATE OR REPLACE VIEW schsaf.view_accounting_movement_detail_data
AS SELECT sum(tbl_mv_dt.value) AS value,
    to_date(tbl_mv_dt.created_at::text, 'YYYY-MM-DD'::text) AS created_at,
    tbl_mv_dt.nit,
    tbl_mv.nature,
    taccount.number AS account_number
   FROM schsaf.tbl_accounting_movement_detail tbl_mv_dt
     JOIN schsaf.tbl_accounting_movement tbl_mv ON tbl_mv.id = tbl_mv_dt.movement_id
     JOIN schsaf.tbl_accounting_account taccount ON taccount.id = tbl_mv.account_id
  GROUP BY tbl_mv_dt.created_at, tbl_mv_dt.nit, tbl_mv.nature, taccount.number;


-- schsaf.view_accounting_movement_detail_info source

CREATE OR REPLACE VIEW schsaf.view_accounting_movement_detail_info
AS SELECT tamd.id,
    tam1.id AS movement_id,
    tam1.product_id,
    tam1.product,
    tam1.process,
    tam1.event,
    tam1.scenery,
    tam1.account_number,
    tam1.account_nature,
    tam1.concept,
    tamd.value,
    tamd.created_at,
    tamd.nit,
    tamd.obligation_id,
    tamd.date_process
   FROM schsaf.tbl_accounting_movement_detail tamd
     JOIN ( SELECT tam.id,
            tat1.product_id,
            tat1.product,
            tat1.process,
            tat1.event,
            tat1.scenery,
            taa.number AS account_number,
            tam.nature AS account_nature,
            tac.description AS concept
           FROM schsaf.tbl_accounting_movement tam
             JOIN schsaf.tbl_accounting_account taa ON tam.account_id = taa.id
             JOIN ( SELECT tat.id,
                    tae.description AS event,
                    tap.description AS process,
                    tas.description AS scenery,
                    tp.id AS product_id,
                    tp.name AS product
                   FROM schsaf.tbl_accounting_transaction tat
                     JOIN schsaf.tbl_accounting_event tae ON tat.event_id = tae.id
                     JOIN schsaf.tbl_accounting_process tap ON tat.process_id = tap.id
                     JOIN schsaf.tbl_products tp ON tat.product_id = tp.id
                     JOIN schsaf.tbl_accounting_scenario tas ON tat.scenario_id = tas.id) tat1 ON tam.transaction_id = tat1.id
             JOIN schsaf.tbl_accounting_concept tac ON tam.concept_id = tac.id) tam1 ON tamd.movement_id = tam1.id
  ORDER BY tamd.id DESC;


-- schsaf.view_accounting_movement_parameter source

CREATE OR REPLACE VIEW schsaf.view_accounting_movement_parameter
AS SELECT t.id AS codtransaccion,
    p.id AS codproducto,
    p.name AS producto,
    r.id AS codproceso,
    r.description AS proceso,
    e.id AS codevento,
    e.description AS evento,
    s.id AS codescenario,
    s.description AS escenario,
    a.number AS movimiento,
    m.nature AS tipomovimiento,
    c.id AS codconcepto,
    c.description AS concepto
   FROM schsaf.tbl_accounting_movement m
     JOIN schsaf.tbl_accounting_account a ON a.id = m.account_id
     JOIN schsaf.tbl_accounting_concept c ON c.id = m.concept_id
     JOIN schsaf.tbl_accounting_transaction t ON t.id = m.transaction_id
     JOIN schsaf.tbl_products p ON p.id = t.product_id
     JOIN schsaf.tbl_accounting_event e ON e.id = t.event_id
     JOIN schsaf.tbl_accounting_process r ON r.id = t.process_id
     JOIN schsaf.tbl_accounting_scenario s ON s.id = t.scenario_id;


-- schsaf.view_accounting_movements_summary source

CREATE OR REPLACE VIEW schsaf.view_accounting_movements_summary
AS SELECT tamd.id,
    tam.id AS movement_id,
    concat(tp.id, '. ', tp.name) AS product,
    concat(tap.id, '. ', tap.description) AS process,
    concat(tae.id, '. ', tae.description) AS event,
    concat(tas.id, '. ', tas.description) AS scenery,
    taa.number AS account,
    tam.nature AS type,
    concat(tac.id, '. ', tac.description) AS concept,
    tamd.value,
    tamd.created_at,
    tamd.obligation_id,
    to2.invoice_number,
    tamd.nit,
    tamd.process_transactional_id,
    tr.code_table AS functional_process
   FROM schsaf.tbl_accounting_movement_detail tamd
     LEFT JOIN schsaf.tbl_obligations to2 ON tamd.obligation_id = to2.id
     LEFT JOIN schsaf.tbl_reference tr ON tamd.id_reference = tr.id
     JOIN schsaf.tbl_accounting_movement tam ON tamd.movement_id = tam.id
     JOIN schsaf.tbl_accounting_account taa ON tam.account_id = taa.id
     JOIN schsaf.tbl_accounting_transaction tat ON tam.transaction_id = tat.id
     JOIN schsaf.tbl_accounting_event tae ON tat.event_id = tae.id
     JOIN schsaf.tbl_accounting_process tap ON tat.process_id = tap.id
     JOIN schsaf.tbl_products tp ON tat.product_id = tp.id
     JOIN schsaf.tbl_accounting_scenario tas ON tat.scenario_id = tas.id
     JOIN schsaf.tbl_accounting_concept tac ON tam.concept_id = tac.id;


-- schsaf.view_amortization_plus_with_resource_value source

CREATE OR REPLACE VIEW schsaf.view_amortization_plus_with_resource_value
AS SELECT tamd.obligation_id,
    date_trunc('month'::text, tamd.created_at) AS month,
    (sum(
        CASE
            WHEN tam.nature::text = 'DEBIT'::text THEN tamd.value
            ELSE 0::double precision
        END) - sum(
        CASE
            WHEN tam.nature::text = 'CREDIT'::text THEN tamd.value
            ELSE 0::double precision
        END))::numeric AS monthly_value
   FROM schsaf.tbl_accounting_movement_detail tamd
     JOIN schsaf.tbl_accounting_movement tam ON tamd.movement_id = tam.id
     JOIN schsaf.tbl_accounting_account taa ON tam.account_id = taa.id
  WHERE taa.number::text = '4102224481'::text
  GROUP BY tamd.obligation_id, (date_trunc('month'::text, tamd.created_at));


-- schsaf.view_amortization_plus_without_resource_value source

CREATE OR REPLACE VIEW schsaf.view_amortization_plus_without_resource_value
AS SELECT tamd.obligation_id,
    date_trunc('month'::text, tamd.created_at) AS month,
    (sum(
        CASE
            WHEN tam.nature::text = 'DEBIT'::text THEN tamd.value
            ELSE 0::double precision
        END) - sum(
        CASE
            WHEN tam.nature::text = 'CREDIT'::text THEN tamd.value
            ELSE 0::double precision
        END))::numeric AS monthly_value
   FROM schsaf.tbl_accounting_movement_detail tamd
     JOIN schsaf.tbl_accounting_movement tam ON tamd.movement_id = tam.id
     JOIN schsaf.tbl_accounting_account taa ON tam.account_id = taa.id
  WHERE taa.number::text = '4102184481'::text
  GROUP BY tamd.obligation_id, (date_trunc('month'::text, tamd.created_at));


-- schsaf.view_amortization_with_resource_value source

CREATE OR REPLACE VIEW schsaf.view_amortization_with_resource_value
AS SELECT tamd.obligation_id,
    date_trunc('month'::text, tamd.created_at) AS month,
    (sum(
        CASE
            WHEN tam.nature::text = 'DEBIT'::text THEN tamd.value
            ELSE 0::double precision
        END) - sum(
        CASE
            WHEN tam.nature::text = 'CREDIT'::text THEN tamd.value
            ELSE 0::double precision
        END))::numeric AS monthly_value
   FROM schsaf.tbl_accounting_movement_detail tamd
     JOIN schsaf.tbl_accounting_movement tam ON tamd.movement_id = tam.id
     JOIN schsaf.tbl_accounting_account taa ON tam.account_id = taa.id
  WHERE taa.number::text = '4102224480'::text
  GROUP BY tamd.obligation_id, (date_trunc('month'::text, tamd.created_at));


-- schsaf.view_amortization_without_resource_value source

CREATE OR REPLACE VIEW schsaf.view_amortization_without_resource_value
AS SELECT tamd.obligation_id,
    date_trunc('month'::text, tamd.created_at) AS month,
    (sum(
        CASE
            WHEN tam.nature::text = 'DEBIT'::text THEN tamd.value
            ELSE 0::double precision
        END) - sum(
        CASE
            WHEN tam.nature::text = 'CREDIT'::text THEN tamd.value
            ELSE 0::double precision
        END))::numeric AS monthly_value
   FROM schsaf.tbl_accounting_movement_detail tamd
     JOIN schsaf.tbl_accounting_movement tam ON tamd.movement_id = tam.id
     JOIN schsaf.tbl_accounting_account taa ON tam.account_id = taa.id
  WHERE taa.number::text = '4102184480'::text
  GROUP BY tamd.obligation_id, (date_trunc('month'::text, tamd.created_at));


-- schsaf.view_assessment source

CREATE OR REPLACE VIEW schsaf.view_assessment
AS SELECT c.id AS assessment_id,
    c.description,
    c.is_percentage,
    c.assessment_value,
    c.start_date_validity,
    c.end_date_validity,
    c.assessment_type_id,
    ct.description AS type_assessment_description,
    c.created_at AS created_date,
    c.updated_at AS update_date,
    c.status,
    date_part('year'::text, c.start_date_validity) AS year,
    c.value_uvt,
    c.points_uvt,
        CASE c.assessment_type_id
            WHEN 1 THEN c.value_uvt * c.points_uvt::numeric
            ELSE NULL::numeric
        END AS tax_cap
   FROM schsaf.tbl_assessment c
     JOIN schsaf.tbl_assessment_type ct ON ct.id = c.assessment_type_id;


-- schsaf.view_assumed_expenses_value source

CREATE OR REPLACE VIEW schsaf.view_assumed_expenses_value
AS SELECT tamd.obligation_id,
    date_trunc('month'::text, tamd.created_at) AS month,
    (sum(
        CASE
            WHEN tam.nature::text = 'DEBIT'::text THEN tamd.value
            ELSE 0::double precision
        END) - sum(
        CASE
            WHEN tam.nature::text = 'CREDIT'::text THEN tamd.value
            ELSE 0::double precision
        END))::numeric AS monthly_value
   FROM schsaf.tbl_accounting_movement_detail tamd
     JOIN schsaf.tbl_accounting_movement tam ON tamd.movement_id = tam.id
     JOIN schsaf.tbl_accounting_account taa ON tam.account_id = taa.id
  WHERE taa.number::text = '5190954482'::text
  GROUP BY tamd.obligation_id, (date_trunc('month'::text, tamd.created_at));


-- schsaf.view_automatic_debit_controls_report source

CREATE OR REPLACE VIEW schsaf.view_automatic_debit_controls_report
AS SELECT row_number() OVER () AS id,
    to_date(tadh.application_date::text, 'YYYYMMDD'::text) AS application_date,
    regexp_replace(tadd.document_number_payer::text, '^0+'::text, ''::text)::character varying(13) AS document_number_payer,
    tc.short_name AS name_payer,
    ti.number_svf AS obligation_number,
    tpr.name AS product_name,
    tpm.modality,
    to2.net_due_date,
    to2.total_due_date,
    to2.principal_balance,
    to2.remunerative_balance,
    to2.moratorium_balance,
    tadd.value_transaction,
    tadd.response_date,
    tadd.transaction_type,
    tadd.payment_value,
        CASE
            WHEN tp.payment_date IS NOT NULL AND tp.payment_time IS NOT NULL THEN concat(tp.payment_date, ' ', tp.payment_time)::timestamp without time zone
            ELSE NULL::timestamp without time zone
        END AS payment_datetime,
    tp.consecutive_payment AS payment_number,
    tp.value AS collection_value,
        CASE
            WHEN tp.status::text = 'APLICACION_PAGO'::text THEN 'APLICADO'::character varying
            WHEN tp.status::text = 'APLICACION_PAGO_PARCIAL'::text THEN 'APLICADO PARCIAL'::character varying
            WHEN tp.status::text = 'ANULACION_INGRESO'::text THEN 'ANULADO'::character varying
            ELSE tp.status
        END AS collection_state,
    tpa.created_at AS date_payment_application,
    tpa.consecutive AS application_number,
    tpi.principal_value,
    tpi.remunerative_value,
    tpi.moratorium_value,
    tpi.total_value::numeric AS total_value,
        CASE
            WHEN tadd.payment_value = 0::numeric THEN 'Débito no exitoso'::text
            WHEN tadd.value_transaction = tadd.payment_value THEN 'Recibido total'::text
            WHEN tadd.value_transaction > tadd.payment_value THEN 'Recibido parcial'::text
            WHEN tadd.value_transaction IS NULL OR tadd.payment_value IS NULL OR tadd.payment_value = 0::numeric THEN 'No hay respuesta banco'::text
            ELSE NULL::text
        END AS monitoring_sent_received,
        CASE
            WHEN tadd.payment_value = tpi.total_value THEN 'Aplicado total'::text
            WHEN tadd.payment_value < tpi.total_value THEN 'Aplicado parcial'::text
            WHEN tadd.payment_value IS NULL OR tpi.total_value IS NULL THEN 'No hay respuesta banco'::text
            ELSE NULL::text
        END AS monitoring_receipt_applied,
    tadd.bank_response,
    ( SELECT
                CASE
                    WHEN tadh_1.bank_account_type::text = '7'::text THEN 'CUENTA AHORRO'::character varying(255)
                    WHEN tadh_1.bank_account_type::text = '1'::text THEN 'CUENTA CORRIENTE'::character varying(255)
                    ELSE tadh_1.bank_account_type::character varying(255)
                END AS account_type
           FROM schsaf.tbl_automatic_debit_historical tadh_1
          WHERE tadh_1.document_client::text = regexp_replace(tadd.document_number_payer::text, '^0+'::text, ''::text) AND tadh_1.type_change::text = 'ING'::text
          ORDER BY tadh_1.created DESC
         LIMIT 1) AS account_type,
    tpr.id AS id_product,
        CASE
            WHEN tadd.bank_response::text = ANY (ARRAY['OK0'::character varying::text, 'OK1'::character varying::text, 'OK2'::character varying::text, 'OK3'::character varying::text, 'OK4'::character varying::text, 'OK5'::character varying::text, 'R00'::character varying::text]) THEN NULL::text::character varying
            ELSE tadcr.description
        END AS bank_response_description,
    tadd.id AS id_automatic_details
   FROM schsaf.tbl_automatic_debit_detail tadd
     LEFT JOIN schsaf.tbl_automatic_debit_header tadh ON tadd.id_automatic_debit_header = tadh.id
     LEFT JOIN schsaf.tbl_invoice ti ON ti.number_svf::text = btrim(split_part(tadd.reference2::text, '|'::text, 2))
     LEFT JOIN schsaf.tbl_invoice_header tih ON ti.invoice_header_id = tih.id
     LEFT JOIN ( SELECT toi_1.obligation_id,
            toi_1.invoice_id
           FROM schsaf.tbl_payment tp_1
             JOIN schsaf.tbl_payment_application tpa_1 ON tpa_1.payment_id = tp_1.id
             JOIN schsaf.tbl_payment_instruction tpi_1 ON tpi_1.payment_application_id = tpa_1.id
             JOIN schsaf.tbl_obligations tob ON tpi_1.obligation_id = tob.id
             JOIN schsaf.tbl_obligation_invoice toi_1 ON tob.id = toi_1.obligation_id
          WHERE tp_1.type_payment::text = 'DBA'::text) toi ON ti.id = toi.invoice_id
     LEFT JOIN ( SELECT tob.id,
            tob.net_due_date,
            tob.total_due_date,
            tob.principal_balance,
            tob.remunerative_balance,
            tob.moratorium_balance
           FROM schsaf.tbl_payment tp_1
             JOIN schsaf.tbl_payment_application tpa_1 ON tpa_1.payment_id = tp_1.id
             JOIN schsaf.tbl_payment_instruction tpi_1 ON tpi_1.payment_application_id = tpa_1.id
             JOIN schsaf.tbl_obligations tob ON tpi_1.obligation_id = tob.id
          WHERE tp_1.type_payment::text = 'DBA'::text
          GROUP BY tob.id, tob.net_due_date, tob.total_due_date) to2 ON toi.obligation_id = to2.id
     LEFT JOIN ( SELECT tpi_1.id,
            tpi_1.obligation_id,
            tpi_1.principal_value,
            tpi_1.remunerative_value,
            tpi_1.moratorium_value,
            tpi_1.receivables_value,
            tpi_1.state,
            tpi_1.payment_id,
            tpi_1.payment_distribution_id,
            tpi_1.created_at,
            tpi_1.updated_at,
            tpi_1.payment_application_id,
            tpi_1.updated_at,
            tpi_1.tolerance_value,
            tpi_1.product_modality_sequence,
            tpi_1.discount_for_amortize,
            tpi_1.order_number,
            tpi_1.total_value,
            tpi_1.portfolio_tolerance_value
           FROM schsaf.tbl_payment tp_1
             JOIN schsaf.tbl_payment_application tpa_1 ON tpa_1.payment_id = tp_1.id
             JOIN schsaf.tbl_payment_instruction tpi_1 ON tpi_1.payment_application_id = tpa_1.id
             JOIN schsaf.tbl_obligations tob ON tpi_1.obligation_id = tob.id
          WHERE tp_1.type_payment::text = 'DBA'::text) tpi(id, obligation_id, principal_value, remunerative_value, moratorium_value, receivables_value, state, payment_id, payment_distribution_id, created_at, updated_at, payment_application_id, updated_at_1, tolerance_value, product_modality_sequence, discount_for_amortize, order_number, total_value, portfolio_tolerance_value) ON to2.id = tpi.obligation_id AND to_char(tpi.created_at, 'DD-MM-YYYY'::text) = to_char(tadd.response_date::timestamp with time zone, 'DD-MM-YYYY'::text)
     LEFT JOIN ( SELECT DISTINCT tpa_1.id,
            tpa_1.application_type,
            tpa_1.state,
            tpa_1.applied_value,
            tpa_1.remaining_value,
            tpa_1.user_applied,
            tpa_1.created_at,
            tpa_1.payment_id,
            tpa_1.surplus_value,
            tpa_1.payment_income_distributed,
            tpa_1.distribution_consecutive,
            tpa_1.payment_value,
            tpa_1.client_document,
            tpa_1.payment_date,
            tpa_1.consecutive,
            tpa_1.missing_value,
            tpa_1.fault_description,
            tpa_1.external_reference,
            tpa_1.payment_status
           FROM schsaf.tbl_payment tp_1
             JOIN schsaf.tbl_payment_application tpa_1 ON tpa_1.payment_id = tp_1.id
             JOIN schsaf.tbl_payment_instruction tpi_1 ON tpi_1.payment_application_id = tpa_1.id
             JOIN schsaf.tbl_obligations tob ON tpi_1.obligation_id = tob.id
          WHERE tp_1.type_payment::text = 'DBA'::text) tpa ON tpi.payment_application_id = tpa.id
     LEFT JOIN schsaf.tbl_payment tp ON tpa.payment_id = tp.id
     LEFT JOIN schsaf.tbl_products_modalities tpm ON tih.sequence = tpm.sequence
     LEFT JOIN schsaf.tbl_products tpr ON tpm.product_id = tpr.id
     LEFT JOIN schsaf.tbl_client tc ON regexp_replace(tadd.document_number_payer::text, '^0+'::text, ''::text) = tc.document_number::text
     LEFT JOIN schsaf.tbl_bank_account_subscribe tbas ON tc.id = tbas.client_id AND tbas.is_principal
     LEFT JOIN schsaf.tbl_bank_account tba ON tbas.bank_account_id = tba.id
     LEFT JOIN schsaf.tbl_automatic_debit_code_response tadcr ON tadd.bank_response::text = tadcr.code::text
  GROUP BY tadd.id, (to_date(tadh.application_date::text, 'YYYYMMDD'::text)), tadd.name_payer, ti.number_svf, tadd.value_transaction, tadd.response_date, tadd.transaction_type, tadd.payment_value, toi.obligation_id, toi.invoice_id, to2.id, tpa.created_at, tpa.consecutive, tpi.payment_application_id, tpr.name, tpm.modality, tp.payment_date, tp.payment_time, tp.consecutive_payment, tp.value, tp.status, tpr.id, tp.type_payment, tp.id, (to_char(tpi.created_at, 'DD-MM-YYYY'::text)), tpi.obligation_id, tc.short_name, to2.net_due_date, to2.total_due_date, to2.principal_balance, to2.remunerative_balance, to2.moratorium_balance, tpi.principal_value, tpi.remunerative_value, tpi.moratorium_value, tba.account_type, tadcr.description, tpi.total_value;


-- schsaf.view_available_consumed_limit_report source

CREATE OR REPLACE VIEW schsaf.view_available_consumed_limit_report
AS WITH latest_audit_log AS (
         SELECT (au_1.final_object::json ->> 'id'::text)::bigint AS global_id,
            (au_1.final_object::json ->> 'startDate'::text)::date AS start_date,
            (au_1.final_object::json ->> 'endDate'::text)::date AS end_date,
            (au_1.final_object::json ->> 'value'::text)::numeric AS value,
            row_number() OVER (PARTITION BY ((au_1.final_object::json ->> 'id'::text)::bigint) ORDER BY au_1.action_date DESC) AS rn
           FROM schsafaudit.tbl_audit_log au_1
          WHERE au_1.target_process::text = 'QUOTA'::text AND au_1.process_type::text = 'QUOTA_GLOBAL'::text AND au_1.log_type::text = 'FUNCTIONAL'::text
        )
 SELECT row_number() OVER () AS id,
    (a.final_object::json ->> 'id'::text)::bigint AS quota_product_id,
    (((a.final_object::json ->> 'quotaGlobal'::text)::json) ->> 'id'::text)::bigint AS quota_global_id,
    tc.document_number AS client_document_number,
    tc.full_name AS client_full_name,
    tp.id AS product_id,
    tp.name AS product_name,
    tpm.id AS modality_id,
    tpm.modality AS modality_name,
        CASE
            WHEN CURRENT_DATE >= au.start_date AND CURRENT_DATE <= au.end_date THEN 'VIGENTE'::character varying
            ELSE 'VENCIDO'::character varying
        END AS global_status,
    au.value AS quota_global_value,
    (a.final_object::json ->> 'value'::text)::numeric AS quota_product_value,
    (a.final_object::json ->> 'consumedValue'::text)::numeric AS consumed_value,
    (a.final_object::json ->> 'availableValue'::text)::numeric AS available_value,
        CASE
            WHEN a.origin_process::text = 'DISBURSEMENT'::character varying::text THEN 'DESEMBOLSO'::character varying
            WHEN a.origin_process::text = 'PAYMENT_APPLICATION'::character varying::text THEN 'APLICACIÓN DE PAGO'::character varying
            ELSE a.origin_process
        END AS origin_process,
        CASE
            WHEN a.origin_process::text = 'DISBURSEMENT'::text THEN (a.init_object::json ->> 'value'::text)::numeric
            WHEN a.origin_process::text = 'PAYMENT_APPLICATION'::text THEN (a.init_object::json ->> 'balance'::text)::numeric
            ELSE NULL::numeric
        END AS moved_value,
        CASE
            WHEN a.origin_process::text = 'DISBURSEMENT'::text AND ((a.init_object::json ->> 'consumeQuota'::text)::boolean) = false THEN 'DISMINUYE'::character varying
            WHEN a.origin_process::text = 'DISBURSEMENT'::text AND ((a.init_object::json ->> 'consumeQuota'::text)::boolean) = true THEN 'AUMENTA'::character varying
            WHEN a.origin_process::text = 'PAYMENT_APPLICATION'::text AND (((a.init_object::json ->> 'movementType'::text)::character varying)::text) = 'APPLIED'::text THEN 'AUMENTA'::character varying
            WHEN a.origin_process::text = 'PAYMENT_APPLICATION'::text AND (((a.init_object::json ->> 'movementType'::text)::character varying)::text) = 'ANNULLED'::text THEN 'DISMINUYE'::character varying
            ELSE NULL::character varying
        END AS movement_type,
    a.action_date AS affected_date
   FROM schsafaudit.tbl_audit_log a
     JOIN schsaf.tbl_quota_global tqg ON tqg.id = ((((a.final_object::json ->> 'quotaGlobal'::text)::json) ->> 'id'::text)::bigint)
     JOIN schsaf.tbl_client tc ON tc.id = tqg.client_id
     JOIN schsaf.tbl_products_modalities tpm ON ((((a.final_object::json ->> 'modality'::text)::json) ->> 'id'::text)::bigint) = tpm.id
     JOIN schsaf.tbl_products tp ON tpm.product_id = tp.id
     LEFT JOIN latest_audit_log au ON au.global_id = ((((a.final_object::json ->> 'quotaGlobal'::text)::json) ->> 'id'::text)::bigint) AND au.rn = 1
  WHERE a.target_process::text = 'QUOTA'::text AND a.process_type::text = 'QUOTA_PRODUCT'::text AND a.log_type::text = 'TECHNICAL'::text;


-- schsaf.view_average_balance_report source

CREATE OR REPLACE VIEW schsaf.view_average_balance_report
AS SELECT row_number() OVER () AS id,
    o.number_obligation AS document,
    concat(o.document_holder, o.number_obligation) AS loan_number,
        CASE
            WHEN upper(o.name_product::text) = 'CONFIRMING'::text AND (upper(o.modality::text) = 'CON RECURSO'::text OR upper(o.modality::text) = 'SIN RECURSO'::text) THEN 'DF'::character varying
            WHEN upper(o.name_product::text) = 'PLUS'::text AND (upper(o.modality::text) = 'CON RECURSO'::text OR upper(o.modality::text) = 'SIN RECURSO'::text) THEN 'DF'::character varying
            WHEN upper(o.name_product::text) = 'MONEDA EXTRANJERA'::text THEN 'DF'::character varying
            WHEN upper(o.name_product::text) = 'LINEA TRIANGULAR'::text THEN 'LT'::character varying
            ELSE NULL::character varying
        END AS line,
        CASE
            WHEN upper(o.name_product::text) = 'CONFIRMING'::text AND upper(o.modality::text) = 'CON RECURSO'::text THEN 'DFC01'::character varying
            WHEN upper(o.name_product::text) = 'CONFIRMING'::text AND upper(o.modality::text) = 'SIN RECURSO'::text THEN 'DFCSR'::character varying
            WHEN upper(o.name_product::text) = 'PLUS'::text AND upper(o.modality::text) = 'SIN RECURSO'::text THEN 'DFSR1'::character varying
            WHEN upper(o.name_product::text) = 'PLUS'::text AND upper(o.modality::text) = 'CON RECURSO'::text THEN 'DF074'::character varying
            ELSE NULL::character varying
        END AS plan,
        CASE
            WHEN o.currency::text = 'COP'::text THEN 0
            ELSE 2
        END AS currency_type,
    o.currency AS currency_code,
        CASE
            WHEN o.discount_value IS NOT NULL AND o.obligation_state::text <> 'CANCELED'::text THEN o.principal_balance - (o.discount_value - o.accrued_amortized)
            ELSE 0::numeric
        END AS capital_value,
    o.obligation_state,
    concat(o.name_product, ' ', o.modality) AS product_name,
        CASE
            WHEN to2.base = 360 THEN 1
            ELSE 2
        END AS base_year_code,
    replace(o.created_at_obligation::character varying::text, '-'::text, ''::text) AS date_conta,
    o.created_at_obligation AS disbursement_date,
    o.invoice_value AS obligation_value,
    replace(o.net_due_date::character varying::text, '-'::text, ''::text) AS net_date,
    replace(o.total_due_date::character varying::text, '-'::text, ''::text) AS total_date,
    o.total_due_date,
    replace(o.disbursement_date::character varying::text, '-'::text, ''::text) AS application_date,
    o.provider_rate,
        CASE
            WHEN tih.provider_rate_type = 0 THEN 'F'::text
            ELSE 'V'::text
        END AS provider_rate_type,
        CASE
            WHEN tih.provider_rate_type = 0 THEN 'FIJA'::text
            ELSE 'DTF'::text
        END AS net_rate_index,
    o.remunerative_rate,
        CASE
            WHEN o.remunerative_rate_type::text = 'Fija Efectiva Anual (EA)'::text THEN 'F'::character varying
            WHEN o.remunerative_rate_type::text = 'Variable (DTF- TA)'::text THEN 'V'::character varying
            ELSE NULL::character varying
        END AS remunerative_rate_type,
        CASE
            WHEN o.remunerative_rate_type::text = 'Fija Efectiva Anual (EA)'::text THEN 'FIJA'::character varying
            WHEN o.remunerative_rate_type::text = 'Variable (DTF- TA)'::text THEN 'DTF'::character varying
            ELSE NULL::character varying
        END AS remunerative_rate_index,
    o.document_holder,
    replace(o.date_last_payment::character varying::text, '-'::text, ''::text) AS date_last_payment,
    o.name_holder,
    0 AS discount_lt,
        CASE
            WHEN upper(o.modality::text) = 'SIN RECURSO'::text THEN o.document_provider
            WHEN upper(o.modality::text) = 'CON RECURSO'::text THEN o.document_payer
            ELSE o.document_payer
        END AS document_counterparty,
        CASE
            WHEN upper(o.modality::text) = 'SIN RECURSO'::text THEN o.name_provider
            WHEN upper(o.modality::text) = 'CON RECURSO'::text THEN o.name_payer
            ELSE o.name_payer
        END AS name_counterparty,
    o.disbursement_value,
    o.obligation_id::bigint AS obligation_id,
    o.creation_date,
        CASE
            WHEN upper(o.name_product::text) = 'CONFIRMING'::text AND upper(o.modality::text) = 'SIN RECURSO'::text THEN acr.monthly_value
            WHEN upper(o.name_product::text) = 'CONFIRMING'::text AND upper(o.modality::text) = 'CON RECURSO'::text THEN asr.monthly_value
            WHEN upper(o.name_product::text) = 'PLUS'::text AND upper(o.modality::text) = 'SIN RECURSO'::text THEN psr.monthly_value
            WHEN upper(o.name_product::text) = 'PLUS'::text AND upper(o.modality::text) = 'CON RECURSO'::text THEN pcr.monthly_value
            ELSE 0::numeric
        END AS discount_df,
        CASE
            WHEN upper(o.name_product::text) = 'CONFIRMING'::text THEN vmv.monthly_value
            WHEN upper(o.name_product::text) = 'PLUS'::text THEN vmvp.monthly_value
            ELSE NULL::numeric
        END AS int_mora,
        CASE
            WHEN upper(o.name_product::text) = 'CONFIRMING'::text THEN vrv.monthly_value
            WHEN upper(o.name_product::text) = 'PLUS'::text THEN vrvp.monthly_value
            ELSE NULL::numeric
        END AS int_remunerative,
    vaev.monthly_value AS assumed_expenses,
        CASE
            WHEN upper(o.name_product::text) = 'CONFIRMING'::text THEN dr.monthly_value
            WHEN upper(o.name_product::text) = 'PLUS'::text THEN drp.monthly_value
            ELSE NULL::numeric
        END AS discount_return
   FROM schsaf.tbl_obligation_historical_report o
     JOIN schsaf.tbl_obligation_invoice toi ON o.obligation_id::bigint = toi.obligation_id
     JOIN schsaf.tbl_invoice ti ON ti.id = toi.invoice_id
     JOIN schsaf.tbl_obligations to2 ON to2.id = o.obligation_id::bigint
     JOIN schsaf.tbl_invoice_header tih ON ti.invoice_header_id = tih.id
     LEFT JOIN schsaf.view_amortization_with_resource_value asr ON o.obligation_id::bigint = asr.obligation_id AND date_trunc('month'::text, o.creation_date::timestamp with time zone) = asr.month
     LEFT JOIN schsaf.view_amortization_without_resource_value acr ON o.obligation_id::bigint = acr.obligation_id AND date_trunc('month'::text, o.creation_date::timestamp with time zone) = acr.month
     LEFT JOIN schsaf.view_remunerative_value vrv ON o.obligation_id::bigint = vrv.obligation_id AND date_trunc('month'::text, o.creation_date::timestamp with time zone) = vrv.month
     LEFT JOIN schsaf.view_moratorium_value vmv ON o.obligation_id::bigint = vmv.obligation_id AND date_trunc('month'::text, o.creation_date::timestamp with time zone) = vmv.month
     LEFT JOIN schsaf.view_assumed_expenses_value vaev ON o.obligation_id::bigint = vaev.obligation_id AND date_trunc('month'::text, o.creation_date::timestamp with time zone) = vaev.month
     LEFT JOIN schsaf.view_total_discount_return dr ON o.obligation_id::bigint = dr.obligation_id AND date_trunc('month'::text, o.creation_date::timestamp with time zone) = dr.month
     LEFT JOIN schsaf.view_amortization_plus_with_resource_value pcr ON o.obligation_id::bigint = pcr.obligation_id AND date_trunc('month'::text, o.creation_date::timestamp with time zone) = pcr.month
     LEFT JOIN schsaf.view_amortization_plus_without_resource_value psr ON o.obligation_id::bigint = psr.obligation_id AND date_trunc('month'::text, o.creation_date::timestamp with time zone) = psr.month
     LEFT JOIN schsaf.view_remunerative_plus_value vrvp ON o.obligation_id::bigint = vrvp.obligation_id AND date_trunc('month'::text, o.creation_date::timestamp with time zone) = vrvp.month
     LEFT JOIN schsaf.view_moratorium_plus_value vmvp ON o.obligation_id::bigint = vmvp.obligation_id AND date_trunc('month'::text, o.creation_date::timestamp with time zone) = vmvp.month
     LEFT JOIN schsaf.view_total_plus_discount_return drp ON o.obligation_id::bigint = drp.obligation_id AND date_trunc('month'::text, o.creation_date::timestamp with time zone) = drp.month
  WHERE o.creation_date >= (CURRENT_DATE - '3 mons'::interval);


-- schsaf.view_bank_account_subscribe source

CREATE OR REPLACE VIEW schsaf.view_bank_account_subscribe
AS SELECT tbar.id,
    tba.id AS bank_id,
    tba.currency,
    tba.account_type,
    tba.account_number,
    tba.account_name,
    tba.allow_debit,
    tba.allow_credit,
    tba.is_closed,
    tba.customer_identification_type,
    tba.customer_identification_number,
    tba.customer_name,
    tba.account_status,
    tba.bank_city,
    tba.bank_name,
    tba.bank_code,
    tbar.client_id,
    tc.document_type AS client_subscription_doc_type,
    tc.document_number AS client_subscription_doc_num,
    tc.full_name AS client_subscription_full_name,
    tbar.bank_account_state,
    tbar.is_principal,
    tbar.last_update,
    tc.document_number AS nit_beneficiary,
    tbar.delete_at,
    tbar.is_third
   FROM schsaf.tbl_bank_account tba
     JOIN schsaf.tbl_bank_account_subscribe tbar ON tbar.bank_account_id = tba.id
     JOIN schsaf.tbl_client tc ON tc.id = tbar.client_id
  WHERE tbar.delete_at IS NULL;


-- schsaf.view_business_relationship source

CREATE OR REPLACE VIEW schsaf.view_business_relationship
AS SELECT DISTINCT ON (union_tables.id, union_tables.state) row_number() OVER (ORDER BY (( SELECT NULL::text AS text))) AS code,
    union_tables.id,
    union_tables.state,
    union_tables.end_date,
    union_tables.start_date,
    union_tables.payer_id,
    union_tables.productmodality_id,
    union_tables.provider_id,
    union_tables.updated_at,
    union_tables.days_with_cost,
    union_tables.days_without_cost,
    union_tables.moratorium_rate,
    union_tables.moratorium_rate_type,
    union_tables.operational_flow,
    union_tables.provider_rate,
    union_tables.provider_rate_type,
    union_tables.refund_display,
    union_tables.refund_negotiation,
    union_tables.refund_rate,
    union_tables.refund_rate_type,
    union_tables.remunerative_rate,
    union_tables.remunerative_rate_type,
    union_tables.special_business,
    union_tables.special_business_comments,
    union_tables.business_day_setting,
    union_tables.calculation_type,
    union_tables.calculation_way,
    union_tables.liability,
    union_tables.rate_change,
    union_tables.refund_by_prepayment,
    union_tables.rejection_comment,
    union_tables.thirdparty_id,
    union_tables.base,
    union_tables.automatic_transfer,
    union_tables.bank_account_id,
    union_tables.invoice_confirmation,
    union_tables.netting,
    union_tables.invoice_value_netting,
    union_tables.isrefundavailable,
    union_tables.rejection_reason_id,
    union_tables.created_at,
    union_tables.platform_id,
    union_tables.disbursement_instruction,
    union_tables.filename_payer,
    union_tables.filename_provider,
    union_tables.id_temp,
        CASE
            WHEN (( SELECT count(*) AS count
               FROM ( SELECT tbl_business_relationships.id,
                        tbl_business_relationships.state
                       FROM schsaf.tbl_business_relationships
                    UNION ALL
                     SELECT tbl_business_relationships_temp.business_relationships_id AS id,
                        tbl_business_relationships_temp.state
                       FROM schsaf.tbl_business_relationships_temp) all_ids
              WHERE all_ids.id = union_tables.id AND all_ids.state::text = 'APPROVED'::text AND union_tables.state::text = 'REJECTED'::text)) > 0 THEN true
            WHEN (( SELECT count(*) AS count
               FROM ( SELECT tbl_business_relationships.id,
                        tbl_business_relationships.state
                       FROM schsaf.tbl_business_relationships
                    UNION ALL
                     SELECT tbl_business_relationships_temp.business_relationships_id AS id,
                        tbl_business_relationships_temp.state
                       FROM schsaf.tbl_business_relationships_temp) all_ids
              WHERE all_ids.id = union_tables.id AND all_ids.state::text = 'PENDING_APPROVAL'::text AND union_tables.state::text = 'APPROVED'::text)) > 0 THEN true
            WHEN (( SELECT count(*) AS count
               FROM ( SELECT tbl_business_relationships.id,
                        tbl_business_relationships.state
                       FROM schsaf.tbl_business_relationships
                    UNION ALL
                     SELECT tbl_business_relationships_temp.business_relationships_id AS id,
                        tbl_business_relationships_temp.state
                       FROM schsaf.tbl_business_relationships_temp) all_ids
              WHERE all_ids.id = union_tables.id AND all_ids.state::text = 'REJECTED'::text AND union_tables.state::text = 'REJECTED'::text AND union_tables.id_temp IS NOT NULL)) > 0 THEN true
            WHEN (( SELECT count(*) AS count
               FROM ( SELECT tbl_business_relationships.id,
                        tbl_business_relationships.state
                       FROM schsaf.tbl_business_relationships
                    UNION ALL
                     SELECT tbl_business_relationships_temp.business_relationships_id AS id,
                        tbl_business_relationships_temp.state
                       FROM schsaf.tbl_business_relationships_temp) all_ids
              WHERE all_ids.id = union_tables.id)) = 1 THEN true
            ELSE false
        END AS is_editable,
    union_tables.days_without_cost_for_slack,
    union_tables.is_massive
   FROM ( SELECT tb1.id,
            tb1.state,
            tb1.end_date,
            tb1.start_date,
            tb1.payer_id,
            tb1.productmodality_id,
            tb1.provider_id,
            tb1.updated_at,
            tb1.days_with_cost,
            tb1.days_without_cost,
            tb1.moratorium_rate,
            tb1.moratorium_rate_type,
            tb1.operational_flow,
            tb1.provider_rate,
            tb1.provider_rate_type,
            tb1.refund_display,
            tb1.refund_negotiation,
            tb1.refund_rate,
            tb1.refund_rate_type,
            tb1.remunerative_rate,
            tb1.remunerative_rate_type,
            tb1.special_business,
            tb1.special_business_comments,
            tb1.business_day_setting,
            tb1.calculation_type,
            tb1.calculation_way,
            tb1.liability,
            tb1.rate_change,
            tb1.refund_by_prepayment,
            tb1.rejection_comment,
            tb1.thirdparty_id,
            tb1.base,
            tb1.automatic_transfer,
            tb1.bank_account_id,
            tb1.invoice_confirmation,
            tb1.netting,
            tb1.invoice_value_netting,
            tb1.isrefundavailable,
            tb1.rejection_reason_id,
            tb1.created_at,
            tb1.platform_id,
            tb1.disbursement_instruction,
            tb1.filename_payer,
            tb1.filename_provider,
            NULL::bigint AS id_temp,
            tb1.days_without_cost_for_slack,
            tb1.is_massive
           FROM schsaf.tbl_business_relationships tb1
        UNION ALL
         SELECT brt.business_relationships_id AS id,
            brt.state,
            brt.end_date,
            brt.start_date,
            brt.payer_id,
            brt.productmodality_id,
            brt.provider_id,
            brt.updated_at,
            brt.days_with_cost,
            brt.days_without_cost,
            brt.moratorium_rate,
            brt.moratorium_rate_type,
            brt.operational_flow,
            brt.provider_rate,
            brt.provider_rate_type,
            brt.refund_display,
            brt.refund_negotiation,
            brt.refund_rate,
            brt.refund_rate_type,
            brt.remunerative_rate,
            brt.remunerative_rate_type,
            brt.special_business,
            brt.special_business_comments,
            brt.business_day_setting,
            brt.calculation_type,
            brt.calculation_way,
            brt.liability,
            brt.rate_change,
            brt.refund_by_prepayment,
            brt.rejection_comment,
            brt.thirdparty_id,
            brt.base,
            brt.automatic_transfer,
            brt.bank_account_id,
            brt.invoice_confirmation,
            brt.netting,
            brt.invoice_value_netting,
            brt.isrefundavailable,
            brt.rejection_reason_id,
            brt.created_at,
            brt.platform_id,
            brt.disbursement_instruction,
            brt.filename_payer,
            brt.filename_provider,
            brt.id AS id_temp,
            brt.days_without_cost_for_slack,
            brt.is_massive
           FROM schsaf.tbl_business_relationships_temp brt) union_tables;


-- schsaf.view_business_relationships_report source

CREATE OR REPLACE VIEW schsaf.view_business_relationships_report
AS SELECT row_number() OVER () AS id,
    r.id AS business_relationships_id,
    r.updated_at AS action_date,
    NULL::text AS action_user,
    ''::text AS scenario,
    tp.id AS product_id,
    tp.name AS product_name,
    tpm.id AS modality_id,
    tpm.modality AS modality_name,
    p.document_number AS payer_document_number,
    p.full_name AS payer_full_name,
    prov.document_number AS provider_document_number,
    prov.full_name AS provider_full_name,
    r.start_date,
    r.end_date,
    r.updated_at,
    r.created_at,
    r.state,
    r.provider_rate_type,
    r.provider_rate,
        CASE
            WHEN tp.name::text = 'Plus'::text THEN r.days_without_cost_for_slack
            WHEN tp.name::text = 'Confirming'::text THEN r.days_without_cost
            ELSE NULL::integer
        END AS days_without_cost,
        CASE
            WHEN tp.name::text = 'Plus'::text THEN NULL::integer
            ELSE r.days_with_cost
        END AS days_with_cost,
        CASE
            WHEN tp.name::text = 'Plus'::text THEN NULL::character varying(30)
            ELSE r.remunerative_rate_type
        END AS remunerative_rate_type,
        CASE
            WHEN tp.name::text = 'Plus'::text THEN NULL::numeric(7,4)
            ELSE r.remunerative_rate
        END AS remunerative_rate,
    r.operational_flow,
    r.isrefundavailable AS has_prepaid_discount,
    r.refund_negotiation AS negotiation_type_for_prepaid_discount,
    r.refund_display AS account_statement_obligation_display,
    r.refund_rate_type AS rate_type_for_prepaid_discount,
    r.refund_rate AS rate_for_prepaid_discount,
    r.refund_by_prepayment AS prepaid_discount,
    r.automatic_transfer,
    tba.customer_name AS account_holder,
    tba.account_number,
    r.platform_id AS platformid,
        CASE
            WHEN tp2.id IS NOT NULL THEN 'SI'::character varying
            ELSE 'NO'::character varying
        END AS platform,
    tp2.acronym AS platformacronym,
    tp2.full_name AS name_platform,
    tp2.disbursement_instruction,
    false AS is_massive
   FROM schsaf.tbl_business_relationships r
     JOIN schsaf.tbl_client p ON r.payer_id = p.id
     JOIN schsaf.tbl_client prov ON r.provider_id = prov.id
     JOIN schsaf.tbl_products_modalities tpm ON r.productmodality_id = tpm.id
     JOIN schsaf.tbl_products tp ON tpm.product_id = tp.id
     LEFT JOIN schsaf.tbl_bank_account tba ON r.bank_account_id = tba.id
     LEFT JOIN schsaf.tbl_platform tp2 ON r.platform_id = tp2.id;


-- schsaf.view_business_relationships_report_pruebas source

CREATE OR REPLACE VIEW schsaf.view_business_relationships_report_pruebas
AS SELECT row_number() OVER () AS id,
    obj.business_relationships_id,
    obj.action_date,
    obj.username AS action_user,
    obj.action AS scenario,
    tp.id AS product_id,
    tp.name AS product_name,
    tpm.id AS modality_id,
    tpm.modality AS modality_name,
    p.document_number AS payer_document_number,
    p.full_name AS payer_full_name,
    prov.document_number AS provider_document_number,
    prov.full_name AS provider_full_name,
    obj.start_date,
    obj.end_date,
    obj.updated_at,
    obj.created_at,
    obj.state,
    obj.provider_rate_type,
    obj.provider_rate,
    obj.days_without_cost,
    obj.days_with_cost,
    obj.remunerative_rate_type,
    obj.remunerative_rate,
    obj.operational_flow,
    obj.isrefundavailable AS has_prepaid_discount,
    obj.refund_negotiation AS negotiation_type_for_prepaid_discount,
    obj.refund_display AS account_statement_obligation_display,
    obj.refund_rate_type AS rate_type_for_prepaid_discount,
    obj.refund_rate AS rate_for_prepaid_discount,
    obj.refund_by_prepayment AS prepaid_discount,
    obj.automatic_transfer,
    tba.customer_name AS account_holder,
    tba.account_number,
    tp2.id AS platformid,
        CASE
            WHEN tp2.id IS NOT NULL THEN 'SI'::character varying
            ELSE 'NO'::character varying
        END AS platform,
    tp2.acronym AS platformacronym,
    tp2.full_name AS name_platform,
    tp2.disbursement_instruction
   FROM ( SELECT tal.username,
            tal.action_date,
            tal.action,
            (tal.final_object::json ->> 'id'::text)::bigint AS business_relationships_id,
            (((tal.final_object::json ->> 'payer'::text)::json) ->> 'id'::text)::bigint AS payer_id,
            (((tal.final_object::json ->> 'provider'::text)::json) ->> 'id'::text)::bigint AS provider_id,
            (((tal.final_object::json ->> 'productModality'::text)::json) ->> 'id'::text)::bigint AS productmodality_id,
            (((tal.final_object::json ->> 'businessRelationshipFunctional'::text)::json) ->> 'bankAccountId'::text)::bigint AS bank_account_id,
            (tal.final_object::json ->> 'startDate'::text)::date AS start_date,
            (tal.final_object::json ->> 'endDate'::text)::date AS end_date,
            (tal.final_object::json ->> 'updateAt'::text)::timestamp without time zone AS updated_at,
            (tal.final_object::json ->> 'createAt'::text)::timestamp without time zone AS created_at,
            tal.final_object::json ->> 'state'::text AS state,
            ((tal.final_object::json ->> 'businessRelationshipCondition'::text)::json) ->> 'providerRateType'::text AS provider_rate_type,
            (((tal.final_object::json ->> 'businessRelationshipCondition'::text)::json) ->> 'providerRate'::text)::numeric AS provider_rate,
            (((tal.final_object::json ->> 'businessRelationshipCondition'::text)::json) ->> 'daysWithoutCost'::text)::integer AS days_without_cost,
            (((tal.final_object::json ->> 'businessRelationshipCondition'::text)::json) ->> 'daysWithCost'::text)::integer AS days_with_cost,
            ((tal.final_object::json ->> 'businessRelationshipCondition'::text)::json) ->> 'remunerativeRateType'::text AS remunerative_rate_type,
            (((tal.final_object::json ->> 'businessRelationshipCondition'::text)::json) ->> 'remunerativeRate'::text)::numeric AS remunerative_rate,
            ((tal.final_object::json ->> 'businessRelationshipCondition'::text)::json) ->> 'operationalFlow'::text AS operational_flow,
            (((tal.final_object::json ->> 'businessRelationshipCondition'::text)::json) ->> 'isRefundAvailable'::text)::boolean AS isrefundavailable,
            ((tal.final_object::json ->> 'businessRelationshipCondition'::text)::json) ->> 'refundNegotiation'::text AS refund_negotiation,
            ((tal.final_object::json ->> 'businessRelationshipCondition'::text)::json) ->> 'refundDisplay'::text AS refund_display,
            ((tal.final_object::json ->> 'businessRelationshipCondition'::text)::json) ->> 'refundRateType'::text AS refund_rate_type,
            (((tal.final_object::json ->> 'businessRelationshipCondition'::text)::json) ->> 'refundRate'::text)::numeric AS refund_rate,
            ((tal.final_object::json ->> 'businessRelationshipCondition'::text)::json) ->> 'refundByPrepayment'::text AS refund_by_prepayment,
            (((tal.final_object::json ->> 'businessRelationshipFunctional'::text)::json) ->> 'automaticTransfer'::text)::boolean AS automatic_transfer,
            (tal.final_object::json ->> 'platformId'::text)::bigint AS platformid
           FROM schsafaudit.tbl_audit_log tal
          WHERE tal.target_process::text = 'BUSINESS_RELATIONSHIP'::text) obj
     JOIN schsaf.tbl_client p ON obj.payer_id = p.id
     JOIN schsaf.tbl_client prov ON obj.provider_id = prov.id
     JOIN schsaf.tbl_products_modalities tpm ON obj.productmodality_id = tpm.id
     JOIN schsaf.tbl_products tp ON tpm.product_id = tp.id
     LEFT JOIN schsaf.tbl_bank_account tba ON obj.bank_account_id = tba.id
     LEFT JOIN schsaf.tbl_platform tp2 ON obj.platformid = tp2.id;


-- schsaf.view_checklist_report source

CREATE OR REPLACE VIEW schsaf.view_checklist_report
AS SELECT row_number() OVER () AS id,
    ch.action_date,
    ch.origin_process,
    ch.client_document_type,
    ch.client_document_number,
    ch.client_full_name,
    ch.alert_message,
    ch.categories_codes,
    ch.categories_description,
    ch.client_blocked,
    rl.legal_person_document,
    rl.action_date_rl,
    rl.origin_process_rl,
    rl.client_document_type_rl,
    rl.client_document_number_rl,
    rl.client_full_name_rl,
    rl.alert_message_rl,
    rl.categories_codes_rl,
    rl.categories_description_rl,
    rl.client_blocked_rl
   FROM ( SELECT tal.action_date,
            tal.origin_process,
            (tal.final_object::json ->> 'clientDocumentType'::text)::character varying AS client_document_type,
            replace(ltrim(replace(((tal.final_object::json ->> 'clientDocumentNumber'::text)::character varying)::text, '0'::text, ' '::text)), ' '::text, '0'::text)::character varying AS client_document_number,
            (tal.final_object::json ->> 'clientFullName'::text)::character varying AS client_full_name,
            (tal.final_object::json ->> 'alertMessage'::text)::character varying AS alert_message,
            replace(tal.final_object::json ->> 'categoriesCodes'::text, ','::text, ' / '::text)::character varying AS categories_codes,
            (tal.final_object::json ->> 'categoriesDescription'::text)::character varying AS categories_description,
            (tal.final_object::json ->> 'clientBlocked'::text)::boolean AS client_blocked
           FROM schsafaudit.tbl_audit_log tal
          WHERE tal.target_process::text = 'CHECKLIST'::text AND tal.process_type IS NULL) ch
     LEFT JOIN ( SELECT (tal.final_object::json ->> 'legalPersonDocument'::text)::character varying AS legal_person_document,
            tal.action_date AS action_date_rl,
            tal.origin_process AS origin_process_rl,
            (tal.final_object::json ->> 'clientDocumentType'::text)::character varying AS client_document_type_rl,
            replace(ltrim(replace(((tal.final_object::json ->> 'clientDocumentNumber'::text)::character varying)::text, '0'::text, ' '::text)), ' '::text, '0'::text)::character varying AS client_document_number_rl,
            (tal.final_object::json ->> 'clientFullName'::text)::character varying AS client_full_name_rl,
            (tal.final_object::json ->> 'alertMessage'::text)::character varying AS alert_message_rl,
            replace(tal.final_object::json ->> 'categoriesCodes'::text, ','::text, ' / '::text)::character varying AS categories_codes_rl,
            (tal.final_object::json ->> 'categoriesDescription'::text)::character varying AS categories_description_rl,
            (tal.final_object::json ->> 'clientBlocked'::text)::boolean AS client_blocked_rl
           FROM schsafaudit.tbl_audit_log tal
          WHERE tal.target_process::text = 'CHECKLIST'::text AND tal.process_type::text = 'LEGAL_REPRESENTATIVE'::text) rl ON ch.client_document_number::text = rl.legal_person_document::text AND ch.action_date = rl.action_date_rl AND ch.origin_process::text = rl.origin_process_rl::text;


-- schsaf.view_client_block_details source

CREATE OR REPLACE VIEW schsaf.view_client_block_details
AS SELECT tcbd.id,
    c.id AS client_id,
    cb.id AS client_block_id,
    c.document_type,
    c.document_number,
    c.full_name,
    cb.is_administrative_block,
    tcbd.block_type_code,
    tbt.description AS block_description,
    tcbd.start_at,
    tcbd.end_at,
    tcbd.state
   FROM schsaf.tbl_client_blocks_details tcbd
     JOIN schsaf.tbl_blocks_type tbt ON tbt.code::text = tcbd.block_type_code::text
     JOIN schsaf.tbl_client_blocks cb ON tcbd.client_block_id = cb.id
     JOIN schsaf.tbl_client c ON cb.client_id = c.id;


-- schsaf.view_client_blocks source

CREATE OR REPLACE VIEW schsaf.view_client_blocks
AS SELECT cb.id,
    c.id AS client_id,
    c.document_type,
    c.document_number,
    c.full_name,
    c.mdm_key,
    cb.is_administrative_block,
    cb.start_at,
    cb.end_at,
    cb.state,
    tcbd.block_type_code AS blockcode
   FROM schsaf.tbl_client_blocks cb
     JOIN schsaf.tbl_client c ON cb.client_id = c.id
     JOIN schsaf.tbl_client_blocks_details tcbd ON cb.id = tcbd.client_block_id;


-- schsaf.view_client_invoice_obligation source

CREATE OR REPLACE VIEW schsaf.view_client_invoice_obligation
AS SELECT tob.id,
    tblcli.document_number AS nit_client,
    tblcli.short_name AS name_client,
    tbpro.document_number AS nit_provider,
    tbpro.short_name AS name_provider,
    tblpayer.document_number AS nit_payer,
    tblpayer.short_name AS name_payer,
    tp.name AS product_name,
    tpm.modality,
    ti.number AS number_invoice,
    ti.number_svf AS number_obligation,
    min(tpa.payment_date) AS date_first_payment,
    max(tpa.payment_date) AS date_last_payment,
        CASE
            WHEN (tob.state::text = 'EXPIRED'::text) IS TRUE THEN ( SELECT tr.value
               FROM schsaf.tbl_rate tr
              WHERE tr.status::text = 'CURRENT'::text AND tr.rate_type_id = 1)
            ELSE NULL::numeric
        END AS moratorium_rate,
    tbd.application_date AS disbursement_date,
    td.days_with_cost
   FROM schsaf.tbl_obligations tob
     JOIN schsaf.tbl_obligation_invoice oi ON tob.id = oi.obligation_id
     JOIN schsaf.tbl_invoice ti ON ti.id = oi.invoice_id
     JOIN schsaf.tbl_business_relationships tbr ON tob.business_relationship_id = tbr.id
     JOIN schsaf.tbl_products_modalities tpm ON tpm.id = tbr.productmodality_id
     JOIN schsaf.tbl_products tp ON tp.id = tpm.product_id
     JOIN schsaf.tbl_invoice_header td ON ti.invoice_header_id = td.id
     LEFT JOIN schsaf.tbl_bank_drafts tbd ON tbd.invoice_header_id = td.id
     JOIN schsaf.tbl_client tbpro ON tbpro.id = td.provider_id
     JOIN schsaf.tbl_client tblpayer ON tblpayer.id = td.payer_id
     JOIN schsaf.tbl_client tblcli ON tblcli.id = tob.client_id
     LEFT JOIN schsaf.tbl_payment_instruction tpi ON tpi.obligation_id = tob.id AND tpi.state::text = 'APPLIED'::text
     LEFT JOIN schsaf.tbl_payment_application tpa ON tpa.id = tpi.payment_application_id
  GROUP BY tob.id, tblcli.document_number, tblcli.short_name, tbpro.document_number, tbpro.short_name, tblpayer.document_number, tblpayer.short_name, tp.name, tpm.modality, ti.number, ti.number_svf, tbd.application_date, td.days_with_cost;


-- schsaf.view_client_master_report source

CREATE OR REPLACE VIEW schsaf.view_client_master_report
AS SELECT row_number() OVER () AS id,
    c.id AS client_id,
    c.document_type AS client_document_type,
    c.document_number AS client_document_number,
    c.short_name AS client_short_name,
    c.full_name AS client_full_name,
        CASE
            WHEN c.self_retainer_other_income::text = 'RESPUE_S'::text THEN 'SI'::character varying
            WHEN c.self_retainer_other_income::text = 'RESPUE_N'::text THEN 'NO'::character varying
            ELSE NULL::character varying
        END AS client_self_retainer,
        CASE
            WHEN c.type_customer::text = 'PJ'::text THEN 'Jurídica'::character varying
            WHEN c.type_customer::text = 'PN'::text THEN 'Natural'::character varying
            ELSE NULL::character varying
        END AS client_customer_type,
    tc.city_name AS client_city,
    c.role_ AS role_code,
        CASE
            WHEN c.role_::text = 'ROLNEG_02'::text THEN 'Cliente'::character varying
            WHEN c.role_::text = 'ROLNEG_01'::text THEN 'Prospecto'::character varying
            WHEN c.role_::text = 'ROLNEG_03'::text THEN 'Excliente'::character varying
            ELSE NULL::character varying
        END AS business_role,
    c.registration_date AS client_last_update,
    c.is_simple_regime,
    c.user_name,
    c.date_last_update AS client_last_update_mdm
   FROM schsaf.tbl_client c
     LEFT JOIN schsaf.tbl_cities tc ON c.city_code::text = tc.city_code::text;


-- schsaf.view_client_obligations_automatic_debit source

CREATE OR REPLACE VIEW schsaf.view_client_obligations_automatic_debit
AS SELECT 6 AS type,
    tc.document_number,
    tc.short_name,
    '5600078'::text AS bank_code,
    ( SELECT tadh.bank_account
           FROM schsaf.tbl_automatic_debit_historical tadh
          WHERE
                CASE
                    WHEN tpm.acronym::text = 'CCR'::text THEN tadh.document_client::text = tc2.document_number::text
                    WHEN tpm.acronym::text = 'CSR'::text THEN tadh.document_client::text = tc.document_number::text
                    WHEN tpm.product_id = 3 THEN tadh.document_client::text = tila.payer_document_number::text
                    ELSE false
                END
          ORDER BY tadh.created DESC
         LIMIT 1) AS account_number,
    ( SELECT tadh.bank_account_type
           FROM schsaf.tbl_automatic_debit_historical tadh
          WHERE
                CASE
                    WHEN tpm.acronym::text = 'CCR'::text THEN tadh.document_client::text = tc2.document_number::text
                    WHEN tpm.acronym::text = 'CSR'::text THEN tadh.document_client::text = tc.document_number::text
                    WHEN tpm.product_id = 3 THEN tadh.document_client::text = tila.payer_document_number::text
                    ELSE false
                END
          ORDER BY tadh.created DESC
         LIMIT 1) AS account_type,
    to2.principal_balance,
    to2.remunerative_balance,
    to2.moratorium_balance,
    to2.vpd_active,
    to2.vpd_refund_value,
    'S'::text AS nitvscta,
        CASE
            WHEN tpm.product_id = 3 THEN tfp.plan_code::character varying(20)
            ELSE tpm.acronym
        END AS plan,
        CASE
            WHEN tpm.product_id = 3 THEN tila.application_number
            ELSE ti.number_svf
        END AS obligation_number,
    to2.total_due_date,
    to2.invoice_due_date,
    ( SELECT tadh.type_change
           FROM schsaf.tbl_automatic_debit_historical tadh
          WHERE
                CASE
                    WHEN tpm.acronym::text = 'CCR'::text THEN tadh.document_client::text = tc2.document_number::text
                    WHEN tpm.acronym::text = 'CSR'::text THEN tadh.document_client::text = tc.document_number::text
                    WHEN tpm.product_id = 3 THEN tadh.document_client::text = tila.payer_document_number::text
                    ELSE false
                END
          ORDER BY tadh.created DESC
         LIMIT 1) AS automatic_debit,
    to2.client_id,
    to2.state,
        CASE
            WHEN tpm.product_id = 3 THEN tc5.id
            ELSE tih.payer_id
        END AS payer_id,
        CASE
            WHEN tpm.product_id = 3 THEN tc5.document_number
            ELSE tc2.document_number
        END AS document_number_payer
   FROM schsaf.tbl_obligations to2
     LEFT JOIN schsaf.tbl_client tc ON to2.client_id = tc.id
     LEFT JOIN schsaf.tbl_obligation_invoice toi ON to2.id = toi.obligation_id
     LEFT JOIN schsaf.tbl_invoice ti ON toi.invoice_id = ti.id
     LEFT JOIN schsaf.tbl_invoice_header tih ON ti.invoice_header_id = tih.id
     LEFT JOIN schsaf.tbl_client tc2 ON tc2.id = tih.payer_id
     LEFT JOIN schsaf.tbl_business_relationships tbr ON to2.business_relationship_id = tbr.id
     LEFT JOIN schsaf.tbl_products_modalities tpm ON tpm.id = tbr.productmodality_id
     LEFT JOIN schsaf.tbl_invoice_lt_aggrupation tila ON tila.obligation_id = to2.id
     LEFT JOIN schsaf.tbl_financing_plan tfp ON tila.plan_id = tfp.id
     LEFT JOIN schsaf.tbl_client tc4 ON tc4.document_number::text = tila.provider_document_number::text
     LEFT JOIN schsaf.tbl_client tc5 ON tc5.document_number::text = tila.payer_document_number::text
  WHERE to2.state::text = ANY (ARRAY['EXPIRED'::character varying::text]);


-- schsaf.view_client_payment_application_config source

CREATE OR REPLACE VIEW schsaf.view_client_payment_application_config
AS SELECT tc.id AS client_id,
    tc.document_type,
    tc.document_number,
    tc.full_name,
    tc.mdm_key,
    tc.vinculation_date,
    tc.status,
    tc.blocked_payment,
    tcpi.id_type_application AS type_application_id,
    ttpi.description,
    tcpi.payment_application_start_date,
    tcpi.last_update
   FROM schsaf.tbl_client tc
     LEFT JOIN schsaf.tbl_client_payment_application_config tcpi ON tcpi.id_client = tc.id
     LEFT JOIN schsaf.tbl_type_payment_application ttpi ON ttpi.id::text = tcpi.id_type_application::text;


-- schsaf.view_client_payment_instruction source

CREATE OR REPLACE VIEW schsaf.view_client_payment_instruction
AS SELECT tc.id AS client_id,
    tc.document_type,
    tc.document_number,
    tc.full_name,
    tc.mdm_key,
    tc.vinculation_date,
    tc.status,
    tc.blocked_payment,
    COALESCE(tcpi.type_application_id, 0::bigint) AS type_application_id,
    ttpi.description,
    tcpi.payment_application_date,
    tcpi.last_update,
    tc.short_name
   FROM schsaf.tbl_client tc
     LEFT JOIN schsaf.tbl_client_payment_instruction tcpi ON tcpi.client_id = tc.id
     LEFT JOIN schsaf.tbl_type_payment_instruction ttpi ON ttpi.id = tcpi.type_application_id;


-- schsaf.view_daily_amortization_report source

CREATE OR REPLACE VIEW schsaf.view_daily_amortization_report
AS SELECT o.document_holder AS client_document_number,
    o.name_holder AS client_name,
    o.number_obligation AS number,
        CASE o.obligation_state
            WHEN 'EXPIRED'::text THEN 'Vencida'::text
            WHEN 'CURRENT'::text THEN 'Vigente'::text
            WHEN 'ANNULLED'::text THEN 'Anulada'::text
            WHEN 'CANCELED'::text THEN 'Cancelada'::text
            ELSE ''::text
        END AS state,
    o.number_document AS invoice_number,
    o.name_product AS product_name,
    o.modality,
    o.created_at_obligation AS date,
    o.disbursement_date AS issuance_date,
    o.net_due_date,
    o.total_due_date,
    schsaf.fn_days_difference_360(o.disbursement_date, CURRENT_DATE) AS age,
    o.discount_rate,
    o.invoice_value AS value,
    o.discount_value,
    to2.accrued_amortized,
    o.discount_value - to2.accrued_amortized AS pending_value,
    fc.finance_charge_value AS daily_value,
    fca.finance_charge_value AS previous_daily_value,
    o.currency
   FROM schsaf.tbl_obligation_historical_report o
     JOIN schsaf.view_summatory_finance_charge_value_report fc ON fc.obligation_id::text = o.obligation_id::text
     JOIN schsaf.tbl_obligations to2 ON to2.id = fc.obligation_id AND fc.finance_charge_type_id = 1 AND (CURRENT_DATE - 1) = to_date(fc.created_at::text, 'YYYY-MM-DD'::text)
     LEFT JOIN schsaf.view_summatory_finance_charge_value_report fca ON fca.obligation_id::text = o.obligation_id::text AND fca.finance_charge_type_id = 1 AND (CURRENT_DATE - 2) = to_date(fca.created_at::text, 'YYYY-MM-DD'::text)
  WHERE o.creation_date = (CURRENT_DATE - 1) AND fc.process_type::text = 'DIARY'::text;


-- schsaf.view_daily_moratorium_report source

CREATE OR REPLACE VIEW schsaf.view_daily_moratorium_report
AS SELECT o.document_holder AS client_document_number,
    o.name_holder AS client_name,
    o.number_obligation AS obligation_number,
        CASE to2.state
            WHEN 'EXPIRED'::text THEN 'Vencida'::text
            WHEN 'PUNISHED'::text THEN 'Castigada'::text
            WHEN 'ANNULLED'::text THEN 'Anulada'::text
            WHEN 'CANCELED'::text THEN 'Cancelada'::text
            WHEN 'CURRENT'::text THEN 'Vigente'::text
            ELSE ''::text
        END AS state,
    o.number_document AS invoice_number,
    o.disbursement_date AS obligation_date,
    o.net_due_date,
    o.total_due_date,
    o.invoice_value,
    fc.principal_balance,
        CASE
            WHEN fca.principal_balance IS NULL THEN COALESCE(fc.principal_balance, 0::numeric, 2::numeric)
            ELSE COALESCE(fca.principal_balance, 0::numeric, 2::numeric)
        END AS yest_principal_balance,
    COALESCE(fc.finance_charge_value, 0::numeric, 2::numeric) AS daily_value,
    to2.accrued_moratorium,
    COALESCE(to2.accrued_moratorium - fc.finance_charge_value, 0::numeric, 2::numeric) AS yest_accrued_moratorium,
    COALESCE(fc.rate, 0::numeric, 2::numeric) AS rate,
    COALESCE(fca.rate, 0::numeric, 2::numeric) AS yest_rate
   FROM schsaf.tbl_obligation_historical_report o
     JOIN schsaf.view_summatory_finance_charge_value_report fc ON fc.obligation_id::text = o.obligation_id::text
     JOIN schsaf.tbl_obligations to2 ON to2.id = fc.obligation_id AND fc.finance_charge_type_id = 3 AND (CURRENT_DATE - 1) = to_date(fc.created_at::text, 'YYYY-MM-DD'::text)
     LEFT JOIN schsaf.view_summatory_finance_charge_value_report fca ON fca.obligation_id::text = o.obligation_id::text AND fca.finance_charge_type_id = 3 AND (CURRENT_DATE - 2) = to_date(fca.created_at::text, 'YYYY-MM-DD'::text)
  WHERE o.creation_date = (CURRENT_DATE - 1) AND fc.process_type::text = 'DIARY'::text;


-- schsaf.view_daily_remunerative_report source

CREATE OR REPLACE VIEW schsaf.view_daily_remunerative_report
AS SELECT o.document_holder AS client_document_number,
    o.name_holder AS client_name,
    o.number_obligation AS number,
    o.number_document AS invoice_number,
        CASE to2.state
            WHEN 'EXPIRED'::text THEN 'Vencida'::text
            WHEN 'CURRENT'::text THEN 'Vigente'::text
            WHEN 'ANNULLED'::text THEN 'Anulada'::text
            WHEN 'CANCELED'::text THEN 'Cancelada'::text
            ELSE ''::text
        END AS state,
    o.disbursement_date AS date,
    o.net_due_date,
    o.total_due_date,
    schsaf.fn_days_difference_360(o.disbursement_date, CURRENT_DATE) AS age,
    o.remunerative_rate,
    o.invoice_value AS value,
    o.principal_balance,
    fc.finance_charge_value AS daily_value,
    to2.accrued_remunerative,
    o.currency
   FROM schsaf.tbl_obligation_historical_report o
     JOIN schsaf.view_summatory_finance_charge_value_report fc ON fc.obligation_id::text = o.obligation_id::text
     JOIN schsaf.tbl_obligations to2 ON to2.id = fc.obligation_id AND fc.finance_charge_type_id = 2 AND (CURRENT_DATE - 1) = to_date(fc.created_at::text, 'YYYY-MM-DD'::text)
  WHERE o.creation_date = (CURRENT_DATE - 1) AND fc.process_type::text = 'DIARY'::text;


-- schsaf.view_disbursement source

CREATE OR REPLACE VIEW schsaf.view_disbursement
AS SELECT td.id,
    td.payer_id,
    td.provider_id,
    td.application_date,
    td.application_number,
    td.value AS original_value,
    tbd.bank_draft_value::double precision AS bank_draft_value,
    tpm.acronym,
    td.state,
    td.feedback,
    cpay.document_type AS document_type_payer,
    cpay.document_number AS document_number_payer,
    cpay.short_name AS short_name_payer,
    cpro.document_type AS document_type_provider,
    cpro.document_number AS document_number_provider,
    cpro.short_name AS short_name_provider,
    tdi.type AS instruction_type,
    tdi.third_party,
    tdi.third_party_document_number,
    tdi.third_party_document_type,
    tdi.third_party_full_name,
    tpm.product_id,
    tpm.id AS modality_id,
    tbd.application_date AS request_date,
    tbd.response_date,
    tp.full_name AS platform_name,
    tbd.state AS bank_draft_state
   FROM schsaf.tbl_invoice_header td
     LEFT JOIN schsaf.tbl_disbursement_instruction tdi ON td.disbursement_instruction_id = tdi.id
     JOIN schsaf.tbl_client cpay ON cpay.id = td.payer_id
     JOIN schsaf.tbl_client cpro ON cpro.id = td.provider_id
     LEFT JOIN schsaf.tbl_bank_drafts tbd ON tbd.invoice_header_id = td.id
     JOIN schsaf.tbl_products_modalities tpm ON tpm.sequence = td.sequence
     LEFT JOIN schsaf.tbl_platform tp ON tp.id = tdi.platform_id;


-- schsaf.view_disbursement_filed_report source

CREATE OR REPLACE VIEW schsaf.view_disbursement_filed_report
AS SELECT d.application_number AS disbursement_record,
    pa.full_name AS payer_full_name,
    pa.document_number AS payer_document_number,
    pr.full_name AS provider_full_name,
    pr.document_number AS provider_document_number,
    di.third_party_full_name,
    di.third_party_document_number,
    pro.name AS product,
    pm.modality,
        CASE di.type
            WHEN 'BANK_ACCOUNT'::text THEN 'CUENTA BANCARIA'::character varying
            WHEN 'OTHER'::text THEN 'OTRO'::character varying
            ELSE di.type
        END AS instruction_type,
    b.account_type,
    b.account_number,
    b.bank_name,
    sum(ti.value) AS original_value,
    sum(ti.initial_discount) AS discount_value,
    ba.gmf_value::numeric AS gmf_value,
    sum(ti.initial_disbursement_value) AS disbursement_value,
        CASE
            WHEN ba.application_date IS NOT NULL AND d.state::text = 'ENDED'::text THEN ba.bank_draft_value::double precision
            ELSE NULL::double precision
        END AS bank_draft_value,
    d.invoices_upload_date AS upload_date,
    d.application_date AS transfer_date,
    ba.application_date AS disbursement_date,
        CASE
            WHEN ba.application_date IS NOT NULL AND d.state::text = 'ENDED'::text THEN sum(ti.new_disbursement_value)
            ELSE NULL::double precision
        END AS new_disbursement_value,
        CASE
            WHEN ba.application_date IS NOT NULL AND d.state::text = 'ENDED'::text THEN sum(ti.new_discount)
            ELSE NULL::double precision
        END AS new_discount_value,
        CASE
            WHEN ba.application_date IS NOT NULL AND d.state::text = 'ENDED'::text THEN avg(ti.new_pay_percentage)
            ELSE NULL::double precision
        END AS new_pay_percentage,
    d.rejecting_user,
        CASE
            WHEN d.state::text = ANY (ARRAY['ENDED'::character varying::text, 'IN_PROCESS'::character varying::text, 'APPROVED'::character varying::text]) THEN 'OK'::text
            ELSE 'FALLO'::text
        END AS system_controls,
        CASE d.state
            WHEN 'RETURNED'::text THEN 'Devuelto'::character varying
            WHEN 'REJECTED'::text THEN 'Rechazado'::character varying
            WHEN 'APPROVED'::text THEN 'Aprobado'::character varying
            WHEN 'IMPEDIMENT'::text THEN 'Impedimento'::character varying
            WHEN 'ENDED'::text THEN 'Finalizado'::character varying
            WHEN 'PENDING_BANK_ACCOUNT'::text THEN 'Pendiente de cuenta'::character varying
            WHEN 'IN_PROCESS'::text THEN 'En proceso de giro'::character varying
            WHEN 'ACH_IMPEDIMENT'::text THEN 'Impedimento ACH'::character varying
            WHEN 'PENDING_APPROVAL'::text THEN 'Pendiente'::character varying
            WHEN 'PENDING_VERIFICATION'::text THEN 'Pendiente de verificar'::character varying
            ELSE d.state
        END AS invoice_status,
    d.source,
    d.feedback,
    ba.response_date
   FROM schsaf.tbl_invoice_header d
     JOIN schsaf.tbl_invoice ti ON ti.invoice_header_id = d.id
     JOIN schsaf.tbl_client pr ON pr.id = d.provider_id
     JOIN schsaf.tbl_client pa ON pa.id = d.payer_id
     JOIN schsaf.tbl_products_modalities pm ON pm.sequence = d.sequence
     JOIN schsaf.tbl_products pro ON pm.product_id = pro.id
     LEFT JOIN schsaf.tbl_disbursement_instruction di ON d.disbursement_instruction_id = di.id
     LEFT JOIN schsaf.tbl_bank_account b ON b.id = di.bank_account_id
     LEFT JOIN schsaf.tbl_bank_drafts ba ON ba.invoice_header_id = d.id
  GROUP BY d.application_number, pa.full_name, pa.document_number, pr.full_name, pr.document_number, di.third_party_full_name, di.third_party_document_number, pro.name, pm.modality, di.type, b.account_type, b.account_number, b.bank_name, ba.bank_draft_value, ba.gmf_value, d.invoices_upload_date, d.application_date, ba.application_date, d.rejecting_user, d.state, d.source, d.feedback, ba.response_date;


-- schsaf.view_disbursement_report source

CREATE OR REPLACE VIEW schsaf.view_disbursement_report
AS SELECT row_number() OVER () AS id,
    pa.id AS payer_id,
    pa.full_name AS payer_full_name,
    pa.document_number AS payer_document_number,
    pr.id AS provider_id,
    pr.full_name AS provider_full_name,
    pr.document_number AS provider_document_number,
    di.third_party_full_name,
    di.third_party_document_number,
    ti.number_svf AS factoring_obligation_number,
    d.application_number AS disbursement_record,
    pro.name AS product,
    pm.modality,
    di.type AS instruction_type,
    b.account_type,
    b.account_number,
    b.bank_name,
    ti.value AS original_value,
    ti.initial_discount AS discount_value,
    to2.tax_value AS gmf_value,
    ti.initial_disbursement_value AS disbursement_value,
    d.invoices_upload_date AS upload_date,
    d.application_date AS transfer_date,
    ba.application_date AS disbursement_date,
        CASE
            WHEN ba.application_date IS NOT NULL AND d.state::text = 'ENDED'::text THEN ti.new_discount
            ELSE NULL::double precision
        END AS new_discount_value,
        CASE
            WHEN ba.application_date IS NOT NULL AND d.state::text = 'ENDED'::text THEN ti.new_disbursement_value
            ELSE NULL::double precision
        END AS new_value_to_pay,
        CASE
            WHEN ba.application_date IS NOT NULL AND d.state::text = 'ENDED'::text THEN ti.new_pay_percentage
            ELSE NULL::double precision
        END AS new_pay_percentage,
    0.0 AS new_gmf_value,
    d.state AS invoice_status,
    d.feedback,
    d.rejecting_user,
    ti.total_due_date,
    ti.net_due_date,
    ba.response_date,
    ba.bank_draft_value
   FROM schsaf.tbl_invoice_header d
     JOIN schsaf.tbl_invoice ti ON ti.invoice_header_id = d.id
     JOIN schsaf.tbl_client pr ON pr.id = d.provider_id
     JOIN schsaf.tbl_client pa ON pa.id = d.payer_id
     JOIN schsaf.tbl_products_modalities pm ON pm.sequence = d.sequence
     JOIN schsaf.tbl_products pro ON pm.product_id = pro.id
     LEFT JOIN schsaf.tbl_disbursement_instruction di ON d.disbursement_instruction_id = di.id
     LEFT JOIN schsaf.tbl_bank_account b ON b.id = di.bank_account_id
     LEFT JOIN schsaf.tbl_bank_drafts ba ON ba.invoice_header_id = d.id
     LEFT JOIN schsaf.tbl_obligation_invoice toi ON toi.invoice_id = ti.id
     LEFT JOIN schsaf.tbl_obligations to2 ON to2.id = toi.obligation_id;


-- schsaf.view_enriched_payment_type source

CREATE OR REPLACE VIEW schsaf.view_enriched_payment_type
AS SELECT tep.id,
    tep.document_number_beneficiary,
    tep.name_beneficiary,
    tep.payment_date,
    tep.process_time,
    COALESCE(
        CASE
            WHEN tep.payment_channel::text ~ '^[0-9]+$'::text THEN ( SELECT concat(ch.description, ' Cód ', ch.agreement_code) AS concat
               FROM schsaf.tbl_payment_channel ch
              WHERE ch.id = tep.payment_channel::integer
             LIMIT 1)
            ELSE NULL::text
        END, ( SELECT concat(ch.description, ' Cód ', ch.agreement_code) AS concat
           FROM schsaf.tbl_payment_channel ch
          WHERE ch.agreement_code::text = tep.payment_channel::text
         LIMIT 1), ( SELECT concat(ch.description, ' Cód ', ch.agreement_code) AS concat
           FROM schsaf.tbl_payment_channel ch
          WHERE ch.agreement_code::text = tep.type_agreement::text
         LIMIT 1)) AS payment_channel,
    tep.city,
    tep.payment_value,
        CASE
            WHEN tep.is_distributed = true THEN 'Distribuido'::character varying
            WHEN tep.type_enriched_payment::text = 'UNION'::text THEN 'Unificado'::character varying
            ELSE 'N/A'::character varying
        END AS process_type
   FROM schsaf.tbl_enriched_payment tep
  WHERE tep.response_code::text <> 'R06'::text AND tep.application_type::text = 'BY_INSTRUCTION'::text AND (tep.payment_state::text = ANY (ARRAY['PENDING'::character varying, 'PROCESSED'::character varying]::text[]))
  ORDER BY tep.id_enriched_payment_parent;


-- schsaf.view_financing_plan_detail source

CREATE OR REPLACE VIEW schsaf.view_financing_plan_detail
AS WITH planes AS (
         SELECT p.plan_code,
            p.state,
            max(p.updated_at) AS last_update
           FROM schsaf.tbl_financing_plan p
          WHERE p.state::text = ANY (ARRAY['APPROVED'::character varying::text, 'REJECTED'::character varying::text, 'PENDING_APPROVAL'::character varying::text, 'EXPIRED'::character varying::text])
          GROUP BY p.plan_code, p.state
        )
 SELECT tfp.id,
    tfp.acronym_id,
    tfp.plan_code,
    tfp.description,
    tfp.state,
    tfp.plan_grants_days_without_cost,
    tfp.days_granted_without_cost,
    tfp.plan_grants_days_with_cost,
    tfp.days_granted_with_cost,
    tfp.days_granted_type,
    tfp.days_granted_from_type,
    tfp.start_date,
    tfp.end_date,
    tfp.billing_period_type,
    tfp.fixed_billing_period_days,
    tfp.variable_billing_period_min_days,
    tfp.variable_billing_period_max_days,
    tfp.discount_percent,
    tfp.base_discount_days,
    tfp.payment_condition_id,
    tfp.min_discount_days,
    tfp.max_discount_days,
    tfp.agreed_rate_type,
    tfp.agreed_variable_rate_type,
    tfp.agreed_spread_rate,
    tfp.provider_net_term,
    tfp.has_discount_prompt_payment,
    tfp.prompt_payment_refund_percent_or_spread,
    tfp.prompt_payment_min_discount_days,
    tfp.prompt_payment_max_discount_days,
    tfp.prompt_payment_discount_rate,
    tfp.agreed_rate_type_additional,
    tfp.agreed_spread_rate_additional,
    tfp.agreed_variable_rate_type_additional,
    tfp.financing_total_term,
    tfp.created_at,
    tfp.updated_at,
    tfp.email,
    tc.id AS client_id,
    tc.document_number,
    tc.document_type,
    tc.full_name,
    tc.mdm_key,
    tp.id AS provider_id,
    tc.short_name,
    tc.verification_digit,
    tfppc.id AS id_payment_condition,
    tfppc.name AS payment_condition_name,
    tfppc.code AS payment_condition_code,
    tfp.provider_discount_calculus_type,
    tfp.prompt_payment_negotiated_rate_type,
    tfp.discount_factor_filename,
        CASE
            WHEN (( SELECT count(*) AS count
               FROM planes p3
              WHERE p3.plan_code::text = tfp.plan_code::text AND p3.state::text = 'APPROVED'::text AND tfp.state::text = 'REJECTED'::text)) > 0 THEN true
            WHEN (( SELECT count(*) AS count
               FROM planes p3
              WHERE p3.plan_code::text = tfp.plan_code::text AND p3.state::text = 'PENDING_APPROVAL'::text AND tfp.state::text = 'APPROVED'::text)) > 0 THEN true
            WHEN (( SELECT count(*) AS count
               FROM planes p3
              WHERE p3.plan_code::text = tfp.plan_code::text AND p3.state::text = 'EXPIRED'::text AND tfp.state::text = 'REJECTED'::text)) > 0 THEN true
            WHEN (( SELECT count(*) AS count
               FROM planes p3
              WHERE p3.plan_code::text = tfp.plan_code::text AND p3.state::text = 'EXPIRED'::text AND tfp.state::text = 'APPROVED'::text)) > 0 THEN true
            WHEN (( SELECT count(*) AS count
               FROM planes p3
              WHERE p3.plan_code::text = tfp.plan_code::text AND tfp.state::text <> 'PENDING_APPROVAL'::text AND tfp.state::text <> 'EXPIRED'::text)) = 1 THEN true
            ELSE false
        END AS is_editable,
    tfp.agreed_variable_rate_type_prompt_payment,
    tfp.is_sustainable_line
   FROM schsaf.tbl_financing_plan tfp
     JOIN schsaf.tbl_acronym ta ON tfp.acronym_id = ta.id
     JOIN schsaf.tbl_provider tp ON ta.provider_id = tp.id
     JOIN schsaf.tbl_client tc ON tp.client_id = tc.id
     JOIN schsaf.tbl_financing_plan_payment_condition tfppc ON tfp.payment_condition_id = tfppc.id
     JOIN planes p2 ON tfp.plan_code::text = p2.plan_code::text AND p2.last_update = tfp.updated_at
  WHERE tfp.state::text = ANY (ARRAY['APPROVED'::character varying::text, 'REJECTED'::character varying::text, 'PENDING_APPROVAL'::character varying::text, 'EXPIRED'::character varying::text]);


-- schsaf.view_financing_request_header source

CREATE MATERIALIZED VIEW schsaf.view_financing_request_header
TABLESPACE pg_default
AS SELECT frh.id,
    frh.filing_number,
    frh.client_id,
    client.full_name AS client_full_name,
    client.document_type AS client_document_type,
    client.document_number AS client_document_number,
    frh.counterpart_id,
    cp.name AS counterpart_full_name,
    cp.document_number AS counterpart_document_number,
    frh.factor_id,
    factor.full_name AS factor_full_name,
    factor.document_type AS factor_document_type,
    factor.document_number AS factor_document_number,
    frh.product_modality_id,
    pm.acronym,
    pm.product_id,
    pm.modality,
    pr.name AS product_name,
    frh.book_id,
    b.name AS book_name,
    b.code AS book_code,
    frh.factor_commission_percentage,
    frh.sofr_rate_percentage,
    frh.spread,
    frh.amortization_percentage,
    frh.remunerative_interest_percentage,
    frh.dppp_percentage,
    frh.provider_commission_percentage,
    frh.disbursement_instruction,
    frh.created_at,
    frh.created_by,
    frh.updated_at,
    frh.updated_by,
    frh.status,
    frh.impediment_reason,
    COALESCE(fci_summary.total_value_usd, 0::numeric) AS total_value_usd,
    COALESCE(fci_summary.total_negotiated_value, 0::numeric) AS total_negotiated_value,
    COALESCE(fci_summary.total_disbursement_value, 0::numeric) AS total_disbursement_value
   FROM schsaf.tbl_financing_request_header frh
     LEFT JOIN schsaf.tbl_client client ON frh.client_id = client.id
     LEFT JOIN schsaf.tbl_counterpart cp ON frh.counterpart_id = cp.id
     LEFT JOIN schsaf.tbl_client factor ON frh.factor_id = factor.id
     LEFT JOIN schsaf.tbl_products_modalities pm ON frh.product_modality_id = pm.id
     LEFT JOIN schsaf.tbl_products pr ON pm.product_id = pr.id
     LEFT JOIN schsaf.tbl_book b ON frh.book_id = b.id
     LEFT JOIN ( SELECT tbl_foreign_currency_invoice.financing_request_id,
            sum(tbl_foreign_currency_invoice.value_usd) AS total_value_usd,
            sum(tbl_foreign_currency_invoice.negotiated_value) AS total_negotiated_value,
            sum(tbl_foreign_currency_invoice.disbursement_value) AS total_disbursement_value
           FROM schsaf.tbl_foreign_currency_invoice
          GROUP BY tbl_foreign_currency_invoice.financing_request_id) fci_summary ON fci_summary.financing_request_id = frh.id
WITH DATA;

-- View indexes:
CREATE INDEX idx_view_book_id ON schsaf.view_financing_request_header USING btree (book_id);
CREATE INDEX idx_view_client_id ON schsaf.view_financing_request_header USING btree (client_id);
CREATE INDEX idx_view_counterpart_id ON schsaf.view_financing_request_header USING btree (counterpart_id);
CREATE INDEX idx_view_created_by ON schsaf.view_financing_request_header USING btree (created_by);
CREATE INDEX idx_view_factor_id ON schsaf.view_financing_request_header USING btree (factor_id);
CREATE INDEX idx_view_filing_number ON schsaf.view_financing_request_header USING btree (filing_number);
CREATE INDEX idx_view_product_modality_id ON schsaf.view_financing_request_header USING btree (product_modality_id);
CREATE INDEX idx_view_status ON schsaf.view_financing_request_header USING btree (status);
CREATE UNIQUE INDEX view_financing_request_header_id_idx ON schsaf.view_financing_request_header USING btree (id);


-- schsaf.view_gmf_report source

CREATE OR REPLACE VIEW schsaf.view_gmf_report
AS SELECT row_number() OVER () AS id,
    v.application_date,
    v.client_document_number,
    v.client_full_name,
    v.application_number,
    v.obligation_number,
    v.process,
    v.process_type,
    v.base_value,
    v.gmf_value,
    v.bank_draft_value,
    v.product,
    v.modality,
    v.currency
   FROM ( SELECT disbursement.application_date,
            disbursement.client_document_number,
            disbursement.client_full_name,
            disbursement.application_number,
            disbursement.obligation_number,
            disbursement.process,
            disbursement.process_type,
            disbursement.base_value,
            disbursement.gmf_value,
            disbursement.bank_draft_value,
            disbursement.product,
            disbursement.modality,
            disbursement.currency
           FROM ( SELECT tbd.application_date,
                    tba.customer_identification_number AS client_document_number,
                    tba.customer_name AS client_full_name,
                    tih.application_number,
                    'No aplica'::text AS obligation_number,
                    'Desembolso'::text AS process,
                    'Desembolso a tercero'::text AS process_type,
                    tbd.bank_draft_value + tbd.gmf_value AS base_value,
                    tbd.gmf_value,
                    tbd.bank_draft_value,
                    tp.name AS product,
                    tpm.modality,
                    tp.currency
                   FROM schsaf.tbl_bank_drafts tbd
                     LEFT JOIN schsaf.tbl_invoice_header tih ON tbd.invoice_header_id = tih.id
                     LEFT JOIN schsaf.tbl_disbursement_instruction tdi ON tih.disbursement_instruction_id = tdi.id
                     LEFT JOIN schsaf.tbl_bank_account tba ON tdi.bank_account_id = tba.id
                     LEFT JOIN schsaf.tbl_products_modalities tpm ON tih.sequence = tpm.sequence
                     LEFT JOIN schsaf.tbl_products tp ON tpm.product_id = tp.id
                  WHERE tbd.gmf_value > 0::numeric) disbursement
        UNION
         SELECT maintenance.application_date,
            maintenance.client_document_number,
            maintenance.client_full_name,
            maintenance.application_number,
            maintenance.obligation_number,
            maintenance.process,
            maintenance.process_type,
            maintenance.base_value,
            maintenance.gmf_value,
            maintenance.bank_draft_value,
            maintenance.product,
            maintenance.modality,
            maintenance.currency
           FROM ( SELECT devolucion.application_date,
                    devolucion.client_document_number,
                    devolucion.client_full_name,
                    devolucion.application_number,
                    devolucion.obligation_number,
                    devolucion.process,
                    devolucion.process_type,
                    devolucion.base_value,
                    devolucion.gmf_value,
                    devolucion.bank_draft_value,
                    devolucion.product,
                    devolucion.modality,
                    devolucion.currency
                   FROM ( SELECT tbm.application_date,
                            tba.customer_identification_number AS client_document_number,
                            tba.customer_name AS client_full_name,
                            tm.maintenance_consecutive AS application_number,
                            'No aplica'::text AS obligation_number,
                            'Mantenimiento'::text AS process,
                                CASE
                                    WHEN tpdt.description::text ~~ '%excedente%'::text THEN 'Devolución por excedente'::text
                                    WHEN tpdt.description::text ~~ '%error%'::text THEN 'Devolución por error de pago'::text
                                    ELSE NULL::text
                                END AS process_type,
                            tpd.shared_discount_value AS base_value,
                            tpd.gmf_value,
                            tbm.bank_draft_value,
                            'No aplica'::text AS product,
                            'No aplica'::text AS modality,
                            tp2.currency
                           FROM schsaf.tbl_bank_drafts_maintenance tbm
                             LEFT JOIN schsaf.tbl_maintenance tm ON tm.id = tbm.maintenance_id
                             LEFT JOIN schsaf.tbl_payback_drafts tpd ON tbm.maintenance_id = tpd.maintenance_id
                             LEFT JOIN schsaf.tbl_bank_account tba ON tba.id = tpd.bank_account
                             LEFT JOIN schsaf.tbl_payback_drafts_types tpdt ON tpd.payback_draft_type_id = tpdt.id
                             LEFT JOIN schsaf.tbl_maintenance_relationships tmr ON tmr.id_maintenance = tpd.maintenance_id
                             LEFT JOIN schsaf.tbl_payment tp2 ON tp2.id = tmr.id_relationship
                          WHERE tpd.maintenance_id = tbm.maintenance_id AND tbm.state::text = 'SUCCESSFUL'::text AND tpd.gmf_value > 0::numeric AND (tpdt.description::text = ANY (ARRAY['Valor a pagar por excedente de pago'::character varying::text, 'Valor a pagar por error de pago'::character varying::text]))) devolucion
                UNION
                 SELECT cxp.application_date,
                    cxp.client_document_number,
                    cxp.client_full_name,
                    cxp.application_number,
                    cxp.obligation_number,
                    cxp.process,
                    cxp.process_type,
                    cxp.base_value,
                    cxp.gmf_value,
                    cxp.bank_draft_value,
                    cxp.product,
                    cxp.modality,
                    cxp.currency
                   FROM ( SELECT tbm.application_date,
                            tba.customer_identification_number AS client_document_number,
                            tba.customer_name AS client_full_name,
                            tm.maintenance_consecutive AS application_number,
                            'No aplica'::text AS obligation_number,
                            'Mantenimiento'::text AS process,
                            'Giro CxP a tercero'::text AS process_type,
                            tap.paid_value + tap.gmf AS base_value,
                            tap.gmf AS gmf_value,
                            tbm.bank_draft_value,
                            'No aplica'::text AS product,
                            'No aplica'::text AS modality,
                            'No aplica'::text AS currency
                           FROM schsaf.tbl_bank_drafts_maintenance tbm
                             LEFT JOIN schsaf.tbl_maintenance tm ON tm.id = tbm.maintenance_id
                             LEFT JOIN schsaf.tbl_maintenance_relationships tmr ON tmr.id_maintenance = tbm.maintenance_id
                             LEFT JOIN schsaf.tbl_account_payable tap ON tap.id = tmr.id_relationship
                             LEFT JOIN schsaf.tbl_bank_account tba ON tba.id = tap.bank_account_id
                          WHERE tbm.state::text = 'SUCCESSFUL'::text AND tap.gmf > 0::numeric) cxp) maintenance
        UNION
         SELECT payment_application.application_date,
            payment_application.client_document_number,
            payment_application.client_full_name,
            payment_application.application_number,
            payment_application.obligation_number,
            payment_application.process,
            payment_application.process_type,
            payment_application.base_value,
            payment_application.gmf_value,
            payment_application.bank_draft_value,
            payment_application.product,
            payment_application.modality,
            payment_application.currency
           FROM ( SELECT date(tpd.created_at) AS application_date,
                    tc.document_number AS client_document_number,
                    tc.full_name AS client_full_name,
                    tpa.consecutive AS application_number,
                    ti.number_svf AS obligation_number,
                    'Aplicación de pago'::text AS process,
                    'Devolución Descuento DPP'::text AS process_type,
                    tpd.shared_discount_value AS base_value,
                    tpd.gmf_value,
                    tpd.shared_discount_value - (tpd.rft_value + tpd.gmf_value) AS bank_draft_value,
                    tp.name AS product,
                    tpm.modality,
                    tp.currency
                   FROM schsaf.tbl_payback_drafts tpd
                     LEFT JOIN schsaf.tbl_payback_drafts_types tpdt ON tpdt.id = tpd.payback_draft_type_id
                     LEFT JOIN schsaf.tbl_client tc ON tc.id = tpd.client_id
                     LEFT JOIN schsaf.tbl_payment_instruction tpi ON tpi.id = tpd.payment_instruction_id
                     LEFT JOIN schsaf.tbl_payment_application tpa ON tpa.id = tpi.payment_application_id
                     LEFT JOIN schsaf.tbl_obligations to2 ON to2.id = tpi.obligation_id
                     LEFT JOIN schsaf.tbl_obligation_invoice toi ON toi.obligation_id = to2.id
                     LEFT JOIN schsaf.tbl_invoice ti ON ti.id = toi.invoice_id
                     LEFT JOIN schsaf.tbl_invoice_header tih ON tih.id = ti.invoice_header_id
                     LEFT JOIN schsaf.tbl_products_modalities tpm ON tpm.sequence = tih.sequence
                     LEFT JOIN schsaf.tbl_products tp ON tp.id = tpm.product_id
                  WHERE tpdt.description::text = 'Valor a pagar por el descuento compartido'::text) payment_application
        UNION
         SELECT payment_application_annulment.application_date,
            payment_application_annulment.client_document_number,
            payment_application_annulment.client_full_name,
            payment_application_annulment.application_number,
            payment_application_annulment.obligation_number,
            payment_application_annulment.process,
            payment_application_annulment.process_type,
            payment_application_annulment.base_value,
            payment_application_annulment.gmf_value,
            payment_application_annulment.bank_draft_value,
            payment_application_annulment.product,
            payment_application_annulment.modality,
            payment_application_annulment.currency
           FROM ( SELECT date(tpaa.created_at) AS application_date,
                    tc.document_number AS client_document_number,
                    tc.full_name AS client_full_name,
                    tpa.consecutive AS application_number,
                    ti.number_svf AS obligation_number,
                    'Aplicación de pago'::text AS process,
                    'Anulación Devolución Descuento DPP'::text AS process_type,
                    tpd.shared_discount_value AS base_value,
                    tpd.gmf_value,
                    tpd.shared_discount_value - (tpd.rft_value + tpd.gmf_value) AS bank_draft_value,
                    tp.name AS product,
                    tpm.modality,
                    tp.currency
                   FROM schsaf.tbl_payback_drafts tpd
                     LEFT JOIN schsaf.tbl_payback_drafts_types tpdt ON tpdt.id = tpd.payback_draft_type_id
                     LEFT JOIN schsaf.tbl_client tc ON tc.id = tpd.client_id
                     LEFT JOIN schsaf.tbl_payment_instruction tpi ON tpi.id = tpd.payment_instruction_id
                     LEFT JOIN schsaf.tbl_payment_application tpa ON tpa.id = tpi.payment_application_id
                     LEFT JOIN schsaf.tbl_payment_application_annulment tpaa ON tpaa.id_payment_application = tpa.id
                     LEFT JOIN schsaf.tbl_obligations to2 ON to2.id = tpi.obligation_id
                     LEFT JOIN schsaf.tbl_obligation_invoice toi ON toi.obligation_id = to2.id
                     LEFT JOIN schsaf.tbl_invoice ti ON ti.id = toi.invoice_id
                     LEFT JOIN schsaf.tbl_invoice_header tih ON tih.id = ti.invoice_header_id
                     LEFT JOIN schsaf.tbl_products_modalities tpm ON tpm.sequence = tih.sequence
                     LEFT JOIN schsaf.tbl_products tp ON tp.id = tpm.product_id
                  WHERE tpdt.description::text = 'Valor a pagar por el descuento compartido'::text AND tpd.state::text = 'ANNULLED'::text) payment_application_annulment) v
  ORDER BY v.process, v.application_number, v.obligation_number, v.process_type DESC;


-- schsaf.view_groups_report source

CREATE OR REPLACE VIEW schsaf.view_groups_report
AS SELECT row_number() OVER () AS id,
    tsg.description,
    tso.name AS option,
    tsg.state,
    tsg.id AS system_group_id,
    tsa.id AS system_action_id,
    tsa.name AS system_action_description,
    tso.id AS system_option_id,
    tsoa.url AS system_url
   FROM schsaf.tbl_system_groups tsg
     JOIN schsaf.tbl_system_privileges tsp ON tsg.id = tsp.system_group_id
     JOIN schsaf.tbl_system_options_actions tsoa ON tsp.system_option_action_id = tsoa.id
     JOIN schsaf.tbl_system_actions tsa ON tsa.id = tsoa.system_action_id
     JOIN schsaf.tbl_system_options tso ON tsoa.system_option_id = tso.id;


-- schsaf.view_historical_usury_rate_report source

CREATE OR REPLACE VIEW schsaf.view_historical_usury_rate_report
AS SELECT r.id,
    r.value_usury_rate AS legal_rate,
    r.value_point_slack AS slack_point,
    r.value AS factoring_rate,
        CASE
            WHEN now() >= r.start_date AND now() <= r.end_date AND r.status::text = 'APPROVED'::text THEN 'CURRENT'::text::character varying
            WHEN now() > r.end_date AND (r.status::text = ANY (ARRAY['APPROVED'::character varying::text, 'PENDING_APPROVAL'::character varying::text])) THEN 'EXPIRED'::text::character varying
            ELSE r.status
        END AS state,
    r.status AS state_2,
    r.start_date,
    r.end_date,
    r.rate_type_id,
    trt.type_code,
    r.created AS created_date,
    trt.indicator AS rate_type,
    tp.name AS periodicity,
    r.executor_user,
    r.approver_user,
    r.updated,
    r.approved_date
   FROM schsaf.tbl_rate r
     JOIN schsaf.tbl_rate_type trt ON trt.id = r.rate_type_id
     LEFT JOIN schsaf.tbl_periodicity tp ON tp.id = trt.periodicity_id;


-- schsaf.view_info_quota_factoring source

CREATE OR REPLACE VIEW schsaf.view_info_quota_factoring
AS SELECT row_number() OVER () AS id,
    quota_filter.client_id,
    quota_filter.client_document,
    quota_filter.client_name,
    quota_filter.global_id,
    quota_filter.global_name,
    quota_filter.global_act_number,
    quota_filter.created_at_global,
    quota_filter.quota_product_id,
    quota_filter.product_id,
    quota_filter.product_name,
    quota_filter.extra_id,
    quota_filter.extra_name,
    quota_filter.extra_type_id,
    quota_filter.extra_type_name,
    quota_filter.created_at_product,
    quota_filter.modality_id,
    quota_filter.modality_name,
    quota_filter.limit_value,
    quota_filter.consumed_value,
    quota_filter.available_value,
    quota_filter.start_date,
    quota_filter.end_date,
    quota_filter.status,
    quota_filter.updated_at,
    quota_filter.created_at_extra
   FROM ( SELECT tc.id AS client_id,
            tc.document_number AS client_document,
            tc.full_name AS client_name,
            tqg.id AS global_id,
            'GLOBAL_LIMIT'::text AS global_name,
            tqg.act_number AS global_act_number,
            NULL::bigint AS quota_product_id,
            NULL::bigint AS product_id,
            NULL::text AS product_name,
            NULL::bigint AS extra_id,
            NULL::text AS extra_name,
            NULL::bigint AS extra_type_id,
            NULL::text AS extra_type_name,
            NULL::bigint AS modality_id,
            NULL::text AS modality_name,
            tqg.value AS limit_value,
            NULL::bigint AS consumed_value,
            NULL::bigint AS available_value,
            tqg.start_date,
            tqg.end_date,
            tqg.created_at AS created_at_global,
            NULL::timestamp without time zone AS created_at_product,
            1 AS "order",
                CASE
                    WHEN CURRENT_DATE > tqg.end_date THEN 'VENCIDO'::text
                    ELSE
                    CASE
                        WHEN (( SELECT count(tcb.state) AS count
                           FROM schsaf.tbl_client_blocks tcb
                          WHERE tcb.state::text = 'BLOCKED'::text AND tcb.client_id = tqg.client_id)) > 0 THEN 'BLOQUEADO'::text
                        ELSE 'VIGENTE'::text
                    END
                END AS status,
            tqg.updated_at,
            NULL::timestamp without time zone AS created_at_extra
           FROM schsaf.tbl_quota_global tqg
             JOIN schsaf.tbl_client tc ON tc.id = tqg.client_id
             JOIN ( SELECT viqfh.global_id
                   FROM schsaf.view_info_quota_factoring_histories viqfh
                     JOIN ( SELECT view_info_quota_factoring_histories.client_id,
                            max(view_info_quota_factoring_histories.created_at_global) AS created_at_global
                           FROM schsaf.view_info_quota_factoring_histories
                          GROUP BY view_info_quota_factoring_histories.client_id) max_date ON viqfh.client_id = max_date.client_id AND viqfh.created_at_global = max_date.created_at_global) subquery ON subquery.global_id = tqg.id
        UNION ALL
         SELECT tc.id AS client_id,
            tc.document_number AS client_document,
            tc.full_name AS client_name,
            tqg.id AS global_id,
            NULL::text AS global_name,
            tqg.act_number AS global_act_number,
            tqp.id AS quota_product_id,
            tp.id AS product_id,
            tp.name AS product_name,
            NULL::bigint AS extra_id,
            NULL::text AS extra_name,
            NULL::bigint AS extra_type_id,
            NULL::text AS extra_type_name,
            tpm.id AS modality_id,
            tpm.modality,
            tqp.value AS limit_value,
                CASE
                    WHEN tpm.acronym::text = 'PLT'::text THEN (( SELECT sum(tqpp.consumed_value) AS sum
                       FROM schsaf.tbl_quota_product_providers tqpp
                      WHERE tqpp.quota_product_id = tqp.id AND tqpp.delete_at IS NULL))::bigint
                    ELSE tqp.consumed_value
                END AS consumed_value,
                CASE
                    WHEN tpm.acronym::text = 'PLT'::text THEN (( SELECT sum(tqpp.available_value) AS sum
                       FROM schsaf.tbl_quota_product_providers tqpp
                      WHERE tqpp.quota_product_id = tqp.id AND tqpp.delete_at IS NULL))::bigint
                    ELSE tqp.available_value
                END AS available_value,
            tqp.start_date,
            tqp.end_date,
            NULL::timestamp without time zone AS created_at_global,
            tqp.created_at AS created_at_product,
            2 AS "order",
                CASE
                    WHEN CURRENT_DATE > tqp.end_date THEN 'VENCIDO'::text
                    ELSE
                    CASE
                        WHEN (( SELECT count(tcb.state) AS count
                           FROM schsaf.tbl_client_blocks tcb
                          WHERE tcb.state::text = 'BLOCKED'::text AND tcb.client_id = tqg.client_id)) > 0 THEN 'BLOQUEADO'::text
                        ELSE 'VIGENTE'::text
                    END
                END AS status,
            tqp.update_at AS updated_at,
            NULL::timestamp without time zone AS created_at_extra
           FROM schsaf.tbl_quota_product tqp
             JOIN schsaf.tbl_products_modalities tpm ON tpm.id = tqp.product_modality_id
             JOIN schsaf.tbl_products tp ON tp.id = tpm.product_id
             JOIN schsaf.tbl_quota_global tqg ON tqp.quota_global_id = tqg.id
             JOIN schsaf.tbl_client tc ON tc.id = tqg.client_id
             JOIN ( SELECT viqfh.global_id
                   FROM schsaf.view_info_quota_factoring_histories viqfh
                     JOIN ( SELECT view_info_quota_factoring_histories.client_id,
                            max(view_info_quota_factoring_histories.created_at_global) AS created_at_global
                           FROM schsaf.view_info_quota_factoring_histories
                          GROUP BY view_info_quota_factoring_histories.client_id) max_date ON viqfh.client_id = max_date.client_id AND viqfh.created_at_global = max_date.created_at_global) subquery ON subquery.global_id = tqg.id
          WHERE tqp.delete_at IS NULL AND (tqp.extra_new_client IS FALSE OR tqp.extra_new_client IS NULL)
        UNION ALL
         SELECT DISTINCT ON (tqet.description, tqp.id) tc.id AS client_id,
            tc.document_number AS client_document,
            tc.full_name AS client_name,
            tqg.id AS global_id,
            NULL::text AS global_name,
            tqg.act_number AS global_act_number,
            tqp.id AS quota_product_id,
            tp.id AS product_id,
            tp.name AS product_name,
            tqe.id AS extra_id,
            'EXTRA_LIMIT'::text AS extra_name,
            tqet.id AS extra_type_id,
            tqet.description AS extra_type_name,
            tpm.id AS modality_id,
            tpm.modality,
                CASE
                    WHEN tpm.acronym::text = 'PLT'::text AND tqet.id = 2 THEN (( SELECT sum(tqe1.value) AS sum
                       FROM schsaf.tbl_quota_extra tqe1
                      WHERE tqe1.quota_product_id = tqp.id AND tqe1.quota_product_provider_id IS NOT NULL AND tqe1.quota_extra_type_id = 2 AND CURRENT_TIMESTAMP <= tqe1.end_date OR tqe1.quota_product_id = tqp.id AND tqe1.quota_product_provider_id IS NOT NULL AND tqe1.quota_extra_type_id = 2 AND tqe1.consumed_value > 0))::bigint
                    WHEN tpm.acronym::text = 'PLT'::text AND tqet.id = 3 THEN (( SELECT sum(tqe1.value) AS sum
                       FROM schsaf.tbl_quota_extra tqe1
                      WHERE tqe1.quota_product_id = tqp.id AND tqe1.quota_product_provider_id IS NOT NULL AND tqe1.quota_extra_type_id = 3 AND CURRENT_TIMESTAMP <= tqe1.end_date OR tqe1.quota_product_id = tqp.id AND tqe1.quota_product_provider_id IS NOT NULL AND tqe1.quota_extra_type_id = 3 AND tqe1.consumed_value > 0))::bigint
                    ELSE tqe.value
                END AS limit_value,
                CASE
                    WHEN tpm.acronym::text = 'PLT'::text AND tqet.id = 1 THEN (( SELECT sum(tqpp.consumed_value) AS sum
                       FROM schsaf.tbl_quota_product_providers tqpp
                      WHERE tqpp.quota_product_id = tqe.quota_product_id AND tqe.quota_product_provider_id IS NULL))::bigint
                    WHEN tpm.acronym::text = 'PLT'::text AND tqet.id = 2 THEN (( SELECT sum(tqe1.consumed_value) AS sum
                       FROM schsaf.tbl_quota_extra tqe1
                      WHERE tqe1.quota_product_id = tqp.id AND tqe1.quota_product_provider_id IS NOT NULL AND tqe1.quota_extra_type_id = 2 AND CURRENT_TIMESTAMP <= tqe1.end_date OR tqe1.quota_product_id = tqp.id AND tqe1.quota_product_provider_id IS NOT NULL AND tqe1.quota_extra_type_id = 2 AND tqe1.consumed_value > 0))::bigint
                    WHEN tpm.acronym::text = 'PLT'::text AND tqet.id = 3 THEN (( SELECT sum(tqe1.consumed_value) AS sum
                       FROM schsaf.tbl_quota_extra tqe1
                      WHERE tqe1.quota_product_id = tqp.id AND tqe1.quota_product_provider_id IS NOT NULL AND tqe1.quota_extra_type_id = 3 AND CURRENT_TIMESTAMP <= tqe1.end_date OR tqe1.quota_product_id = tqp.id AND tqe1.quota_product_provider_id IS NOT NULL AND tqe1.quota_extra_type_id = 3 AND tqe1.consumed_value > 0))::bigint
                    ELSE tqe.consumed_value
                END AS consumed_value,
                CASE
                    WHEN tpm.acronym::text = 'PLT'::text AND tqet.id = 1 THEN (( SELECT sum(tqpp.available_value) AS sum
                       FROM schsaf.tbl_quota_product_providers tqpp
                      WHERE tqpp.quota_product_id = tqe.quota_product_id AND tqe.quota_product_provider_id IS NULL))::bigint
                    WHEN tpm.acronym::text = 'PLT'::text AND tqet.id = 2 THEN (( SELECT sum(tqe1.available_value) AS sum
                       FROM schsaf.tbl_quota_extra tqe1
                      WHERE tqe1.quota_product_id = tqp.id AND tqe1.quota_product_provider_id IS NOT NULL AND tqe1.quota_extra_type_id = 2 AND CURRENT_TIMESTAMP <= tqe1.end_date OR tqe1.quota_product_id = tqp.id AND tqe1.quota_product_provider_id IS NOT NULL AND tqe1.quota_extra_type_id = 2 AND tqe1.consumed_value > 0))::bigint
                    WHEN tpm.acronym::text = 'PLT'::text AND tqet.id = 3 THEN (( SELECT sum(tqe1.available_value) AS sum
                       FROM schsaf.tbl_quota_extra tqe1
                      WHERE tqe1.quota_product_id = tqp.id AND tqe1.quota_product_provider_id IS NOT NULL AND tqe1.quota_extra_type_id = 3 AND CURRENT_TIMESTAMP <= tqe1.end_date OR tqe1.quota_product_id = tqp.id AND tqe1.quota_product_provider_id IS NOT NULL AND tqe1.quota_extra_type_id = 3 AND tqe1.consumed_value > 0))::bigint
                    ELSE tqe.available_value
                END AS available_value,
            tqe.start_date,
            tqe.end_date,
            NULL::timestamp without time zone AS created_at_global,
            tqp.created_at AS created_at_product,
            3 AS "order",
                CASE
                    WHEN tqe.quota_extra_type_id = 3 AND now() > tqe.end_date THEN 'VENCIDO'::text
                    WHEN (tqe.quota_extra_type_id = ANY (ARRAY[1::bigint, 2::bigint])) AND CURRENT_DATE > tqe.end_date::date THEN 'VENCIDO'::text
                    ELSE
                    CASE
                        WHEN (( SELECT count(tcb.state) AS count
                           FROM schsaf.tbl_client_blocks tcb
                          WHERE tcb.state::text = 'BLOCKED'::text AND tcb.client_id = tqg.client_id)) > 0 THEN 'BLOQUEADO'::text
                        ELSE 'VIGENTE'::text
                    END
                END AS status,
            tqp.update_at AS updated_at,
            tqe.created_at AS created_at_extra
           FROM schsaf.tbl_quota_extra tqe
             JOIN schsaf.tbl_quota_product tqp ON tqe.quota_product_id = tqp.id
             JOIN schsaf.tbl_quota_extra_type tqet ON tqe.quota_extra_type_id = tqet.id
             JOIN schsaf.tbl_products_modalities tpm ON tpm.id = tqp.product_modality_id
             JOIN schsaf.tbl_products tp ON tp.id = tpm.product_id
             JOIN schsaf.tbl_quota_global tqg ON tqp.quota_global_id = tqg.id
             JOIN schsaf.tbl_client tc ON tc.id = tqg.client_id
             JOIN ( SELECT viqfh.global_id
                   FROM schsaf.view_info_quota_factoring_histories viqfh
                     JOIN ( SELECT view_info_quota_factoring_histories.client_id,
                            max(view_info_quota_factoring_histories.created_at_global) AS created_at_global
                           FROM schsaf.view_info_quota_factoring_histories
                          GROUP BY view_info_quota_factoring_histories.client_id) max_date ON viqfh.client_id = max_date.client_id AND viqfh.created_at_global = max_date.created_at_global) subquery ON subquery.global_id = tqg.id
          WHERE (CURRENT_TIMESTAMP <= tqe.end_date OR tqe.consumed_value > 0) AND (tqe.quota_extra_type_id = ANY (ARRAY[2::bigint, 3::bigint])) OR (CURRENT_TIMESTAMP <= tqe.end_date OR tqe.consumed_value > 0) AND (( SELECT tqp2.extra_new_client
                   FROM schsaf.tbl_quota_product tqp2
                  WHERE tqp2.id = tqe.quota_product_id)) = true) quota_filter
  ORDER BY quota_filter.global_id, quota_filter."order", quota_filter.extra_type_id;


-- schsaf.view_info_quota_factoring_histories source

CREATE OR REPLACE VIEW schsaf.view_info_quota_factoring_histories
AS SELECT row_number() OVER () AS id,
    quota_filter.client_id,
    quota_filter.client_document,
    quota_filter.client_name,
    quota_filter.global_id,
    quota_filter.global_name,
    quota_filter.global_act_number,
    quota_filter.created_at_global,
    quota_filter.quota_product_id,
    quota_filter.product_id,
    quota_filter.product_name,
    quota_filter.extra_id,
    quota_filter.extra_name,
    quota_filter.extra_type_id,
    quota_filter.extra_type_name,
    quota_filter.created_at_product,
    quota_filter.modality_id,
    quota_filter.modality_name,
    quota_filter.limit_value,
    quota_filter.consumed_value,
    quota_filter.available_value,
    quota_filter.start_date,
    quota_filter.end_date,
    quota_filter.status,
    quota_filter.updated_at
   FROM ( SELECT tc.id AS client_id,
            tc.document_number AS client_document,
            tc.full_name AS client_name,
            tqg.id AS global_id,
            'GLOBAL_LIMIT'::text AS global_name,
            tqg.act_number AS global_act_number,
            NULL::bigint AS quota_product_id,
            NULL::bigint AS product_id,
            NULL::text AS product_name,
            NULL::bigint AS extra_id,
            NULL::text AS extra_name,
            NULL::bigint AS extra_type_id,
            NULL::text AS extra_type_name,
            NULL::bigint AS modality_id,
            NULL::text AS modality_name,
            tqg.value AS limit_value,
            NULL::bigint AS consumed_value,
            NULL::bigint AS available_value,
            tqg.start_date,
            tqg.end_date,
            tqg.created_at AS created_at_global,
            NULL::timestamp without time zone AS created_at_product,
            1 AS "order",
                CASE
                    WHEN CURRENT_DATE <= tqg.end_date THEN 'VIGENTE'::text
                    ELSE 'VENCIDO'::text
                END AS status,
            tqg.updated_at
           FROM schsaf.tbl_quota_global tqg
             JOIN schsaf.tbl_client tc ON tc.id = tqg.client_id
        UNION ALL
         SELECT tc.id AS client_id,
            tc.document_number AS client_document,
            tc.full_name AS client_name,
            tqg.id AS global_id,
            NULL::text AS global_name,
            tqg.act_number AS global_act_number,
            tqp.id AS quota_product_id,
            tp.id AS product_id,
            tp.name AS product_name,
            NULL::bigint AS extra_id,
            NULL::text AS extra_name,
            NULL::bigint AS extra_type_id,
            NULL::text AS extra_type_name,
            tpm.id AS modality_id,
            tpm.modality,
            tqp.value AS limit_value,
            tqp.consumed_value,
            tqp.available_value,
            tqp.start_date,
            tqp.end_date,
            NULL::timestamp without time zone AS created_at_global,
            tqp.created_at AS created_at_product,
            2 AS "order",
                CASE
                    WHEN tqp.delete_at IS NOT NULL THEN 'ELIMINADO'::text
                    WHEN CURRENT_DATE <= tqp.end_date THEN 'VIGENTE'::text
                    ELSE 'VENCIDO'::text
                END AS status,
            tqp.update_at AS updated_at
           FROM schsaf.tbl_quota_product tqp
             JOIN schsaf.tbl_products_modalities tpm ON tpm.id = tqp.product_modality_id
             JOIN schsaf.tbl_products tp ON tp.id = tpm.product_id
             JOIN schsaf.tbl_quota_global tqg ON tqp.quota_global_id = tqg.id
             JOIN schsaf.tbl_client tc ON tc.id = tqg.client_id
        UNION ALL
         SELECT tc.id AS client_id,
            tc.document_number AS client_document,
            tc.full_name AS client_name,
            tqg.id AS global_id,
            NULL::text AS global_name,
            tqg.act_number AS global_act_number,
            tqp.id AS quota_product_id,
            tp.id AS product_id,
            tp.name AS product_name,
            tqe.id AS extra_id,
            'EXTRA_LIMIT'::text AS extra_name,
            tqet.id AS extra_type_id,
            tqet.description AS extra_type_name,
            tpm.id AS modality_id,
            tpm.modality,
            tqe.value AS limit_value,
            tqe.consumed_value,
            tqe.available_value,
            tqe.start_date,
            tqe.end_date,
            NULL::timestamp without time zone AS created_at_global,
            tqp.created_at AS created_at_product,
            3 AS "order",
                CASE
                    WHEN CURRENT_DATE <= tqe.end_date THEN 'VIGENTE'::text
                    ELSE 'VENCIDO'::text
                END AS status,
            tqp.update_at AS updated_at
           FROM schsaf.tbl_quota_extra tqe
             JOIN schsaf.tbl_quota_product tqp ON tqe.quota_product_id = tqp.id
             JOIN schsaf.tbl_quota_extra_type tqet ON tqe.quota_extra_type_id = tqet.id
             JOIN schsaf.tbl_products_modalities tpm ON tpm.id = tqp.product_modality_id
             JOIN schsaf.tbl_products tp ON tp.id = tpm.product_id
             JOIN schsaf.tbl_quota_global tqg ON tqp.quota_global_id = tqg.id
             JOIN schsaf.tbl_client tc ON tc.id = tqg.client_id
          WHERE CURRENT_DATE <= tqe.end_date) quota_filter
  ORDER BY quota_filter.global_id, quota_filter."order";


-- schsaf.view_maintenance_detail source

CREATE OR REPLACE VIEW schsaf.view_maintenance_detail
AS SELECT tmed.id,
    tme.id AS maintenance_id,
    tme.state,
    tme.created_at,
    tme.updated_at,
    tme.maintenance_consecutive,
    tmed.value,
    COALESCE(tmt2.code_type, tmt.code_type) AS code_type,
    COALESCE(tmt2.name, tmt.name) AS maintenance_type,
    tmc.name AS maintenance_causal,
    COALESCE(tmct2.category_code, tmct.category_code) AS category_code,
    tme.is_massive
   FROM schsaf.tbl_maintenance tme
     LEFT JOIN schsaf.tbl_maintenance_causal tmc ON tme.id_maintenance_causal = tmc.id
     LEFT JOIN schsaf.tbl_maintenance_detail tmed ON tme.id = tmed.id_maintenance
     LEFT JOIN schsaf.tbl_maintenance_type tmt ON tmed.id_maintenance_type = tmt.id
     LEFT JOIN schsaf.tbl_maintenance_category_type tmct ON tmct.id = tmt.maintenance_category_type_id
     LEFT JOIN schsaf.tbl_maintenance_type tmt2 ON tme.id_maintenance_type = tmt2.id
     LEFT JOIN schsaf.tbl_maintenance_category_type tmct2 ON tmct2.id = tmt2.maintenance_category_type_id;


-- schsaf.view_maintenance_detail_complete source

CREATE OR REPLACE VIEW schsaf.view_maintenance_detail_complete
AS SELECT tm.id AS id_maintenance,
    tm.id_maintenance_causal,
    tm.state,
    tm.created_at,
    tm.executer_user,
    tm.approver_user,
    tm.maintenance_consecutive,
    tmd.id AS id_detail,
    COALESCE(tmd.id_maintenance_type, tm.id_maintenance_type) AS id_maintenance_type,
    tmd.value,
    COALESCE(tmr.id, tms.obligation_id) AS id_maintenance_relationships,
    COALESCE(tmr.id_relationship, tms.obligation_id) AS id_relationship,
    tmr.id_new_obligation,
    tmr.table_name,
    COALESCE(tmt.name, tmt2.name) AS name_type,
    COALESCE(tmt.code_type, tmt2.code_type) AS code_type,
    COALESCE(tmct.name, tmct2.name) AS name_category_type,
    COALESCE(tmct.category_code, tmct2.category_code) AS category_code,
    tpd.bank_account AS id_bank_account,
        CASE
            WHEN tmr.table_name::text = 'tbl_payments'::text THEN ( SELECT tbl_payment.nit_beneficiary
               FROM schsaf.tbl_payment
              WHERE tbl_payment.id = tmr.id_relationship)
            WHEN tmr.table_name::text = 'tbl_payback_drafts'::text AND tpm.refund_by_prepayment::text = 'Proveedor'::text THEN ( SELECT tbl_client.document_number
               FROM schsaf.tbl_client
              WHERE tbl_client.id = tbr.provider_id)
            ELSE ( SELECT tbl_client.document_number
               FROM schsaf.tbl_client
              WHERE tbl_client.id = tbr.payer_id)
        END AS id_beneficiary,
        CASE
            WHEN tmr.table_name::text = 'tbl_payments'::text THEN ( SELECT tc3.short_name
               FROM schsaf.tbl_payment tp3
                 JOIN schsaf.tbl_client tc3 ON tc3.document_number::text = tp3.nit_beneficiary::text
              WHERE tp3.id = tmr.id_relationship)
            WHEN tmr.table_name::text = 'tbl_payback_drafts'::text AND tpm.refund_by_prepayment::text = 'Proveedor'::text THEN ( SELECT tbl_client.short_name
               FROM schsaf.tbl_client
              WHERE tbl_client.id = tbr.provider_id)
            ELSE ( SELECT tbl_client.short_name
               FROM schsaf.tbl_client
              WHERE tbl_client.id = tbr.payer_id)
        END AS beneficiary_name,
    tpm.refund_by_prepayment,
    tc.document_number,
    tc.short_name,
    tpd.gmf_value,
    tpd.rft_value,
    tm.updated_at,
        CASE
            WHEN tmr.table_name::text = 'tbl_payments'::text THEN tpd.payback_draft_value
            WHEN tmr.table_name::text = 'tbl_payback_drafts'::text THEN tpd.shared_discount_value - tpd.rft_value - tpd.gmf_value
            ELSE NULL::numeric
        END AS value_to_pay,
    tba.account_number,
    tba.account_name,
    tba.account_type,
    tba.bank_name,
    tba.customer_identification_number,
    tba.customer_name,
        CASE
            WHEN tmr.table_name::text = 'tbl_payments'::text THEN ( SELECT tp2.value_pending_application
               FROM schsaf.tbl_payment tp2
              WHERE tp2.id = tmr.id_relationship)
            WHEN tmr.table_name::text = 'tbl_payback_drafts'::text THEN tpd.payback_draft_value
            ELSE NULL::numeric
        END AS value_pending_to_refund,
    tpd.shared_discount_value AS value_without_deductibles
   FROM schsaf.tbl_maintenance tm
     LEFT JOIN schsaf.tbl_maintenance_detail tmd ON tm.id = tmd.id_maintenance AND tm.id_maintenance_type IS NULL
     LEFT JOIN schsaf.tbl_maintenance_type tmt2 ON tm.id_maintenance_type = tmt2.id
     LEFT JOIN schsaf.tbl_maintenance_relationships tmr ON tm.id = tmr.id_maintenance
     LEFT JOIN schsaf.tbl_maintenance_type tmt ON tmd.id_maintenance_type = tmt.id
     LEFT JOIN schsaf.tbl_maintenance_category_type tmct ON tmt.maintenance_category_type_id = tmct.id
     LEFT JOIN schsaf.tbl_maintenance_category_type tmct2 ON tmt2.maintenance_category_type_id = tmct2.id
     LEFT JOIN schsaf.tbl_payback_drafts tpd ON tpd.id = tmr.id_relationship
     LEFT JOIN schsaf.tbl_client tc ON tpd.client_id = tc.id
     LEFT JOIN schsaf.tbl_payment_instruction tpi ON tpd.payment_instruction_id = tpi.id
     LEFT JOIN schsaf.tbl_bank_account tba ON tpd.bank_account = tba.id
     LEFT JOIN schsaf.tbl_obligations to2 ON tpi.obligation_id = to2.id
     LEFT JOIN schsaf.tbl_business_relationships tbr ON to2.business_relationship_id = tbr.id
     LEFT JOIN schsaf.tbl_products_modalities tpm ON tbr.productmodality_id = tpm.id
     LEFT JOIN schsaf.tbl_maintenance_special tms ON tms.maintenance_id = tm.id
  ORDER BY tm.id DESC;


-- schsaf.view_maintenance_info source

CREATE OR REPLACE VIEW schsaf.view_maintenance_info
AS SELECT tm.id,
    tm.created_at,
    tm.executer_user,
    tm.approver_user,
    tm.maintenance_consecutive,
    tm.state,
    tm.id_maintenance_causal,
    mc.id AS id_causal,
    mc.name AS name_causal,
        CASE
            WHEN tmt.maintenance_category_type_id IS NULL THEN ( SELECT DISTINCT tmt2.maintenance_category_type_id
               FROM schsaf.tbl_maintenance_type tmt2
              WHERE (tmt2.id IN ( SELECT tmd.id_maintenance_type
                       FROM schsaf.tbl_maintenance_detail tmd
                      WHERE tmd.id_maintenance = tm.id
                     LIMIT 1)))
            ELSE tmt.maintenance_category_type_id
        END AS category_type_id,
        CASE
            WHEN tmct.category_code IS NULL THEN (( SELECT string_agg(DISTINCT tmct2.category_code::text, ', '::text) AS string_agg
               FROM schsaf.tbl_maintenance_category_type tmct2
              WHERE (tmct2.id IN ( SELECT DISTINCT tmt2.maintenance_category_type_id
                       FROM schsaf.tbl_maintenance_type tmt2
                      WHERE (tmt2.id IN ( SELECT tmd.id_maintenance_type
                               FROM schsaf.tbl_maintenance_detail tmd
                              WHERE tmd.id_maintenance = tm.id))))))::character varying
            ELSE tmct.category_code
        END AS category_code,
        CASE
            WHEN tmt.id IS NULL THEN ( SELECT DISTINCT tmt2.id
               FROM schsaf.tbl_maintenance_type tmt2
              WHERE (tmt2.id IN ( SELECT tmd.id_maintenance_type
                       FROM schsaf.tbl_maintenance_detail tmd
                      WHERE tmd.id_maintenance = tm.id
                     LIMIT 1)))
            ELSE tmt.id
        END AS id_type,
        CASE
            WHEN tmt.code_type IS NULL THEN ( SELECT DISTINCT tmt2.code_type
               FROM schsaf.tbl_maintenance_type tmt2
              WHERE (tmt2.id IN ( SELECT tmd.id_maintenance_type
                       FROM schsaf.tbl_maintenance_detail tmd
                      WHERE tmd.id_maintenance = tm.id
                     LIMIT 1)))
            ELSE tmt.code_type
        END AS code_maintenance_type,
        CASE
            WHEN tmt.name IS NULL THEN ( SELECT DISTINCT tmt2.name
               FROM schsaf.tbl_maintenance_type tmt2
              WHERE (tmt2.id IN ( SELECT tmd.id_maintenance_type
                       FROM schsaf.tbl_maintenance_detail tmd
                      WHERE tmd.id_maintenance = tm.id
                     LIMIT 1)))
            ELSE tmt.name
        END AS name_type,
    COALESCE(string_agg(DISTINCT tc2.full_name::text, ', '::text), string_agg(DISTINCT tc3.full_name::text, ', '::text), string_agg(DISTINCT tc4.full_name::text, ', '::text), string_agg(DISTINCT tc5.full_name::text, ', '::text), string_agg(DISTINCT tc6.full_name::text, ', '::text)) AS client_full_name,
    COALESCE(string_agg(DISTINCT tc2.document_number::text, ', '::text), string_agg(DISTINCT tc3.document_number::text, ', '::text), string_agg(DISTINCT tc4.document_number::text, ', '::text), string_agg(DISTINCT tc5.document_number::text, ', '::text), string_agg(DISTINCT tc6.document_number::text, ', '::text)) AS document_number,
    tm.is_massive
   FROM schsaf.tbl_maintenance tm
     LEFT JOIN schsaf.tbl_maintenance_causal mc ON mc.id = tm.id_maintenance_causal
     LEFT JOIN schsaf.tbl_maintenance_type tmt ON tmt.id = tm.id_maintenance_type
     LEFT JOIN schsaf.tbl_maintenance_category_type tmct ON tmct.id = tmt.maintenance_category_type_id
     LEFT JOIN schsaf.tbl_maintenance_relationships tmr2 ON tmr2.id_maintenance = tm.id AND tmr2.table_name::text = 'tbl_payback_drafts'::text
     LEFT JOIN schsaf.tbl_payback_drafts tpd ON tpd.id = tmr2.id_relationship
     LEFT JOIN schsaf.tbl_client tc2 ON tc2.id = tpd.client_id
     LEFT JOIN schsaf.tbl_maintenance_relationships tmr3 ON tmr3.id_maintenance = tm.id AND tmr3.table_name::text = 'tbl_payments'::text
     LEFT JOIN schsaf.tbl_payment p ON p.id = tmr3.id_relationship
     LEFT JOIN schsaf.tbl_client tc3 ON tc3.document_number::text = p.nit_beneficiary::text
     LEFT JOIN schsaf.tbl_maintenance_relationships tmr4 ON tmr4.id_maintenance = tm.id AND tmr4.table_name::text = 'tbl_account_payable'::text
     LEFT JOIN schsaf.tbl_account_payable tap ON tap.id = tmr4.id_relationship
     LEFT JOIN schsaf.tbl_client tc4 ON tc4.id = tap.client_id
     LEFT JOIN ( SELECT DISTINCT ON (tms_1.maintenance_id) tms_1.maintenance_id,
            tms_1.client_id
           FROM schsaf.tbl_maintenance_special tms_1
          ORDER BY tms_1.maintenance_id, tms_1.created_at DESC) tms ON tms.maintenance_id = tm.id
     LEFT JOIN schsaf.tbl_client tc5 ON tc5.id = tms.client_id
     LEFT JOIN ( SELECT DISTINCT ON (tmic_1.maintenance_id) tmic_1.maintenance_id,
            tmic_1.obligation_id
           FROM schsaf.tbl_maintenance_initial_condition tmic_1
          ORDER BY tmic_1.maintenance_id, tmic_1.created_at DESC) tmic ON tmic.maintenance_id = tm.id
     LEFT JOIN schsaf.tbl_obligations obl2 ON obl2.id = tmic.obligation_id
     LEFT JOIN schsaf.tbl_client tc6 ON tc6.id = obl2.client_id
  GROUP BY tm.id, tm.created_at, tm.executer_user, tm.approver_user, tm.maintenance_consecutive, tm.state, tm.id_maintenance_causal, mc.id, mc.name, tmt.maintenance_category_type_id, tmct.category_code, tmt.id, tmt.code_type, tmt.name, tm.is_massive
  ORDER BY tm.id DESC;


-- schsaf.view_maintenance_special_detail source

CREATE OR REPLACE VIEW schsaf.view_maintenance_special_detail
AS SELECT ms.id,
    ms.obligation_id,
    ms.client_id,
    ms.maintenance_id,
    ms.remunerative_interest,
    ms.moratorium_balance,
    ms.discount,
    ms.principal_balance,
    ms.reimbursement,
    ms.created_at,
    ms.updated_at,
    c.document_number AS nit_client,
    c.full_name AS client_name,
    m.created_at AS created_at_mtto,
    m.maintenance_consecutive,
    m.executer_user,
    m.approver_user,
    m.state,
    ms.remunerative_interest + ms.moratorium_balance + ms.discount + ms.gmf + ms.retention AS total_refund_value,
    ms.gmf,
    ms.retention,
    to2.invoice_number,
    m.updated_at AS update_at_mtto
   FROM schsaf.tbl_maintenance_special ms
     JOIN schsaf.tbl_maintenance m ON m.id = ms.maintenance_id
     JOIN schsaf.tbl_client c ON c.id = ms.client_id
     LEFT JOIN schsaf.tbl_obligations to2 ON to2.id = ms.obligation_id;


-- schsaf.view_moratorium_plus_value source

CREATE OR REPLACE VIEW schsaf.view_moratorium_plus_value
AS SELECT tamd.obligation_id,
    date_trunc('month'::text, tamd.created_at) AS month,
    (sum(
        CASE
            WHEN tam.nature::text = 'DEBIT'::text THEN tamd.value
            ELSE 0::double precision
        END) - sum(
        CASE
            WHEN tam.nature::text = 'CREDIT'::text THEN tamd.value
            ELSE 0::double precision
        END))::numeric AS monthly_value
   FROM schsaf.tbl_accounting_movement_detail tamd
     JOIN schsaf.tbl_accounting_movement tam ON tamd.movement_id = tam.id
     JOIN schsaf.tbl_accounting_account taa ON tam.account_id = taa.id
  WHERE taa.number::text = '4102424481'::text
  GROUP BY tamd.obligation_id, (date_trunc('month'::text, tamd.created_at));


-- schsaf.view_moratorium_value source

CREATE OR REPLACE VIEW schsaf.view_moratorium_value
AS SELECT tamd.obligation_id,
    date_trunc('month'::text, tamd.created_at) AS month,
    (sum(
        CASE
            WHEN tam.nature::text = 'DEBIT'::text THEN tamd.value
            ELSE 0::double precision
        END) - sum(
        CASE
            WHEN tam.nature::text = 'CREDIT'::text THEN tamd.value
            ELSE 0::double precision
        END))::numeric AS monthly_value
   FROM schsaf.tbl_accounting_movement_detail tamd
     JOIN schsaf.tbl_accounting_movement tam ON tamd.movement_id = tam.id
     JOIN schsaf.tbl_accounting_account taa ON tam.account_id = taa.id
  WHERE taa.number::text = '4102424480'::text
  GROUP BY tamd.obligation_id, (date_trunc('month'::text, tamd.created_at));


-- schsaf.view_obligation_control_rate source

CREATE OR REPLACE VIEW schsaf.view_obligation_control_rate
AS SELECT adh.id,
    c.document_number AS nit,
    c.short_name AS name_nit,
    i.number_svf AS number_obligation,
    adh.state,
    p.name AS name_product,
    adh.fixed_remunerative_rate,
    adh.remunerative_rate,
    adh.remunerative_rate_adjust,
    br.remunerative_rate_type,
    adh.causal_adjust,
    adh.date_adjust,
    adh.created,
    ( SELECT tr.value
           FROM schsaf.tbl_rate tr
          WHERE tr.status::text = 'CURRENT'::text AND tr.rate_type_id = 1) AS usury_factoring_rate
   FROM schsaf.tbl_obligation_historical adh
     LEFT JOIN schsaf.tbl_obligations o ON o.id = adh.obligation_id
     LEFT JOIN schsaf.tbl_client c ON c.id = o.client_id
     LEFT JOIN schsaf.tbl_business_relationships br ON o.business_relationship_id = br.id
     LEFT JOIN schsaf.tbl_obligation_invoice oi ON o.id = oi.obligation_id
     LEFT JOIN schsaf.tbl_invoice i ON i.id = oi.invoice_id
     LEFT JOIN schsaf.tbl_products_modalities pm ON pm.sequence = adh.product_modality
     LEFT JOIN schsaf.tbl_products p ON p.id = pm.product_id;


-- schsaf.view_obligation_historical source

CREATE OR REPLACE VIEW schsaf.view_obligation_historical
AS SELECT adh.id,
    adh.nit,
    c.full_name AS name_nit,
    i.number_svf AS number_obligation,
    adh.state,
    p.name AS name_product,
    adh.fixed_remunerative_rate,
    adh.remunerative_rate,
    adh.remunerative_rate_adjust,
    adh.slack_point,
    adh.causal_adjust,
    adh.date_adjust,
    adh.created,
    adh.start_date_rate,
    adh.end_date_rate
   FROM schsaf.tbl_obligation_historical adh
     LEFT JOIN schsaf.tbl_client c ON c.document_number::text = adh.nit::text
     LEFT JOIN schsaf.tbl_obligations o ON o.id = adh.obligation_id
     LEFT JOIN schsaf.tbl_obligation_invoice oi ON o.id = oi.obligation_id
     LEFT JOIN schsaf.tbl_invoice i ON i.id = oi.invoice_id
     LEFT JOIN schsaf.tbl_products_modalities pm ON pm.sequence = adh.product_modality
     LEFT JOIN schsaf.tbl_products p ON p.id = pm.product_id;


-- schsaf.view_obligation_rate_payment_info source

CREATE OR REPLACE VIEW schsaf.view_obligation_rate_payment_info
AS SELECT vobl.obligation_id AS id,
    vobl.total_due_date,
    ( SELECT tr.value
           FROM schsaf.tbl_rate tr
          WHERE vobl.total_due_date >= tr.start_date AND vobl.total_due_date <= tr.end_date AND tr.status::text = 'CURRENT'::text
         LIMIT 1) AS moratorium_rate,
    min(tpa.payment_date) AS date_first_payment,
    max(tpa.payment_date) AS date_last_payment
   FROM schsaf.view_obligations vobl
     LEFT JOIN schsaf.tbl_payment_instruction tpi ON tpi.obligation_id = vobl.obligation_id AND tpi.state::text = 'APPLIED'::text
     LEFT JOIN schsaf.tbl_payment_application tpa ON tpa.id = tpi.payment_application_id
  GROUP BY vobl.obligation_id, vobl.total_due_date;


-- schsaf.view_obligation_report source

CREATE OR REPLACE VIEW schsaf.view_obligation_report
AS SELECT row_number() OVER (ORDER BY tob.total_due_date, tob.net_due_date, tob.created_at) AS obligation_order,
    tob.id,
        CASE
            WHEN tpm.product_id = 3 THEN tila.application_number
            ELSE ti.number_svf
        END AS number,
        CASE
            WHEN tpm.product_id = 3 THEN tila.application_number
            ELSE ti.number
        END AS invoice_number,
    tob.invoice_due_date AS invoice_date,
    td.application_date AS disbursement_date,
    tob.net_due_date,
    tob.total_due_date,
    tob.invoice_value,
    tob.disbursement_value,
    tob.discount_value,
    tob.transfer_value,
    tob.principal_balance,
    tob.accrued_amortized,
    tob.accrued_remunerative,
    tob.state,
    tob.accrued_moratorium,
    tob.remunerative_balance,
    tob.moratorium_balance,
    tob.receivables_balance,
        CASE
            WHEN tpm.product_id = 3 THEN tfp.plan_code::character varying(30)
            ELSE tpm.modality
        END AS modality,
    tp.name AS product,
    tob.client_id,
    tc1.document_number AS document_obligation,
    tc1.short_name AS name_obligation,
        CASE
            WHEN tpm.product_id = 3 THEN tc1.document_number
            ELSE tc2.document_number
        END AS document_payer,
        CASE
            WHEN tpm.product_id = 3 THEN tc1.short_name
            ELSE tc2.short_name
        END AS name_payer,
        CASE
            WHEN tpm.product_id = 3 THEN tc1.full_name
            ELSE tc2.full_name
        END AS full_name_payer,
        CASE
            WHEN tpm.product_id = 3 THEN tc4.document_number
            ELSE tc3.document_number
        END AS document_provider,
        CASE
            WHEN tpm.product_id = 3 THEN tc4.short_name
            ELSE tc3.short_name
        END AS name_provider,
        CASE
            WHEN tpm.product_id = 3 THEN tc4.full_name
            ELSE tc3.full_name
        END AS full_name_provider,
    tob.vpd_refund_display AS refund_display,
    tob.created_at,
    tob.discount_rate,
    tob.remunerative_rate,
    tob.base,
    tob.fixed_remunerative_rate,
    tob.vpd_active,
    tob.vpd_refund_rate,
    tob.vpd_refund_value,
    tob.prepayment_rate,
    tob.homologation_consecutive
   FROM schsaf.tbl_obligations tob
     LEFT JOIN schsaf.tbl_business_relationships tbr ON tob.business_relationship_id = tbr.id
     LEFT JOIN schsaf.tbl_products_modalities tpm ON tpm.id = tbr.productmodality_id
     LEFT JOIN schsaf.tbl_products tp ON tp.id = tpm.product_id
     LEFT JOIN schsaf.tbl_obligation_invoice oi ON tob.id = oi.obligation_id
     LEFT JOIN schsaf.tbl_invoice ti ON ti.id = oi.invoice_id
     LEFT JOIN schsaf.tbl_invoice_header td ON td.id = ti.invoice_header_id
     LEFT JOIN schsaf.tbl_client tc1 ON tc1.id = tob.client_id
     LEFT JOIN schsaf.tbl_client tc2 ON tc2.id = td.payer_id
     LEFT JOIN schsaf.tbl_client tc3 ON tc3.id = td.provider_id
     LEFT JOIN schsaf.tbl_invoice_lt_aggrupation tila ON tila.obligation_id = tob.id
     LEFT JOIN schsaf.tbl_financing_plan tfp ON tila.plan_id = tfp.id
     LEFT JOIN schsaf.tbl_client tc4 ON tc4.document_number::text = tila.provider_document_number::text
  WHERE tob.state::text = ANY (ARRAY['CURRENT'::character varying::text, 'EXPIRED'::character varying::text])
  ORDER BY tob.total_due_date, tob.net_due_date, tob.created_at;


-- schsaf.view_obligations source

CREATE OR REPLACE VIEW schsaf.view_obligations
AS WITH client_data AS (
         SELECT tbl_client.id,
            tbl_client.document_number,
            tbl_client.full_name,
            tbl_client.short_name
           FROM schsaf.tbl_client
        ), canceled_dates AS (
         SELECT tbl_payment_instruction.obligation_id,
            max(tbl_payment_instruction.created_at) AS canceled_date
           FROM schsaf.tbl_payment_instruction
          GROUP BY tbl_payment_instruction.obligation_id
        ), shared_discounts AS (
         SELECT DISTINCT tpi.obligation_id,
            tpd.shared_discount_value
           FROM schsaf.tbl_payback_drafts tpd
             JOIN schsaf.tbl_payment_instruction tpi ON tpd.payment_instruction_id = tpi.id
          WHERE tpd.state::text = ANY (ARRAY['PENDING'::character varying::text, 'PAYED_DRAFT'::character varying::text])
        )
 SELECT row_number() OVER (ORDER BY tobli.id) AS id,
    tobli.id AS obligation_id,
    ti.number_svf AS obligation_number,
    tobli.state,
    tobli.created_at AS placement_date,
    tobli.net_due_date,
    tobli.total_due_date,
    tobli.remunerative_rate,
    tobli.fixed_remunerative_rate,
    tobli.provider_rate,
    tobli.discount_rate AS amortization_rate,
    tobli.prepayment_rate,
    tobli.vpd_active,
    tobli.disbursement_value + tobli.discount_value AS initial_capital,
    tobli.principal_balance,
    tobli.remunerative_balance,
    tobli.moratorium_balance,
    tobli.receivables_balance,
    tobli.accrued_amortized,
    tobli.vpd_refund_rate AS vpd_rate,
    tobli.vpd_refund_value AS vpd_value,
    tp.id AS product_id,
    CURRENT_DATE AS consultation_date,
    tc.id AS client_id,
    tc.document_number,
    tc.full_name,
    tc.short_name,
    tbpro.id AS provider_id,
    tbpro.document_number AS nit_provider,
    tbpro.full_name AS name_provider,
    tbpro.short_name AS short_name_provider,
    tblpayer.id AS payer_id,
    tblpayer.document_number AS nit_payer,
    tblpayer.full_name AS name_payer,
    tblpayer.short_name AS short_name_payer,
    tp.name AS product_name,
    tpm.modality,
    tpm.sequence,
    ti.number AS numbers_invoice,
    tobli.homologation_consecutive AS numbers_obligation_homologated,
    ti.discount_rate,
    tobli.discount_value,
    tobli.accrued_remunerative,
    tobli.accrued_moratorium,
    tobli.base,
    0.0000 AS cxc,
    tobli.principal_balance + tobli.remunerative_balance + tobli.moratorium_balance + tobli.receivables_balance AS total_value,
    cd.canceled_date,
    sd.shared_discount_value
   FROM ( SELECT tob.id,
            COALESCE(tmr.id_relationship, tob.id) AS id_old_obligation,
            tob.state,
            tob.client_id,
            tob.business_relationship_id,
            tob.created_at,
            tob.invoice_due_date,
            tob.total_due_date,
            tob.net_due_date,
            tob.base,
            tob.discount_rate,
            tob.fixed_remunerative_rate,
            tob.remunerative_rate,
            tob.invoice_value,
            tob.disbursement_value,
            tob.discount_value,
            tob.tax_value,
            tob.transfer_value,
            tob.principal_balance,
            tob.accrued_amortized,
            tob.accrued_remunerative,
            tob.accrued_moratorium,
            tob.updated_at,
            tob.homologation_consecutive,
            tob.remunerative_balance,
            tob.moratorium_balance,
            tob.receivables_balance,
            tob.vpd_active,
            tob.vpd_refund_rate,
            tob.vpd_refund_display,
            tob.vpd_refund_value,
            tob.prepayment_rate,
            tob.provider_rate
           FROM schsaf.tbl_obligations tob
             LEFT JOIN schsaf.tbl_maintenance_relationships tmr ON tmr.id_new_obligation = tob.id AND tmr.table_name::text = 'tbl_obligations'::text) tobli
     LEFT JOIN schsaf.tbl_obligation_invoice oi ON tobli.id = oi.obligation_id
     LEFT JOIN schsaf.tbl_invoice ti ON ti.id = oi.invoice_id
     LEFT JOIN schsaf.tbl_business_relationships tbr ON tobli.business_relationship_id = tbr.id
     LEFT JOIN schsaf.tbl_products_modalities tpm ON tpm.id = tbr.productmodality_id
     LEFT JOIN schsaf.tbl_products tp ON tpm.product_id = tp.id
     LEFT JOIN schsaf.tbl_invoice_header td ON ti.invoice_header_id = td.id
     LEFT JOIN client_data tc ON tc.id = tobli.client_id
     LEFT JOIN client_data tbpro ON tbpro.id = td.provider_id
     LEFT JOIN client_data tblpayer ON tblpayer.id = td.payer_id
     LEFT JOIN canceled_dates cd ON tobli.id = cd.obligation_id AND tobli.state::text = 'CANCELED'::text
     LEFT JOIN shared_discounts sd ON tobli.id = sd.obligation_id;


-- schsaf.view_obligations_historical_report source

CREATE OR REPLACE VIEW schsaf.view_obligations_historical_report
AS SELECT ob.id AS obligation_id,
        CASE
            WHEN tblpm.product_id = 3 THEN tc4.document_number
            ELSE tbpro.document_number
        END AS document_provider,
        CASE
            WHEN tblpm.product_id = 3 THEN tc4.short_name
            ELSE tbpro.short_name
        END AS name_provider,
        CASE
            WHEN tblpm.product_id = 3 THEN tc5.document_number
            ELSE tblpa.document_number
        END AS document_payer,
        CASE
            WHEN tblpm.product_id = 3 THEN tc5.short_name
            ELSE tblpa.short_name
        END AS name_payer,
        CASE
            WHEN tblpm.product_id = 3 THEN tc5.document_number
            ELSE tblcl.document_number
        END AS document_holder,
        CASE
            WHEN tblpm.product_id = 3 THEN tc5.short_name
            ELSE tblcl.short_name
        END AS name_holder,
    tp.name AS name_product,
        CASE
            WHEN tblpm.product_id = 3 THEN tfp.plan_code::character varying(30)
            ELSE tblpm.modality
        END AS modality,
    tp.currency,
        CASE
            WHEN tblpm.product_id = 3 THEN tila.application_number
            ELSE ti.number_svf
        END AS number_obligation,
    ob.homologation_consecutive AS number_obligation_homologated,
        CASE
            WHEN tblpm.product_id = 3 THEN tila.application_number
            ELSE ti.number
        END AS number_document,
    ob.remunerative_rate,
        CASE
            WHEN tih.remunerative_rate_type = 0 THEN 'Fija Efectiva Anual (EA)'::text
            WHEN tih.remunerative_rate_type = 1 THEN 'Variable (DTF- TA)'::text
            ELSE NULL::text
        END AS remunerative_rate_type,
    tbr.refund_rate,
    tbr.refund_rate_type,
    tbr.isrefundavailable,
    ob.discount_rate,
        CASE
            WHEN max(tpa.payment_date) IS NULL OR max(tpa.payment_date) IS NOT NULL AND ob.state::text <> 'CANCELED'::text THEN ( SELECT tr.value
               FROM schsaf.tbl_rate tr
              WHERE tr.status::text = 'CURRENT'::text AND tr.rate_type_id = 1)
            ELSE ( SELECT tr.value
               FROM schsaf.tbl_rate tr
              WHERE (tr.status::text = ANY (ARRAY['CURRENT'::character varying::text, 'EXPIRED'::character varying::text])) AND tr.rate_type_id = 1 AND max(tpa.payment_date) >= tr.start_date AND max(tpa.payment_date) <= tr.end_date)
        END AS value_usury_rate,
    schsaf.fn_days_difference_360(COALESCE(tbd.application_date, tila.application_at::date), CURRENT_DATE) AS age_obligation,
    ob.created_at AS created_at_obligation,
    ob.total_due_date,
    ob.net_due_date,
    max(tpa.payment_date) AS date_last_payment,
        CASE
            WHEN ob.state::text = 'PENDING'::text THEN 'Temporal'::character varying(100)
            ELSE ob.state
        END AS obligation_state,
    ob.disbursement_value,
    ob.discount_value,
    ob.accrued_amortized,
    sum(tpd.rft_value) AS rft_value,
    sum(tpd.shared_discount_value) AS early_payment_discount,
    ob.principal_balance,
    ob.remunerative_balance,
    ob.moratorium_balance,
    ob.receivables_balance,
    tp.id AS id_product,
    tih.application_date AS transfer_date,
    tbd.application_date AS disbursement_date,
    ti.issuance_date,
    ob.invoice_value,
    ob.accrued_remunerative,
    ob.accrued_moratorium,
    COALESCE(ob.provider_rate, 0::numeric) AS provider_rate,
    tblpm.id AS product_modality_id,
    sum(tpd.gmf_value) AS gmf_value,
    ob.prepayment_rate,
    sum(tap.value) AS account_payable,
    ob.vpd_active,
    ob.vpd_refund_value
   FROM schsaf.tbl_obligations ob
     LEFT JOIN schsaf.tbl_payment_instruction tpi ON tpi.obligation_id = ob.id AND tpi.state::text = 'APPLIED'::text
     LEFT JOIN schsaf.tbl_payment_application tpa ON tpa.id = tpi.payment_application_id AND tpa.state::text = 'APPLIED'::text
     LEFT JOIN schsaf.tbl_payback_drafts tpd ON tpd.payment_instruction_id = tpi.id AND (tpd.state::text = ANY (ARRAY['PAYED_DRAFT'::character varying::text, 'PENDING'::character varying::text]))
     LEFT JOIN schsaf.tbl_obligation_invoice toi ON toi.obligation_id = ob.id
     LEFT JOIN schsaf.tbl_invoice ti ON ti.id = toi.invoice_id
     LEFT JOIN schsaf.tbl_invoice_header tih ON tih.id = ti.invoice_header_id
     LEFT JOIN schsaf.tbl_bank_drafts tbd ON tbd.invoice_header_id = tih.id
     LEFT JOIN schsaf.tbl_client tblpa ON tblpa.id = tih.payer_id
     LEFT JOIN schsaf.tbl_client tbpro ON tbpro.id = tih.provider_id
     LEFT JOIN schsaf.tbl_client tblcl ON tblcl.id = ob.client_id AND tblpa.document_number IS NOT NULL
     LEFT JOIN schsaf.tbl_business_relationships tbr ON ob.business_relationship_id = tbr.id
     LEFT JOIN schsaf.tbl_products_modalities tblpm ON tbr.productmodality_id = tblpm.id
     LEFT JOIN schsaf.tbl_products tp ON tp.id = tblpm.product_id
     LEFT JOIN schsaf.tbl_account_payable tap ON tap.obligation_id = ob.id AND tap.state::text = 'PENDING'::text
     LEFT JOIN schsaf.tbl_invoice_lt_aggrupation tila ON tila.obligation_id = ob.id
     LEFT JOIN schsaf.tbl_financing_plan tfp ON tila.plan_id = tfp.id
     LEFT JOIN schsaf.tbl_client tc4 ON tc4.document_number::text = tila.provider_document_number::text
     LEFT JOIN schsaf.tbl_client tc5 ON tc5.document_number::text = tila.payer_document_number::text
  WHERE ob.state::text = ANY (ARRAY['CURRENT'::character varying::text, 'PENDING'::character varying::text, 'EXPIRED'::character varying::text, 'CANCELED'::character varying::text])
  GROUP BY tc4.document_number, tc4.short_name, tc5.document_number, tc5.short_name, tfp.plan_code, tila.application_number, tila.application_at, tblpa.document_number, tblpa.short_name, tbpro.document_number, tbpro.short_name, tblcl.document_number, tblcl.short_name, ob.id, ob.created_at, ob.total_due_date, ob.net_due_date, ob.state, ob.disbursement_value, ob.principal_balance, ob.remunerative_balance, ob.moratorium_balance, ob.discount_value, ob.accrued_amortized, tbr.refund_rate, tbr.days_with_cost, tbr.remunerative_rate, tbr.remunerative_rate_type, tbr.refund_rate_type, tbr.isrefundavailable, ti.number, ti.number_svf, tp.currency, tp.id, tp.name, tblpm.modality, ob.homologation_consecutive, ob.remunerative_rate, ob.discount_rate, tih.application_date, tbd.application_date, ti.issuance_date, ob.invoice_value, ob.accrued_remunerative, ob.accrued_moratorium, tih.provider_rate_ea, tblpm.id, ob.prepayment_rate, tih.remunerative_rate_type
  ORDER BY tbpro.document_number;


-- schsaf.view_obligations_info source

CREATE OR REPLACE VIEW schsaf.view_obligations_info
AS SELECT tob.id AS obligation_id,
    ti.number_svf AS numbers_obligation,
    tob.state AS obligation_state,
    tob.created_at AS placement_date,
    tob.net_due_date,
    tob.total_due_date,
    tob.remunerative_rate,
    tob.discount_rate AS amortization_rate,
    tob.vpd_active,
    tob.disbursement_value + tob.discount_value AS initial_capital,
    tob.principal_balance,
    tob.remunerative_balance,
    tob.moratorium_balance,
    tob.receivables_balance,
    tob.accrued_amortized,
    tob.vpd_refund_rate AS vpd_rate,
    tob.vpd_refund_value AS vpd_value,
        CASE
            WHEN tob.state::text = 'EXPIRED'::text OR (tob.state::text = 'UPDATED'::text AND tob.total_due_date < date(tm.created_at)) IS TRUE THEN ( SELECT tr.value
               FROM schsaf.tbl_rate tr
              WHERE tr.status::text = 'CURRENT'::text AND tr.rate_type_id = 1)
            ELSE NULL::numeric
        END AS moratorium_rate,
    tp.id AS product_id,
    CURRENT_DATE AS consultation_date,
    tblcli.id AS client_id,
    tblcli.document_number AS nit_client,
    tblcli.short_name AS name_client,
    tbpro.id AS provider_id,
    tbpro.document_number AS nit_provider,
    tbpro.short_name AS name_provider,
    tbpro.full_name AS full_name_provider,
    tblpayer.id AS payer_id,
    tblpayer.document_number AS nit_payer,
    tblpayer.short_name AS name_payer,
    tblpayer.full_name AS full_name_payer,
    tp.name AS product_name,
    tpm.modality,
    ti.number AS numbers_invoice,
    tob.homologation_consecutive AS numbers_obligation_homologated,
    ( SELECT min(tpi.created_at) AS min
           FROM schsaf.tbl_payment_instruction tpi
          WHERE tpi.created_at = (( SELECT min(te.created_at) AS min
                   FROM schsaf.tbl_payment_instruction te
                  WHERE te.state::text = 'APPLIED'::text AND te.obligation_id = tob.id))) AS date_first_payment,
    ( SELECT max(tpi.created_at) AS max
           FROM schsaf.tbl_payment_instruction tpi
          WHERE tpi.created_at = (( SELECT max(te.created_at) AS max
                   FROM schsaf.tbl_payment_instruction te
                  WHERE te.state::text = 'APPLIED'::text AND te.obligation_id = tob.id))) AS date_last_payment,
    tob.net_due_date - tob.created_at AS net_days,
    CURRENT_DATE - tob.created_at AS age_of_obligation,
    ti.discount_rate,
    tob.discount_value,
    tm.id AS id_maintenance,
    tm.maintenance_consecutive,
    tm.created_at AS maintenance_date,
        CASE
            WHEN tob.state::text = 'UPDATED'::text THEN false
            ELSE true
        END AS isafter,
    tob.base,
    COALESCE(td.days_with_cost, 0) AS days_with_cost
   FROM schsaf.tbl_obligations tob
     JOIN schsaf.tbl_obligation_invoice oi ON tob.id = oi.obligation_id
     JOIN schsaf.tbl_invoice ti ON ti.id = oi.invoice_id
     JOIN schsaf.tbl_business_relationships tbr ON tob.business_relationship_id = tbr.id
     JOIN schsaf.tbl_products_modalities tpm ON tpm.id = tbr.productmodality_id
     JOIN schsaf.tbl_products tp ON tp.id = tpm.product_id
     JOIN schsaf.tbl_invoice_header td ON ti.invoice_header_id = td.id
     JOIN schsaf.tbl_client tbpro ON tbpro.id = td.provider_id
     JOIN schsaf.tbl_client tblpayer ON tblpayer.id = td.payer_id
     JOIN schsaf.tbl_client tblcli ON tblcli.id = tob.client_id
     LEFT JOIN schsaf.tbl_maintenance_relationships tmr ON tmr.id_relationship = tob.id
     LEFT JOIN schsaf.tbl_maintenance tm ON tm.id = tmr.id_maintenance;


-- schsaf.view_obligations_info_details source

CREATE OR REPLACE VIEW schsaf.view_obligations_info_details
AS SELECT tblo.id AS obligation_id,
    tblcli.id AS client_id,
    tblcli.document_number AS client_nit,
    tblcli.full_name AS client_name,
    tblpayer.id AS payer_id,
    tblpayer.document_number AS payer_nit,
    tblpayer.full_name AS payer_name,
    tbli.number_svf AS number_obligation,
    tblo.discount_rate,
    tblo.net_due_date,
    tblo.created_at AS application_date,
    tbli.number_svf AS code,
    tblo.total_due_date,
    tblo.discount_rate AS rate_discount_client,
    tblo.remunerative_rate AS rate_discount_payer
   FROM schsaf.tbl_obligations tblo
     JOIN schsaf.tbl_obligation_invoice toi ON tblo.id = toi.obligation_id
     JOIN schsaf.tbl_invoice tbli ON toi.invoice_id = tbli.id
     JOIN schsaf.tbl_business_relationships tbr ON tblo.business_relationship_id = tbr.id
     JOIN schsaf.tbl_products_modalities tbmlpm ON tbmlpm.id = tbr.productmodality_id
     JOIN schsaf.tbl_invoice_header tbldb ON tbldb.id = tbli.invoice_header_id
     JOIN schsaf.tbl_client tblpayer ON tblpayer.id = tblo.client_id
     JOIN schsaf.tbl_client tblcli ON tblcli.id = tbldb.payer_id;


-- schsaf.view_obligations_information source

CREATE OR REPLACE VIEW schsaf.view_obligations_information
AS SELECT tc.document_number,
    tc.document_type,
    tc.full_name,
    tobli.state,
    tp.currency,
    sum(tobli.principal_balance) AS principalpayable,
    sum(tobli.remunerative_balance) AS interestpayable,
    sum(tobli.moratorium_balance) AS arrears,
    sum(tobli.principal_balance + tobli.remunerative_balance + tobli.moratorium_balance) AS totalliabilities,
    tpm.acronym AS product_name
   FROM schsaf.tbl_obligations tobli
     JOIN schsaf.tbl_client tc ON tc.id = tobli.client_id
     JOIN schsaf.tbl_business_relationships tbr ON tobli.business_relationship_id = tbr.id
     JOIN schsaf.tbl_products_modalities tpm ON tpm.id = tbr.productmodality_id
     JOIN schsaf.tbl_products tp ON tpm.product_id = tp.id
  WHERE tobli.state::text ~~ 'CURRENT'::text
  GROUP BY tc.document_number, tc.full_name, tobli.state, tpm.acronym, tp.currency, tc.document_type;


-- schsaf.view_obligations_maintenance source

CREATE OR REPLACE VIEW schsaf.view_obligations_maintenance
AS SELECT to2.id AS obligation_id,
    to2.client_id,
    tom.maintenance_id,
    tom.created_at AS approved_date,
    to2.created_at,
    tom.invoice_due_date,
    tom.total_due_date,
    tom.net_due_date,
    to2.base,
    tom.discount_rate,
    tom.fixed_remunerative_rate,
    to2.invoice_value,
    to2.tax_value,
    to2.transfer_value,
    to2.business_relationship_id,
    tom.prepayment_rate,
    tom.remunerative_rate,
    tom.disbursement_value,
    tom.discount_value,
    tom.principal_balance,
    tom.remunerative_balance,
    tom.moratorium_balance,
    tom.receivables_balance,
    tom.accrued_amortized,
    tom.accrued_remunerative,
    tom.state,
    tom.accrued_moratorium,
    to2.updated_at,
    to2.homologation_consecutive,
    to2.vpd_active,
    to2.vpd_refund_rate,
    to2.vpd_refund_value,
    to2.vpd_refund_display,
    tom.net_days,
    tom.obligation_age AS age,
    tom.prepayment_discount,
    tom.principal_balance + tom.accrued_remunerative + tom.accrued_moratorium AS total,
    tom.status_process_maintenance,
    tom.provider_rate,
    tom.payable_balance
   FROM schsaf.tbl_obligations_maintenance tom
     JOIN schsaf.tbl_obligations to2 ON to2.id = tom.obligation_id;


-- schsaf.view_obligations_maintenance_detail_report source

CREATE OR REPLACE VIEW schsaf.view_obligations_maintenance_detail_report
AS SELECT DISTINCT COALESCE(tmic.id, tms.id) AS id,
    to2.id AS obligation_id,
    tm.id AS maintenance_id,
    tm.created_at AS creation_date,
    tm.maintenance_consecutive,
    tcpro.document_type AS document_type_provider,
    tcpro.document_number AS document_number_provider,
    tcpro.short_name AS short_name_provider,
    tch.document_type AS document_type_holder,
    tch.document_number AS document_number_holder,
    tch.short_name AS short_name_holder,
    tp.id AS product_id,
    tp.name AS product_name,
    tmt.id AS maintenance_type_id,
    tmt.full_name AS maintenance_type_full_name,
    ti.number_svf AS number_obligation_factoring,
    tm.state AS maintenance_state,
    tm.case_number,
    tblpayer.document_type AS document_type_payer,
    tblpayer.document_number AS nit_payer,
    tblpayer.short_name AS short_name_payer,
    tch.id AS holder_id,
    tcpro.id AS provider_id,
    tblpayer.id AS payer_id
   FROM schsaf.tbl_maintenance tm
     JOIN schsaf.tbl_maintenance_type tmt ON tmt.id = tm.id_maintenance_type
     LEFT JOIN schsaf.tbl_maintenance_initial_condition tmic ON tmic.maintenance_id = tm.id
     LEFT JOIN schsaf.tbl_maintenance_special tms ON tms.maintenance_id = tm.id
     JOIN schsaf.tbl_obligations to2 ON to2.id = tmic.obligation_id OR tms.obligation_id = to2.id
     JOIN schsaf.tbl_business_relationships tbr ON tbr.id = to2.business_relationship_id
     JOIN schsaf.tbl_products_modalities tpm ON tpm.id = tbr.productmodality_id
     JOIN schsaf.tbl_products tp ON tp.id = tpm.product_id
     JOIN schsaf.tbl_client tch ON tch.id = to2.client_id
     LEFT JOIN schsaf.tbl_obligation_invoice toi ON toi.obligation_id = to2.id
     LEFT JOIN schsaf.tbl_invoice ti ON ti.id = toi.invoice_id
     LEFT JOIN schsaf.tbl_invoice_header tih ON tih.id = ti.invoice_header_id
     JOIN schsaf.tbl_client tcpro ON tcpro.id = tih.provider_id
     JOIN schsaf.tbl_client tblpayer ON tblpayer.id = tih.payer_id
  ORDER BY (COALESCE(tmic.id, tms.id)) DESC, tm.id, tch.document_number, tcpro.document_number, ti.number_svf;


-- schsaf.view_obligations_maintenance_historical_report source

CREATE OR REPLACE VIEW schsaf.view_obligations_maintenance_historical_report
AS WITH lastfinancecharge AS (
         SELECT tfc.obligation_id,
            max(tfc.created_at) AS last_finance_charge_date
           FROM schsaf.tbl_finance_charges tfc
          WHERE tfc.process_type::text = 'DIARY'::text
          GROUP BY tfc.obligation_id
        ), special AS (
         SELECT tme.reference_date,
            tmsa.user_applied AS user_applied_annulment,
            tmsa.created_at AS created_at_annulment,
            tmsa.case_number AS case_number_annulment,
            tme.obligation_id,
            tme.maintenance_id
           FROM schsaf.tbl_maintenance_special tme
             LEFT JOIN schsaf.tbl_maintenance_special_annulment tmsa ON tmsa.maintenance_id = tme.maintenance_id
        )
 SELECT tom.id,
    tom.created_at AS registration_date,
    tom.status_process_maintenance,
    tm.created_at AS creation_date,
    tm.updated_at AS approval_date,
    tm.id_maintenance_type,
    tmt.code_type,
    tmt.full_name AS maintenance_type_full_name,
    tm.maintenance_consecutive,
    tom.obligation_id,
    ti.number_svf AS number_obligation_factoring,
    tch.document_type AS document_type_holder,
    tch.document_number AS document_number_holder,
    tch.short_name AS short_name_holder,
    tcpro.document_type AS document_type_provider,
    tcpro.document_number AS document_number_provider,
    tcpro.short_name AS short_name_provider,
    tp.id AS product_id,
    tp.name AS product_name,
    tpm.modality,
    tom.provider_rate,
    tom.prepayment_rate,
    tom.principal_balance,
    tom.remunerative_rate,
        CASE
            WHEN tih.remunerative_rate_type = 0 THEN 'Fija Efectiva Anual (EA)'::text
            WHEN tih.remunerative_rate_type = 1 THEN 'Variable (DTF- TA)'::text
            ELSE NULL::text
        END AS remunerative_rate_type,
    tom.net_due_date,
    tom.total_due_date,
    fc.last_finance_charge_date,
        CASE
            WHEN tom.status_process_maintenance::text = 'BEFORE'::text THEN tm.executer_user
            WHEN tom.status_process_maintenance::text = 'AFTER'::text THEN tm.approver_user
            ELSE NULL::character varying
        END AS user_name,
    tm.case_number,
    tblpayer.document_type AS document_type_payer,
    tblpayer.document_number AS nit_payer,
    tblpayer.short_name AS short_name_payer,
    tom.moratorium_balance,
    tom.remunerative_balance,
    tom.disbursement_value,
    tom.discount_value,
    tm.state AS state_maintenance,
    tm.id AS maintenance_id,
    tch.id AS holder_id,
    tcpro.id AS provider_id,
    tblpayer.id AS payer_id,
    tom.is_annulled,
    sp.user_applied_annulment,
    sp.created_at_annulment,
    sp.case_number_annulment,
    sp.reference_date
   FROM schsaf.tbl_obligations_maintenance tom
     JOIN schsaf.tbl_maintenance tm ON tm.id = tom.maintenance_id
     JOIN schsaf.tbl_maintenance_type tmt ON tmt.id = tm.id_maintenance_type
     JOIN schsaf.tbl_obligations to2 ON to2.id = tom.obligation_id
     JOIN schsaf.tbl_business_relationships tbr ON tbr.id = to2.business_relationship_id
     JOIN schsaf.tbl_products_modalities tpm ON tpm.id = tbr.productmodality_id
     JOIN schsaf.tbl_products tp ON tp.id = tpm.product_id
     JOIN schsaf.tbl_client tch ON tch.id = to2.client_id
     LEFT JOIN schsaf.tbl_obligation_invoice toi ON toi.obligation_id = to2.id
     LEFT JOIN schsaf.tbl_invoice ti ON ti.id = toi.invoice_id
     LEFT JOIN schsaf.tbl_invoice_header tih ON tih.id = ti.invoice_header_id
     JOIN schsaf.tbl_client tcpro ON tcpro.id = tih.provider_id
     JOIN schsaf.tbl_client tblpayer ON tblpayer.id = tih.payer_id
     LEFT JOIN lastfinancecharge fc ON fc.obligation_id = tom.obligation_id
     LEFT JOIN special sp ON sp.obligation_id = tom.obligation_id AND sp.maintenance_id = tm.id;


-- schsaf.view_payback_draft_info source

CREATE OR REPLACE VIEW schsaf.view_payback_draft_info
AS SELECT tpd.id,
    tc2.document_number AS provider_id,
    tc2.full_name AS provider_name,
    tc2.short_name AS provider_short_name,
    tc.document_number AS payer_id,
    tc.full_name AS payer_name,
    tc.short_name AS payer_short_name,
        CASE tbr.refund_by_prepayment
            WHEN 'Proveedor'::text THEN tc2.document_number
            WHEN 'Pagador'::text THEN tc.document_number
            ELSE ''::character varying
        END AS beneficiary_id,
        CASE tbr.refund_by_prepayment
            WHEN 'Proveedor'::text THEN tc2.full_name
            WHEN 'Pagador'::text THEN tc.full_name
            ELSE ''::character varying
        END AS beneficiary_name,
        CASE tbr.refund_by_prepayment
            WHEN 'Proveedor'::text THEN tc2.short_name
            WHEN 'Pagador'::text THEN tc.short_name
            ELSE ''::character varying
        END AS beneficiary_short_name,
    tpa.consecutive AS payment_number,
    tpa.created_at AS payment_date_time,
    tp.name AS product_name,
    tpm.modality,
    ti.number_svf AS number_obligation,
    tbo.disbursement_value + tbo.discount_value AS initial_capital,
    tpd.shared_discount_value AS value_without_deductible,
    tpd.shared_discount_value - tpd.rft_value - tpd.gmf_value AS payback_draft_net_value,
    tbo.state,
    tpd.rft_value AS rtf_value,
    tpd.payback_draft_type_id,
    tm.id AS maintenance_id,
    tpd.gmf_value
   FROM schsaf.tbl_payback_drafts tpd
     JOIN schsaf.tbl_maintenance_relationships tmr ON tpd.id = tmr.id_relationship
     JOIN schsaf.tbl_maintenance tm ON tmr.id_maintenance = tm.id
     JOIN schsaf.tbl_payment_instruction pis ON tpd.payment_instruction_id = pis.id
     JOIN schsaf.tbl_obligations tbo ON pis.obligation_id = tbo.id
     JOIN schsaf.tbl_business_relationships tbr ON tbo.business_relationship_id = tbr.id
     JOIN schsaf.tbl_client tc ON tbr.payer_id = tc.id
     JOIN schsaf.tbl_client tc2 ON tbr.provider_id = tc2.id
     JOIN schsaf.tbl_products_modalities tpm ON tbr.productmodality_id = tpm.id
     JOIN schsaf.tbl_products tp ON tpm.product_id = tp.id
     JOIN schsaf.tbl_payment_application tpa ON pis.payment_application_id = tpa.id
     JOIN schsaf.tbl_obligation_invoice toi ON tbo.id = toi.obligation_id
     JOIN schsaf.tbl_invoice ti ON toi.invoice_id = ti.id;


-- schsaf.view_payment source

CREATE OR REPLACE VIEW schsaf.view_payment
AS SELECT tp.id,
    tp.created,
    tp.consecutive_payment,
    tp.payment_date,
    tp.payment_time,
    tp.nit_payer AS reference_nit,
    tcc.full_name AS reference_name,
    tp.nit_beneficiary AS beneficiary_nit,
    tcb.full_name AS beneficiary_name,
    tp.city AS office_city,
    tp.value,
    tp.payment_channel,
    tp.code_agreement,
    tp.type_payment,
    tp.currency,
    tp.justify,
    tp.date_payment_application AS distribution_date,
    tp.date_payment_distribution AS status_date,
    tp.value_application AS value_applied,
    tp.value_pending_application AS value_pending_applied,
    tp.remaining_amount_return AS value_pending,
    tp.status,
    tp.type_record,
    tp.income_distributed,
    tpc.description AS payment_channel_description,
        CASE
            WHEN COALESCE(tp.income_distributed, false) THEN tp.value
            ELSE 0.0000
        END AS value_distribuited,
    'user'::text AS user_app
   FROM schsaf.tbl_payment tp
     LEFT JOIN schsaf.tbl_client tcc ON tcc.document_number::text = tp.nit_payer::text
     LEFT JOIN schsaf.tbl_client tcb ON tcb.document_number::text = tp.nit_beneficiary::text
     LEFT JOIN schsaf.tbl_payment_channel tpc ON tpc.id = tp.payment_channel;


-- schsaf.view_payment_application source

CREATE OR REPLACE VIEW schsaf.view_payment_application
AS SELECT DISTINCT tpa.id,
    tp.payment_date,
    tp.nit_payer AS identification_number,
    tc.short_name,
    tpa.created_at AS application_date,
    tpa.consecutive AS application_number,
    tpa.state,
    tpa.applied_value,
    tpa.remaining_value
   FROM schsaf.tbl_payment tp
     JOIN schsaf.tbl_client tc ON tp.nit_payer::text = tc.document_number::text
     JOIN schsaf.tbl_payment_instruction tpi ON tpi.payment_id = tp.id
     JOIN schsaf.tbl_payment_application tpa ON tpa.id = tpi.payment_application_id;


-- schsaf.view_payment_application_annulment_report source

CREATE OR REPLACE VIEW schsaf.view_payment_application_annulment_report
AS SELECT tpa.id,
    tpc.agreement_code,
    tpa.applied_value,
    tpa.created_at AS application_date,
    tpa.consecutive AS payment_application_number,
    tpa.application_type,
    tpc.channel_code,
    tpc.description AS channel_description,
    tp.code_agreement,
    tp.currency,
    tp.nit_payer AS identification_number,
    tp.nit_beneficiary AS identification_number_beneficiary,
    tp.payment_channel,
    (tp.payment_date || ' '::text) || tp.payment_time AS payment_date,
    tp.consecutive_payment AS payment_number,
    tp.value AS payment_value,
    tpr.name AS product_name,
    tc.short_name,
    tc2.short_name AS short_name_beneficiary,
    tpa.state,
    tpa.user_applied
   FROM schsaf.tbl_payment tp
     JOIN schsaf.tbl_client tc ON tc.document_number::text = (( SELECT
                CASE
                    WHEN (EXISTS ( SELECT 1
                       FROM schsaf.tbl_client
                      WHERE tbl_client.document_number::text = tp.nit_payer::text)) THEN tp.nit_payer::text
                    ELSE tp.nit_beneficiary::text
                END AS nit_beneficiary))
     JOIN schsaf.tbl_payment_application tpa ON tpa.payment_id = tp.id
     LEFT JOIN schsaf.tbl_payment_instruction tpi ON tpi.payment_application_id = tpa.id
     LEFT JOIN schsaf.tbl_obligations tob ON tpi.obligation_id = tob.id
     LEFT JOIN schsaf.tbl_obligation_invoice oi ON tob.id = oi.obligation_id
     LEFT JOIN schsaf.tbl_invoice ti ON ti.id = oi.invoice_id
     LEFT JOIN schsaf.tbl_business_relationships tbr ON tob.business_relationship_id = tbr.id
     LEFT JOIN schsaf.tbl_products_modalities tpm ON tpm.id = tbr.productmodality_id
     LEFT JOIN schsaf.tbl_products tpr ON tpm.product_id = tpr.id
     LEFT JOIN schsaf.tbl_payment_application_annulment tpaa ON tpaa.id_payment_application = tpa.id
     LEFT JOIN schsaf.tbl_client tc2 ON tp.nit_beneficiary::text = tc2.document_number::text
     LEFT JOIN schsaf.tbl_client tc3 ON tbr.provider_id = tc3.id
     LEFT JOIN schsaf.tbl_causal_annulment tca ON tpaa.id_causal_annulment = tca.id
     LEFT JOIN schsaf.tbl_payback_drafts tpd ON tpi.id = tpd.payment_instruction_id
     LEFT JOIN schsaf.tbl_payment_channel tpc ON tpc.id = tp.payment_channel
  WHERE tpa.state::text <> 'FAILED'::text
  GROUP BY tpa.id, tpc.agreement_code, tpa.applied_value, tpa.created_at, tpa.consecutive, tpa.application_type, tpc.channel_code, tpc.description, tp.code_agreement, tp.currency, tp.nit_payer, tp.nit_beneficiary, tp.payment_channel, tp.payment_date, tp.payment_time, tp.consecutive_payment, tp.value, tpr.name, tc.short_name, tc2.short_name, tpa.state, tpa.user_applied, tpi.receivables_value
  ORDER BY tpa.id DESC;


-- schsaf.view_payment_application_complete_report source

CREATE OR REPLACE VIEW schsaf.view_payment_application_complete_report
AS WITH payment_application_data AS (
         SELECT tpa.id AS payment_application_id,
            tp.nit_payer AS identification_number,
            tc.short_name,
            tp.nit_beneficiary AS identification_number_beneficiary,
            tc2.short_name AS short_name_beneficiary,
            tpa.created_at AS application_date,
            tpa.consecutive AS application_number,
            tpa.application_type,
            tpa.state,
            (tp.payment_date || ' '::text) || tp.payment_time AS payment_date,
            tp.consecutive_payment AS payment_number,
            tp.currency,
            tp.value AS payment_value,
                CASE
                    WHEN tpa.user_applied::text = 'Operación ejecutada por el sistema'::text THEN 'AUTOMÁTICA'::character varying
                    ELSE 'MANUAL'::character varying
                END AS elaboration_type,
            tpa.applied_value AS application_applied_value,
            tpa.user_applied,
            tpc.agreement_code,
            tp.payment_channel,
            tpc.channel_code,
            tpc.description AS channel_description,
            tpaa.consecutive AS annulment_number,
            tpaa.user_applied AS annulment_user_applied,
            tpaa.created_at AS annulment_date,
            tca.causal AS causal_annulment,
            tpaa.description AS annulment_justification
           FROM schsaf.tbl_payment tp
             JOIN schsaf.tbl_payment_application tpa ON tpa.payment_id = tp.id
             JOIN schsaf.tbl_client tc ON tc.document_number::text = (( SELECT
                        CASE
                            WHEN (EXISTS ( SELECT 1
                               FROM schsaf.tbl_client
                              WHERE tbl_client.document_number::text = tp.nit_payer::text)) THEN tp.nit_payer::text
                            ELSE tp.nit_beneficiary::text
                        END AS nit_beneficiary))
             LEFT JOIN schsaf.tbl_payment_application_annulment tpaa ON tpaa.id_payment_application = tpa.id
             JOIN schsaf.tbl_client tc2 ON tc2.document_number::text = tp.nit_beneficiary::text
             LEFT JOIN schsaf.tbl_causal_annulment tca ON tca.id = tpaa.id_causal_annulment
             JOIN schsaf.tbl_payment_channel tpc ON tpc.id = tp.payment_channel
          WHERE tpa.state::text <> 'FAILED'::text
        )
 SELECT bd.payment_application_id,
        CASE
            WHEN tpr.id = 3 THEN tc4_inv.document_number
            ELSE tc4.document_number
        END AS identification_number,
        CASE
            WHEN tpr.id = 3 THEN tc4_inv.short_name
            ELSE tc4.short_name
        END AS short_name,
    bd.identification_number_beneficiary,
    bd.short_name_beneficiary,
    bd.application_date,
    bd.application_number,
    bd.application_type,
    bd.state,
    bd.payment_date,
    bd.payment_number,
    bd.currency,
    bd.payment_value,
    bd.elaboration_type,
    bd.application_applied_value,
    bd.user_applied,
    bd.agreement_code,
    bd.payment_channel,
    bd.channel_code,
    bd.channel_description,
    bd.annulment_number,
    bd.annulment_user_applied,
    bd.annulment_date,
    bd.causal_annulment,
    bd.annulment_justification,
        CASE
            WHEN tpr.id = 3 THEN tc3_inv.short_name
            ELSE tc3.short_name
        END AS provider_name,
        CASE
            WHEN tpr.id = 3 THEN tc3_inv.document_number
            ELSE tc3.document_number
        END AS provider_identification_number,
    tpr.id AS product_id,
    tpr.name AS product_name,
    tob.invoice_number AS obligation_number,
    tpi.principal_value,
    tpi.remunerative_value,
    tpi.moratorium_value,
    COALESCE(tpi.receivables_value, 0::numeric) AS receivables_value,
    tpi.tolerance_value AS obligation_tolerance_value,
    abs(tpi.portfolio_tolerance_value) AS portfolio_tolerance_value,
        CASE
            WHEN tpi.portfolio_tolerance_value > 0::numeric THEN 'surplus'::text
            WHEN tpi.portfolio_tolerance_value < 0::numeric THEN 'missing'::text
            ELSE 'no_values'::text
        END AS tolerance_status,
    COALESCE(tpd.shared_discount_value, 0::numeric) AS dpp_value,
    COALESCE((tpd.shared_discount_value - tpd.gmf_value - tpd.rft_value)::numeric(22,4), 0::numeric) AS dpp_transfer,
    COALESCE(tpd.gmf_value, 0::numeric) AS dpp_gmf,
    COALESCE(tpd.rft_value, 0::numeric) AS dpp_rtf
   FROM payment_application_data bd
     JOIN schsaf.tbl_payment_instruction tpi ON tpi.payment_application_id = bd.payment_application_id
     JOIN schsaf.tbl_obligations tob ON tpi.obligation_id = tob.id
     JOIN schsaf.tbl_business_relationships tbr ON tbr.id = tob.business_relationship_id
     JOIN schsaf.tbl_products_modalities tpm ON tpm.id = tbr.productmodality_id
     JOIN schsaf.tbl_products tpr ON tpr.id = tpm.product_id
     LEFT JOIN schsaf.tbl_client tc3 ON tc3.id = tbr.provider_id
     LEFT JOIN schsaf.tbl_client tc4 ON tc4.id = tbr.payer_id
     LEFT JOIN schsaf.tbl_invoice_lt_aggrupation tila ON tila.obligation_id = tob.id
     LEFT JOIN schsaf.tbl_client tc3_inv ON tc3_inv.document_number::text = tila.provider_document_number::text
     LEFT JOIN schsaf.tbl_client tc4_inv ON tc4_inv.document_number::text = tila.payer_document_number::text
     LEFT JOIN schsaf.tbl_payback_drafts tpd ON tpi.id = tpd.payment_instruction_id
UNION ALL
 SELECT bd.payment_application_id,
    bd.identification_number,
    bd.short_name,
    bd.identification_number_beneficiary,
    bd.short_name_beneficiary,
    bd.application_date,
    bd.application_number,
    bd.application_type,
    bd.state,
    bd.payment_date,
    bd.payment_number,
    bd.currency,
    bd.payment_value,
    bd.elaboration_type,
    bd.application_applied_value,
    bd.user_applied,
    bd.agreement_code,
    bd.payment_channel,
    bd.channel_code,
    bd.channel_description,
    bd.annulment_number,
    bd.annulment_user_applied,
    bd.annulment_date,
    bd.causal_annulment,
    bd.annulment_justification,
    tc.short_name AS provider_name,
    tc.document_number AS provider_identification_number,
    NULL::bigint AS product_id,
        CASE
            WHEN tr.type::text = 'LIFE'::text THEN 'Línea triangular'::text
            ELSE ''::text
        END::character varying AS product_name,
        CASE
            WHEN tr.type::text = 'LIFE'::text THEN 'Seguro de vida'::text
            ELSE 'Cuentas por Cobrar'::text
        END::character varying AS obligation_number,
    0 AS principal_value,
    0 AS remunerative_value,
    0 AS moratorium_value,
    trpd.paid_value AS receivables_value,
    0 AS obligation_tolerance_value,
    0 AS portfolio_tolerance_value,
    ''::text AS tolerance_status,
    0 AS dpp_value,
    0 AS dpp_transfer,
    0 AS dpp_gmf,
    0 AS dpp_rtf
   FROM payment_application_data bd
     JOIN schsaf.tbl_receivable_payment_details trpd ON trpd.payment_application_id = bd.payment_application_id
     JOIN schsaf.tbl_receivable tr ON tr.id = trpd.receivable_id
     JOIN schsaf.tbl_client tc ON tc.id = tr.client_id
  ORDER BY 1 DESC, 6 DESC, 30;


-- schsaf.view_payment_application_report source

CREATE OR REPLACE VIEW schsaf.view_payment_application_report
AS SELECT tpa.id,
    tp.nit_payer AS identification_number,
    tc.short_name,
    tp.consecutive_payment AS payment_number,
    (tp.payment_date || ' '::text) || tp.payment_time AS payment_date,
    tp.value AS payment_value,
    tpa.application_type,
        CASE
            WHEN tpa.user_applied::text = 'Operación ejecutada por el sistema'::text THEN 'AUTOMÁTICA'::character varying
            ELSE 'MANUAL'::character varying
        END AS elaboration_type,
    tpa.state,
    tpa.applied_value,
    tpa.user_applied,
    tpr.name AS product_name,
    ti.number_svf AS obligation_number,
    ( SELECT sum(trpd.paid_value) AS sum
           FROM schsaf.tbl_receivable_payment_details trpd
          WHERE tpa.id = trpd.payment_application_id) AS receivables_value,
    tpi.moratorium_value,
    tpi.remunerative_value,
    tpi.principal_value,
    abs(tpi.portfolio_tolerance_value) AS tolerance_value,
    tpa.created_at AS application_date,
    tpa.consecutive AS application_number,
    tpaa.consecutive AS annulment_number,
    tpaa.user_applied AS annulment_user_applied,
    tpaa.created_at AS annulment_date,
    tp.nit_beneficiary AS identification_number_beneficiary,
    tc2.short_name AS short_name_beneficiary,
    tpa.consecutive AS payment_application_number,
    tc3.short_name AS provider_name,
    tc3.document_number AS provider_identification_number,
    tpi.tolerance_value AS obligation_tolerance_value,
        CASE
            WHEN tpi.portfolio_tolerance_value > 0::numeric THEN 'surplus'::text
            WHEN tpi.portfolio_tolerance_value < 0::numeric THEN 'missing'::text
            ELSE 'no_values'::text
        END AS tolerance_status,
    tpd.shared_discount_value AS dpp_value,
    (tpd.shared_discount_value - tpd.gmf_value - tpd.rft_value)::numeric(22,4) AS dpp_transfer,
    tpd.gmf_value AS dpp_gmf,
    tpd.rft_value AS dpp_rtf,
    tca.causal AS causal_annulment,
    tpaa.description AS annulment_justification,
    tp.currency,
    tp.code_agreement,
    tp.payment_channel,
    tpc.channel_code,
    tpc.description AS channel_description,
    tpc.agreement_code,
    tpm.modality,
    tob.id AS obligation_id,
    tpi.total_value AS legalized_payment,
    tpi.id AS payment_instruction_id,
    tpd.id AS payback_drafts_id,
    tpi.discount_for_amortize,
    tpi.vpd_refund_value
   FROM schsaf.tbl_payment tp
     JOIN schsaf.tbl_client tc ON tc.document_number::text = (( SELECT
                CASE
                    WHEN (EXISTS ( SELECT 1
                       FROM schsaf.tbl_client
                      WHERE tbl_client.document_number::text = tp.nit_payer::text)) THEN tp.nit_payer::text
                    ELSE tp.nit_beneficiary::text
                END AS nit_beneficiary))
     JOIN schsaf.tbl_payment_application tpa ON tpa.payment_id = tp.id
     LEFT JOIN schsaf.tbl_payment_instruction tpi ON tpi.payment_application_id = tpa.id
     LEFT JOIN schsaf.tbl_obligations tob ON tpi.obligation_id = tob.id
     LEFT JOIN schsaf.tbl_obligation_invoice oi ON tob.id = oi.obligation_id
     LEFT JOIN schsaf.tbl_invoice ti ON ti.id = oi.invoice_id
     LEFT JOIN schsaf.tbl_business_relationships tbr ON tob.business_relationship_id = tbr.id
     LEFT JOIN schsaf.tbl_products_modalities tpm ON tpm.id = tbr.productmodality_id
     LEFT JOIN schsaf.tbl_products tpr ON tpm.product_id = tpr.id
     LEFT JOIN schsaf.tbl_payment_application_annulment tpaa ON tpaa.id_payment_application = tpa.id
     LEFT JOIN schsaf.tbl_client tc2 ON tp.nit_beneficiary::text = tc2.document_number::text
     LEFT JOIN schsaf.tbl_client tc3 ON tbr.provider_id = tc3.id
     LEFT JOIN schsaf.tbl_causal_annulment tca ON tpaa.id_causal_annulment = tca.id
     LEFT JOIN schsaf.tbl_payback_drafts tpd ON tpi.id = tpd.payment_instruction_id
     LEFT JOIN schsaf.tbl_payment_channel tpc ON tpc.id = tp.payment_channel
  WHERE tpa.state::text <> 'FAILED'::text
  ORDER BY tpa.id DESC;


-- schsaf.view_payment_distribution source

CREATE OR REPLACE VIEW schsaf.view_payment_distribution
AS SELECT tpd.id,
    tpd.payment_id,
    tp.consecutive_payment,
    tp.date_payment_distribution,
    tp.payment_distribution_consecutive,
    tpd.distribution_consecutive,
    tpd.client_id,
    tc.document_number,
    tc.full_name,
    tpd.assigned_value,
    tpd.status,
    ca.causal,
    tpd.justify_cancel,
    tpd.value_pending_application
   FROM schsaf.tbl_payment_distribution tpd
     JOIN schsaf.tbl_payment tp ON tp.id = tpd.payment_id AND tp.income_distributed = true
     JOIN schsaf.tbl_client tc ON tc.id = tpd.client_id
     LEFT JOIN schsaf.tbl_causal_annulment ca ON ca.id = tpd.causal_annulment_id;


-- schsaf.view_payment_search_info source

CREATE OR REPLACE VIEW schsaf.view_payment_search_info
AS SELECT tp.id,
    tp.consecutive_payment,
    tp.nit_payer,
    tc.full_name AS name_nit_payer,
    tc.short_name AS short_name_payer,
    tp.payment_date,
    tp.payment_time,
    tp.nit_beneficiary,
    tc1.full_name AS name_beneficiary,
    tc1.short_name AS short_name_beneficiary,
    tci.city_name AS city,
    tp.value,
    tp.payment_channel,
    tp.code_agreement,
    tp.type_payment,
    tp.currency,
    tp.status,
    tp.type_record,
    tp.created,
    tp.updated,
    ( SELECT DISTINCT ON (tpa.payment_id) tpa.created_at
           FROM schsaf.tbl_payment_application tpa
          WHERE tpa.payment_id = tp.id AND tpa.state::text = 'APPLIED'::text
          ORDER BY tpa.payment_id, tpa.id DESC) AS date_payment_application,
    tp.date_payment_distribution,
    tp.value_application,
    tp.value_pending_application,
    tp.remaining_amount_return,
    tp.income_distributed,
    tp.justify_cancel,
    tp.causal_annulment_id,
    tp.payment_distribution_user,
    tp.payment_distribution_consecutive,
    tp.justify,
    tp.type_payment AS type_payment_description,
    tpc.description AS payment_channel_description,
    tca.causal AS causal_annulment,
    tpd.payback_draft_value::numeric(20,2) AS value_payback,
    tpd.gmf_value::numeric(20,2) AS gmf_value_payback,
    tp.income_centralized,
    ( SELECT count(tpa.id) AS count
           FROM schsaf.tbl_payment_application tpa
          WHERE tpa.payment_id = tp.id) AS total_applications,
    ( SELECT count(tpa.id) AS count
           FROM schsaf.tbl_payment_application tpa
          WHERE tpa.state::text = 'APPLIED'::text AND tpa.payment_id = tp.id) AS applications_applied,
    (tpd.payback_draft_value + tpd.gmf_value)::numeric(20,2) AS total_payback,
        CASE
            WHEN tp.status::text = 'IMPEDIMENTO'::text THEN ( SELECT tpa.fault_description
               FROM schsaf.tbl_payment_application tpa
              WHERE tpa.payment_id = tp.id
              ORDER BY tpa.created_at DESC
             LIMIT 1)
            ELSE 'na'::character varying
        END AS last_impediment,
    tcpi.type_application_id::smallint AS application_type,
    tp.created_by_user,
    tp.annulled_by_user
   FROM schsaf.tbl_payment tp
     LEFT JOIN schsaf.tbl_client tc ON tc.document_number::text = tp.nit_payer::text
     JOIN schsaf.tbl_payment_channel tpc ON tpc.id = tp.payment_channel
     LEFT JOIN schsaf.tbl_client tc1 ON tc1.document_number::text = tp.nit_beneficiary::text
     LEFT JOIN schsaf.tbl_causal_annulment tca ON tca.id = tp.causal_annulment_id
     LEFT JOIN schsaf.tbl_cities tci ON tci.city_code::text = tp.city::text
     LEFT JOIN ( SELECT tmr.id_relationship,
            tpd_1.id,
            sum(tpd_1.rft_value) AS rft_value,
            sum(tpd_1.gmf_value) AS gmf_value,
            sum(tpd_1.payback_draft_value) AS payback_draft_value,
            tpd_1.bank_account,
            tpd_1.maintenance_id
           FROM schsaf.tbl_payback_drafts tpd_1
             JOIN schsaf.tbl_maintenance_relationships tmr ON tpd_1.maintenance_id = tmr.id_maintenance
             JOIN schsaf.tbl_maintenance tm ON tm.id = tmr.id_maintenance
          WHERE tm.state::text = 'APPROVED'::text AND tmr.table_name::text = 'tbl_payments'::text AND tpd_1.state::text = 'PAYED_DRAFT'::text
          GROUP BY tpd_1.id, tmr.id_relationship) tpd ON tpd.id_relationship = tp.id
     LEFT JOIN schsaf.tbl_client_payment_instruction tcpi ON tcpi.client_id = tc1.id;


-- schsaf.view_quota_factoring_extra_limit source

CREATE OR REPLACE VIEW schsaf.view_quota_factoring_extra_limit
AS SELECT tqfel.id,
    tqfel.client_id,
    tp.id AS product_id,
    tp.name AS product_name,
    tp.currency,
    tpm.acronym,
    tqfel.product_modality_id,
    tpm.modality,
    tc.document_number AS client_document_number,
    tcs.document_type AS client_document_type,
    tqfel.supplier_id,
    tcs.document_number AS supplier_document_number,
    tcs.document_type AS supplier_document_type,
    tcs.full_name AS supplier_full_name,
    tqfel.start_date_quota,
    tqfel.end_date_quota,
    tqfel.approved_limit,
    tqfel.consumed_limit,
    tqfel.approved_limit - tqfel.consumed_limit AS available_limit,
    tqfel.created,
    tqfel.updated,
    tqfel.quota_state
   FROM schsaf.tbl_quota_factoring_exclusive_limit tqfel
     JOIN schsaf.tbl_products_modalities tpm ON tpm.id = tqfel.product_modality_id
     JOIN schsaf.tbl_products tp ON tp.id = tpm.product_id
     JOIN schsaf.tbl_client tcs ON tcs.id = tqfel.supplier_id
     JOIN schsaf.tbl_client tc ON tc.id = tqfel.client_id;


-- schsaf.view_quota_factoring_report source

CREATE OR REPLACE VIEW schsaf.view_quota_factoring_report
AS SELECT row_number() OVER () AS id,
    c.id AS client_id,
    c.document_number AS client_document_number,
    c.full_name AS client_full_name,
    g.id AS global_id,
    g.act_number AS global_act_number,
    g.value AS global_value,
    p.id AS quota_product_id,
        CASE
            WHEN now() >= p.start_date AND now() <= p.end_date THEN 'VIGENTE'::character varying
            ELSE 'VENCIDO'::character varying
        END AS quota_product_status,
    tp.id AS product_id,
    tp.name AS product_name,
    tpm.id AS modality_id,
    tpm.modality AS modality_name,
    p.value AS quota_product_value,
    c.document_type AS client_document_type,
    c.short_name AS client_short_name,
        CASE
            WHEN c.self_retainer_other_income::text = 'RESPUE_S'::text THEN 'SI'::character varying
            WHEN c.self_retainer_other_income::text = 'RESPUE_N'::text THEN 'NO'::character varying
            ELSE NULL::character varying
        END AS client_self_retainer,
        CASE
            WHEN c.type_customer::text = 'PJ'::text THEN 'Jurídica'::character varying
            WHEN c.type_customer::text = 'PN'::text THEN 'Natural'::character varying
            ELSE NULL::character varying
        END AS client_customer_type,
    tc.city_name AS client_city,
    c.date_last_update AS client_last_update,
    g.start_date AS global_start_date,
    g.end_date AS global_end_date,
        CASE
            WHEN now() >= g.start_date AND now() <= g.end_date THEN 'VIGENTE'::character varying
            ELSE 'VENCIDO'::character varying
        END AS global_status,
    g.updated_at AS global_last_update,
        CASE
            WHEN upper(tp.name::text) = 'CONFIRMING'::text AND (upper(tpm.modality::text) = 'CON RECURSO'::text OR upper(tpm.modality::text) = 'SIN RECURSO'::text) THEN 'DF'::character varying
            WHEN upper(tp.name::text) = 'PLUS'::text AND (upper(tpm.modality::text) = 'CON RECURSO'::text OR upper(tpm.modality::text) = 'SIN RECURSO'::text) THEN 'DF'::character varying
            ELSE NULL::character varying
        END AS line,
    p.start_date AS quota_product_start_date,
    p.end_date AS quota_product_end_date,
    p.update_at AS quota_product_last_update,
    g.created_at AS global_created_at
   FROM schsaf.tbl_quota_product p
     JOIN schsaf.tbl_quota_global g ON p.quota_global_id = g.id
     JOIN schsaf.tbl_client c ON g.client_id = c.id
     JOIN schsaf.tbl_products_modalities tpm ON p.product_modality_id = tpm.id
     JOIN schsaf.tbl_products tp ON tpm.product_id = tp.id
     LEFT JOIN schsaf.tbl_cities tc ON c.city_code::text = tc.city_code::text;


-- schsaf.view_rate_filter source

CREATE OR REPLACE VIEW schsaf.view_rate_filter
AS SELECT tr.id,
    tr.created,
    tr.end_date,
    tr.start_date,
    tr.status,
    tr.updated,
    tr.value,
    tr.value_point_slack,
    tr.value_usury_rate,
    tr.approved_at,
    tr.rate_type_id,
    date_part('year'::text, tr.start_date) AS year,
    date_part('month'::text, tr.start_date) AS month,
    trt.type_code
   FROM schsaf.tbl_rate tr
     JOIN schsaf.tbl_rate_type trt ON trt.id = tr.rate_type_id;


-- schsaf.view_receivable_and_account_payable source

CREATE OR REPLACE VIEW schsaf.view_receivable_and_account_payable
AS SELECT tr.id,
    tr.created_at,
    tr.type,
        CASE
            WHEN tr.type::text = 'MTTO'::text THEN 'Mantenimientos'::text
            WHEN tr.type::text = 'DPP'::text THEN 'Aplicación de pago'::text
            WHEN tr.type::text = 'ARED'::text THEN 'Recaudos'::text
            ELSE NULL::text
        END AS process,
    tr.description,
    tcr.id AS client_id,
    tcr.document_number AS document_number_account_owner,
    tcr.short_name AS short_name_account_owner,
    ( SELECT tmat.type_code
           FROM schsaf.tbl_maintenance_account_type tmat
          WHERE tmat.description::text = 'Cuentas por Cobrar'::text) AS account_type,
    tr.value AS receivable_value,
    NULL::numeric AS account_payable_net_value,
    tr.state,
    NULL::numeric AS gmf_value,
    tm.maintenance_consecutive,
    tm.approver_user AS maintenance_approver_user,
    tmc.name AS maintenance_name_causal,
    tpaa.consecutive AS payment_application_consecutive,
    tpaa.user_applied AS payment_application_approver_user,
    tca.causal AS payment_application_causal,
    tp.consecutive_payment,
    tp.annulled_by_user AS payment_approver_user,
    tcaa.causal AS payment_causal,
    tm.id AS id_maintenance
   FROM schsaf.tbl_receivable tr
     JOIN schsaf.tbl_client tcr ON tcr.id = tr.client_id
     LEFT JOIN schsaf.tbl_maintenance tm ON tm.id = tr.maintenance_id
     LEFT JOIN schsaf.tbl_maintenance_causal tmc ON tmc.id = tm.id_maintenance_causal
     LEFT JOIN schsaf.tbl_payment_instruction tpi ON tpi.id = tr.payment_instruction_id
     LEFT JOIN schsaf.tbl_payment_application tpa ON tpa.id = tpi.payment_application_id
     LEFT JOIN schsaf.tbl_payment_application_annulment tpaa ON tpa.id = tpaa.id_payment_application
     LEFT JOIN schsaf.tbl_causal_annulment tca ON tca.id = tpaa.id_causal_annulment
     LEFT JOIN schsaf.tbl_payment tp ON tp.id = tr.payment_id
     LEFT JOIN schsaf.tbl_causal_annulment tcaa ON tcaa.id = tp.causal_annulment_id
UNION ALL
 SELECT tap.id,
    tap.created_at,
    tap.code_maintenance_type AS type,
    'Mantenimientos'::text AS process,
    tap.description,
    tc.id AS client_id,
    tc.document_number AS document_number_account_owner,
    tc.short_name AS short_name_account_owner,
    ( SELECT tmat.type_code
           FROM schsaf.tbl_maintenance_account_type tmat
          WHERE tmat.description::text = 'Cuentas por Pagar'::text) AS account_type,
    NULL::numeric AS receivable_value,
        CASE
            WHEN tap.state::text = 'PENDING'::text THEN tap.value - COALESCE(tap.gmf, 0::numeric)
            WHEN tap.state::text = 'SUCCESSFUL_TRANSFER'::text THEN tap.paid_value
            ELSE NULL::numeric
        END AS account_payable_net_value,
    tap.state,
    tap.gmf AS gmf_value,
    tm.maintenance_consecutive,
    tm.approver_user AS maintenance_approver_user,
    tmc.name AS maintenance_name_causal,
    NULL::character varying AS payment_application_consecutive,
    NULL::character varying AS payment_application_approver_user,
    NULL::character varying AS payment_application_causal,
    NULL::character varying AS consecutive_payment,
    NULL::character varying AS payment_approver_user,
    NULL::character varying AS payment_causal,
    tm.id AS id_maintenance
   FROM schsaf.tbl_account_payable tap
     JOIN schsaf.tbl_client tc ON tc.id = tap.client_id
     LEFT JOIN schsaf.tbl_maintenance tm ON tm.id = tap.maintenance_id
     LEFT JOIN schsaf.tbl_maintenance_causal tmc ON tmc.id = tm.id_maintenance_causal
  ORDER BY 2 DESC;


-- schsaf.view_receivable_and_specials source

CREATE OR REPLACE VIEW schsaf.view_receivable_and_specials
AS SELECT tr.maintenance_id,
    tr.id,
    tr.created_at,
        CASE
            WHEN
            CASE
                WHEN tmt.code_type::text ~~ '%002'::text THEN 'AC001'::text
                WHEN tmt.code_type::text ~~ '%003'::text THEN 'IDP001'::text
                WHEN tmt.code_type::text ~~ '%004'::text THEN 'PO001'::text
                ELSE 'CXC'::text
            END = 'CXC'::text AND (tr.state::text = ANY (ARRAY['PAID'::character varying::text, 'PAID_PARTIAL'::character varying::text])) THEN tr.updated_at
            ELSE NULL::timestamp without time zone
        END AS date_last_payment,
        CASE
            WHEN tmt.code_type::text ~~ '%002'::text THEN 'AC001'::text
            WHEN tmt.code_type::text ~~ '%003'::text THEN 'IDP001'::text
            WHEN tmt.code_type::text ~~ '%004'::text THEN 'PO001'::text
            ELSE 'CXC'::text
        END AS type,
        CASE tr.type
            WHEN 'MTTO'::text THEN 'Mantenimientos'::text
            WHEN 'DPP'::text THEN 'Aplicación de pago'::text
            WHEN 'ARED'::text THEN 'Recaudos'::text
            ELSE NULL::text
        END AS process,
        CASE
            WHEN tr.type::text = 'MTTO'::text THEN tmt.name
            ELSE tr.description
        END AS description,
    tmt.code_type AS maintenance_code_type,
    tm.maintenance_consecutive,
        CASE tr.type
            WHEN 'DPP'::text THEN tpaa.consecutive
            WHEN 'ARED'::text THEN tp.consecutive_payment
            ELSE NULL::character varying
        END AS payment_consecutive,
        CASE tr.type
            WHEN 'MTTO'::text THEN tmc.name
            WHEN 'DPP'::text THEN tca.causal
            WHEN 'ARED'::text THEN tcaa.causal
            ELSE NULL::character varying
        END AS causal,
    tcr.document_number AS client_document_number,
    tcr.short_name AS client_name,
    tr.value AS receivable_value,
        CASE
            WHEN tr.state::text = 'PAID'::text THEN 0::numeric
            ELSE tr.value - tr.paid_value
        END AS receivable_value_pending,
    tr.state,
    tm.executer_user AS maintenance_execute_user,
    tm.approver_user AS maintenance_approve_user
   FROM schsaf.tbl_receivable tr
     JOIN schsaf.tbl_client tcr ON tcr.id = tr.client_id
     LEFT JOIN schsaf.tbl_payment_instruction tpi ON tpi.id = tr.payment_instruction_id
     LEFT JOIN schsaf.tbl_payment_application tpa ON tpa.id = tpi.payment_application_id
     LEFT JOIN schsaf.tbl_payment_application_annulment tpaa ON tpa.id = tpaa.id_payment_application
     LEFT JOIN schsaf.tbl_causal_annulment tca ON tca.id = tpaa.id_causal_annulment
     LEFT JOIN schsaf.tbl_payment tp ON tp.id = tr.payment_id
     LEFT JOIN schsaf.tbl_causal_annulment tcaa ON tcaa.id = tp.causal_annulment_id
     LEFT JOIN schsaf.tbl_maintenance tm ON tr.maintenance_id = tm.id
     LEFT JOIN schsaf.tbl_maintenance_causal tmc ON tm.id_maintenance_causal = tmc.id
     LEFT JOIN schsaf.tbl_maintenance_detail tmd ON tm.id = tmd.id_maintenance
     LEFT JOIN schsaf.tbl_maintenance_type tmt ON tmd.id_maintenance_type = tmt.id
  ORDER BY tr.created_at DESC;


-- schsaf.view_refund_advance_payment_info source

CREATE OR REPLACE VIEW schsaf.view_refund_advance_payment_info
AS SELECT tc2.document_number AS nit_provider,
    tc2.full_name AS name_provider,
    tc2.short_name AS provider_short_name,
    tc.document_number AS nit_payer,
    tc.full_name AS name_payer,
    tc.short_name AS payer_short_name,
        CASE tpd.type_client_beneficiary
            WHEN 'Proveedor'::text THEN tc2.document_number
            WHEN 'Pagador'::text THEN tc.document_number
            ELSE ''::character varying
        END AS nit_beneficiary,
        CASE tpd.type_client_beneficiary
            WHEN 'Proveedor'::text THEN tc2.full_name
            WHEN 'Pagador'::text THEN tc.full_name
            ELSE ''::character varying
        END AS name_beneficiary,
        CASE tpd.type_client_beneficiary
            WHEN 'Proveedor'::text THEN tc2.short_name
            WHEN 'Pagador'::text THEN tc.short_name
            ELSE ''::character varying
        END AS beneficiary_short_name,
    tpa.payment_date,
    tpa.consecutive AS number_payment_application,
    ti.number_svf AS number_obligation,
    tp.name AS product_name,
    tpm.modality,
    tbo.disbursement_value + tbo.discount_value AS initial_capital,
    tpd.payback_draft_value AS discount_for_amortize,
    tpd.rft_value AS rtf_value,
    tbo.state,
    pis.state AS payment_state,
    tpd.id,
    tbr.payer_id,
    tpd.state AS payback_drafts_state
   FROM schsaf.tbl_payback_drafts tpd
     JOIN schsaf.tbl_payment_instruction pis ON tpd.payment_instruction_id = pis.id AND tpd.payback_draft_type_id = 1
     JOIN schsaf.tbl_obligations tbo ON pis.obligation_id = tbo.id AND tbo.state::text = 'CANCELED'::text
     JOIN schsaf.tbl_business_relationships tbr ON tbo.business_relationship_id = tbr.id
     JOIN schsaf.tbl_client tc ON tbr.payer_id = tc.id
     JOIN schsaf.tbl_client tc2 ON tbr.provider_id = tc2.id
     JOIN schsaf.tbl_products_modalities tpm ON tbr.productmodality_id = tpm.id
     JOIN schsaf.tbl_products tp ON tpm.product_id = tp.id
     JOIN schsaf.tbl_payment_application tpa ON pis.payment_application_id = tpa.id
     JOIN schsaf.tbl_obligation_invoice toi ON tbo.id = toi.obligation_id
     JOIN schsaf.tbl_invoice ti ON toi.invoice_id = ti.id
     JOIN schsaf.tbl_invoice_header tih ON ti.invoice_header_id = tih.id
  ORDER BY tpd.id;


-- schsaf.view_refund_and_account_payable source

CREATE OR REPLACE VIEW schsaf.view_refund_and_account_payable
AS WITH maintenance_info AS (
         SELECT tm.id AS id_maintenance,
            tmr.id_relationship,
            tm.created_at,
            tm.updated_at,
            tm.approver_user,
            tm.executer_user,
            tmr.table_name
           FROM schsaf.tbl_maintenance_relationships tmr
             JOIN schsaf.tbl_maintenance tm ON tmr.id_maintenance = tm.id
          WHERE tm.state::text = 'APPROVED'::text
        ), combined_data AS (
         SELECT tm.id AS maintenance_id,
            tpd.id AS id_reference,
            tm.state,
            tpd.created_at AS create_at_global,
            tm.created_at AS create_at_maintenance,
            tm.updated_at AS approve_at_maintenance,
            tc.document_number AS customer_id,
            tc.short_name AS customer_name,
            tmt.name AS name_type,
            tmt.code_type,
            'Aplicaciones de Pago'::text AS generating_process,
            NULL::character varying AS maintenance_consecutive,
            tpa.consecutive AS payment_application_consecutive,
            NULL::character varying AS payment_consecutive,
            tpd.shared_discount_value AS amount_before_gmf_and_rtf,
            tpd.gmf_value,
            tpd.rft_value AS rtf_value,
            tpd.shared_discount_value - tpd.gmf_value - tpd.rft_value AS disbursement_amount,
            tba.account_number AS bank_account_number,
            tba.account_type AS bank_account_type,
            tba.customer_identification_number AS bank_account_holder_id,
            tba.customer_name AS bank_account_holder_name,
            tmc.name AS causal,
            tm.executer_user AS execute_user,
            tm.approver_user AS approve_user
           FROM schsaf.tbl_maintenance tm
             JOIN schsaf.tbl_maintenance_detail tmd ON tm.id = tmd.id_maintenance
             JOIN schsaf.tbl_maintenance_causal tmc ON tm.id_maintenance_causal = tmc.id
             JOIN schsaf.tbl_maintenance_relationships tmr ON tm.id = tmr.id_maintenance
             JOIN schsaf.tbl_maintenance_type tmt ON tmd.id_maintenance_type = tmt.id
             JOIN schsaf.tbl_maintenance_category_type tmct ON tmt.maintenance_category_type_id = tmct.id AND tmct.category_code::text = 'DV02'::text
             JOIN schsaf.tbl_payback_drafts tpd ON tmr.id_relationship = tpd.id
             LEFT JOIN schsaf.tbl_client tc ON tpd.client_id = tc.id
             LEFT JOIN schsaf.tbl_payment_instruction tpi ON tpd.payment_instruction_id = tpi.id
             LEFT JOIN schsaf.tbl_payment_application tpa ON tpi.payment_application_id = tpa.id
             LEFT JOIN schsaf.tbl_bank_account tba ON tpd.bank_account = tba.id
          WHERE tm.state::text = 'APPROVED'::text AND tmt.code_type::text = 'DDPP001'::text
        UNION ALL
         SELECT tm.id AS maintenance_id,
            tpd.id AS id_reference,
            tm.state,
            tpd.created_at AS create_at_global,
            tm.created_at AS create_at_maintenance,
            tm.updated_at AS approve_at_maintenance,
            tc.document_number AS customer_id,
            tc.short_name AS customer_name,
            tmt.name AS name_type,
            tmt.code_type,
            'Aplicaciones de Pago'::text AS generating_process,
            NULL::character varying AS maintenance_consecutive,
            NULL::character varying AS payment_application_consecutive,
            NULL::character varying AS payment_consecutive,
            tpd.shared_discount_value AS amount_before_gmf_and_rtf,
            tpd.gmf_value,
            tpd.rft_value AS rtf_value,
            tpd.shared_discount_value - tpd.gmf_value - tpd.rft_value AS disbursement_amount,
            tba.account_number AS bank_account_number,
            tba.account_type AS bank_account_type,
            tba.customer_identification_number AS bank_account_holder_id,
            tba.customer_name AS bank_account_holder_name,
            tmc.name AS causal,
            tm.executer_user AS execute_user,
            tm.approver_user AS approve_user
           FROM schsaf.tbl_maintenance tm
             JOIN schsaf.tbl_maintenance_detail tmd ON tm.id = tmd.id_maintenance
             JOIN schsaf.tbl_maintenance_causal tmc ON tm.id_maintenance_causal = tmc.id
             JOIN schsaf.tbl_maintenance_type tmt ON tmd.id_maintenance_type = tmt.id
             JOIN schsaf.tbl_maintenance_category_type tmct ON tmt.maintenance_category_type_id = tmct.id AND tmct.category_code::text = 'DV02'::text
             LEFT JOIN schsaf.tbl_payback_drafts tpd ON tpd.maintenance_id = tm.id
             LEFT JOIN schsaf.tbl_client tc ON tpd.client_id = tc.id
             LEFT JOIN schsaf.tbl_bank_account tba ON tpd.bank_account = tba.id
          WHERE tm.state::text = 'APPROVED'::text AND tmt.code_type::text <> 'DDPP001'::text
        UNION ALL
         SELECT NULL::bigint AS maintenance_id,
            tp.id AS id_reference,
            'PENDING'::character varying AS state,
            tp.created AS create_at_global,
            NULL::timestamp without time zone AS create_at_maintenance,
            NULL::timestamp without time zone AS approve_at_maintenance,
            tp.nit_beneficiary AS customer_id,
            tc.short_name AS customer_name,
            'Devolucion Error de Pago - Devolucion Excedente de pago'::character varying AS name_type,
            'DEP001-DEP002'::character varying AS code_type,
            'Recaudos'::text AS generating_process,
            NULL::character varying AS maintenance_consecutive,
            NULL::character varying AS payment_application_consecutive,
            tp.consecutive_payment AS payment_consecutive,
            tp.value_pending_application AS amount_before_gmf_and_rtf,
            NULL::numeric AS gmf_value,
            NULL::numeric AS rtf_value,
            tp.value_pending_application AS disbursement_amount,
            NULL::character varying AS bank_account_number,
            NULL::character varying AS bank_account_type,
            NULL::character varying AS bank_account_holder_id,
            NULL::character varying AS bank_account_holder_name,
            NULL::character varying AS causal,
            NULL::character varying AS execute_user,
            NULL::character varying AS approve_user
           FROM schsaf.tbl_payment tp
             JOIN schsaf.tbl_client tc ON tc.document_number::text = tp.nit_beneficiary::text
             JOIN schsaf.tbl_payment_channel tpc ON tpc.id = tp.payment_channel
             LEFT JOIN schsaf.tbl_causal_annulment tca ON tca.id = tp.causal_annulment_id
             LEFT JOIN schsaf.tbl_cities tci ON tci.city_code::text = tp.city::text
             LEFT JOIN schsaf.tbl_client_payment_instruction tcpi ON tcpi.client_id = tc.id
          WHERE tp.status::text = ANY (ARRAY['APLICACION_PAGO_PARCIAL'::text, 'PENDIENTE_DISTRIBUIR_APLICAR'::text, 'PARCIALMENTE_DISTRIBUIDO'::text])
        UNION ALL
         SELECT tm.id AS maintenance_id,
            tap.id AS id_reference,
            tap.state,
            tap.created_at AS create_at_global,
            mi.created_at AS create_at_maintenance,
            mi.updated_at AS approve_at_maintenance,
            tc.document_number AS customer_id,
            tc.short_name AS customer_name,
            'Cuentas por Pagar'::character varying AS name_type,
            'CXP'::character varying AS code_type,
            tap.description AS generating_process,
            tm.maintenance_consecutive,
            NULL::character varying AS payment_application_consecutive,
            NULL::character varying AS payment_consecutive,
                CASE
                    WHEN tap.state::text = 'PENDING'::text THEN tap.value - COALESCE(tap.gmf, 0::numeric)
                    WHEN tap.state::text = 'SUCCESSFUL_TRANSFER'::text THEN tap.paid_value
                    ELSE NULL::numeric
                END AS amount_before_gmf_and_rtf,
            tap.gmf AS gmf_value,
            NULL::numeric AS rtf_value,
            tap.paid_value + tap.value AS disbursement_amount,
            tba.account_number AS bank_account_number,
            tba.account_type AS bank_account_type,
            tba.customer_identification_number AS bank_account_holder_id,
            tba.customer_name AS bank_account_holder_name,
            tmc.name AS causal,
                CASE
                    WHEN tap.state::text = 'PENDING'::text THEN tm.executer_user
                    WHEN tap.state::text = 'SUCCESSFUL_TRANSFER'::text THEN mi.executer_user
                    ELSE NULL::character varying
                END AS execute_user,
                CASE
                    WHEN tap.state::text = 'PENDING'::text THEN tm.approver_user
                    WHEN tap.state::text = 'SUCCESSFUL_TRANSFER'::text THEN mi.approver_user
                    ELSE NULL::character varying
                END AS approve_user
           FROM schsaf.tbl_account_payable tap
             JOIN schsaf.tbl_client tc ON tc.id = tap.client_id
             LEFT JOIN schsaf.tbl_maintenance tm ON tm.id = tap.maintenance_id
             LEFT JOIN schsaf.tbl_maintenance_causal tmc ON tmc.id = tm.id_maintenance_causal
             LEFT JOIN schsaf.tbl_maintenance_detail tmd ON tmd.id_maintenance = tap.maintenance_id
             LEFT JOIN schsaf.tbl_bank_account tba ON tba.id = tap.bank_account_id
             LEFT JOIN maintenance_info mi ON tap.id = mi.id_relationship AND mi.table_name::text = 'tbl_account_payable'::text
        UNION ALL
         SELECT tpd.maintenance_id,
            tpd.id AS id_reference,
            'PENDING'::character varying AS state,
            tpd.created_at AS create_at_global,
            NULL::timestamp without time zone AS create_at_maintenance,
            NULL::timestamp without time zone AS approve_at_maintenance,
                CASE tpd.type_client_beneficiary
                    WHEN 'Proveedor'::text THEN tc2.document_number
                    WHEN 'Pagador'::text THEN tc.document_number
                    ELSE ''::character varying
                END AS customer_id,
                CASE tpd.type_client_beneficiary
                    WHEN 'Proveedor'::text THEN tc2.short_name
                    WHEN 'Pagador'::text THEN tc.short_name
                    ELSE ''::character varying
                END AS customer_name,
            'Devolucion Descuento Por Pronto Pago'::character varying AS name_type,
            'DDPP001'::character varying AS code_type,
            'Aplicaciones de pago'::text AS generating_process,
            NULL::character varying AS maintenance_consecutive,
            tpa.consecutive AS payment_application_consecutive,
            tpayment.consecutive_payment AS payment_consecutive,
            tpd.shared_discount_value AS amount_before_gmf_and_rtf,
            tpd.gmf_value,
            tpd.rft_value AS rtf_value,
            tpd.payback_draft_value AS disbursement_amount,
            NULL::character varying AS bank_account_number,
            NULL::character varying AS bank_account_type,
            NULL::character varying AS bank_account_holder_id,
            NULL::character varying AS bank_account_holder_name,
            NULL::character varying AS causal,
            NULL::character varying AS execute_user,
            NULL::character varying AS approve_user
           FROM schsaf.tbl_payback_drafts tpd
             JOIN schsaf.tbl_payment_instruction pis ON tpd.payment_instruction_id = pis.id AND tpd.payback_draft_type_id = 1
             JOIN schsaf.tbl_obligations tbo ON pis.obligation_id = tbo.id AND tbo.state::text = 'CANCELED'::text
             JOIN schsaf.tbl_business_relationships tbr ON tbo.business_relationship_id = tbr.id
             JOIN schsaf.tbl_client tc ON tbr.payer_id = tc.id
             JOIN schsaf.tbl_client tc2 ON tbr.provider_id = tc2.id
             JOIN schsaf.tbl_products_modalities tpm ON tbr.productmodality_id = tpm.id
             JOIN schsaf.tbl_products tp ON tpm.product_id = tp.id
             JOIN schsaf.tbl_payment_application tpa ON pis.payment_application_id = tpa.id
             JOIN schsaf.tbl_payment tpayment ON pis.payment_id = tpayment.id
             JOIN schsaf.tbl_obligation_invoice toi ON tbo.id = toi.obligation_id
             JOIN schsaf.tbl_invoice ti ON toi.invoice_id = ti.id
             JOIN schsaf.tbl_invoice_header tih ON ti.invoice_header_id = tih.id
          WHERE tpd.state::text = 'PENDING'::text
        )
 SELECT row_number() OVER () AS unique_id,
    combined_data.maintenance_id,
    combined_data.id_reference,
    combined_data.state,
    combined_data.create_at_global,
    combined_data.create_at_maintenance,
    combined_data.approve_at_maintenance,
    combined_data.customer_id,
    combined_data.customer_name,
    combined_data.name_type,
    combined_data.code_type,
    combined_data.generating_process,
    combined_data.maintenance_consecutive,
    combined_data.payment_application_consecutive,
    combined_data.payment_consecutive,
    combined_data.amount_before_gmf_and_rtf,
    combined_data.gmf_value,
    combined_data.rtf_value,
    combined_data.disbursement_amount,
    combined_data.bank_account_number,
    combined_data.bank_account_type,
    combined_data.bank_account_holder_id,
    combined_data.bank_account_holder_name,
    combined_data.causal,
    combined_data.execute_user,
    combined_data.approve_user
   FROM combined_data;


-- schsaf.view_remunerative_plus_value source

CREATE OR REPLACE VIEW schsaf.view_remunerative_plus_value
AS SELECT tamd.obligation_id,
    date_trunc('month'::text, tamd.created_at) AS month,
    (sum(
        CASE
            WHEN tam.nature::text = 'DEBIT'::text THEN tamd.value
            ELSE 0::double precision
        END) - sum(
        CASE
            WHEN tam.nature::text = 'CREDIT'::text THEN tamd.value
            ELSE 0::double precision
        END))::numeric AS monthly_value
   FROM schsaf.tbl_accounting_movement_detail tamd
     JOIN schsaf.tbl_accounting_movement tam ON tamd.movement_id = tam.id
     JOIN schsaf.tbl_accounting_account taa ON tam.account_id = taa.id
  WHERE taa.number::text = '4102024481'::text
  GROUP BY tamd.obligation_id, (date_trunc('month'::text, tamd.created_at));


-- schsaf.view_remunerative_value source

CREATE OR REPLACE VIEW schsaf.view_remunerative_value
AS SELECT tamd.obligation_id,
    date_trunc('month'::text, tamd.created_at) AS month,
    (sum(
        CASE
            WHEN tam.nature::text = 'DEBIT'::text THEN tamd.value
            ELSE 0::double precision
        END) - sum(
        CASE
            WHEN tam.nature::text = 'CREDIT'::text THEN tamd.value
            ELSE 0::double precision
        END))::numeric AS monthly_value
   FROM schsaf.tbl_accounting_movement_detail tamd
     JOIN schsaf.tbl_accounting_movement tam ON tamd.movement_id = tam.id
     JOIN schsaf.tbl_accounting_account taa ON tam.account_id = taa.id
  WHERE taa.number::text = '4102024480'::text
  GROUP BY tamd.obligation_id, (date_trunc('month'::text, tamd.created_at));


-- schsaf.view_report_conciliation_temp source

CREATE OR REPLACE VIEW schsaf.view_report_conciliation_temp
AS (
         SELECT 0 AS id,
            to_char(tbd.application_date::timestamp with time zone, 'YYYYMMDD'::text) AS fecha,
                CASE
                    WHEN tdi.third_party THEN tdi.third_party_document_number
                    ELSE tc.document_number
                END AS nit,
            tbd.bank_draft_value AS valor,
            tih.application_number AS radicado,
            0 AS canal,
            ''::text AS canal_descrip,
            'Desembolsos'::text AS fte,
                CASE
                    WHEN tdi.third_party THEN tdi.third_party_full_name
                    ELSE tc.full_name
                END AS customer_name,
            b.account_number,
            ''::text AS canal_code,
            ''::text AS fecha_recaudo
           FROM schsaf.tbl_bank_drafts tbd
             JOIN schsaf.tbl_invoice_header tih ON tih.id = tbd.invoice_header_id
             JOIN schsaf.tbl_disbursement_instruction tdi ON tdi.id = tih.disbursement_instruction_id
             JOIN schsaf.tbl_client tc ON tc.id = tih.provider_id
             LEFT JOIN schsaf.tbl_bank_account b ON b.id = tdi.bank_account_id
          WHERE (tbd.state::text = ANY (ARRAY['SUCCESSFUL'::character varying::text, 'PENDING'::character varying::text])) OR tih.state::text = 'REJECTED'::text AND tih.feedback::text = 'Desembolso rechazado por el Api de pagos'::text
        UNION
         SELECT 0 AS id,
            to_char(tbm.application_date::timestamp with time zone, 'YYYYMMDD'::text) AS fecha,
                CASE
                    WHEN tbm.type::text = 'DEVOLUCION'::text THEN ( SELECT tba.customer_identification_number
                       FROM schsaf.tbl_payback_drafts tpd
                         JOIN schsaf.tbl_bank_account tba ON tba.id = tpd.bank_account
                      WHERE tpd.maintenance_id = tbm.maintenance_id
                     LIMIT 1)
                    WHEN tbm.type::text = 'CUENTA POR PAGAR'::text THEN ( SELECT tba.customer_identification_number
                       FROM schsaf.tbl_maintenance_relationships tmr
                         JOIN schsaf.tbl_account_payable tap ON tap.id = tmr.id_relationship
                         JOIN schsaf.tbl_bank_account tba ON tba.id = tap.bank_account_id
                      WHERE tmr.id_maintenance = tbm.maintenance_id
                     LIMIT 1)
                    ELSE NULL::character varying
                END AS nit,
            tbm.bank_draft_value AS valor,
            tm.maintenance_consecutive AS radicado,
            0 AS canal,
            ''::text AS canal_descrip,
            'Mantenimiento'::text AS fte,
                CASE
                    WHEN tbm.type::text = 'DEVOLUCION'::text THEN ( SELECT tba.customer_name
                       FROM schsaf.tbl_payback_drafts tpd
                         JOIN schsaf.tbl_bank_account tba ON tba.id = tpd.bank_account
                      WHERE tpd.maintenance_id = tbm.maintenance_id
                     LIMIT 1)
                    WHEN tbm.type::text = 'CUENTA POR PAGAR'::text THEN ( SELECT tba.customer_name
                       FROM schsaf.tbl_maintenance_relationships tmr
                         JOIN schsaf.tbl_account_payable tap ON tap.id = tmr.id_relationship
                         JOIN schsaf.tbl_bank_account tba ON tba.id = tap.bank_account_id
                      WHERE tmr.id_maintenance = tbm.maintenance_id
                     LIMIT 1)
                    ELSE NULL::character varying
                END AS customer_name,
                CASE
                    WHEN tbm.type::text = 'DEVOLUCION'::text THEN ( SELECT tba.account_number
                       FROM schsaf.tbl_payback_drafts tpd
                         JOIN schsaf.tbl_bank_account tba ON tba.id = tpd.bank_account
                      WHERE tpd.maintenance_id = tbm.maintenance_id
                     LIMIT 1)
                    WHEN tbm.type::text = 'CUENTA POR PAGAR'::text THEN ( SELECT tba.account_number
                       FROM schsaf.tbl_maintenance_relationships tmr
                         JOIN schsaf.tbl_account_payable tap ON tap.id = tmr.id_relationship
                         JOIN schsaf.tbl_bank_account tba ON tba.id = tap.bank_account_id
                      WHERE tmr.id_maintenance = tbm.maintenance_id
                     LIMIT 1)
                    ELSE NULL::character varying
                END AS account_number,
            ''::text AS canal_code,
            ''::text AS fecha_recaudo
           FROM schsaf.tbl_bank_drafts_maintenance tbm
             JOIN schsaf.tbl_maintenance tm ON tm.id = tbm.maintenance_id
          WHERE tbm.state::text = 'SUCCESSFUL'::text
        UNION
         SELECT 0 AS id,
                CASE
                    WHEN tp.status::text = 'ANULACION_INGRESO'::text THEN to_char(tp.updated, 'YYYYMMDD'::text)
                    WHEN tp.status::text = 'IMPEDIMENTO'::text THEN to_char(tp.created, 'YYYYMMDD'::text)
                    ELSE to_char(tp.created, 'YYYYMMDD'::text)
                END AS fecha,
            tp.nit_beneficiary AS nit,
            tp.value AS valor,
            tp.consecutive_payment AS radicado,
            tp.payment_channel AS canal,
            tpc.description AS canal_descrip,
                CASE
                    WHEN tp.status::text = 'ANULACION_INGRESO'::text THEN 'Recaudo anulado'::text
                    ELSE 'Recaudo'::text
                END AS fte,
            cl.full_name AS customer_name,
            ''::text AS account_number,
            tpc.agreement_code AS canal_code,
            to_char(tp.payment_date::timestamp with time zone, 'YYYYMMDD'::text) AS fecha_recaudo
           FROM schsaf.tbl_payment tp
             JOIN schsaf.tbl_payment_channel tpc ON tpc.id = tp.payment_channel
             LEFT JOIN schsaf.tbl_client cl ON cl.document_number::text = tp.nit_beneficiary::text
) UNION ALL
 SELECT 0 AS id,
    to_char(tp.created, 'YYYYMMDD'::text) AS fecha,
    tp.nit_beneficiary AS nit,
    tp.value AS valor,
    tp.consecutive_payment AS radicado,
    tp.payment_channel AS canal,
    tpc.description AS canal_descrip,
    'Recaudo'::text AS fte,
    cl.full_name AS customer_name,
    ''::character varying AS account_number,
    tpc.agreement_code AS canal_code,
    to_char(tp.payment_date::timestamp with time zone, 'YYYYMMDD'::text) AS fecha_recaudo
   FROM schsaf.tbl_payment tp
     JOIN schsaf.tbl_payment_channel tpc ON tpc.id = tp.payment_channel
     LEFT JOIN schsaf.tbl_client cl ON cl.document_number::text = tp.nit_beneficiary::text
  WHERE tp.status::text = 'ANULACION_INGRESO'::text AND to_char(tp.created, 'YYYYMMDD'::text) = to_char(tp.updated, 'YYYYMMDD'::text)
  ORDER BY 5, 8;


-- schsaf.view_rol_events source

CREATE OR REPLACE VIEW schsaf.view_rol_events
AS SELECT roles.id,
    roles.name AS rol_name,
    roles.event_id,
    events.description,
    events.dual_control
   FROM schsaf.tbl_events events
     JOIN schsaf.tbl_roles roles ON roles.event_id = events.id;


-- schsaf.view_rtf_report source

CREATE OR REPLACE VIEW schsaf.view_rtf_report
AS SELECT row_number() OVER () AS id,
    pd.id AS payback_draft_id,
    pd.created_at AS application_date,
    c.full_name AS client_full_name,
    c.document_number AS client_document_number,
    tpa.consecutive::character varying AS payment_application_number,
    pd.payment_instruction_id,
    ti.number_svf AS obligation_number,
    pd.shared_discount_value AS base_value,
    pd.rft_value,
    pd.shared_discount_value - (pd.rft_value + pd.gmf_value) AS bank_draft_value,
        CASE
            WHEN i.state::text = 'ANNULLED'::text THEN 'Anulación De Pago'::character varying
            ELSE 'Aplicación De Pago'::character varying
        END AS process,
        CASE
            WHEN i.state::text = 'ANNULLED'::text THEN 'Anulación Descuento Pronto Pago (DPP)'::character varying
            ELSE 'Descuento Pronto Pago (DPP)'::character varying
        END AS type,
    tpm.modality,
    tp.name AS product,
    tp.currency
   FROM schsaf.tbl_payback_drafts pd
     JOIN schsaf.tbl_client c ON pd.client_id = c.id
     JOIN schsaf.tbl_payment_instruction i ON pd.payment_instruction_id = i.id
     LEFT JOIN schsaf.tbl_payment_application_annulment pa ON i.payment_application_id = pa.id_payment_application
     LEFT JOIN schsaf.tbl_payment_application tpa ON i.payment_application_id = tpa.id
     JOIN schsaf.tbl_obligation_invoice toi ON i.obligation_id = toi.obligation_id
     JOIN schsaf.tbl_invoice ti ON toi.invoice_id = ti.id
     JOIN schsaf.tbl_payback_drafts_types pt ON pd.payback_draft_type_id = pt.id
     JOIN schsaf.tbl_obligations to2 ON i.obligation_id = to2.id
     JOIN schsaf.tbl_business_relationships r ON to2.business_relationship_id = r.id
     JOIN schsaf.tbl_products_modalities tpm ON r.productmodality_id = tpm.id
     JOIN schsaf.tbl_products tp ON tpm.product_id = tp.id
  WHERE pt.description::text = 'Valor a pagar por el descuento compartido'::text
  ORDER BY pd.created_at DESC;


-- schsaf.view_solicitud_manteinance source

CREATE OR REPLACE VIEW schsaf.view_solicitud_manteinance
AS SELECT ti.number_svf AS number_obligation,
    tc1.document_number AS document_client,
    tc1.short_name AS name_client,
    tc2.document_number AS document_payer,
    tc2.short_name AS name_payer,
    obl.net_due_date,
    obl.total_due_date,
    obl.discount_value
   FROM schsaf.tbl_maintenance_relationships meo
     JOIN schsaf.tbl_obligations obl ON meo.id_relationship = obl.id
     JOIN schsaf.tbl_obligation_invoice toi ON obl.id = toi.obligation_id
     JOIN schsaf.tbl_invoice ti ON ti.id = toi.invoice_id
     JOIN schsaf.tbl_invoice_header td ON td.id = ti.invoice_header_id
     LEFT JOIN schsaf.tbl_client tc1 ON tc1.id = obl.client_id
     LEFT JOIN schsaf.tbl_client tc2 ON tc2.id = td.payer_id;


-- schsaf.view_status_payment_by_user source

CREATE OR REPLACE VIEW schsaf.view_status_payment_by_user
AS SELECT ( SELECT count(tp.status) AS count
           FROM schsaf.tbl_payment tp
          WHERE tp.status::text = 'PENDIENTE_DISTRIBUIR_APLICAR'::text AND tp.nit_beneficiary::text = tc.document_number::text) AS pending_apply,
    ( SELECT count(tp.status) AS count
           FROM schsaf.tbl_payment tp
          WHERE tp.status::text = 'APLICACION_PAGO_PARCIAL'::text AND tp.nit_beneficiary::text = tc.document_number::text) AS partial_application,
    ( SELECT count(tp.status) AS count
           FROM schsaf.tbl_payment tp
          WHERE tp.status::text = 'IMPEDIMENTO'::text AND tp.nit_beneficiary::text = tc.document_number::text) AS impediment,
    (( SELECT sum(tp.value) AS sum
           FROM schsaf.tbl_payment tp
          WHERE (tp.status::text = ANY (ARRAY['IMPEDIMENTO'::character varying::text, 'PENDIENTE_DISTRIBUIR_APLICAR'::character varying::text, 'APLICACION_PAGO_PARCIAL'::character varying::text])) AND tp.nit_beneficiary::text = tc.document_number::text))::numeric(20,2) AS total,
    tc.document_number
   FROM schsaf.tbl_client tc
  ORDER BY tc.document_number;


-- schsaf.view_summatory_finance_charge_value_report source

CREATE OR REPLACE VIEW schsaf.view_summatory_finance_charge_value_report
AS SELECT tfc.obligation_id,
    tfc.finance_charge_type_id,
    to_date(tfc.created_at::text, 'YYYY-MM-DD'::text) AS created_at,
    sum(tfc.finance_charge_value) AS finance_charge_value,
    max(tfc.principal_balance) AS principal_balance,
    max(tfc.rate) AS rate,
    tfc.process_type
   FROM schsaf.tbl_finance_charges tfc
  WHERE tfc.process_type::text = 'DIARY'::text
  GROUP BY tfc.obligation_id, tfc.finance_charge_type_id, tfc.process_type, (to_date(tfc.created_at::text, 'YYYY-MM-DD'::text));


-- schsaf.view_total_daily_amortization_report source

CREATE OR REPLACE VIEW schsaf.view_total_daily_amortization_report
AS SELECT o.o AS obligations,
    yo.o AS yest_obligations,
    o.c AS clients,
    yo.c AS yest_clients,
    o.iv AS invoice_value,
        CASE
            WHEN yo.iv IS NULL THEN 0::double precision
            ELSE yo.iv::double precision
        END AS yest_invoice_value,
    o.pb AS principal_balance,
        CASE
            WHEN yo.pb IS NULL THEN 0::numeric
            ELSE yo.pb
        END AS yest_principal_balance,
    o.dv - o.da AS missing_amortization,
    yo.dv - yo.da AS yest_missing_amortization,
    o.da AS accrued_amortization,
    yo.da AS yest_accrued_amortization,
    o.dda AS amortization,
    yo.dda AS yest_amortization,
    ((o.da - yo.da) / yo.da)::double precision * 100::double precision AS dif_accrued_amortization,
    ((o.dv - o.da - (yo.dv - yo.da)) / (yo.dv - yo.da))::double precision * 100::double precision AS dif_missing_amortization,
    ((o.dda - yo.dda) / yo.dda)::double precision * 100::double precision AS dif_amortization
   FROM ( SELECT count(0) AS o,
            count(DISTINCT o_1.client_id) AS c,
            sum(o_1.invoice_value) AS iv,
            sum(fc.principal_balance) AS pb,
            sum(o_1.discount_value) AS dv,
            sum(o_1.accrued_amortized) AS da,
            sum(fc.finance_charge_value) AS dda
           FROM schsaf.tbl_obligations o_1
             JOIN schsaf.view_summatory_finance_charge_value_report fc ON fc.obligation_id = o_1.id AND fc.finance_charge_type_id = 1 AND to_date(fc.created_at::text, 'YYYY-MM-DD'::text) = (CURRENT_DATE - 1)) o
     CROSS JOIN ( SELECT count(0) AS o,
            count(DISTINCT o_1.client_id) AS c,
            sum(o_1.invoice_value) AS iv,
            sum(fc.principal_balance) AS pb,
            sum(o_1.discount_value) AS dv,
            sum(o_1.accrued_amortized) AS da,
            sum(fc.finance_charge_value) AS dda
           FROM schsaf.tbl_obligations o_1
             JOIN schsaf.view_summatory_finance_charge_value_report fc ON fc.obligation_id = o_1.id AND fc.finance_charge_type_id = 1 AND to_date(fc.created_at::text, 'YYYY-MM-DD'::text) = (CURRENT_DATE - 2)) yo;


-- schsaf.view_total_daily_moratorium_report source

CREATE OR REPLACE VIEW schsaf.view_total_daily_moratorium_report
AS SELECT o.o AS obligations,
    yo.o AS yest_obligations,
    o.c AS clients,
    yo.c AS yest_clients,
    o.iv AS invoice_value,
        CASE
            WHEN yo.iv IS NULL THEN 0::numeric
            ELSE yo.iv
        END AS yest_invoice_value,
    o.pb AS principal_balance,
        CASE
            WHEN yo.pb IS NULL THEN 0::numeric
            ELSE yo.pb
        END AS yest_principal_balance,
    o.mi AS moratorium,
    yo.mi AS yest_moratorium,
    (o.mi - yo.mi) / yo.mi * 100::numeric AS dif_moratorium,
    o.rate,
    yo.rate AS yest_rate
   FROM ( SELECT count(0) AS o,
            count(DISTINCT o_1.client_id) AS c,
            sum(o_1.invoice_value) AS iv,
            sum(fc.principal_balance) AS pb,
            sum(fc.finance_charge_value) AS mi,
            avg(fc.rate) AS rate
           FROM schsaf.tbl_obligations o_1
             JOIN schsaf.view_summatory_finance_charge_value_report fc ON fc.obligation_id = o_1.id AND fc.finance_charge_type_id = 3 AND to_date(fc.created_at::text, 'YYYY-MM-DD'::text) = (CURRENT_DATE - 1)) o
     CROSS JOIN ( SELECT count(0) AS o,
            count(DISTINCT o_1.client_id) AS c,
            sum(o_1.invoice_value) AS iv,
            sum(fc.principal_balance) AS pb,
            sum(fc.finance_charge_value) AS mi,
            avg(fc.rate) AS rate
           FROM schsaf.tbl_obligations o_1
             JOIN schsaf.view_summatory_finance_charge_value_report fc ON fc.obligation_id = o_1.id AND fc.finance_charge_type_id = 3 AND to_date(fc.created_at::text, 'YYYY-MM-DD'::text) = (CURRENT_DATE - 2)) yo;


-- schsaf.view_total_daily_remunerative_report source

CREATE OR REPLACE VIEW schsaf.view_total_daily_remunerative_report
AS SELECT o.o AS obligations,
    yo.o AS yesterday_obligations,
    o.c AS clients,
    yo.c AS yesterday_clients,
    o.iv AS invoice_value,
        CASE
            WHEN yo.iv IS NULL THEN 0::double precision
            ELSE yo.iv::double precision
        END AS yesterday_invoice_value,
    o.pb AS principal_balance,
        CASE
            WHEN yo.pb IS NULL THEN 0::numeric
            ELSE yo.pb
        END AS yesterday_principal_balance,
    o.ri AS remunerative,
        CASE
            WHEN yo.ri IS NULL THEN 0::double precision
            ELSE yo.ri::double precision
        END AS yesterday_remunerative,
    ((o.ri - yo.ri) / yo.ri)::double precision * 100::double precision AS dif_remunerative
   FROM ( SELECT count(0) AS o,
            count(DISTINCT o_1.client_id) AS c,
            sum(o_1.invoice_value) AS iv,
            sum(o_1.principal_balance) AS pb,
            sum(fc.finance_charge_value) AS ri
           FROM schsaf.tbl_obligations o_1
             JOIN schsaf.view_summatory_finance_charge_value_report fc ON fc.obligation_id = o_1.id AND fc.finance_charge_type_id = 2 AND to_date(fc.created_at::text, 'YYYY-MM-DD'::text) = (CURRENT_DATE - 1)) o
     CROSS JOIN ( SELECT count(0) AS o,
            count(DISTINCT o_1.client_id) AS c,
            sum(o_1.invoice_value) AS iv,
            sum(o_1.principal_balance) AS pb,
            sum(fc.finance_charge_value) AS ri
           FROM schsaf.tbl_obligations o_1
             JOIN schsaf.view_summatory_finance_charge_value_report fc ON fc.obligation_id = o_1.id AND fc.finance_charge_type_id = 2 AND to_date(fc.created_at::text, 'YYYY-MM-DD'::text) = (CURRENT_DATE - 2)) yo;


-- schsaf.view_total_discount_return source

CREATE OR REPLACE VIEW schsaf.view_total_discount_return
AS SELECT tamd.obligation_id,
    date_trunc('month'::text, tamd.created_at) AS month,
    (sum(
        CASE
            WHEN tam.nature::text = 'DEBIT'::text THEN tamd.value
            ELSE 0::double precision
        END) - sum(
        CASE
            WHEN tam.nature::text = 'CREDIT'::text THEN tamd.value
            ELSE 0::double precision
        END))::numeric AS monthly_value
   FROM schsaf.tbl_accounting_movement_detail tamd
     JOIN schsaf.tbl_accounting_movement tam ON tamd.movement_id = tam.id
     JOIN schsaf.tbl_accounting_account taa ON tam.account_id = taa.id
  WHERE taa.number::text = '5104954480'::text
  GROUP BY tamd.obligation_id, (date_trunc('month'::text, tamd.created_at));


-- schsaf.view_total_plus_discount_return source

CREATE OR REPLACE VIEW schsaf.view_total_plus_discount_return
AS SELECT tamd.obligation_id,
    date_trunc('month'::text, tamd.created_at) AS month,
    (sum(
        CASE
            WHEN tam.nature::text = 'DEBIT'::text THEN tamd.value
            ELSE 0::double precision
        END) - sum(
        CASE
            WHEN tam.nature::text = 'CREDIT'::text THEN tamd.value
            ELSE 0::double precision
        END))::numeric AS monthly_value
   FROM schsaf.tbl_accounting_movement_detail tamd
     JOIN schsaf.tbl_accounting_movement tam ON tamd.movement_id = tam.id
     JOIN schsaf.tbl_accounting_account taa ON tam.account_id = taa.id
  WHERE taa.number::text = '5104954481'::text
  GROUP BY tamd.obligation_id, (date_trunc('month'::text, tamd.created_at));