CREATE OR REPLACE FUNCTION q_code
RETURN CHAR
IS
BEGIN
    RETURN concat('q_',LPAD(q_num.nextval,6,0));
END;
/