CREATE OR REPLACE FUNCTION a_code
RETURN CHAR
IS
BEGIN
    RETURN concat('a_',LPAD(a_num.nextval,6,0));
END;
/