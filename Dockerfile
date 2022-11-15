FROM eclipse-temurin:11.0.17_8-jre-focal

ARG KARATE_VERSION="1.2.0"

RUN curl -sL -o /karate.jar "https://github.com/karatelabs/karate/releases/download/v${KARATE_VERSION}/karate-${KARATE_VERSION}.jar" \
    && mkdir /tests

WORKDIR /tests
VOLUME /tests

ENTRYPOINT ["java", "-cp", "/karate.jar:.", "com.intuit.karate.Main"]

CMD ["."]
