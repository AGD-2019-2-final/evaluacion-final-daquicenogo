-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;

--
-- >>> Escriba su respuesta a partir de este punto <<<

-- carga de datos y realiza consulta
d = LOAD 'data.tsv' AS (letra:CHARARRAY, fecha:CHARARRAY, numero:INT);
t1 = GROUP d BY letra;
r = FOREACH t1 GENERATE group, COUNT(d.numero);

-- escribe el archivo de salida
STORE r INTO 'output';

-- copia los archivos del HDFS al sistema local
--fs -get /datalake/evaluacion-final-wssanchezm/02-pig-50/q01-10/output/.