FROM oven/bun:1

WORKDIR /usr/src/app

COPY ./packages ./packages
COPY ./bun.lockb ./bun.lockb

COPY ./package.json ./package.json
COPY ./turbo.json ./turbo.json

COPY ./apps/ws-backend ./apps/ws-backend

RUN bun install
RUN bun run generate:db

EXPOSE 8080

CMD ["bun", "run", "start:ws"]