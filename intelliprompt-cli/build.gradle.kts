plugins {
    id("intelliprompt.java-conventions")
    id("intelliprompt.native-conventions")
    application
}

dependencies {
    implementation(project(":intelliprompt-core"))
    implementation(project(":intelliprompt-deploy"))
    implementation(libs.picocli)
    annotationProcessor(libs.picocli.codegen)
    
    testImplementation(libs.bundles.testing)
}

application {
    mainClass.set("com.intelliprompt.cli.Main")
}
