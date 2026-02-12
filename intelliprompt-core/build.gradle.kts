plugins {
    id("intelliprompt.java-conventions")
    id("intelliprompt.publishing")
}

dependencies {
    implementation(project(":intelliprompt-shared"))
    implementation(libs.bundles.jackson)
    implementation(libs.bundles.logging)
    implementation(libs.pty4j)
    
    testImplementation(libs.bundles.testing)
}
