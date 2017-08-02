read1 = LOAD 'hdfs://localhost:54310/user/hduser/combined/part-m-00000' USING PigStorage(',') AS (ObjectId:chararray,Dbh:int, TpCondition:chararray, TreepointglobalId:chararray, GenusSpecies:chararray, RiskRating:int, InspectionType:chararray, InspectionStatus:chararray, InspectiontpCondition:chararray, InspectiontpStructure:chararray, TreepointDbh:int, SwtreeconditionRating:int, SwdamageRating:int, GlobalID:chararray, InspectedByname:chararray, UpdatedDate:chararray,UpdatedByname:chararray,ParentinspectionglobalID:chararray);

Filtering = FILTER read1 by GenusSpecies == 'Pyrus calleryana - Callery pear';
Grouping = GROUP Filtering BY (GenusSpecies, TpCondition);
Risk = FOREACH Grouping GENERATE FLATTEN(group) AS (GenusSpecies, TpCondition), MIN(Filtering.RiskRating), MAX(Filtering.RiskRating);

DUMP Risk;

STORE Risk INTO 'hdfs://localhost:54310/user/hduser/pigout' USING PigStorage (',');


