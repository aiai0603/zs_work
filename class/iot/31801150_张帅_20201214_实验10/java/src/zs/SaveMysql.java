package zs;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import com.alibaba.fastjson.JSONObject;

public class SaveMysql {
    private static String driver="com.mysql.jdbc.Driver";
    private static String url="jdbc:mysql://47.100.136.15:3306/mqtt?serverTimezone=UTC";
    private static String user="root";
    private static String password="Sss991126/";
    Connection conn=null;
    Statement stmt=null;
    ResultSet rs=null;
  
   
    public void savedate2(String payload) {
        JSONObject equipment = new JSONObject();
        
        java.sql.Timestamp time= new java.sql.Timestamp(System.currentTimeMillis());
        try{
           
            equipment = JSONObject.parseObject(payload);
        }
        catch (Exception e){
            e.printStackTrace();
            System.out.println("Json格式错误");
            return ;
        }
        String sql = "insert into IoT_test(Sid,Sname,Ename,Humidity,Temperature,Timesite,Username)"+"values('"+equipment.getString("sid")+"','"
                +equipment.getString("sname")+"','"+equipment.getString("Ename")+"','"+equipment.getDouble("humidity")+"','"+equipment.getDouble("temperature")
                +"','"+time+"','"+equipment.getString("clientid")+"');";
        try {
            Class.forName(driver);
            conn=DriverManager.getConnection(url,user,password);
            stmt=conn.createStatement();
            stmt.executeUpdate(sql);
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        finally {
            try {
                if(stmt!=null) stmt.close();
                if(conn!=null) conn.close();
            }
            catch(Exception e) {
                e.printStackTrace();
            }
        }

    }
    
    public void savedate(String topic,int Qos,String payload) {
        
        java.sql.Timestamp timestamp=new java.sql.Timestamp(System.currentTimeMillis());
		String sql = "insert into mqtt(Topic,Qos,payload,Timestamp)"+"values('"+topic+"','"+Qos+"','"+payload+"','"+timestamp+"');";
        try {
            Class.forName(driver);
            conn=DriverManager.getConnection(url,user,password);
            stmt=conn.createStatement();
            stmt.executeUpdate(sql);
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        finally {
            try {
                if(stmt!=null) stmt.close();
                if(conn!=null) conn.close();
            }
            catch(Exception e) {
                e.printStackTrace();
            }
        }
    }


}
