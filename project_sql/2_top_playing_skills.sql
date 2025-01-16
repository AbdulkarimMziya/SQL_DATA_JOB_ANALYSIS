/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
    SELECT 
        job_id,
        job_title,
        salary_year_avg,
        company_dim.name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
    WHERE job_title LIKE '%Software%' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

SELECT top_paying_jobs.*,
        skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC

/*
    To identify the top-paying jobs and skills, let's analyze the data:

    1. The most frequently listed skills.
    2. Average salaries associated with each skill.
    3. Insights into skill combinations (if any).

   <-- RESULTS -->

    Top 5 Highest-Paying Jobs
    Senior Software Engineer: $225,000/year
    Senior Software Engineer, Full Stack: $205,000/year
    Lead Data Engineer - Capital One Software (Remote Eligible): $203,000/year
    Senior Software Engineer, Cluster Scalability: $200,000/year
    Senior Software Engineer, Server Security: $200,000/year

    Top 5 Highest-Paying Skills
    AWS: $211,000/year
    Snowflake: $211,000/year
    DynamoDB: $205,000/year
    GraphQL: $205,000/year
    Pandas: $205,000/year
*/