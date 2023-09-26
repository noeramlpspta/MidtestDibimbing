SELECT DISTINCT num
FROM (
  SELECT num,
         LEAD(num, 1) OVER (ORDER BY id) AS next_num,
         LAG(num, 1) OVER (ORDER BY id) AS prev_num
  FROM input_table
) AS subquery
WHERE num = next_num AND num = prev_num
ORDER BY num;