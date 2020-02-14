-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.csv` escriba una consulta en Pig que genere la 
-- siguiente salida:
-- 
--   Vivian@Hamilton
--   Karen@Holcomb
--   Cody@Garrett
--   Roth@Fry
--   Zoe@Conway
--   Gretchen@Kinney
--   Driscoll@Klein
--   Karyn@Diaz
--   Merritt@Guy
--   Kylan@Sexton
--   Jordan@Estes
--   Hope@Coffey
--   Vivian@Crane
--   Clio@Noel
--   Hope@Silva
--   Ayanna@Jarvis
--   Chanda@Boyer
--   Chadwick@Knight
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--

-- carga de datos y realiza consulta
d = LOAD 'data.csv' USING PigStorage(',') AS 
(c1:INT, 
 c2:CHARARRAY, 
 c3:CHARARRAY, 
 c4:CHARARRAY, 
 c5:CHARARRAY, 
 c6:INT);

r = FOREACH d GENERATE CONCAT(c2,'@',c3);
--t2 = GROUP t1 BY (c2,c3);
--r = FOREACH t2 GENERATE group, COUNT(t1);

-- escribe el archivo de salida
STORE r INTO 'output';

-- copia los archivos del HDFS al sistema local
--fs -get /datalake/evaluacion-final-wssanchezm/02-pig-50/q09-10/output/.

