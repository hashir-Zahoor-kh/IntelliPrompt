plugins {
    id("intelliprompt.java-conventions")
}

dependencies {
    implementation(project(":intelliprompt-cli"))
    implementation(project(":intelliprompt-tui"))
}

tasks.register("assembleDist") {
    dependsOn(":intelliprompt-cli:installDist")
    dependsOn(":intelliprompt-tui:installDist")
}
