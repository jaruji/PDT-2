CREATE INDEX screen_name_btree_index ON accounts(screen_name);

SET max_parallel_workers_per_gather = 2;
EXPLAIN ANALYSE SELECT screen_name FROM accounts WHERE screen_name = 'realDonaldTrump';

SET parallel_tuple_cost TO 0.1;
EXPLAIN ANALYSE SELECT * FROM accounts WHERE followers_count >= 100 AND followers_count <= 200;

CREATE INDEX followers_count_index ON accounts(followers_count);

SELECT * FROM accounts WHERE followers_count >= 100 AND followers_count <= 1000; 

CREATE INDEX name_btree_index ON accounts(name);
CREATE INDEX friends_count_btree_index ON accounts(friends_count);
CREATE INDEX description_btree_index ON accounts(description);

EXPLAIN ANALYSE INSERT INTO accounts(screen_name, name, description, followers_count, friends_count, statuses_count) 
VALUES ('PDT', ':-)', ':>)', 10, 5, 3);

DROP INDEX name_btree_index;
DROP INDEX friends_count_btree_index;
DROP INDEX description_btree_index;

CREATE INDEX retweet_count_btree_index ON tweets(retweet_count);
CREATE INDEX content_btree_index ON tweets(content);

EXPLAIN ANALYSE SELECT content FROM tweets WHERE content LIKE '%Gates%';

DROP INDEX content_btree_index; 

EXPLAIN ANALYSE SELECT content FROM tweets WHERE content LIKE '%Gates%';

EXPLAIN ANALYSE SELECT content FROM tweets WHERE content LIKE 'The Cabel and Deep State%';

CREATE INDEX content_btree_index ON tweets(content text_pattern_ops);


SELECT content from tweets LIMIT 10;




EXPLAIN ANALYSE SELECT content FROM tweets WHERE content ILIKE '%idiot #QAnon';


EXPLAIN ANALYSE SELECT * from accounts 
WHERE followers_count < 1000 AND friends_count > 1000
ORDER BY statuses_count DESC;

DROP INDEX friends_count_btree_index;
DROP INDEX followers_count_index;
DROP INDEX statuses_count_index;

CREATE INDEX friends_count_btree_index ON accounts(friends_count);
CREATE INDEX followers_count_index ON accounts(followers_count);
CREATE INDEX statuses_count_index ON accounts(statuses_count);

CREATE INDEX turbo_index ON accounts(friends_count, followers_count, statuses_count);

CREATE EXTENSION pg_trgm;
CREATE INDEX screen_name_gist_index ON accounts USING gist (screen_name gist_trgm_ops);

EXPLAIN ANALYSE SELECT * from accounts WHERE screen_name LIKE '%realDonaldTrump%'


