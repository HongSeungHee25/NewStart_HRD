import java.util.Scanner;

public class Score {
	public static final String Red = "\u001B[31m";
	public static final String Green = "\u001B[32m";
	public static final String Blue = "\u001B[34m";
	public static final String RESET = "\u001B[0m";
	
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		double test1;
		int test2;
		double test3;
		double need;
		
		System.out.println("내부평가 점수를 입력하세요.");
		System.out.print("▶ ");
		test1 = sc.nextDouble();
		
		need = 80 - test1/2;
		
		for (int i = 1; i <=10 ; i++) {
			test2 = i*10;
			test3 = need - test2*0.2;
			System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
			System.out.println("내부평가 점수 : "+test1+"점 ("+test1/2+")");
			System.out.println(Red+"필요한 외부평가 점수 : "+need+RESET);
			System.out.println(Blue+"외부평가 필기 : "+test2+"점 ("+test2*0.2+")"+RESET);
			System.out.println(Green+"외부평가 실기 : "+Math.round(test3*3)+"점 ("+test3+")"+RESET);
		}
		
		sc.close();
	}
}
