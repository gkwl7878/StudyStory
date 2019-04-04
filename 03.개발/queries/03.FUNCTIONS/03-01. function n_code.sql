CREATE OR REPLACE FUNCTION n_code
RETURN CHAR
IS
BEGIN
    RETURN concat('n_',LPAD(n_num.nextval,6,0));
END;
/