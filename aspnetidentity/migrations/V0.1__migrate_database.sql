-- Tạo user mới
CREATE USER aspnetidentity IDENTIFIED BY "Luyenhaidang10062002@"
DEFAULT TABLESPACE DATA
QUOTA UNLIMITED ON DATA;

-- Gán quyền kết nối và tạo object
GRANT CONNECT, RESOURCE TO aspnetidentity;

-- Gán role đặc biệt cho ADB
GRANT DWROLE TO aspnetidentity;       -- nếu là Data Warehouse
GRANT UNLIMITED TABLESPACE TO aspnetidentity;

-- Gán quyền tạo view, sequence, procedure...
GRANT CREATE VIEW TO aspnetidentity;
GRANT CREATE SEQUENCE TO aspnetidentity;
GRANT CREATE PROCEDURE TO aspnetidentity;
GRANT CREATE TRIGGER TO aspnetidentity;
GRANT CREATE SYNONYM TO aspnetidentity;

BEGIN
  ORDS.ENABLE_SCHEMA(
    p_enabled => TRUE,
    p_schema => 'ASPNETIDENTITY',
    p_url_mapping_type => 'BASE_PATH',
    p_url_mapping_pattern => 'aspnetidentity',
    p_auto_rest_auth => FALSE
  );
END;
/

