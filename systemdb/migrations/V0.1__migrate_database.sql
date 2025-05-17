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

BEGIN
  ORDS.ENABLE_SCHEMA(
    p_enabled => TRUE,
    p_schema => 'FLEX_SYSTEM',
    p_url_mapping_type => 'BASE_PATH',
    p_url_mapping_pattern => 'flex_system',
    p_auto_rest_auth => FALSE
  );
END;
/
