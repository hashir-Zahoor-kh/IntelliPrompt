plugins {
    `maven-publish`
    signing
}

publishing {
    publications {
        create<MavenPublication>("maven") {
            from(components["java"])
            
            pom {
                name.set(project.name)
                description.set("IntelliPrompt - Intelligent Terminal Assistant")
                url.set("https://github.com/hashir-Zahoor-kh/IntelliPrompt")
                
                licenses {
                    license {
                        name.set("MIT License")
                        url.set("https://opensource.org/licenses/MIT")
                    }
                }
                
                developers {
                    developer {
                        id.set("hashir-Zahoor-kh")
                        name.set("Hashir Zahoor")
                        email.set("hashir@intelliprompt.io")
                    }
                }
                
                scm {
                    connection.set("scm:git:git://github.com/hashir-Zahoor-kh/IntelliPrompt.git")
                    developerConnection.set("scm:git:ssh://github.com/hashir-Zahoor-kh/IntelliPrompt.git")
                    url.set("https://github.com/hashir-Zahoor-kh/IntelliPrompt")
                }
            }
        }
    }
    
    repositories {
        maven {
            name = "GitHubPackages"
            url = uri("https://maven.pkg.github.com/hashir-Zahoor-kh/IntelliPrompt")
            credentials {
                username = System.getenv("GITHUB_ACTOR")
                password = System.getenv("GITHUB_TOKEN")
            }
        }
    }
}

signing {
    val signingKey = System.getenv("GPG_SIGNING_KEY")
    val signingPassword = System.getenv("GPG_SIGNING_PASSWORD")
    if (signingKey != null && signingPassword != null) {
        useInMemoryPgpKeys(signingKey, signingPassword)
        sign(publishing.publications["maven"])
    }
}
