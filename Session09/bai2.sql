create index idx_email on users using hash(email);

explain analyze  SELECT * FROM users WHERE email = 'example@example.com';