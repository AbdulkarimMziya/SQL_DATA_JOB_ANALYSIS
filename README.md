#  Introduction
I Dive into the Software job market! Focusing on Software Engineer roles,
this project explores top-paying jobs, in-demand skills, and where high demand meets high salary in Software Engineering.

SQL Queries? Check them out here: [project_sql](/project_sql/)
# Background
The tech industry continues to grow rapidly, with Software Engineers among the most sought-after professionals worldwide. 
Companies increasingly look for candidates with expertise in programming, data analysis, and emerging technologies. 
However, not all skills and roles are equal in terms of demand and compensation.

### The questions I wanted to answer through my
SQL queries were:
1. What are the top-paying Software Engineer jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for Software Engineers?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?

# Tools I Used
For my deep dive into the Software Engineer job market, I harnessed the power of several key tools:
- **SQL**: The backbone of my analysis, allowing me to query the database and unearth critical insights.
- **PostgreSQL**: The chosen database management system, ideal for handling the job posting data.
- **Visual Studio Code**: My go-to for database management and executing SQL queries.
- **Git & GitHub**: Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.
  
# The Analysis

## Top Paying Roles
To identify the highest-paying roles, I filtered Software positions by average yearly salary and location. This query highlights the high paying opportunities in the field.

```SQL
SELECT 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    company_dim.name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
WHERE job_title LIKE '%Software%' AND
      job_location = 'Anywhere' AND
      salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;
```
Here's the breakdown of the top Software Engineer jobs in 2023:
- **Wide Salary Range:** Top 10 paying Software Engineering roles span from $184,000 to $225,000, indicating significant salary potential in the field.
- **Diverse Employers** Companies like Datavant,MongoDB, and Capital One are among those offering high salaries,showing a broad interest across different industries.
- **Job Title Variety:** There's a high diversity in job titles, from software engineering and data-related fields, reflecting varied roles and specializations within data.

<img src="assets/top_paying_role.png" alt="top paying rol" width="500" height="350" />
*Bar graph visualizing the salary for the top 10 salarigs for data analysts; ChatGPT generated this graph from my SQL query.*

## Top In-demand Skills
This query aims to identify the top 10 most in-demand skills for software-related jobs by counting how frequently each skill appears across job postings.

```SQL
SELECT
    skills,
    COUNT (skills_job_dim.job_id) AS demand_count
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact. job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short LIKE '%Software%'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 10
```

Here's the breakdown of the most in demand skills for a Software Engineer in 2023:
- Programming languages like **Python**, **Java**, and **JavaScript** remain fundamental, while cloud platforms and containerization tools (AWS, Azure, Kubernetes, Docker) are becoming increasingly vital in the industry.

<img src="assets/top_demanded_skills.png" alt="top paying rol" width="500" height="350" />

## Skills Based on Salary
Exploring the average salaries associated with different skills revealed which skillsare the highest paying.

```SQL
SELECT
    skills,
    ROUND(AVG(salary_year_avg), 2) avg_salary
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact. job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short LIKE '%Software%' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 30
```

Here's the breakdown of the top paying skills for a Software Engineer in 2023:
- **Top-Paying Skills:** Specialized databases like **Cassandra ($213,333)** and **Neo4j ($183,840)** lead due to their niche demand.
- **Frameworks:** Competitive salaries for **ASP.NET Core ($155,000)** and **Ruby on Rails ($149,500)**; slightly lower for widely used tools like **Express.js ($143,816)**.
- **Languages:** Specialized languages like **Assembly ($157,188)** command premium pay.
- **Infrastructure:** Skills in **Debian ($196,500)** reflect high demand in server management.
- **Overall:** Salaries correlate with demand and specialization, with databases and infrastructure expertise leading the way.


* Table of the average salary of the top 10 paying skills for Software Engineer *


# What I learned
# Conclusions
