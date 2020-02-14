-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
-- 


-- carga de datos y realiza consulta
d = LOAD 'data.tsv' AS (letra:CHARARRAY, fecha:CHARARRAY, numero:INT);
t1 = ORDER d BY numero;
t2 = FOREACH t1 GENERATE numero;
r = LIMIT t2 5;

-- escribe el archivo de salida
STORE r INTO 'output';

-- copia los archivos del HDFS al sistema local
--fs -get /datalake/evaluacion-final-wssanchezm/03-pig-50/q02-10/output/.
