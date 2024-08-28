# Website Monitoring
### Links to download [Prometheus, Node_Exporter & black Box exporter](https://prometheus.io/download/)
### Links to download [Grafana](https://grafana.com/grafana/download)
### Other [link](https://github.com/prometheus/blackbox_exporter)

## Prometheus Installation [Monitor Server]

```bash
sudo apt update
wget https://github.com/prometheus/prometheus/releases/download/v2.54.0/prometheus-2.54.0.linux-amd64.tar.gz
tar -xvf prometheus-2.54.0.linux-amd64.tar.gz
rm -rf prometheus-2.54.0.linux-amd64.tar.gz
cd prometheus-2.54.0.linux-amd64.tar.gz
./prometheus &
```
- Open in Browser

```
https://monitor-public-ip:9090
```

## Grafana Installation [Monitor Server]

```bash
sudo apt-get install -y adduser libfontconfig1 musl
wget https://dl.grafana.com/enterprise/release/grafana-enterprise_11.1.4_amd64.deb
sudo dpkg -i grafana-enterprise_11.1.4_amd64.deb
```
- Execute Grafana
```bash
sudo /bin/systemctl start grafana-server
```

- Open in Browser

```
https://monitor-public-ip:3000
```
- username = admin
- password = admin

## Blackbox_exporter Installation [Monitor Server]


```bash
sudo apt update
wget https://github.com/prometheus/blackbox_exporter/releases/download/v0.25.0/blackbox_exporter-0.25.0.linux-amd64.tar.gz
tar -xvf blackbox_exporter-0.25.0.linux-amd64.tar.gz
rm -rf blackbox_exporter-0.25.0.linux-amd64.tar.gz
cd blackbox_exporter-0.25.0.linux-amd64.tar.gz
./blackbox_exporter &
```
- Open in Browser

```
https://monitor-public-ip:9115
```

### Configurations

```bash
cd prometheus-2.54.0.linux-amd64.tar.gz/

```
- vi prometheus.yml
```bash
scrape_configs:
  - job_name: 'blackbox'
    metrics_path: /probe
    params:
      module: [http_2xx]  # Look for a HTTP 200 response.
    static_configs:
      - targets:
        - http://prometheus.io    # Target to probe with http.
        - http://app-url
    relabel_configs:
      - source_labels: [__address__]
        target_label: __param_target
      - source_labels: [__param_target]
        target_label: instance
      - target_label: __address__
        replacement: blackbox-ip:9115  
```
- Replace the Blackbox-ip and app-url and Save the file

- Run the command
```bash
pgrep prometheus
# will get <id>
kill <id>
./prometheus &
```

- Refresh the prometheus page
- Prometheus -> Status -> Targets.

## Add Data Sources to Grafana

- Grafana webpage -> Home -> Connections -> Data sources -> Add data sources -> prometheus -> provide prometheus server URL -> Save and Test
- Import dashboard -> Provide dashboard URL or ID like 7587 (blackbox) -> Load ->  Select prometheus as Data source -> Import.

# System Monitoring in Jenkins Webpage
- Manage Jenkins -> Plugins -> Search for **Prometheus metrics** -> Install -> Restart

## node_exporter Installation [Jenkins Server]


```bash
sudo apt update
wget https://github.com/prometheus/node_exporter/releases/download/v1.8.2/node_exporter-1.8.2.linux-amd64.tar.gz
tar -xvf node_exporter-1.8.2.linux-amd64.tar.gz
rm -rf node_exporter-1.8.2.linux-amd64.tar.gz
cd node_exporter-1.8.2.linux-amd64.tar.gz
./node_exporter &
```
- Open in Browser

```
https://jenkins-public-ip:9100
```
- Manage Jenkins -> System -> Configure Prometheus if required.

### Configurations [Monitor Server]

```bash
cd prometheus-2.54.0.linux-amd64.tar.gz/

```
- vi prometheus.yml
```bash
scrape_configs:
  - job_name: 'node-exporter'
    static_configs:
      - targets: ['<jenkins-ip>:9100']

  - job_name: 'jenkins'
    metrics_path: '/prometheus'
    static_configs:
      - targets: ['<jenkins-ip>:8080']       
```
- Append it and Replace the jenkins-ip and Save the file

- Run the command
```bash
pgrep prometheus
# will get <id>
kill <id>
./prometheus &
```
- Refresh the prometheus page

## Add Data Sources to Grafana

- Grafana webpage -> Home -> Dashboards -> Import dashboard -> Provide dashboard URL or ID like 1860 (node_exporter) -> Load ->  Select prometheus as Data source -> Import.

## Now all blackbox, node-exporter, jenkins, and prometheus are up and running in Prometheus webpage. Also Grafana is working.
