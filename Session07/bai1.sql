EXPLAIN ANALYZE
SELECT *
FROM book
WHERE genre = 'Fantasy';
EXPLAIN ANALYZE
SELECT *
FROM book
WHERE author ILIKE '%Rowling%';

CREATE INDEX idx_book_genre_btree ON book (genre);

CREATE EXTENSION pg_trgm;
CREATE EXTENSION btree_gin;
CREATE INDEX idx_book_title_gin ON book USING gin (title);
CLUSTER book USING idx_book_genre_btree;
EXPLAIN ANALYZE
SELECT *
FROM book
WHERE genre = 'Fantasy';

-- 5. Viết báo cáo ngắn
-- 1.Chỉ mục B-tree (trên genre): Loại chỉ mục này cực kỳ hiệu quả (thời gian truy vấn giảm mạnh) đối với truy vấn so
-- sánh bằng (genre = 'Fantasy'). Sau khi áp dụng CLUSTER, hiệu suất truy vấn càng được cải thiện hơn nữa vì dữ
-- liệu vật lý được sắp xếp theo thứ tự genre, giúp PostgreSQL đọc các bản ghi liên quan (ví dụ: tất cả sách 'Fantasy')
-- từ các khối đĩa liền kề.
-- Chỉ mục GIN (pg_trgm trên title): Chỉ mục B-tree không hiệu quả cho tìm kiếm chuỗi con (%Rowling%). Ngược lại, chỉ
-- mục GIN kết hợp với pg_trgm được thiết kế đặc biệt cho các truy vấn LIKE với ký tự % ở đầu hoặc ở giữa, giúp tăng tốc
-- độ đáng kể cho các truy vấn tìm kiếm phức tạp.
-- 2.Hash Index: Loại chỉ mục này không được khuyến khích trong PostgreSQL vì nó không hỗ trợ các phép toán so sánh lớn hơn/nhỏ hơn (>, <, LIKE).