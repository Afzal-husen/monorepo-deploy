FROM oven/bun

WORKDIR /usr/src/app

COPY . .

RUN bun install
RUN bun run generate:db

EXPOSE 8080

CMD ["bun", "run", "start:ws"]

