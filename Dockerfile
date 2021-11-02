FROM cm2network/steamcmd:root

ENV STEAMAPPID 1690800
ENV STEAMAPP Satisfactory
ENV STEAMAPPDIR "${HOMEDIR}/${STEAMAPP}-dedicated"

COPY entrypoint.sh ${HOMEDIR}/entrypoint.sh
RUN chmod +x "${HOMEDIR}/entrypoint.sh" && chown -R "${USER}:${USER}" "${HOMEDIR}"

USER ${USER}

VOLUME ${STEAMAPPDIR}

WORKDIR ${HOMEDIR}

CMD ["bash", "entrypoint.sh"]

EXPOSE 15777/udp 15000/udp 7777/udp