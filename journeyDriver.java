package Risk;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.io.FloatWritable;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;



public class journeyDriver {
	public static void main(String[] args) throws Exception {
		Configuration conf = new Configuration();
		conf.set("fs.defaultFS", "hdfs://localhost:54310");
		conf.set("fs.hdfs.impl", org.apache.hadoop.hdfs.DistributedFileSystem.class.getName());
		Job job = Job.getInstance(conf, "Group By 3  and avg of Field 6");
		//Job job = Job.getInstance();
		job.setJarByClass(JourneyDriver.class);
		job.setMapperClass(journeyMapper.class);
		job.setReducerClass(journeyReducer.class);
		job.setOutputKeyClass(Text.class);
		job.setOutputValueClass(IntWritable.class);
		FileInputFormat.addInputPath(job, new Path("hdfs://localhost:54310/user/hduser/combined/part-m-00000"));
		FileOutputFormat.setOutputPath(job, new Path("hdfs://localhost:54310/user/hduser/Damage"));
	System.exit(job.waitForCompletion(true) ? 0 : 1);
		}
}
