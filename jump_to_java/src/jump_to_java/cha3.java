package jump_to_java;

public class cha3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("Hello World");
		//����
		int age = 10;
		long countOfStar = 8764827384923849L;
		
		float pi = 3.14F;
		double morePi = 3.14159265358979323846;
		
		double d1 = 123.4;
		double d2 = 1.234e2;
		
		int octal = 023;    // ������: 19
		int hex = 0xC;     // ������: 12
		
		int a = 10;
        int b = 5;
        System.out.println(a+b);
        System.out.println(a-b);
        System.out.println(a*b);
        System.out.println(a/b);
        
        System.out.println(7 % 3);
        System.out.println(3 % 7);
        
        //��������
        int i = 0;
        int j= 10;
        i++;
        j--;

        System.out.println(i);
        System.out.println(j);
        
        System.out.println(i++);
        System.out.println(i);
        
       
        int base = 180;
        int height = 185;
        boolean isTall = height > base;

        if (isTall) {
            System.out.println("Ű�� Ů�ϴ�.");
        }
        
        int z = 3;
        boolean isOdd = z % 2 == 1;
        System.out.println(isOdd);
        
        char a1 = 'a';
        char a2 = 97;
        char a3 = '\u0061';

        System.out.println(a1);
        System.out.println(a2);
        System.out.println(a3);
        
	}

public class cha3_1{
    public static void main(String[] args){
        String a = "Happy Java";
        System.out.println(a)

    }
}

}
