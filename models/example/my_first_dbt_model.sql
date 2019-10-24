
-- Welcome to your first dbt model!
-- Did you know that you can also configure models directly within
-- the SQL file? This will override configurations stated in dbt_project.yml

-- Try changing 'view' to 'table', then re-running dbt
{{ config(materialized='view') }}


select
  1 as id,
  'tom' as user,
  'why_not' as says
UNION
SELECT
  2 as id,
  'liam' as user,
  'use kube' as says
UNION
SELECT
  3 as id,
  'claudio' as user,
  'relax' as says
UNION
SELECT
  4 as id,
  'jack' as user,
  'learning is fun' as says
