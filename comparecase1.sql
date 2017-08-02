SET mapreduce.framework.name = local;
SET mapred.local.dir=/tmp/hduser/mapred/local;

DROP TABLE case3;  
CREATE TABLE IF NOT EXISTS case3 (ObjectId String, Dbh INT, TpCondition String,TreepointglobalId String , GenusSpecies String, RiskRating INT, InspectionType String, InspectionStatus String, InspectiontpCondition String, InspectiontpStructure String, TreepointDbh INT,
SwtreeconditionRating INT, SwdamageRating INT, GlobalID String, InspectedByname String, UpdatedDate String,
UpdatedByname String, ParentinspectionglobalID String) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',';

LOAD DATA INPATH 'hdfs://localhost:54310/user/hduser/combined/part-m-00000' INTO TABLE case3;

INSERT OVERWRITE LOCAL DIRECTORY '/home/hduser/Downloads/comparecase1'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT TpCondition, AVG(DBH)  FROM case3 GROUP BY TpCondition ;

