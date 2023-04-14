package com.codeonline.cloud.shell;

import com.codeonline.cloud.shell.strategy.IShellStrategy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class ShellMan {
    @Autowired
    @Qualifier("localShellStrategyImpl")
    private IShellStrategy localShellStrategyImpl;

    @Autowired
    @Qualifier("SSHShellStrategyImpl")
    private IShellStrategy  sshShellStrategyImpl;

    @Value("${ssh.enable}")
    private String  sshEnable;


    public String exec(String cmd) throws IOException {
        if ("true".equals(sshEnable)){
            return sshShellStrategyImpl.exec(cmd);
        }else {
            return localShellStrategyImpl.exec(cmd);
        }
    }

    public String exec(String cmd,boolean enable) throws IOException {
        if ("true".equals(enable)){
            return sshShellStrategyImpl.exec(cmd);
        }else {
            return localShellStrategyImpl.exec(cmd);
        }
    }
}
