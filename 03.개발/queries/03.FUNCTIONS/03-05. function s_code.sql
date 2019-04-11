CREATE OR REPLACE FUNCTION s_code
RETURN CHAR
IS
BEGIN
    RETURN concat('s_',LPAD(s_num.nextval,6,0));
END;
/