plugins {
    id("intelliprompt.java-conventions") apply false
    id("intelliprompt.native-conventions") apply false
    id("intelliprompt.publishing") apply false
    alias(libs.plugins.spring.boot) apply false
    alias(libs.plugins.spotless) apply false
}

allprojects {
    group = "com.intelliprompt"
    version = "1.0.0-SNAPSHOT"
    
    repositories {
        mavenCentral()
    }
}

tasks.register("clean") {
    delete(rootProject.buildDir)
}
