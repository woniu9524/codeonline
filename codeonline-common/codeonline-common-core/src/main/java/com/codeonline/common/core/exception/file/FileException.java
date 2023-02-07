package com.codeonline.common.core.exception.file;

import com.codeonline.common.core.exception.base.BaseException;

/**
 * 文件信息异常类
 * 
 * @author codeonline
 */
public class FileException extends BaseException
{
    private static final long serialVersionUID = 1L;

    public FileException(String code, Object[] args)
    {
        super("file", code, args, null);
    }

}
