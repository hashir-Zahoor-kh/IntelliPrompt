plugins {
    id("intelliprompt.java-conventions")
    id("org.graalvm.buildtools.native")
}

graalvmNative {
    binaries {
        named("main") {
            imageName.set(project.name)
            mainClass.set("com.intelliprompt.${project.name.removePrefix("intelliprompt-")}.Main")
            
            buildArgs.addAll(
                "--no-fallback",
                "--enable-http",
                "--enable-https",
                "--enable-url-protocols=http,https",
                "-H:+ReportExceptionStackTraces",
                "-H:+AddAllCharsets",
                "--initialize-at-build-time=org.slf4j",
                "--verbose"
            )
            
            javaLauncher.set(javaToolchains.launcherFor {
                languageVersion.set(JavaLanguageVersion.of(21))
                vendor.set(JvmVendorSpec.matching("GraalVM"))
            })
        }
    }
    
    metadataRepository {
        enabled.set(true)
    }
}
