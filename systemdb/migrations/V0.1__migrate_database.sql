-- Tạo user mới
CREATE USER flex_system IDENTIFIED BY "Luyenhaidang10062002@"
DEFAULT TABLESPACE DATA
QUOTA UNLIMITED ON DATA;

-- Gán quyền kết nối và tạo object
GRANT CONNECT, RESOURCE TO flex_system;

-- Gán role đặc biệt cho ADB
GRANT DWROLE TO flex_system;       -- nếu là Data Warehouse
GRANT UNLIMITED TABLESPACE TO flex_system;

-- Gán quyền tạo view, sequence, procedure...
GRANT CREATE VIEW TO flex_system;
GRANT CREATE SEQUENCE TO flex_system;
GRANT CREATE PROCEDURE TO flex_system;
GRANT CREATE TRIGGER TO flex_system;
GRANT CREATE SYNONYM TO flex_system;
/
