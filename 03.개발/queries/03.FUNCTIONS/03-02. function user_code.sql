CREATE OR REPLACE FUNCTION user_code
RETURN CHAR
IS
BEGIN
    RETURN concat('user',LPAD(user_num.nextval,6,0));
END;
/