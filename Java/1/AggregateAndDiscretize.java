import java.io.IOException;
import java.util.Scanner;

public class AggregateAndDiscretize {
	ReadCsv rcsv;
	static Scanner sc = new Scanner(System.in);
	int min, max, col, sum;
	double avg;
	AggregateAndDiscretize(String fileName) throws IOException{
		rcsv = new ReadCsv(fileName, ",");
		System.out.println("Enter the column number: ");
		col = sc.nextInt() - 1;
		min = Integer.MAX_VALUE;
		max = Integer.MIN_VALUE;
		this.aggregate();
		this.discretize();
	}
	void aggregate()	{
		sum = 0;
		int count = 0;
		for(String[] line : rcsv.csvData)	{
			int n = Integer.parseInt(line[col]);
			if(n > max)
				max = Integer.parseInt(line[col]);
			if(n < min)
				min = Integer.parseInt(line[col]);
			sum += n;
			count++;
		}
		avg = (double)sum/count;
		System.out.println("Max : " + max);
		System.out.println("Min : " + min);
		System.out.println("Sum : " + sum);
		System.out.println("Average : " + avg);
	}
	void discretize()	{
		int mean = (min + max) / 2;
		int mid1 = (min + mean) / 2;
		int mid2 = (mean + max) / 2;
		for(String[] line: rcsv.csvData)	{
			for(int i=0;i<line.length; i++)	{
				if(i == col){
					int val = Integer.parseInt(line[i]);
					if(val>= min && val<mid1)
						System.out.print(min + "-" + mid1 + " ");
					else if(val>=mid1 && val < mean)
						System.out.print(mid1 + "-" + mean + " ");
					else if(val>=mean && val < mid2) 
						System.out.print(mean + "-" + mid2 + " ");
					else if(val>=mid2 && val <=max)
						System.out.print(mid2 + "-" + max + " ");
				}
				else
					System.out.print(line[i] + " ");
			}
			System.out.println();
		}
	}
	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		System.out.println("Enter file Name: ");
		AggregateAndDiscretize s = new AggregateAndDiscretize(sc.next());
	}
}
