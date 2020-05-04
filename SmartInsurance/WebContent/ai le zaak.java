import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringReader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.Random;


import weka.core.Instances;

import weka.classifiers.Classifier;


import weka.classifiers.trees.RandomForest;

import weka.core.Instances;


public class hello {

	public static void main(String[] args) throws Exception {
		String year,brand,model,mileage;
		year="2019";
		brand="BMW";
		model="340i";
		mileage="497";
		
		// TODO Auto-generated method stub
		BufferedReader datafile = readDataFile("trainData3.arff");

		Instances train = new Instances(datafile);
		train.setClassIndex(0);
 
	
		RandomForest j48 = new RandomForest();
		j48.buildClassifier(train);

		weka.core.SerializationHelper.write("Cars_mL.model", j48);
		
		Classifier cls = (Classifier) weka.core.SerializationHelper.read("Cars_mL.model");
		BufferedReader header=new BufferedReader(new FileReader("Cars_header.arff"));
		 StringBuilder everything = new StringBuilder();
		    String line;
		    while( (line = header.readLine()) != null) {
		       everything.append(line+"\n");
		    }
		    everything.append("?,"+brand+","+model+","+mileage+","+year);
		//System.out.println(everything);
		
		//Instances unlabeled = new Instances(new BufferedReader(new FileReader("vehiclestrainarff.arff")));
		Instances unlabeled = new Instances(new BufferedReader(new StringReader(everything.toString())));
		unlabeled.setClassIndex(0);
		for (int i = 0; i < unlabeled.numInstances(); i++) {
			double clsLabel = cls.classifyInstance(unlabeled.instance(i));
			System.out.println("predicted price: "+Math.round(clsLabel));
			//System.out.println("---predicted value: " + unlabeled.classAttribute().value((int)clsLabel));
	         }
		
		
		
		
	}
	
	public static BufferedReader readDataFile(String filename) {
		BufferedReader inputReader = null;
 
		try {
			inputReader = new BufferedReader(new FileReader(filename));
		} catch (FileNotFoundException ex) {
			System.err.println("File not found: " + filename);
		}
 
		return inputReader;
	}
}
