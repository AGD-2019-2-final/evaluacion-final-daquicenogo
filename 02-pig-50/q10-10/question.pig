-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Genere una relación con el apellido y su longitud. Ordene por longitud y 
-- por apellido. Obtenga la siguiente salida.
-- 
--   Hamilton,8
--   Garrett,7
--   Holcomb,7
--   Coffey,6
--   Conway,6
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

t1 = FOREACH d GENERATE $2, SIZE($2);
t2 = ORDER t1 BY $1 DESC, $0;
r = LIMIT t2 5;

-- escribe el archivo de salida
STORE r INTO 'output' USING PigStorage(',');

-- copia los archivos del HDFS al sistema local
--fs -get /datalake/evaluacion-final-wssanchezm/02-pig-50/q10-10/output/.