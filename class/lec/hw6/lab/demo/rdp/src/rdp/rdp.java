package rdp;


import java.util.Scanner;
 
public class rdp  {
 
	   //����ı��ʽ
    static String expression;
    //��ǰ�ķ���
    static Character sym;
    //��ǰָ��
    static int index;
    //���ִ����﷨��
    static boolean hasErr;
    public static void main(String []main){
        Scanner input=new Scanner(System.in);
        expression=input.next();
        while (!expression.equals("end")){
            expression+="#";
            index=-1;
            hasErr=false;
            advance();
            S();
          
            if (hasErr){
                error();
            }
            else if (sym=='#'){
                System.out.println(expression.replace("#","")+"�ǺϷ���");
            }else{
                error();
            }
            expression=input.next();
        }
    }


    public static void S(){
            A();
            B();
            D();
        
    }

    public static void A(){
        if (sym=='a'){
            advance();
            A();
        }
    }
    
    public static void B(){
        if (sym=='b'){
            advance();
            B();
            
        }
    }
    
    public static void D(){
        if (sym=='d'){
            advance();
            D();
            
        }
    }

 


    //��ָ����ǰ��һ��
    public static void advance(){
        index++;
        sym=expression.charAt(index);
    }

    //������
    public static void error(){
        System.out.println(expression.replace("#","")+"�ǲ��Ϸ���");
    }


}
