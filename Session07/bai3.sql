EXPLAIN ANALYZE SELECT * FROM post WHERE is_public = TRUE AND content ILIKE '%du lịch%';

CREATE EXTENSION IF NOT EXISTS pg_trgm;
CREATE EXTENSION btree-gin;
CREATE INDEX idx_post_content_gin ON post USING gin (LOWER(content));

EXPLAIN ANALYZE SELECT * FROM post WHERE is_public = TRUE AND content ILIKE '%du lịch%';

CREATE INDEX idx_post_tags_gin ON post USING gin (tags);

EXPLAIN ANALYZE SELECT * FROM post WHERE tags @> ARRAY['travel'];

CREATE INDEX idx_post_recent_public
ON post(created_at DESC)
WHERE is_public = TRUE;

EXPLAIN ANALYZE SELECT * FROM post WHERE is_public = TRUE AND created_at >= NOW() - INTERVAL '7 days';

CREATE INDEX idx_post_user_recent ON post (user_id, created_at DESC);

EXPLAIN ANALYZE SELECT * FROM post WHERE user_id = 1 ORDER BY created_at DESC;