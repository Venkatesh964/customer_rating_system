 
 -- select count(account_key) from customers_transactions,customers_account_info where customers_transactions.account_key==customers_account_info.account_key;
--  

--  select sum( Transaction_Amount(in $)) from customers_transactions  group by month(Transaction_Date),Transaction_Origin where transaction_type=INN;
--  select count(*) from customers_transactions group by month(Transaction_Date),Transaction_Origin;
--  select sum( Transaction_Amount(in $)) from customers_transactions  group by month(Transaction_Date),Transaction_Origin where transaction_type=OUT;
 
SELECT sum(Transaction_Amount(in $)) as t from customers_transactions  group by month(Transaction_Date),Transaction_Origin 
where transaction_type=OUT
CASE
    WHEN t >1000 THEN 'High Risk'
    WHEN 600<t<1000 THEN 'medium risk'
    ELSE 'low risk'
END;


select sum( Transaction_Amount(in $)) as t from customers_transactions  group by month(Transaction_Date),Transaction_Origin 
where transaction_type=INN
CASE
    WHEN t >800 THEN 'High Risk'
    WHEN 500<t<800 THEN 'medium risk'
    ELSE 'low risk'
END;


select count(account_key) as t from customers_transactions,customers_account_info
where customers_transactions.account_key==customers_account_info.account_key
CASE
    WHEN t >20 THEN 'High Risk'
    WHEN 10<t<20 THEN 'medium risk'
    ELSE 'low risk'
END;

select count(*) from customers_transactions group by month(Transaction_Date),Transaction_Origin
 where transaction_type=OUT or transaction_type=INN
CASE
    WHEN t >10 THEN 'High Risk'
    WHEN 6<t<10 THEN 'medium risk'
    ELSE 'low risk'
END;