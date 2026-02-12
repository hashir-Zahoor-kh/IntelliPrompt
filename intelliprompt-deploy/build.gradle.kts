plugins {
    id("intelliprompt.java-conventions")
    id("intelliprompt.publishing")
}

dependencies {
    implementation(project(":intelliprompt-core"))
    implementation(project(":intelliprompt-templates"))
    implementation(project(":intelliprompt-api"))
    implementation(libs.bundles.jackson)
    
    testImplementation(libs.bundles.testing)
}
