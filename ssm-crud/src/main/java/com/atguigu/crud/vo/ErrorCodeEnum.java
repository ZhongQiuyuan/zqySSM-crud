package com.atguigu.crud.vo;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * @author zqy
 * @create 2021-11-15 10:14
 */

@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum ErrorCodeEnum {
    OK("00000", "一切正确"),
    USER_ERROR("A0001", "用户端错误"),
    USER_REQUEST_PARAM_ERROR("A0400", "用户请求参数错误");

    /** 错误码 */
    private String value;
    /** 错误描述信息 */
    private String desc;

    ErrorCodeEnum(String value, String desc) {
        this.value = value;
        this.desc = desc;
    }

    @Override
    public String toString() {
        return "[" + value + "]" + desc;
    }

    public String getValue() {
        return value;
    }

    public String getDesc() {
        return desc;
    }
}