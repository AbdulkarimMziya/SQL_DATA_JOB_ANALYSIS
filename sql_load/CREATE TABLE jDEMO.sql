CREATE TABLE job_applied(
    job_id INT,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50)
); 

INSERT INTO job_applied (
    job_id,
    application_sent_date,
    custom_resume,
    resume_file_name,
    cover_letter_sent,
    cover_letter_file_name,
     status
)
VALUES (
    1, 
    '2023-01-01', 
    TRUE, 
    'resume.pdf', 
    TRUE, 
    'coverletter.pdf', 
    'submitted'),
    (
    2, 
    '2023-01-02', 
    false, 
    'resume-2.pdf', 
    false, 
    null, 
    'interview scheduled'),
    (
    3, 
    '2023-01-03', 
    true, 
    'resume-3.pdf', 
    true, 
    'coverletter-3.pdf', 
    'interview scheduled');

ALTER TABLE job_applied
ADD contact VARCHAR(50); 

UPDATE job_applied
SET contact = 'Derek Bachman'
WHERE job_id = 1;

UPDATE job_applied
SET contact = 'Bruce Wayne'
WHERE job_id = 2;

UPDATE job_applied
SET contact = 'Vrunik Patel'
WHERE job_id = 3;

ALTER TABLE job_applied
RENAME COLUMN contact TO contact_name;

ALTER TABLE job_applied
ALTER COLUMN contact_name TYPE TEXT;

DROP TABLE job_applied