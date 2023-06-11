CREATE TABLE CustomerDates (
  CustID INT,
  Dates DATE
);


INSERT INTO CustomerDates (CustID, Dates)
VALUES
  (1111, '2022-12-01'),
  (1111, '2022-10-01'),
  (1111, '2022-09-01'),
  (1111, '2023-01-01'),
  (2222, '2022-01-01'),
  (2222, '2022-05-01'),
  (2222, '2022-04-01');
  
SELECT CustID, Dates,
  TIMESTAMPDIFF(MONTH,MIN(Dates) OVER (PARTITION BY CustID ORDER BY Dates), Dates) AS MonthDifference
FROM CustomerDates ;  