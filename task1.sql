CREATE OR REPLACE FUNCTION format_seconds(seconds IN NUMBER)
RETURN VARCHAR2
IS
  days NUMBER;
  hours NUMBER;
  minutes NUMBER;
  remaining_seconds NUMBER;
  formatted_time VARCHAR2(100);
BEGIN
  days := FLOOR(seconds / 86400);
  remaining_seconds := MOD(seconds, 86400);
  hours := FLOOR(remaining_seconds / 3600);
  remaining_seconds := MOD(remaining_seconds, 3600);
  minutes := FLOOR(remaining_seconds / 60);
  remaining_seconds := MOD(remaining_seconds, 60);

  formatted_time := 
    CASE WHEN days > 0 THEN days || ' days ' END ||
    CASE WHEN hours > 0 THEN hours || ' hours ' END ||
    CASE WHEN minutes > 0 THEN minutes || ' minutes ' END ||
    remaining_seconds || ' seconds';

  RETURN formatted_time;
END;
/
