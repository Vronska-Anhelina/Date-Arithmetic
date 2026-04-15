SELECT DISTINCT account_id,sent_date,DENSE_RANK() OVER (PARTITION BY account_id ORDER BY sent_date DESC) AS sent_day_rank
FROM(
SELECT id_account AS account_id,DATE_ADD(ss.date,INTERVAL es.sent_date DAY)AS sent_date
FROM `DA.session` ss
JOIN `DA.account_session` acs
ON ss.ga_session_id=acs.ga_session_id
JOIN `DA.email_sent` es
ON acs.account_id=es.id_account) AS sentt_date
