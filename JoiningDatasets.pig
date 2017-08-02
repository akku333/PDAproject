Inspection = LOAD '/home/hduser/Downloads/Inspection1.csv' using PigStorage(',') AS (InspectionType:chararray, InspectionStatus:chararray, InspectionTpcondition:chararray,InspectionTpstructure:chararray, TreepointDbh:int, SwtreeconditionRation:int, SwdamageRating:INT, TreepointglobalId:chararray, GlobalId:chararray, InspectionbyName:chararray, UpdatedDate:chararray,UpdatedbyName:chararray, PernetinspectionId:chararray);

Treepoint = LOAD '/home/hduser/Downloads/Treepoint1.csv' using PigStorage(',') AS (ObjectId:INT, Dbh:INT, TpCondition:chararray,TreepointglobalId:chararray, Genusspecies:chararray, Riskrating:int);

Inspection_Tree = join Inspection by TreepointglobalId, Treepoint by TreepointglobalId;
STORE Inspection_Tree INTO '/home/hduser/Downloads/combined_data' USING PigStorage (',');

