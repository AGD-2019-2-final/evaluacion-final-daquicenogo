-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
-- columna 3 separados por coma. La tabla debe estar ordenada por las 
-- columnas 1, 2 y 3.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

-- carga de datos y realiza consulta
d = LOAD 'data.tsv' AS (c1:CHARARRAY, c2:BAG{t:(p:CHARARRAY)}, c3:MAP[]);

t1 = FOREACH d GENERATE c1 , COUNT(c2), SIZE(c3);
r = ORDER t1 BY $0, $1, $2;

-- escribe el archivo de salida
STORE r INTO 'output' USING PigStorage(',');

-- copia los archivos del HDFS al sistema local
--fs -get /datalake/evaluacion-final-wssanchezm/02-pig-50/q07-10/output/.