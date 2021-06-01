
package cn.edu.zucc.result;
//实现响应的枚举类
public enum ExceptionMsg {
	SUCCESS("200", "操作成功"),
	FAILED("400","操作失败"),
    PERMISSION("403","没有权限"),
	TOKENFAILED("1423","token验证失败");





   private ExceptionMsg(String code, String msg) {
        this.code = code;
        this.msg = msg;
    }
    private String code;
    private String msg;
    
	public String getCode() {
		return code;
	}
	public String getMsg() {
		return msg;
	}

    
}

