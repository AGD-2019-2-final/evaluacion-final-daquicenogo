-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

-- carga de datos y realiza consulta
d = LOAD 'data.tsv' AS (c1:CHARARRAY, c2:BAG{t:(p:CHARARRAY)}, c3:MAP[]);

t1 = FOREACH d GENERATE FLATTEN(KEYSET(c3)) AS c1;
t2 = GROUP t1 BY c1;
r = FOREACH t2 GENERATE group, COUNT(t1);

-- escribe el archivo de salida
STORE r INTO 'output' USING PigStorage(',');

-- copia los archivos del HDFS al sistema local
--fs -get /datalake/evaluacion-final-wssanchezm/02-pig-50/q06-10/output/.