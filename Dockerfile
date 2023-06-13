# see versions at https://hub.docker.com/_/ghost
FROM ghost:5.14.1

WORKDIR $GHOST_INSTALL
COPY . .
RUN npm i -g knex-migrator
RUN node knex-migrator rollback
ENTRYPOINT []
CMD ["./start.sh"]
