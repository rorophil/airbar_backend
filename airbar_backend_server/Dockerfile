# Build stage
FROM dart:3.8.0 AS build
WORKDIR /app

# Build from a minimal workspace that contains only the server package.
COPY airbar_backend_server ./airbar_backend_server
RUN printf "name: _\npublish_to: none\nenvironment:\n  sdk: '^3.8.0'\nworkspace:\n  - airbar_backend_server\n" > /app/pubspec.yaml
WORKDIR /app/airbar_backend_server

# Install dependencies and compile the server executable
RUN dart pub get
RUN dart compile exe bin/main.dart -o bin/server

# Final stage
FROM alpine:latest

# Environment variables
ENV runmode=production
ENV serverid=default
ENV logging=normal
ENV role=monolith

# Copy runtime dependencies
COPY --from=build /runtime/ /

# Copy compiled server executable
COPY --from=build /app/airbar_backend_server/bin/server server
COPY --from=build /app/airbar_backend_server/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Copy configuration files and resources
COPY --from=build /app/airbar_backend_server/config/ config/
COPY --from=build /app/airbar_backend_server/web/ web/
COPY --from=build /app/airbar_backend_server/migrations/ migrations/

# This file is required to enable the endpoint log filter in Insights.
COPY --from=build /app/airbar_backend_server/lib/src/generated/protocol.yaml lib/src/generated/protocol.yaml

# Expose ports
EXPOSE 8080
EXPOSE 8081
EXPOSE 8082

# Define the entrypoint command
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
