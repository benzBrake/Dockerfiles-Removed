FROM benzbrake/alpine as downloader
MAINTAINER Ryan Lieu <github-benzBrake@woai.ru>

ARG BROOK_VERSION
RUN if [[ -z ${BROOK_VERSION} ]]; then BROOK_VERSION=$(curl -s https://api.github.com/repos/txthinking/brook/releases/latest | grep "tag_name" | cut -d \" -f 4) ; fi && \
    curl -sSL https://github.com/txthinking/brook/releases/download/${BROOK_VERSION}/brook_linux_386 -o /bin/brook && \
    chmod +x /bin/brook

FROM scratch
MAINTAINER Ryan Lieu <github-benzBrake@woai.ru>
COPY --from=downloader /bin/brook /bin/brook
ENTRYPOINT ["/bin/brook"]