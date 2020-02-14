-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
-- columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
-- columna 3 es:
-- 
--   ((b,jjj), 216)
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

-- carga de datos y realiza consulta
d = LOAD 'data.tsv' AS (c1:CHARARRAY, c2:BAG{t:(p:CHARARRAY)}, c3:MAP[]);

t1 = FOREACH d GENERATE c1 AS c1 , FLATTEN(c2.p) AS c2, FLATTEN(KEYSET(c3)) AS c3;
t2 = GROUP t1 BY (c2,c3);
r = FOREACH t2 GENERATE group, COUNT(t1);

-- escribe el archivo de salida
STORE r INTO 'output';

-- copia los archivos del HDFS al sistema local
--fs -get ./datalake/evaluacion-final-wssanchezm/02-pig-50/q08-10/output/.