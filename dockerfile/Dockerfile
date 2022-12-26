ARG BaseImage

FROM ${BaseImage}

# 解决问题：https://github.com/FISCO-BCOS/FISCO-BCOS/issues/3276
RUN sed -i 's/MinProtocol = TLSv1.2/MinProtocol = TLSv1/g' /etc/ssl/openssl.cnf

ARG ServerType
ARG BIN
ENV ServerType=${ServerType}

RUN mkdir -p /usr/local/server/bin/

COPY ${BIN} /usr/local/server/bin/