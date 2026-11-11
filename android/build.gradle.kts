import java.util.Properties
import org.gradle.api.tasks.Delete
import org.gradle.api.credentials.HttpHeaderCredentials
import org.gradle.authentication.http.HttpHeaderAuthentication

// Load GitHub token with fallback to maven.properties
val mavenGitHubToken: String by lazy {

    val token = System.getenv("MAVEN_GITHUB_TOKEN")
    val securePath = System.getenv("BIOLOGIX_KEYS_PATH")
    ?: "${System.getenv("HOME")}/Keys"

    if (token != null) {
        token
    } else {
        val mavenPropsFile = file("$securePath/maven-repo/maven.properties")
        if (!mavenPropsFile.canRead()) {
            throw Exception("Could not read $mavenPropsFile")
        }
        Properties().apply {
            load(mavenPropsFile.inputStream())
        }.getProperty("GITHUB_TOKEN")
    }
}

// Load GitHub username with fallback to maven.properties
val mavenGitHubUser: String by lazy {

    val user = System.getenv("MAVEN_GITHUB_USER")
    val securePath = System.getenv("BIOLOGIX_KEYS_PATH")
    ?: "${System.getenv("HOME")}/Keys"

    if (user != null) {
        user
    } else {
        val mavenPropsFile = file("$securePath/maven-repo/maven.properties")
        if (!mavenPropsFile.canRead()) {
            throw Exception("Could not read $mavenPropsFile")
        }
        Properties().apply {
            load(mavenPropsFile.inputStream())
        }.getProperty("GITHUB_USER")
    }
}
allprojects {
    repositories {
        google()
        mavenCentral()
        maven {
            // url = uri("https://gitlab.com/api/v4/groups/431593/-/packages/maven")
            url = uri("https://maven.pkg.github.com/biologixsistemas/cicd")
            credentials(HttpHeaderCredentials::class.java) {
                // name = "Private-Token"
                // value = mavenGitlabToken
                username = mavenGitHubUser
                password = mavenGithubToken
            }
            authentication {
                create<HttpHeaderAuthentication>("header")
            }
        }
    }
}

val newBuildDir: Directory =
rootProject.layout.buildDirectory
.dir("../../build")
.get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
