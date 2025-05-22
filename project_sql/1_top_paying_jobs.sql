/*
Question: What are the top-paying data engineer jobs?
-- Identify the top 10 highest-paying Data Engineer roles that are available in german-speaking countries (Germany, Switzerland, Austria).
-- Focuses on job postings with specified salaries (remove nulls).
-- Why? Highlight the top-paying opportunities for Data Engineers, offering insights into employment qualifications.
*/

SELECT 
  job_id,
  job_title,
  job_title_short,
  job_location,
  job_schedule_type,
  salary_year_avg,
  job_posted_date,
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