package com.example.demo.exception;


//@ResponseStatus(code= HttpStatus.INTERNAL_SERVER_ERROR,reason="600")
public class BusinessException extends RuntimeException {
    //自定义错误码
    private Integer code;
    //自定义构造器，必须输入错误码及内容
    public BusinessException(int code, String msg) {
        super(msg);
        this.code = code;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }
}


