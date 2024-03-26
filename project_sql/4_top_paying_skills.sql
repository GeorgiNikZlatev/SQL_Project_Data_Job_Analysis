/*
 What are the top skills based on salary?
 -Looking at the average salary associated with each skill for Data Analyst positions.
 -Focusing on roles with specified salaries and remote locations.
 -Why? : To reveal how different skills impact salary levels for Data Analyst positions
 and to identify the most financially rewarding skills.
 */

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings_fact.job_work_from_home = TRUE
    AND job_title_short LIKE 'Data Analyst'
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT
    25

/*
Insights into trends based on the top-paying skills for data analysts:
-Big Data Technologies Dominate: Skills like PySpark, Elasticsearch, Databricks, and Kubernetes indicate a significant demand for handling large volumes of data efficiently. This suggests that companies are increasingly investing in big data solutions and cloud-based infrastructure to manage and analyze data at scale.
-Focus on Data Science and Machine Learning: Skills such as Pandas, NumPy, Scikit-learn, and Jupyter are essential for data manipulation, analysis, and machine learning tasks. This trend underscores the growing importance of data science and machine learning in various industries, as companies strive to derive insights and value from their data to make informed decisions.
-DevOps and Version Control Tools Gain Traction: Tools like Bitbucket, GitLab, Jenkins, and Atlassian reflect the integration of DevOps practices in data analytics workflows. As organizations aim for more automation, collaboration, and reproducibility in their data projects, proficiency in version control systems and continuous integration/continuous deployment (CI/CD) pipelines becomes increasingly valuable for data analysts.

Results in JSON format:
[
  {
    "skills": "pyspark",
    "avg_salary": "208172"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "189155"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skills": "watson",
    "avg_salary": "160515"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skills": "gitlab",
    "avg_salary": "154500"
  },
  {
    "skills": "swift",
    "avg_salary": "153750"
  },
  {
    "skills": "jupyter",
    "avg_salary": "152777"
  },
  {
    "skills": "pandas",
    "avg_salary": "151821"
  },
  {
    "skills": "elasticsearch",
    "avg_salary": "145000"
  },
  {
    "skills": "golang",
    "avg_salary": "145000"
  },
  {
    "skills": "numpy",
    "avg_salary": "143513"
  },
  {
    "skills": "databricks",
    "avg_salary": "141907"
  },
  {
    "skills": "linux",
    "avg_salary": "136508"
  },
  {
    "skills": "kubernetes",
    "avg_salary": "132500"
  },
  {
    "skills": "atlassian",
    "avg_salary": "131162"
  },
  {
    "skills": "twilio",
    "avg_salary": "127000"
  },
  {
    "skills": "airflow",
    "avg_salary": "126103"
  },
  {
    "skills": "scikit-learn",
    "avg_salary": "125781"
  },
  {
    "skills": "jenkins",
    "avg_salary": "125436"
  },
  {
    "skills": "notion",
    "avg_salary": "125000"
  },
  {
    "skills": "scala",
    "avg_salary": "124903"
  },
  {
    "skills": "postgresql",
    "avg_salary": "123879"
  },
  {
    "skills": "gcp",
    "avg_salary": "122500"
  },
  {
    "skills": "microstrategy",
    "avg_salary": "121619"
  }
]
*/
