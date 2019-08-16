package Risk;

import java.io.IOException;

import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.io.FloatWritable;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class journeyMapper extends Mapper<Object, Text, Text, IntWritable>
{
	//Creating object of IntWritable and Text
	private IntWritable damagerating  = new IntWritable();
	private Text  Structures = new Text();
   
			public void map(Object key, Text value, Context context)
					throws IOException, InterruptedException
					{
	//Passing the string and splitting it by comma separated and storing it in string array
				String[] arr_new = value.toString().split(",");
				Structures.set(arr_new[9]);
		damagerating.set(Integer.parseInt(arr_new[12]));

			
				
	//Passing the key and value to context buffer of the Map output 
				context.write(Structures, damagerating);
				
				
		}
		
	}
