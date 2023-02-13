package com.codeonline.cloud.shell.strategy.impl;


import com.codeonline.cloud.shell.strategy.IShellStrategy;
import com.codeonline.cloud.shell.util.LocalExecuteUtil;
import org.springframework.stereotype.Component;

@Component
public class LocalShellStrategyImpl implements IShellStrategy {
    @Override
    public String exec(String cmd) {
        return LocalExecuteUtil.executeNewFlow(cmd);
    }
}
