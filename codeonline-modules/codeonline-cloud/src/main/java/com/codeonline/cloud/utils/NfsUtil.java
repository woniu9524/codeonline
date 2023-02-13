package com.codeonline.cloud.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.io.FileNotFoundException;
import java.util.Scanner;
public class NfsUtil {

    /*
    *  读取文件树
    * */
    public static void showList(File file, List<Map<String, Object>> fileTree) {
        Map<String, Object> map = new HashMap<>();
        if (file.isDirectory()) {//如果是目录
            map.put("name", file.getName());
            map.put("path", file.getPath());
            List<Map<String, Object>> childTree = new ArrayList<>();
            File[] listFiles = file.listFiles();//获取当前路径下的所有文件和目录,返回File对象数组
            for (File f : listFiles) {//将目录内的内容对象化并遍历
                showList(f, childTree);
            }
            map.put("children", childTree);
            fileTree.add(map);
        } else if (file.isFile()) {//如果是文件
            map.put("name", file.getName());
            map.put("isLeaf", true);
            map.put("path", file.getPath());
            fileTree.add(map);
        }

    }

    /*
    *  读取文件内容
    * */
    public static String readFileContent(String filePath) {
        StringBuilder contentBuilder = new StringBuilder();
        try {
            Scanner scanner = new Scanner(new File(filePath));
            while (scanner.hasNextLine()) {
                contentBuilder.append(scanner.nextLine()).append("\n");
            }
            scanner.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        return contentBuilder.toString();
    }


}
