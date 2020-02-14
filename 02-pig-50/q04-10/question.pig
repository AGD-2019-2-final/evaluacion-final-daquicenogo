--
-- Pregunta
-- ===========================================================================
-- 
-- El archivo `truck_event_text_partition.csv` tiene la siguiente estructura:
-- 
--   driverId       INT
--   truckId        INT
--   eventTime      STRING
--   eventType      STRING
--   longitude      DOUBLE
--   latitude       DOUBLE
--   eventKey       STRING
--   correlationId  STRING
--   driverName     STRING
--   routeId        BIGINT
--   routeName      STRING
--   eventDate      STRING
-- 
-- Escriba un script en Pig que carge los datos y obtenga los primeros 10 
-- registros del archivo para las primeras tres columnas, y luego, ordenados 
-- por driverId, truckId, y eventTime. 
--
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
--  >>> Escriba su respuesta a partir de este punto <<<
-- 

-- carga de datos y realiza consulta
d = LOAD 'truck_event_text_partition.csv' USING PigStorage(',') 
AS (driverId:INT,
truckId:INT,
eventTime:CHARARRAY,
eventType:CHARARRAY,
longitude:FLOAT,
latitude:FLOAT,
eventKey:CHARARRAY,
correlationId:CHARARRAY,
driverName:CHARARRAY,
routeId:INT,
routeName:CHARARRAY,
eventDate:CHARARRAY);

t1 = FOREACH d GENERATE $0, $1, $2;
t2 = LIMIT t1 10;
t3 = ORDER t2 BY $0, $1, $2;
r = FOREACH t3 GENERATE $0, $1, $2;

-- escribe el archivo de salida
STORE r INTO 'output' USING PigStorage(',');

-- copia los archivos del HDFS al sistema local
--fs -get /datalake/evaluacion-final-wssanchezm/02-pig-50/q04-10/output/.