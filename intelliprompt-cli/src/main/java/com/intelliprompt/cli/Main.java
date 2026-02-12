package com.intelliprompt.cli;

@Command(name = "intelliprompt", mixinStandardHelpOptions = true, version = "1.0.0",
         description = "IntelliPrompt - Intelligent Terminal Assistant")
public class Main implements Runnable {
    
    public static void main(String[] args) {
        int exitCode = new CommandLine(new Main()).execute(args);
        System.exit(exitCode);
    }
    
    @Override
    public void run() {
        System.out.println("IntelliPrompt CLI - Coming soon!");
    }
}
