# 1.
SELECT (PRICE-PRICE%10000)AS PRICE_GROUP ,count(*) AS PRODUCTS
from product
group by price_group
order by price_group

# 2. case when 사용(if문)
# SELECT (
#     CASE
#     WHEN PRICE < 10000 THEN 0
#     ELSE TRUNCATE(PRICE, -4)
#     END
# ) AS PRICE_GROUP , COUNT(PRODUCT_ID)
# FROM PRODUCT
# GROUP BY PRICE_GROUP
# ORDER BY PRICE_GROUP;