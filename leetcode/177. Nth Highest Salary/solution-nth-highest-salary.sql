CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  DECLARE offset_val INT;
  # OFFSET does not accept expressions. So, we pre-calculate it here like grown-ups.
  SET offset_val = N - 1;
  RETURN (
    # Write your MySQL query statement below.
    SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    LIMIT 1 OFFSET offset_val
  );
END
# The runtime of this submission is slow.
# Apparently, extra variable declarations and
# even lines of code slow down MySQL.
