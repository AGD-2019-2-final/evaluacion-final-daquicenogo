--
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        color 
--    FROM 
--        u 
--    WHERE 
--        color NOT LIKE 'b%';
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
d = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
t1 = FOREACH d GENERATE $4, SUBSTRING($4,0,1);
t2 = FILTER t1 BY NOT $1 IN ('b');
r = FOREACH t2 GENERATE $0;

-- escribe el archivo de salida
STORE r INTO 'output' USING PigStorage(',');

-- copia los archivos del HDFS al sistema local
--fs -get /datalake/evaluacion-final-wssanchezm/02-pig-50/q14-10/output/.