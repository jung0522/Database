SELECT a.id 
FROM a 
WHERE a.b = (
    SELECT b.b 
    FROM b 
    WHERE b.b2 = (
        SELECT c.c 
        FROM c 
        WHERE c.�ؿ� = '�ؿ�1'
    )
);
