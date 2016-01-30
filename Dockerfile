FROM alpine:3.3

RUN apk add --no-cache --update ca-certificates curl

EXPOSE 8200
VOLUME /certs /data

ENV VAULT_VERSION 0.4.1

COPY SHA256SUMS .
RUN curl -o vault.zip -fSL "https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip" \
    && sha256sum -c SHA256SUMS \
    && unzip vault.zip -d /usr/local/bin \
    && rm -f vault.zip SHA256SUMS

COPY vault.hcl /etc/

CMD ["vault", "server", "-config", "/etc/vault.hcl"]