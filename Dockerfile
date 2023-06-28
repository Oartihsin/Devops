FROM ubuntu:latest

# Install necessary dependencies
RUN apt-get update && apt-get install -y curl supervisor

# Install Node Exporter
RUN curl -LO "https://github.com/prometheus/node_exporter/releases/download/v1.2.2/node_exporter-1.2.2.linux-amd64.tar.gz" \
    && tar -xvf node_exporter-1.2.2.linux-amd64.tar.gz \
    && rm node_exporter-1.2.2.linux-amd64.tar.gz \
    && mv node_exporter-1.2.2.linux-amd64/node_exporter /usr/local/bin \
    && rm -rf node_exporter-1.2.2.linux-amd64

# Copy the supervisord configuration file
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Start supervisord as the main process
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

