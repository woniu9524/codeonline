package com.codeonline.cloud.shell.util;

import ch.ethz.ssh2.Connection;
import ch.ethz.ssh2.Session;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.*;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;

@Component
public class SSHExecuteUtil {
    private final Charset charset = StandardCharsets.UTF_8;
    private Connection conn;
    @Value("${ssh.ipAddr}")
    private String ipAddr;
    @Value("${ssh.userName}")
    private String userName;
    @Value("${ssh.password}")
    private String password;

    /**
     * 登录远程Linux主机
     *
     * @return 是否登录成功
     */
    private boolean login() {
        conn = new Connection(ipAddr);
        try {
            // 连接
            conn.connect();
            // 认证
            return conn.authenticateWithPassword(userName, password);
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 执行Shell脚本或命令
     *
     * @param cmd 命令行序列
     * @return 脚本输出结果
     */
    public String exec(String cmd) throws IOException {
        InputStream in = null;
        String result=null;
        try {
            if (this.login()) {
                // 打开一个会话
                Session session = conn.openSession();
                session.execCommand(cmd);
                in = session.getStdout();
                result = String.valueOf(this.processStdout(in, this.charset));
                conn.close();
            }
        } finally {
            if (null != in) {
                in.close();
            }
        }
        return result;
    }

    /**
     * 解析流获取字符串信息
     *
     * @param in      输入流对象
     * @param charset 字符集
     * @return 脚本输出结果
     */
    public StringBuilder processStdout(InputStream in, Charset charset) throws FileNotFoundException {
        byte[] buf = new byte[1024];
        StringBuilder sb = new StringBuilder();
        try {
            // 此方法是休息10秒后最后一次性输出2行数据
            int length;
            while ((length = in.read(buf)) != -1) {
                sb.append(new String(buf, 0, length));
            }

            // 这个会按照脚本一步一步执行，中途有休息10秒。
            BufferedReader reader = null;
            String result = null;
            reader = new BufferedReader(new InputStreamReader(in, "UTF-8"));
            while ((result = reader.readLine()) != null) {
                System.out.println(result);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return sb;
    }


}