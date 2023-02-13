package com.codeonline.common.core.exception.codeonline;

/*
* 执行关于harbor的shell命令报错
*
* */

public class HarborShellException extends RuntimeException {
    private static final long serialVersionUID = 1L;

    public HarborShellException(String message) {
        super(message);
    }
}
