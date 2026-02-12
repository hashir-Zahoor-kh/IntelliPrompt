plugins {
    java
    id("com.diffplug.spotless")
    id("checkstyle")
    id("pmd")
}

java {
    toolchain {
        languageVersion.set(JavaLanguageVersion.of(21))
    }
    withSourcesJar()
    withJavadocJar()
}

tasks.withType<JavaCompile> {
    options.encoding = "UTF-8"
    options.release.set(21)
}

tasks.withType<Test> {
    useJUnitPlatform()
    maxParallelForks = Runtime.getRuntime().availableProcessors() / 2
}

spotless {
    java {
        googleJavaFormat("1.18.1")
        removeUnusedImports()
        trimTrailingWhitespace()
        endWithNewline()
    }
}

checkstyle {
    toolVersion = "10.12.5"
    configFile = rootProject.file("config/checkstyle/checkstyle.xml")
}

pmd {
    toolVersion = "6.55.0"
    isConsoleOutput = true
    ruleSetFiles = files(rootProject.file("config/pmd/ruleset.xml"))
}
