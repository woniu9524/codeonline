package com.codeonline.cloud;

import com.codeonline.cloud.utils.NfsUtil;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest(classes = CodeOnlineCloudApplication.class)
public class TestNFS {
    @Test
    public void testRead(){
        String s = NfsUtil.readFileContent("C:\\Users\\Administrator\\Desktop\\data\\nfs\\1\\2-1673483074074\\8\\1.py");
        System.out.println(s);
    }


}
