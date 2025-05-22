/*
Question: What skills are required for the top-paying data engineer jobs?
-- Use the top 10 highest-paying Data Engineer jobs from first query.
-- Add the specific skills required for these roles.
-- Why? It provides a detailed look at which high-paying jobs demand certain skills, helping job seekers understand which skills to develop that align with top salaries.
*/

WITH top_paying_jobs AS (
  SELECT 
    job_id,
    job_title,
    salary_year_avg,
    name as company_name
  FROM
    job_postings_fact
  LEFT JOIN
    company_dim ON job_postings_fact.company_id = company_dim.company_id
  WHERE
    job_title_short = 'Data Engineer'AND
    (job_location LIKE '%Switzerland' OR
    job_location LIKE '%Germany' OR
    job_location LIKE '%Austria') AND
    salary_year_avg IS NOT NULL
  ORDER BY
    salary_year_avg DESC
  LIMIT 10
)

SELECT 
  top_paying_jobs.*,
  skills
FROM
  top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
  salary_year_avg DESC


/*Key Takeaways:
Apache Spark dominates as the top skill, showing strong relevance in high-paying roles.
SQL remains foundational and highly valued.
Familiarity with version control tools (Git/GitHub) and cloud/data platforms (Databricks, Azure) is common.
A variety of tools and languages are listed once, suggesting companies value well-rounded and flexible candidates.

[
  {
    "job_id": 173290,
    "job_title": "Research Engineer Power Electronics (f/m/div.)",
    "salary_year_avg": "200000.0",
    "company_name": "Bosch Group",
    "skills": "matlab"
  },
  {
    "job_id": 173290,
    "job_title": "Research Engineer Power Electronics (f/m/div.)",
    "salary_year_avg": "200000.0",
    "company_name": "Bosch Group",
    "skills": "spark"
  },
  {
    "job_id": 173290,
    "job_title": "Research Engineer Power Electronics (f/m/div.)",
    "salary_year_avg": "200000.0",
    "company_name": "Bosch Group",
    "skills": "github"
  },
  {
    "job_id": 665085,
    "job_title": "Research Engineer - Laser Material Processing (f/m/div.)",
    "salary_year_avg": "200000.0",
    "company_name": "Bosch Group",
    "skills": "python"
  },
  {
    "job_id": 665085,
    "job_title": "Research Engineer - Laser Material Processing (f/m/div.)",
    "salary_year_avg": "200000.0",
    "company_name": "Bosch Group",
    "skills": "spark"
  },
  {
    "job_id": 665085,
    "job_title": "Research Engineer - Laser Material Processing (f/m/div.)",
    "salary_year_avg": "200000.0",
    "company_name": "Bosch Group",
    "skills": "github"
  },
  {
    "job_id": 337410,
    "job_title": "Research Engineer Bio-MEMS Sensors (f/m/div.)",
    "salary_year_avg": "199675.0",
    "company_name": "Bosch Group",
    "skills": "spark"
  },
  {
    "job_id": 1380376,
    "job_title": "Consultant* – Data Engineering und Data Architecture",
    "salary_year_avg": "165000.0",
    "company_name": "Capco",
    "skills": "sql"
  },
  {
    "job_id": 1380376,
    "job_title": "Consultant* – Data Engineering und Data Architecture",
    "salary_year_avg": "165000.0",
    "company_name": "Capco",
    "skills": "nosql"
  },
  {
    "job_id": 719911,
    "job_title": "Data Architect and Archiving Consultant  (f/m/div.)",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skills": "spark"
  },
  {
    "job_id": 719911,
    "job_title": "Data Architect and Archiving Consultant  (f/m/div.)",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skills": "sap"
  },
  {
    "job_id": 164692,
    "job_title": "(Senior) Analytics Engineer / Data Engineer (all genders)",
    "salary_year_avg": "163500.0",
    "company_name": "TeamViewer",
    "skills": "sql"
  },
  {
    "job_id": 164692,
    "job_title": "(Senior) Analytics Engineer / Data Engineer (all genders)",
    "salary_year_avg": "163500.0",
    "company_name": "TeamViewer",
    "skills": "go"
  },
  {
    "job_id": 164692,
    "job_title": "(Senior) Analytics Engineer / Data Engineer (all genders)",
    "salary_year_avg": "163500.0",
    "company_name": "TeamViewer",
    "skills": "git"
  },
  {
    "job_id": 318838,
    "job_title": "Product Owner (m/f/d) Data Engineering",
    "salary_year_avg": "147500.0",
    "company_name": "Jochen Schweizer mydays Group",
    "skills": "databricks"
  },
  {
    "job_id": 318838,
    "job_title": "Product Owner (m/f/d) Data Engineering",
    "salary_year_avg": "147500.0",
    "company_name": "Jochen Schweizer mydays Group",
    "skills": "kafka"
  },
  {
    "job_id": 318838,
    "job_title": "Product Owner (m/f/d) Data Engineering",
    "salary_year_avg": "147500.0",
    "company_name": "Jochen Schweizer mydays Group",
    "skills": "git"
  },
  {
    "job_id": 318838,
    "job_title": "Product Owner (m/f/d) Data Engineering",
    "salary_year_avg": "147500.0",
    "company_name": "Jochen Schweizer mydays Group",
    "skills": "jenkins"
  },
  {
    "job_id": 318838,
    "job_title": "Product Owner (m/f/d) Data Engineering",
    "salary_year_avg": "147500.0",
    "company_name": "Jochen Schweizer mydays Group",
    "skills": "jira"
  },
  {
    "job_id": 1422373,
    "job_title": "Team Lead Data Engineering (all genders)",
    "salary_year_avg": "147500.0",
    "company_name": "TeamViewer",
    "skills": "sql"
  },
  {
    "job_id": 1422373,
    "job_title": "Team Lead Data Engineering (all genders)",
    "salary_year_avg": "147500.0",
    "company_name": "TeamViewer",
    "skills": "scala"
  },
  {
    "job_id": 1422373,
    "job_title": "Team Lead Data Engineering (all genders)",
    "salary_year_avg": "147500.0",
    "company_name": "TeamViewer",
    "skills": "spark"
  },
  {
    "job_id": 1712008,
    "job_title": "Data Engineer – Analytics (f/m/div.) for Solid Oxide Fuel Cells (SOFC)",
    "salary_year_avg": "147500.0",
    "company_name": "Bosch Group",
    "skills": "sql"
  },
  {
    "job_id": 1712008,
    "job_title": "Data Engineer – Analytics (f/m/div.) for Solid Oxide Fuel Cells (SOFC)",
    "salary_year_avg": "147500.0",
    "company_name": "Bosch Group",
    "skills": "python"
  },
  {
    "job_id": 1712008,
    "job_title": "Data Engineer – Analytics (f/m/div.) for Solid Oxide Fuel Cells (SOFC)",
    "salary_year_avg": "147500.0",
    "company_name": "Bosch Group",
    "skills": "azure"
  },
  {
    "job_id": 1712008,
    "job_title": "Data Engineer – Analytics (f/m/div.) for Solid Oxide Fuel Cells (SOFC)",
    "salary_year_avg": "147500.0",
    "company_name": "Bosch Group",
    "skills": "databricks"
  },
  {
    "job_id": 1712008,
    "job_title": "Data Engineer – Analytics (f/m/div.) for Solid Oxide Fuel Cells (SOFC)",
    "salary_year_avg": "147500.0",
    "company_name": "Bosch Group",
    "skills": "spark"
  },
  {
    "job_id": 1712008,
    "job_title": "Data Engineer – Analytics (f/m/div.) for Solid Oxide Fuel Cells (SOFC)",
    "salary_year_avg": "147500.0",
    "company_name": "Bosch Group",
    "skills": "airflow"
  },
  {
    "job_id": 1712008,
    "job_title": "Data Engineer – Analytics (f/m/div.) for Solid Oxide Fuel Cells (SOFC)",
    "salary_year_avg": "147500.0",
    "company_name": "Bosch Group",
    "skills": "terraform"
  }
]
*/
