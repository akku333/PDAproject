read1 = LOAD 'hdfs://localhost:54310/user/hduser/combined/part-m-00000' USING PigStorage(',') AS (ObjectId:chararray,Dbh:int, TpCondition:chararray, TreepointglobalId:chararray, GenusSpecies:chararray, RiskRating:int, InspectionType:chararray, InspectionStatus:chararray, InspectiontpCondition:chararray, InspectiontpStructure:chararray, TreepointDbh:int, SwtreeconditionRating:int, SwdamageRating:int, GlobalID:chararray, InspectedByname:chararray, UpdatedDate:chararray,UpdatedByname:chararray,ParentinspectionglobalID:chararray);

grouping = GROUP read1 BY TpCondition;
addition = FOREACH grouping GENERATE group, AVG(read1.Dbh);
DUMP addition;
STORE addition INTO '/home/hduser/Downloads/pigcomparecase1' USING PigStorage (',');
