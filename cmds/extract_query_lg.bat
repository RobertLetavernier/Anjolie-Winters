@echo off

>  _tmp_query.sql echo SELECT 
>> _tmp_query.sql echo     CONCAT('[', publicIdx, '] ', publicNom) as "Publication"
>> _tmp_query.sql echo     , CONCAT('[', number.numIdx, '] ', number.numNom) as "Numero"
>> _tmp_query.sql echo     -- , CONCAT('[', NuLaIdx, '] ', numla.numIdx, ' / ', numla.lgCode) as "NuLa"
>> _tmp_query.sql echo     , CONCAT('[', lg.lgCode, '] ', lg.lgNom) as "Langue"
>> _tmp_query.sql echo FROM       syge_numerolangue    AS numla
>> _tmp_query.sql echo INNER JOIN syge_langue          AS lg       ON lg.lgCode = numla.LgCode
>> _tmp_query.sql echo INNER JOIN syge_numero          AS number   ON number.numIdx = numla.numIdx
>> _tmp_query.sql echo INNER JOIN syge_publication                 ON publicIdx = numPublicIdx
>> _tmp_query.sql echo -- WHERE lg.lgCode='%2'
>> _tmp_query.sql echo ORDER BY Publication ASC, Numero ASC, numla.lgCode ASC

REM "C:\Program Files\MySQL\MySQL Server 5.5\bin\mysql" -P3306 -uroot -pvYbLR59uzzt5rwHa %1 < _tmp_query.sql
mysql -P3307 -uroot -pPyLQa1HR1x3UV8go %1 < _tmp_query.sql