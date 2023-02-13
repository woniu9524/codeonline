package com.codeonline.cloud.shell.util;


import java.io.*;

public class LocalExecuteUtil {
    /**
     * 运行Linux命令
     * @author YuanRiKang
     * @date 2022/5/24 16:56
     * @param command 命令
     * @return 返回结果
     */
    public static String executeNewFlow(String command) {
        Runtime run = Runtime.getRuntime();
        String rspLine=null;
        try {
            Process proc = run.exec("/bin/bash", null, null);
            BufferedReader in = new BufferedReader(new InputStreamReader(proc.getInputStream()));
            PrintWriter out = new PrintWriter(new BufferedWriter(new OutputStreamWriter(proc.getOutputStream())), true);
            out.println(command);
            out.println("exit");// 这个命令必须执行，否则in流不结束。
            rspLine = in.readLine();

            proc.waitFor();
            in.close();
            out.close();
            proc.destroy();
        } catch (IOException e1) {
            e1.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return rspLine;
    }
}

