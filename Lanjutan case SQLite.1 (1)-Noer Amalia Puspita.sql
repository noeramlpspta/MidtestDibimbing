CREATE TABLE input_table (
    id INT,
    num INT
);

INSERT INTO input_table (id, num)
VALUES
    (1, 1),
    (2, 2),
    (3, 2),
    (4, 2),
    (5, 2),
    (6, 1),
    (7, 1),
    (8, 1),
    (9, 1);
-------------------------------------------------
WITH NumberSequences AS (
  SELECT
    id,
    num,
    LEAD(num, 1) OVER (ORDER BY id) AS next_num,
    LAG(num, 1) OVER (ORDER BY id) AS prev_num
  FROM
    input_table
)

SELECT DISTINCT num
FROM NumberSequences
WHERE num = next_num AND num = prev_num
ORDER BY num;