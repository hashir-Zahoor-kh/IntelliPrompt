pluginManagement {
    includeBuild("build-logic")
    repositories {
        gradlePluginPortal()
        mavenCentral()
    }
}

plugins {
    id("org.gradle.toolchains.foojay-resolver-convention") version "0.7.0"
}

rootProject.name = "intelliprompt"

include(
    "intelliprompt-shared",
    "intelliprompt-core",
    "intelliprompt-cli",
    "intelliprompt-tui",
    "intelliprompt-templates",
    "intelliprompt-deploy",
    "intelliprompt-api",
    "intelliprompt-backend",
    "intelliprompt-packaging"
)
