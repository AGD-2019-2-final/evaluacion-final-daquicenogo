-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        REGEX_EXTRACT(birthday, '....-..-..', 2) 
--    FROM 
--        u;
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

t1 = FOREACH d GENERATE SUBSTRING($3,5,7);
--t2 = FILTER t1 BY $1 IN ('a','e','i','o','u');
--r = FOREACH t2 GENERATE $0, $2;

-- escribe el archivo de salida
STORE t1 INTO 'output'USING PigStorage(',');

-- copia los archivos del HDFS al sistema local
--fs -get /datalake/evaluacion-final-wssanchezm/02-pig-50/q24-10/output/.