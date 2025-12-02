-- 1. Thêm cột genre (varchar) vào bảng library.Books
ALTER TABLE Books
    ADD COLUMN genre VARCHAR(100);

-- 2. Đổi tên cột available thành is_available trong bảng library.Books
ALTER TABLE Books
    RENAME COLUMN available TO is_available;

-- 3. Xóa cột email khỏi bảng library.Members
ALTER TABLE Members
    DROP COLUMN email;

-- 4. Xóa bảng OrderDetails khỏi schema sales
DROP TABLE OrderDetails;