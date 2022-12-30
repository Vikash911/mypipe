# This is the Demo project for Jenkins section of the DevOps boot camp.

# Branches
The following branches are active in this project to test Jenkins integration:

## main

A simple `Jenkinsfile` is presented here that has 3 stages: test, build and deploy. Each stage logs when it begins executing. The build and deploy stage run only if the build is being executed on the main branch.

## jenkins-jobs

In this branch, a few `Jenkinsfile`s are presented. The main Jenkinsfile is similar to the main branch. The `JenkinsfileExamples` has general examples of what is possible in a Jenkinsfile. For example, use of parameters or environment variables. The `JenkinsfileSingleBranch` has a similar structure to the the main Jenkinsfile but the logic of the stages is extracted to `script.groovy` file. 

## jenkins-shared-lib


In this branch, the logic of the `Jenkinsfile` is extracted to a separate library that can be accessed [here](https://github.com/ArshaShiri/DevOpsBootcampJenkinsSharedLibraryDemo). In this manner, the use of shared libraries in Jenkins is demonstrated.

## jenkins-version-increment
For the most parts, this branch is similar to `jenkins-jobs` branch. The main difference is in the main `Jenkinsfile` where a new stage for incrementing the application's version is introduced. The same version is then used to build a new docker image that is pushed to the docker hub.