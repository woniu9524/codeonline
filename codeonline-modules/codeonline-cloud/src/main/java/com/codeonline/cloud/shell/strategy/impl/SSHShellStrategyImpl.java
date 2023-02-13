package com.codeonline.cloud.shell.strategy.impl;


import com.codeonline.cloud.shell.strategy.IShellStrategy;
import com.codeonline.cloud.shell.util.SSHExecuteUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class SSHShellStrategyImpl implements IShellStrategy {
    @Autowired
    private SSHExecuteUtil sshExecuteUtil;

    @Override
    public String exec(String cmd) throws IOException {
        return sshExecuteUtil.exec(cmd);
    }
}
