--Practice Dates
 -- Cast with ':: Type'
 SELECT 
    '2025-01-14':: DATE,
    '123':: INTEGER,
    'false':: BOOLEAN,
    '3.123':: REAL;

/*
    Create three tables:
• Jan 2023 jobs
• Feb 2023 jobs
• Mar 2023 jobs
• Foreshadowing: This will be used in another practice problem below.
• Hints:
• Use CREATE TABLE table_name AS syntax to create your table
• Look at a way to filter out only specific months ( EXTRACT )
*/

-- January
CREATE TABLE january_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

-- February
CREATE TABLE february_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

-- March
CREATE TABLE march_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;


SELECT * FROM march_jobs LIMIT 10;