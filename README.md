# Docker Karate

A Dockerfile for [Karate](https://karatelabs.github.io/karate/) testing framework. The image is based on the [Eclipse Temurin Java 11 JRE](https://hub.docker.com/_/eclipse-temurin) image.

This image was inspired by [reMarkable's Karate image](https://github.com/reMarkable/docker-karate) which is deprecated and no longer maintained.

The image is exposing `/tests` volume where Karate will look for test cases to run and where the reports will be stored in the `target/karate-reports` directory after each execution. Mount a host directory to the `/tests` volume to make the test cases available to the running container.

Execute all tests found in the local current directory:

    docker run --rm -v "$PWD:/tests" fkjellberg/karate

To run only one specific test, add it to the command line:

    docker run --rm -v "$PWD:/tests" fkjellberg/karate test.feature

List all command line options:

    docker run --rm -v "$PWD:/tests" fkjellberg/karate --help

Depending on the operating system and how the `/tests` volume is mounted, it may be necessary to set the user and group for the Karate process running within the docker container so the reports stored in the target directory will by accessible on the local file system by the current user. Set the user and group to the same identifiers as the user launching the container:

    docker run --rm -u "$(id -u):$(id -g)" -v "$PWD:/tests" fkjellberg/karate
