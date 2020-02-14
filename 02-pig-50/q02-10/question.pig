-- Pregunta
-- ===========================================================================
-- 
-- Ordene el archivo `data.tsv`  por letra y valor (3ra columna).
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
--  >>> Escriba el codigo del mapper a partir de este punto <<<
-- 


-- carga de datos y realiza consulta
d = LOAD 'data.tsv' AS (letra:CHARARRAY, fecha:CHARARRAY, numero:INT);
t1 = ORDER d BY letra, numero;
--r = FOREACH t1 GENERATE group, COUNT(d.numero);

-- escribe el archivo de salida
STORE t1 INTO 'output';

-- copia los archivos del HDFS al sistema local
--fs -get /datalake/evaluacion-final-wssanchezm/02-pig-50/q02-10/output/.

