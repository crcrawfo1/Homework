/* Here is how I would isolate (or group) the transactions of each cardholder*/

CREATE VIEW transactions_of_each_cardholder AS
SELECT h.id, h.name, t.date, t.amount
FROM card_holder h
INNER JOIN credit_card c
ON h.id = c.id_card_holder
INNER JOIN transaction t
ON c.card = t.card
ORDER BY h.id;

/*Considering the time period 7 am to 9am */
CREATE VIEW seven_to_nine_top_100_transactions AS
SELECT h.id, h.name, t.date, t.amount
FROM card_holder h
INNER JOIN credit_card c
ON h.id = c.id_card_holder
INNER JOIN transaction t
ON c.card = t.card
WHERE CAST(t.date AS time) >= '07:00:00' and CAST(t.date AS time) <= '09:00:00' 
ORDER BY t.amount DESC
LIMIT 100;
/*It does appear as though there is fraudulent activity, as Robert Johnson and
Crystal Clark both have numerous charges of over 1000 dollars between the hours
of 7am and 9am. If you compare this with their traditional spending habits, which
I found when I grouped the transactions, this is well over what they usually spend.*/

/*Transactions with less than 2 dollars */
CREATE VIEW number_of_transactions_less_than_two_dollars AS
SELECT COUNT(h.id), h.name
FROM card_holder h
INNER JOIN credit_card c
ON h.id = c.id_card_holder
INNER JOIN transaction t
ON c.card = t.card
WHERE t.amount < 2
GROUP BY h.id
ORDER BY count DESC;
/*It would appear as though there is also fraud occurring regarding small payments.
There are multiple people with over 20 $2 or less charges. This indicates to me
that these card holders have been hacked.*/

/*Top Five Merchants Prone to being hacked using small transactions*/
CREATE VIEW Top_Five_Merchants_Prone_to_Hacking AS
SELECT COUNT(m.id), m.name
FROM card_holder h
INNER JOIN credit_card c
ON h.id = c.id_card_holder
INNER JOIN transaction t
ON c.card = t.card
INNER JOIN merchant m
ON t.id_merchant = m.id
INNER JOIN merchant_category mc
ON m.id_merchant_category = mc.id
WHERE t.amount < 2
GROUP BY m.id 
ORDER BY count DESC
LIMIT 5;
/*As indicated by the resulting view, the top 5 merchants that are prone to being
hacked using small transactions are Wood-Ramirez, Hood-Phillips, Baker Inc,
Clark and Sons, and Greene-Wood.*/







