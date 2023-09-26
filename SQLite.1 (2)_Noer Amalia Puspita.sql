SELECT DISTINCT num
FROM (
  SELECT num,
         LEAD(num, 1) OVER (ORDER BY id) AS next_num,
         LAG(num, 1) OVER (ORDER BY id) AS prev_num
  FROM input_table
) AS subquery
WHERE num = next_num AND num = prev_num
ORDER BY num;

--INPUT

CREATE TABLE email_list (
    ID SERIAL PRIMARY KEY,
    email VARCHAR(100) NOT NULL
);

INSERT INTO email_list (email)
VALUES
    ('abc@gmail.com'),
    ('def@gmail.com'),
    ('abc@yahoo.com'),
    ('abc@gmail.com'),
    ('def@gmail.com'),
    ('def@gmail.com'),
    ('abc@bing.com');

--OUTPUT

SELECT email
FROM email_list
GROUP BY email
HAVING COUNT(email) > 1;