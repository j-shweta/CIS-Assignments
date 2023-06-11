CREATE TABLE ProductSales (
  product_id INT,
  product_price DECIMAL(10, 2),
  date_sold DATE
);

INSERT INTO ProductSales (product_id, product_price, date_sold)
VALUES
  (1, 10.99, '2023-06-01'),
  (1, 5.49, '2023-06-02'),
  (1, 14.99, '2023-06-03'),
  (2, 7.99, '2023-06-04'),
  (2, 19.99, '2023-06-05'),
  (3, 12.49, '2023-06-07'),
  (3, 9.99, '2023-06-09'),
  (4, 6.99, '2023-06-09'),
  (5, 17.99, '2023-05-10'),
  (5, 8.49, '2023-05-11'),
  (5, 11.99, '2023-04-13'),
  (6, 4.99, '2023-03-15'),
  (6, 16.99, '2023-03-18'),
  (7, 13.49, '2023-04-20'),
  (7, 10.99, '2023-03-22');
  
WITH ProductSalesWithPrevDate AS (
  SELECT product_id, product_price, date_sold,
    LAG(date_sold) OVER (PARTITION BY product_id ORDER BY date_sold) AS previous_date_sold
  FROM ProductSales
)
SELECT ProductSalesWithPrevDate.product_id
FROM ProductSalesWithPrevDate
WHERE date_sold - previous_date_sold > 14 OR previous_date_sold IS NULL
ORDER BY product_id, date_sold;