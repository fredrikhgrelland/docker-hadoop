FROM adoptopenjdk:8-jdk-hotspot

# Allow buildtime config of HADOOP_VERSION
ARG HADOOP_VERSION
# Set HADOOP_VERSION from arg if provided at build, env if provided at run, or default
ENV HADOOP_VERSION=${HADOOP_VERSION:-3.1.1}
ENV DOWNLOAD https://archive.apache.org/dist/hadoop/core/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz
ENV HADOOP_HOME=/opt/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV USER=root
ENV PATH $HADOOP_HOME/bin/:$PATH

COPY ca_certificates/* /usr/local/share/ca-certificates/
RUN \
    apt-get update && apt-get install -y ca-certificates procps curl tar bash perl && rm -rf /var/lib/apt/lists/* \
    && update-ca-certificates 2>/dev/null || true && echo "NOTE: CA warnings suppressed." \
    #Test download ( does ssl trust work )
    && curl -s -I -o /dev/null $DOWNLOAD || echo -e "\n###############\nERROR: You are probably behind a corporate proxy. Add your custom ca .crt in the ca_certificates docker build folder\n###############\n" \
    #Download and unpack hadoop
    && curl -s -L $DOWNLOAD | tar xz -C /opt/ \
    && ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop \
    && mkdir /opt/hadoop-$HADOOP_VERSION/logs