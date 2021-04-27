
package com.example.demo.result;
//实现响应的枚举类
public enum ExceptionMsg {
	SUCCESS("200", "操作成功"),
	FAILED("400","操作失败"),
    ParamError("405", "参数错误！"),
    SidNotUnique("000401","学号重复");



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

