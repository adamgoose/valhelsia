FROM alpine as modpack
WORKDIR /work
RUN wget -O valhelsia.zip https://media.forgecdn.net/files/2949/225/Valhelsia_SERVER-2.1.8a.zip
RUN unzip valhelsia.zip
RUN mv Valhelsia_SERVER-2.1.8a/config Valhelsia_SERVER-2.1.8a/mods .

FROM itzg/minecraft-server
ENV VERSION 1.15.2
ENV TYPE FORGE
ENV FORGEVERSION 31.1.74

COPY --from=modpack /work/mods /mods
COPY --from=modpack /work/config /config