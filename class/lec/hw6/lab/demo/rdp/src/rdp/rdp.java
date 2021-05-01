package rdp;


import java.util.Scanner;
 
public class rdp  {
 
	   //输入的表达式
    static String expression;
    //当前的符号
    static Character sym;
    //当前指针
    static int index;
    //出现错误语法了
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
                System.out.println(expression.replace("#","")+"是合法的");
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

 


    //把指针向前进一步
    public static void advance(){
        index++;
        sym=expression.charAt(index);
    }

    //出错处理
    public static void error(){
        System.out.println(expression.replace("#","")+"是不合法的");
    }


}
