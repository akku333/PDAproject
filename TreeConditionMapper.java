package Tree;

import java.io.IOException;

import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.io.FloatWritable;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class TreeConditionMapper extends Mapper<Object, Text, Text, IntWritable>
{
	//Creating object of IntWritable and Text
	private IntWritable dbh  = new IntWritable();
	private Text  Tpcondition = new Text();
   
			public void map(Object key, Text value, Context context)
					throws IOException, InterruptedException
					{
	//Passing the string and splitting it by comma separated and storing it in string array
				String[] arr_new = value.toString().split(",");
				Tpcondition.set(arr_new[2]);
				dbh.set(Integer.parseInt(arr_new[1]));
	//Passing the key and value to context buffer of the Map output 
				context.write(Tpcondition, dbh);
				
				
		}
		
	}
