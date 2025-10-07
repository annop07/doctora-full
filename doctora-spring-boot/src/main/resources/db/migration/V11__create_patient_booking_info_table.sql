-- V11: Create patient_booking_info table for storing patient information with appointments

CREATE TABLE IF NOT EXISTS patient_booking_info (
    id BIGSERIAL PRIMARY KEY,
    appointment_id BIGINT NOT NULL,
    patient_prefix VARCHAR(20),
    patient_first_name VARCHAR(100),
    patient_last_name VARCHAR(100),
    patient_email VARCHAR(255),
    patient_phone VARCHAR(20),
    patient_id_card VARCHAR(20),
    patient_birth_date DATE,
    patient_gender VARCHAR(10),
    patient_address TEXT,
    patient_emergency_contact VARCHAR(100),
    patient_emergency_phone VARCHAR(20),
    reason_for_visit TEXT,
    medical_history TEXT,
    allergies TEXT,
    current_medications TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_patient_booking_info_appointment
        FOREIGN KEY (appointment_id)
        REFERENCES appointments(id)
        ON DELETE CASCADE
);

CREATE INDEX idx_patient_booking_info_appointment ON patient_booking_info(appointment_id);
CREATE INDEX idx_patient_booking_info_email ON patient_booking_info(patient_email);
CREATE INDEX idx_patient_booking_info_id_card ON patient_booking_info(patient_id_card);
