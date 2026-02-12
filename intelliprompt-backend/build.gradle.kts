plugins {
    id("intelliprompt.java-conventions")
    alias(libs.plugins.spring.boot)
}

dependencies {
    implementation(project(":intelliprompt-api"))
    implementation(project(":intelliprompt-core"))
    
    implementation(libs.spring.boot.starter.web)
    implementation(libs.spring.boot.starter.data.jpa)
    implementation(libs.spring.boot.starter.security)
    implementation(libs.spring.boot.starter.actuator)
    implementation(libs.bundles.jackson)
    
    runtimeOnly("org.postgresql:postgresql:42.7.10")
    
    testImplementation(libs.bundles.testing)
    testImplementation("org.springframework.boot:spring-boot-starter-test")
}
