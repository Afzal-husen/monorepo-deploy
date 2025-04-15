Bun.serve({
  port: 8080,
  fetch(request, server) {
    if (server.upgrade(request)) {
      return;
    }
    return new Response("Upgrade failed", { status: 500 });
  },
  websocket: {
    message(ws, message) {
      ws.send(message);
    },
  },
});
