/*
 What skills are required for the top-paying Data Analyst jobs?
 -Using the top 10 highest-paying Data Analyst London roles from 1st query.
 -Add the specific skills required for these roles.
 -Why? : It provides a detailed look at which skills are required by high-paying jobs, 
 helping job seekers understand which skill to develop
 */
WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        job_posted_date,
        name AS company_name
    FROM
        job_postings_fact
        LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst'
        AND job_location LiKE '%London%'
        AND salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT
        10
)
SELECT
    top_paying_jobs.*,
    skills_dim.skills
FROM
    top_paying_jobs
    INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC

/*
Results in JSON format:
[
  {
    "job_id": 159866,
    "job_title": "Research Engineer, Science",
    "salary_year_avg": "177283.0",
    "job_posted_date": "2023-06-28 21:00:41",
    "company_name": "DeepMind",
    "skills": "python"
  },
  {
    "job_id": 159866,
    "job_title": "Research Engineer, Science",
    "salary_year_avg": "177283.0",
    "job_posted_date": "2023-06-28 21:00:41",
    "company_name": "DeepMind",
    "skills": "c++"
  },
  {
    "job_id": 159866,
    "job_title": "Research Engineer, Science",
    "salary_year_avg": "177283.0",
    "job_posted_date": "2023-06-28 21:00:41",
    "company_name": "DeepMind",
    "skills": "pandas"
  },
  {
    "job_id": 159866,
    "job_title": "Research Engineer, Science",
    "salary_year_avg": "177283.0",
    "job_posted_date": "2023-06-28 21:00:41",
    "company_name": "DeepMind",
    "skills": "numpy"
  },
  {
    "job_id": 159866,
    "job_title": "Research Engineer, Science",
    "salary_year_avg": "177283.0",
    "job_posted_date": "2023-06-28 21:00:41",
    "company_name": "DeepMind",
    "skills": "tensorflow"
  },
  {
    "job_id": 159866,
    "job_title": "Research Engineer, Science",
    "salary_year_avg": "177283.0",
    "job_posted_date": "2023-06-28 21:00:41",
    "company_name": "DeepMind",
    "skills": "pytorch"
  },
  {
    "job_id": 478395,
    "job_title": "Data Architect",
    "salary_year_avg": "163782.0",
    "job_posted_date": "2023-03-01 22:26:19",
    "company_name": "Logispin",
    "skills": "nosql"
  },
  {
    "job_id": 478395,
    "job_title": "Data Architect",
    "salary_year_avg": "163782.0",
    "job_posted_date": "2023-03-01 22:26:19",
    "company_name": "Logispin",
    "skills": "azure"
  },
  {
    "job_id": 478395,
    "job_title": "Data Architect",
    "salary_year_avg": "163782.0",
    "job_posted_date": "2023-03-01 22:26:19",
    "company_name": "Logispin",
    "skills": "looker"
  },
  {
    "job_id": 217504,
    "job_title": "Analytics Engineer - ENA London, Warsaw- (F/M)",
    "salary_year_avg": "139216.0",
    "job_posted_date": "2023-04-21 10:38:48",
    "company_name": "AccorCorpo",
    "skills": "sql"
  },
  {
    "job_id": 217504,
    "job_title": "Analytics Engineer - ENA London, Warsaw- (F/M)",
    "salary_year_avg": "139216.0",
    "job_posted_date": "2023-04-21 10:38:48",
    "company_name": "AccorCorpo",
    "skills": "python"
  },
  {
    "job_id": 4851,
    "job_title": "Business Intelligence Data Analyst",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-03-24 10:22:34",
    "company_name": "Ocorian",
    "skills": "excel"
  },
  {
    "job_id": 4851,
    "job_title": "Business Intelligence Data Analyst",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-03-24 10:22:34",
    "company_name": "Ocorian",
    "skills": "tableau"
  },
  {
    "job_id": 4851,
    "job_title": "Business Intelligence Data Analyst",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-03-24 10:22:34",
    "company_name": "Ocorian",
    "skills": "powerpoint"
  },
  {
    "job_id": 178006,
    "job_title": "Data Analyst - (Ratings Ops)",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-05-17 01:21:58",
    "company_name": "Sylvera",
    "skills": "sql"
  },
  {
    "job_id": 178006,
    "job_title": "Data Analyst - (Ratings Ops)",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-05-17 01:21:58",
    "company_name": "Sylvera",
    "skills": "python"
  },
  {
    "job_id": 178006,
    "job_title": "Data Analyst - (Ratings Ops)",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-05-17 01:21:58",
    "company_name": "Sylvera",
    "skills": "javascript"
  },
  {
    "job_id": 178006,
    "job_title": "Data Analyst - (Ratings Ops)",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-05-17 01:21:58",
    "company_name": "Sylvera",
    "skills": "vba"
  },
  {
    "job_id": 178006,
    "job_title": "Data Analyst - (Ratings Ops)",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-05-17 01:21:58",
    "company_name": "Sylvera",
    "skills": "excel"
  },
  {
    "job_id": 178006,
    "job_title": "Data Analyst - (Ratings Ops)",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-05-17 01:21:58",
    "company_name": "Sylvera",
    "skills": "tableau"
  },
  {
    "job_id": 178006,
    "job_title": "Data Analyst - (Ratings Ops)",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-05-17 01:21:58",
    "company_name": "Sylvera",
    "skills": "looker"
  },
  {
    "job_id": 178006,
    "job_title": "Data Analyst - (Ratings Ops)",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-05-17 01:21:58",
    "company_name": "Sylvera",
    "skills": "sheets"
  },
  {
    "job_id": 1751909,
    "job_title": "Data Analyst",
    "salary_year_avg": "105000.0",
    "job_posted_date": "2023-07-04 13:16:42",
    "company_name": "Informa Group Plc.",
    "skills": "go"
  },
  {
    "job_id": 1751909,
    "job_title": "Data Analyst",
    "salary_year_avg": "105000.0",
    "job_posted_date": "2023-07-04 13:16:42",
    "company_name": "Informa Group Plc.",
    "skills": "gdpr"
  },
  {
    "job_id": 1751909,
    "job_title": "Data Analyst",
    "salary_year_avg": "105000.0",
    "job_posted_date": "2023-07-04 13:16:42",
    "company_name": "Informa Group Plc.",
    "skills": "dax"
  },
  {
    "job_id": 522268,
    "job_title": "Data Analyst",
    "salary_year_avg": "102500.0",
    "job_posted_date": "2023-01-25 09:50:48",
    "company_name": "Verisk",
    "skills": "excel"
  },
  {
    "job_id": 202872,
    "job_title": "Data Analyst",
    "salary_year_avg": "100500.0",
    "job_posted_date": "2023-07-04 08:16:42",
    "company_name": "NBCUniversal",
    "skills": "sql"
  },
  {
    "job_id": 202872,
    "job_title": "Data Analyst",
    "salary_year_avg": "100500.0",
    "job_posted_date": "2023-07-04 08:16:42",
    "company_name": "NBCUniversal",
    "skills": "excel"
  },
  {
    "job_id": 202872,
    "job_title": "Data Analyst",
    "salary_year_avg": "100500.0",
    "job_posted_date": "2023-07-04 08:16:42",
    "company_name": "NBCUniversal",
    "skills": "tableau"
  },
  {
    "job_id": 202872,
    "job_title": "Data Analyst",
    "salary_year_avg": "100500.0",
    "job_posted_date": "2023-07-04 08:16:42",
    "company_name": "NBCUniversal",
    "skills": "word"
  },
  {
    "job_id": 202872,
    "job_title": "Data Analyst",
    "salary_year_avg": "100500.0",
    "job_posted_date": "2023-07-04 08:16:42",
    "company_name": "NBCUniversal",
    "skills": "sharepoint"
  },
  {
    "job_id": 202872,
    "job_title": "Data Analyst",
    "salary_year_avg": "100500.0",
    "job_posted_date": "2023-07-04 08:16:42",
    "company_name": "NBCUniversal",
    "skills": "powerpoint"
  },
  {
    "job_id": 202872,
    "job_title": "Data Analyst",
    "salary_year_avg": "100500.0",
    "job_posted_date": "2023-07-04 08:16:42",
    "company_name": "NBCUniversal",
    "skills": "outlook"
  },
  {
    "job_id": 1031606,
    "job_title": "Founding Data Analyst",
    "salary_year_avg": "100500.0",
    "job_posted_date": "2023-07-14 18:16:21",
    "company_name": "Relay Technologies",
    "skills": "go"
  }
]
*/