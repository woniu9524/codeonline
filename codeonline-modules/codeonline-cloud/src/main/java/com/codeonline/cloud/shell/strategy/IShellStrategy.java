package com.codeonline.cloud.shell.strategy;

import java.io.IOException;

public interface IShellStrategy {
    String exec(String cmd) throws IOException;
}
