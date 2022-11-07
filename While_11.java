package while_;

public class While_01 {

	public static void main(String[] args) {
		int a =1;
		while(a<=10) {
			//a++; // 이러면 화면에 1이 안나옴 
			System.out.print(a+" "); // 무한루프
			/*1이 나오고 싶으면 여기에 */a++;  
		}//while 
		System.out.println();
		
		//1  2  3  4 5 6 7 8 9 10
		int b=0 ;
		while(b<=9) {
		 b++;
		 System.out.print(b+" ");}//
		System.out.println();
		
		int c = 0;
		while(true)/* 조건이 참 -> 무한루프*/ {
			c++;
			System.out.print(c+" ");
			//if(조건 ) break; -> 여기서 break 는 if 조건일 때 반복인 while을 빠져나가라는 뜻
			if(c==10) break;
			//or
			if(c>=10)break ; //while을 벗어나라... if 조건을 사용해서.
			
			
		}
		
		
		}
	}


