CREATE OR REPLACE FUNCTION sn_code
RETURN CHAR
IS
BEGIN
    RETURN concat('sn_',LPAD(sn_num.nextval,6,0));
END;
/