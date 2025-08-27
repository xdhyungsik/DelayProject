CREATE INDEX IF NOT EXISTS idx_adc_airport ON airline_delay_cause_clean(airport_code);
CREATE INDEX IF NOT EXISTS idx_ap_airport  ON airports_clean(airport_code);
CREATE INDEX IF NOT EXISTS idx_en_airport  ON enplanements_clean(airport_code);
CREATE INDEX IF NOT EXISTS idx_dm_airport  ON delays_master(airport_code);
