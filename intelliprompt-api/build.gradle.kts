plugins {
    id("intelliprompt.java-conventions")
    id("intelliprompt.publishing")
}

dependencies {
    implementation(project(":intelliprompt-shared"))
    implementation(libs.bundles.okhttp)
    implementation(libs.bundles.jackson)
    implementation(libs.reactor.core)
    
    testImplementation(libs.bundles.testing)
}
