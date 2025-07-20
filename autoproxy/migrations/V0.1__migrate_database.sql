-- Create new user
CREATE USER autoproxy IDENTIFIED BY "Luyenhaidang10100202@"
DEFAULT TABLESPACE DATA
QUOTA UNLIMITED ON DATA;

-- Grant connect and object creation privileges
GRANT CONNECT, RESOURCE TO autoproxy;

-- Grant special role for ADB
GRANT DWROLE TO autoproxy;       -- For Data Warehouse
GRANT UNLIMITED TABLESPACE TO autoproxy;

-- Grant privileges to create view, sequence, procedure, etc.
GRANT CREATE VIEW TO autoproxy;
GRANT CREATE SEQUENCE TO autoproxy;
GRANT CREATE PROCEDURE TO autoproxy;
GRANT CREATE TRIGGER TO autoproxy;
GRANT CREATE SYNONYM TO autoproxy;

BEGIN
  ORDS.ENABLE_SCHEMA(
    p_enabled => TRUE,
    p_schema => 'AUTOPROXY',
    p_url_mapping_type => 'BASE_PATH',
    p_url_mapping_pattern => 'autoproxy',
    p_auto_rest_auth => FALSE
  );
END;
/