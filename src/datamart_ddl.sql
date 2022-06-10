CREATE TABLE analysis.dm_rfm_segments (
	user_id int4 NOT NULL,
	recency int4 NOT NULL,
	frequency int4 NOT NULL,
	monetary_value int4 NOT NULL,
	CONSTRAINT dm_rfm_segments_pkey PRIMARY KEY (user_id),
	CONSTRAINT dm_rfm_segments_recency_check CHECK (((recency >= 1) AND (recency <= 5))),
	CONSTRAINT dm_rfm_segments_recency_check1 CHECK (((frequency >= 1) AND (frequency <= 5))),
	CONSTRAINT dm_rfm_segments_recency_check2 CHECK (((monetary_value >= 1) AND (monetary_value <= 5)))
);