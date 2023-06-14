{{- define "socialnetwork.templates.grafana.grafana-dashboard.json"  }}
{
  "annotations": {
    "list": [
      {
        "$$hashKey": "object:1058",
        "builtIn": 1,
        "datasource": {
          "type": "datasource",
          "uid": "grafana"
        },
        "enable": true,
        "hide": true,
        "iconColor": "rgba(0, 211, 255, 1)",
        "name": "Annotations & Alerts",
        "target": {
          "limit": 100,
          "matchAny": false,
          "tags": [],
          "type": "dashboard"
        },
        "type": "dashboard"
      }
    ]
  },
  "editable": true,
  "fiscalYearStartMonth": 0,
  "gnetId": 1860,
  "graphTooltip": 0,
  "id": 2,
  "iteration": 1661870175805,
  "links": [
    {
      "icon": "external link",
      "tags": [],
      "title": "GitHub",
      "type": "link",
      "url": "https://github.com/rfrail3/grafana-dashboards"
    },
    {
      "icon": "external link",
      "tags": [],
      "title": "Grafana",
      "type": "link",
      "url": "https://grafana.com/grafana/dashboards/1860"
    }
  ],
  "liveNow": false,
  "panels": [
    {
      "collapsed": false,
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 0
      },
      "id": 261,
      "panels": [],
      "title": "Quick CPU / Mem / Disk",
      "type": "row"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "description": "Busy state of all CPU cores together",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [
            {
              "options": {
                "match": "null",
                "result": {
                  "text": "N/A"
                }
              },
              "type": "special"
            }
          ],
          "max": 100,
          "min": 0,
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "rgba(50, 172, 45, 0.97)",
                "value": null
              },
              {
                "color": "rgba(237, 129, 40, 0.89)",
                "value": 85
              },
              {
                "color": "rgba(245, 54, 54, 0.9)",
                "value": 95
              }
            ]
          },
          "unit": "percent"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 4,
        "w": 3,
        "x": 0,
        "y": 1
      },
      "id": 20,
      "links": [],
      "options": {
        "orientation": "horizontal",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showThresholdLabels": false,
        "showThresholdMarkers": true
      },
      "pluginVersion": "8.5.6",
      "targets": [
        {
          "expr": "(((count(count(node_cpu_seconds_total{instance=\"$node\",job=\"$job\"}) by (cpu))) - avg(sum by (mode)(rate(node_cpu_seconds_total{mode='idle',instance=\"$node\",job=\"$job\"}[$__rate_interval])))) * 100) / count(count(node_cpu_seconds_total{instance=\"$node\",job=\"$job\"}) by (cpu))",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "",
          "refId": "A",
          "step": 240
        }
      ],
      "title": "CPU Busy",
      "type": "gauge"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "description": "Busy state of all CPU cores together (5 min average)",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [
            {
              "options": {
                "match": "null",
                "result": {
                  "text": "N/A"
                }
              },
              "type": "special"
            }
          ],
          "max": 100,
          "min": 0,
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "rgba(50, 172, 45, 0.97)",
                "value": null
              },
              {
                "color": "rgba(237, 129, 40, 0.89)",
                "value": 85
              },
              {
                "color": "rgba(245, 54, 54, 0.9)",
                "value": 95
              }
            ]
          },
          "unit": "percent"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 4,
        "w": 3,
        "x": 3,
        "y": 1
      },
      "id": 155,
      "links": [],
      "options": {
        "orientation": "horizontal",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showThresholdLabels": false,
        "showThresholdMarkers": true
      },
      "pluginVersion": "8.5.6",
      "targets": [
        {
          "expr": "avg(node_load5{instance=\"$node\",job=\"$job\"}) /  count(count(node_cpu_seconds_total{instance=\"$node\",job=\"$job\"}) by (cpu)) * 100",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "refId": "A",
          "step": 240
        }
      ],
      "title": "Sys Load (5m avg)",
      "type": "gauge"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "description": "Busy state of all CPU cores together (15 min average)",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [
            {
              "options": {
                "match": "null",
                "result": {
                  "text": "N/A"
                }
              },
              "type": "special"
            }
          ],
          "max": 100,
          "min": 0,
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "rgba(50, 172, 45, 0.97)",
                "value": null
              },
              {
                "color": "rgba(237, 129, 40, 0.89)",
                "value": 85
              },
              {
                "color": "rgba(245, 54, 54, 0.9)",
                "value": 95
              }
            ]
          },
          "unit": "percent"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 4,
        "w": 3,
        "x": 6,
        "y": 1
      },
      "id": 19,
      "links": [],
      "options": {
        "orientation": "horizontal",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showThresholdLabels": false,
        "showThresholdMarkers": true
      },
      "pluginVersion": "8.5.6",
      "targets": [
        {
          "expr": "avg(node_load15{instance=\"$node\",job=\"$job\"}) /  count(count(node_cpu_seconds_total{instance=\"$node\",job=\"$job\"}) by (cpu)) * 100",
          "hide": false,
          "intervalFactor": 1,
          "refId": "A",
          "step": 240
        }
      ],
      "title": "Sys Load (15m avg)",
      "type": "gauge"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "description": "Non available RAM memory",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "decimals": 0,
          "mappings": [],
          "max": 100,
          "min": 0,
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "rgba(50, 172, 45, 0.97)",
                "value": null
              },
              {
                "color": "rgba(237, 129, 40, 0.89)",
                "value": 80
              },
              {
                "color": "rgba(245, 54, 54, 0.9)",
                "value": 90
              }
            ]
          },
          "unit": "percent"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 4,
        "w": 3,
        "x": 9,
        "y": 1
      },
      "hideTimeOverride": false,
      "id": 16,
      "links": [],
      "options": {
        "orientation": "horizontal",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showThresholdLabels": false,
        "showThresholdMarkers": true
      },
      "pluginVersion": "8.5.6",
      "targets": [
        {
          "expr": "((node_memory_MemTotal_bytes{instance=\"$node\",job=\"$job\"} - node_memory_MemFree_bytes{instance=\"$node\",job=\"$job\"}) / (node_memory_MemTotal_bytes{instance=\"$node\",job=\"$job\"} )) * 100",
          "format": "time_series",
          "hide": true,
          "intervalFactor": 1,
          "refId": "A",
          "step": 240
        },
        {
          "expr": "100 - ((node_memory_MemAvailable_bytes{instance=\"$node\",job=\"$job\"} * 100) / node_memory_MemTotal_bytes{instance=\"$node\",job=\"$job\"})",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "refId": "B",
          "step": 240
        }
      ],
      "title": "RAM Used",
      "type": "gauge"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "description": "Used Swap",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [
            {
              "options": {
                "match": "null",
                "result": {
                  "text": "N/A"
                }
              },
              "type": "special"
            }
          ],
          "max": 100,
          "min": 0,
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "rgba(50, 172, 45, 0.97)",
                "value": null
              },
              {
                "color": "rgba(237, 129, 40, 0.89)",
                "value": 10
              },
              {
                "color": "rgba(245, 54, 54, 0.9)",
                "value": 25
              }
            ]
          },
          "unit": "percent"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 4,
        "w": 3,
        "x": 12,
        "y": 1
      },
      "id": 21,
      "links": [],
      "options": {
        "orientation": "horizontal",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showThresholdLabels": false,
        "showThresholdMarkers": true
      },
      "pluginVersion": "8.5.6",
      "targets": [
        {
          "expr": "((node_memory_SwapTotal_bytes{instance=\"$node\",job=\"$job\"} - node_memory_SwapFree_bytes{instance=\"$node\",job=\"$job\"}) / (node_memory_SwapTotal_bytes{instance=\"$node\",job=\"$job\"} )) * 100",
          "intervalFactor": 1,
          "refId": "A",
          "step": 240
        }
      ],
      "title": "SWAP Used",
      "type": "gauge"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "description": "Used Root FS",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [
            {
              "options": {
                "match": "null",
                "result": {
                  "text": "N/A"
                }
              },
              "type": "special"
            }
          ],
          "max": 100,
          "min": 0,
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "rgba(50, 172, 45, 0.97)",
                "value": null
              },
              {
                "color": "rgba(237, 129, 40, 0.89)",
                "value": 80
              },
              {
                "color": "rgba(245, 54, 54, 0.9)",
                "value": 90
              }
            ]
          },
          "unit": "percent"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 4,
        "w": 3,
        "x": 15,
        "y": 1
      },
      "id": 154,
      "links": [],
      "options": {
        "orientation": "horizontal",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showThresholdLabels": false,
        "showThresholdMarkers": true
      },
      "pluginVersion": "8.5.6",
      "targets": [
        {
          "expr": "100 - ((node_filesystem_avail_bytes{instance=\"$node\",job=\"$job\",mountpoint=\"/\",fstype!=\"rootfs\"} * 100) / node_filesystem_size_bytes{instance=\"$node\",job=\"$job\",mountpoint=\"/\",fstype!=\"rootfs\"})",
          "format": "time_series",
          "intervalFactor": 1,
          "refId": "A",
          "step": 240
        }
      ],
      "title": "Root FS Used",
      "type": "gauge"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "description": "Total number of CPU cores",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [
            {
              "options": {
                "match": "null",
                "result": {
                  "text": "N/A"
                }
              },
              "type": "special"
            }
          ],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "short"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 2,
        "w": 2,
        "x": 18,
        "y": 1
      },
      "id": 14,
      "links": [],
      "maxDataPoints": 100,
      "options": {
        "colorMode": "none",
        "graphMode": "none",
        "justifyMode": "auto",
        "orientation": "horizontal",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "textMode": "auto"
      },
      "pluginVersion": "8.5.6",
      "targets": [
        {
          "expr": "count(count(node_cpu_seconds_total{instance=\"$node\",job=\"$job\"}) by (cpu))",
          "interval": "",
          "intervalFactor": 1,
          "legendFormat": "",
          "refId": "A",
          "step": 240
        }
      ],
      "title": "CPU Cores",
      "type": "stat"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "description": "System uptime",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "decimals": 1,
          "mappings": [
            {
              "options": {
                "match": "null",
                "result": {
                  "text": "N/A"
                }
              },
              "type": "special"
            }
          ],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "s"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 2,
        "w": 4,
        "x": 20,
        "y": 1
      },
      "hideTimeOverride": true,
      "id": 15,
      "links": [],
      "maxDataPoints": 100,
      "options": {
        "colorMode": "none",
        "graphMode": "none",
        "justifyMode": "auto",
        "orientation": "horizontal",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "textMode": "auto"
      },
      "pluginVersion": "8.5.6",
      "targets": [
        {
          "expr": "node_time_seconds{instance=\"$node\",job=\"$job\"} - node_boot_time_seconds{instance=\"$node\",job=\"$job\"}",
          "intervalFactor": 1,
          "refId": "A",
          "step": 240
        }
      ],
      "title": "Uptime",
      "type": "stat"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "description": "Total RootFS",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "decimals": 0,
          "mappings": [
            {
              "options": {
                "match": "null",
                "result": {
                  "text": "N/A"
                }
              },
              "type": "special"
            }
          ],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "rgba(50, 172, 45, 0.97)",
                "value": null
              },
              {
                "color": "rgba(237, 129, 40, 0.89)",
                "value": 70
              },
              {
                "color": "rgba(245, 54, 54, 0.9)",
                "value": 90
              }
            ]
          },
          "unit": "bytes"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 2,
        "w": 2,
        "x": 18,
        "y": 3
      },
      "id": 23,
      "links": [],
      "maxDataPoints": 100,
      "options": {
        "colorMode": "none",
        "graphMode": "none",
        "justifyMode": "auto",
        "orientation": "horizontal",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "textMode": "auto"
      },
      "pluginVersion": "8.5.6",
      "targets": [
        {
          "expr": "node_filesystem_size_bytes{instance=\"$node\",job=\"$job\",mountpoint=\"/\",fstype!=\"rootfs\"}",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "refId": "A",
          "step": 240
        }
      ],
      "title": "RootFS Total",
      "type": "stat"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "description": "Total RAM",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "decimals": 0,
          "mappings": [
            {
              "options": {
                "match": "null",
                "result": {
                  "text": "N/A"
                }
              },
              "type": "special"
            }
          ],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "bytes"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 2,
        "w": 2,
        "x": 20,
        "y": 3
      },
      "id": 75,
      "links": [],
      "maxDataPoints": 100,
      "options": {
        "colorMode": "none",
        "graphMode": "none",
        "justifyMode": "auto",
        "orientation": "horizontal",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "textMode": "auto"
      },
      "pluginVersion": "8.5.6",
      "targets": [
        {
          "expr": "node_memory_MemTotal_bytes{instance=\"$node\",job=\"$job\"}",
          "intervalFactor": 1,
          "refId": "A",
          "step": 240
        }
      ],
      "title": "RAM Total",
      "type": "stat"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "description": "Total SWAP",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "decimals": 0,
          "mappings": [
            {
              "options": {
                "match": "null",
                "result": {
                  "text": "N/A"
                }
              },
              "type": "special"
            }
          ],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "bytes"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 2,
        "w": 2,
        "x": 22,
        "y": 3
      },
      "id": 18,
      "links": [],
      "maxDataPoints": 100,
      "options": {
        "colorMode": "none",
        "graphMode": "none",
        "justifyMode": "auto",
        "orientation": "horizontal",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "textMode": "auto"
      },
      "pluginVersion": "8.5.6",
      "targets": [
        {
          "expr": "node_memory_SwapTotal_bytes{instance=\"$node\",job=\"$job\"}",
          "intervalFactor": 1,
          "refId": "A",
          "step": 240
        }
      ],
      "title": "SWAP Total",
      "type": "stat"
    },
    {
      "collapsed": false,
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 5
      },
      "id": 263,
      "panels": [],
      "title": "Basic CPU / Mem / Net / Disk",
      "type": "row"
    },
    {
      "aliasColors": {
        "Busy": "#EAB839",
        "Busy Iowait": "#890F02",
        "Busy other": "#1F78C1",
        "Idle": "#052B51",
        "Idle - Waiting for something to happen": "#052B51",
        "guest": "#9AC48A",
        "idle": "#052B51",
        "iowait": "#EAB839",
        "irq": "#BF1B00",
        "nice": "#C15C17",
        "softirq": "#E24D42",
        "steal": "#FCE2DE",
        "system": "#508642",
        "user": "#5195CE"
      },
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "decimals": 2,
      "description": "Basic CPU info",
      "fieldConfig": {
        "defaults": {
          "links": []
        },
        "overrides": []
      },
      "fill": 4,
      "fillGradient": 0,
      "gridPos": {
        "h": 7,
        "w": 12,
        "x": 0,
        "y": 6
      },
      "hiddenSeries": false,
      "id": 77,
      "legend": {
        "alignAsTable": false,
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "rightSide": false,
        "show": true,
        "sideWidth": 250,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "maxPerRow": 6,
      "nullPointMode": "null",
      "options": {
        "alertThreshold": true
      },
      "percentage": true,
      "pluginVersion": "8.5.6",
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [
        {
          "alias": "Busy Iowait",
          "color": "#890F02"
        },
        {
          "alias": "Idle",
          "color": "#7EB26D"
        },
        {
          "alias": "Busy System",
          "color": "#EAB839"
        },
        {
          "alias": "Busy User",
          "color": "#0A437C"
        },
        {
          "alias": "Busy Other",
          "color": "#6D1F62"
        }
      ],
      "spaceLength": 10,
      "stack": true,
      "steppedLine": false,
      "targets": [
        {
          "expr": "sum by (instance)(rate(node_cpu_seconds_total{mode=\"system\",instance=\"$node\",job=\"$job\"}[$__rate_interval])) * 100",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "Busy System",
          "refId": "A",
          "step": 240
        },
        {
          "expr": "sum by (instance)(rate(node_cpu_seconds_total{mode='user',instance=\"$node\",job=\"$job\"}[$__rate_interval])) * 100",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "Busy User",
          "refId": "B",
          "step": 240
        },
        {
          "expr": "sum by (instance)(rate(node_cpu_seconds_total{mode='iowait',instance=\"$node\",job=\"$job\"}[$__rate_interval])) * 100",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Busy Iowait",
          "refId": "C",
          "step": 240
        },
        {
          "expr": "sum by (instance)(rate(node_cpu_seconds_total{mode=~\".*irq\",instance=\"$node\",job=\"$job\"}[$__rate_interval])) * 100",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Busy IRQs",
          "refId": "D",
          "step": 240
        },
        {
          "expr": "sum (rate(node_cpu_seconds_total{mode!='idle',mode!='user',mode!='system',mode!='iowait',mode!='irq',mode!='softirq',instance=\"$node\",job=\"$job\"}[$__rate_interval])) * 100",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Busy Other",
          "refId": "E",
          "step": 240
        },
        {
          "expr": "sum by (mode)(rate(node_cpu_seconds_total{mode='idle',instance=\"$node\",job=\"$job\"}[$__rate_interval])) * 100",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Idle",
          "refId": "F",
          "step": 240
        }
      ],
      "thresholds": [],
      "timeRegions": [],
      "title": "CPU Basic",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "$$hashKey": "object:123",
          "format": "short",
          "label": "",
          "logBase": 1,
          "max": "100",
          "min": "0",
          "show": true
        },
        {
          "$$hashKey": "object:124",
          "format": "short",
          "logBase": 1,
          "show": false
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "aliasColors": {
        "Apps": "#629E51",
        "Buffers": "#614D93",
        "Cache": "#6D1F62",
        "Cached": "#511749",
        "Committed": "#508642",
        "Free": "#0A437C",
        "Hardware Corrupted - Amount of RAM that the kernel identified as corrupted / not working": "#CFFAFF",
        "Inactive": "#584477",
        "PageTables": "#0A50A1",
        "Page_Tables": "#0A50A1",
        "RAM_Free": "#E0F9D7",
        "SWAP Used": "#BF1B00",
        "Slab": "#806EB7",
        "Slab_Cache": "#E0752D",
        "Swap": "#BF1B00",
        "Swap Used": "#BF1B00",
        "Swap_Cache": "#C15C17",
        "Swap_Free": "#2F575E",
        "Unused": "#EAB839"
      },
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "decimals": 2,
      "description": "Basic memory usage",
      "fieldConfig": {
        "defaults": {
          "links": []
        },
        "overrides": []
      },
      "fill": 4,
      "fillGradient": 0,
      "gridPos": {
        "h": 7,
        "w": 12,
        "x": 12,
        "y": 6
      },
      "hiddenSeries": false,
      "id": 78,
      "legend": {
        "alignAsTable": false,
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "rightSide": false,
        "show": true,
        "sideWidth": 350,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "maxPerRow": 6,
      "nullPointMode": "null",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "8.5.6",
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [
        {
          "alias": "RAM Total",
          "color": "#E0F9D7",
          "fill": 0,
          "stack": false
        },
        {
          "alias": "RAM Cache + Buffer",
          "color": "#052B51"
        },
        {
          "alias": "RAM Free",
          "color": "#7EB26D"
        },
        {
          "alias": "Avaliable",
          "color": "#DEDAF7",
          "fill": 0,
          "stack": false
        }
      ],
      "spaceLength": 10,
      "stack": true,
      "steppedLine": false,
      "targets": [
        {
          "expr": "node_memory_MemTotal_bytes{instance=\"$node\",job=\"$job\"}",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "RAM Total",
          "refId": "A",
          "step": 240
        },
        {
          "expr": "node_memory_MemTotal_bytes{instance=\"$node\",job=\"$job\"} - node_memory_MemFree_bytes{instance=\"$node\",job=\"$job\"} - (node_memory_Cached_bytes{instance=\"$node\",job=\"$job\"} + node_memory_Buffers_bytes{instance=\"$node\",job=\"$job\"} + node_memory_SReclaimable_bytes{instance=\"$node\",job=\"$job\"})",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "RAM Used",
          "refId": "B",
          "step": 240
        },
        {
          "expr": "node_memory_Cached_bytes{instance=\"$node\",job=\"$job\"} + node_memory_Buffers_bytes{instance=\"$node\",job=\"$job\"} + node_memory_SReclaimable_bytes{instance=\"$node\",job=\"$job\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "RAM Cache + Buffer",
          "refId": "C",
          "step": 240
        },
        {
          "expr": "node_memory_MemFree_bytes{instance=\"$node\",job=\"$job\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "RAM Free",
          "refId": "D",
          "step": 240
        },
        {
          "expr": "(node_memory_SwapTotal_bytes{instance=\"$node\",job=\"$job\"} - node_memory_SwapFree_bytes{instance=\"$node\",job=\"$job\"})",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "SWAP Used",
          "refId": "E",
          "step": 240
        }
      ],
      "thresholds": [],
      "timeRegions": [],
      "title": "Memory Basic",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "bytes",
          "label": "",
          "logBase": 1,
          "min": "0",
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": false
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "aliasColors": {
        "Recv_bytes_eth2": "#7EB26D",
        "Recv_bytes_lo": "#0A50A1",
        "Recv_drop_eth2": "#6ED0E0",
        "Recv_drop_lo": "#E0F9D7",
        "Recv_errs_eth2": "#BF1B00",
        "Recv_errs_lo": "#CCA300",
        "Trans_bytes_eth2": "#7EB26D",
        "Trans_bytes_lo": "#0A50A1",
        "Trans_drop_eth2": "#6ED0E0",
        "Trans_drop_lo": "#E0F9D7",
        "Trans_errs_eth2": "#BF1B00",
        "Trans_errs_lo": "#CCA300",
        "recv_bytes_lo": "#0A50A1",
        "recv_drop_eth0": "#99440A",
        "recv_drop_lo": "#967302",
        "recv_errs_eth0": "#BF1B00",
        "recv_errs_lo": "#890F02",
        "trans_bytes_eth0": "#7EB26D",
        "trans_bytes_lo": "#0A50A1",
        "trans_drop_eth0": "#99440A",
        "trans_drop_lo": "#967302",
        "trans_errs_eth0": "#BF1B00",
        "trans_errs_lo": "#890F02"
      },
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "description": "Basic network info per interface",
      "fieldConfig": {
        "defaults": {
          "links": []
        },
        "overrides": []
      },
      "fill": 4,
      "fillGradient": 0,
      "gridPos": {
        "h": 7,
        "w": 12,
        "x": 0,
        "y": 13
      },
      "hiddenSeries": false,
      "id": 74,
      "legend": {
        "alignAsTable": false,
        "avg": false,
        "current": false,
        "hideEmpty": false,
        "hideZero": false,
        "max": false,
        "min": false,
        "rightSide": false,
        "show": true,
        "sort": "current",
        "sortDesc": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "8.5.6",
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [
        {
          "alias": "/.*trans.*/",
          "transform": "negative-Y"
        }
      ],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "rate(node_network_receive_bytes_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])*8",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "recv {{`device`}}",
          "refId": "A",
          "step": 240
        },
        {
          "expr": "rate(node_network_transmit_bytes_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])*8",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "trans {{`device`}} ",
          "refId": "B",
          "step": 240
        }
      ],
      "thresholds": [],
      "timeRegions": [],
      "title": "Network Traffic Basic",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "bps",
          "logBase": 1,
          "show": true
        },
        {
          "format": "pps",
          "label": "",
          "logBase": 1,
          "show": false
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "decimals": 3,
      "description": "Disk space used of all filesystems mounted",
      "fieldConfig": {
        "defaults": {
          "links": []
        },
        "overrides": []
      },
      "fill": 4,
      "fillGradient": 0,
      "gridPos": {
        "h": 7,
        "w": 12,
        "x": 12,
        "y": 13
      },
      "height": "",
      "hiddenSeries": false,
      "id": 152,
      "legend": {
        "alignAsTable": false,
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "rightSide": false,
        "show": true,
        "sort": "current",
        "sortDesc": false,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "maxPerRow": 6,
      "nullPointMode": "null",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "8.5.6",
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "100 - ((node_filesystem_avail_bytes{instance=\"$node\",job=\"$job\",device!~'rootfs'} * 100) / node_filesystem_size_bytes{instance=\"$node\",job=\"$job\",device!~'rootfs'})",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "{{`mountpoint`}}",
          "refId": "A",
          "step": 240
        }
      ],
      "thresholds": [],
      "timeRegions": [],
      "title": "Disk Space Used Basic",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "percent",
          "logBase": 1,
          "max": "100",
          "min": "0",
          "show": true
        },
        {
          "format": "short",
          "logBase": 1,
          "show": true
        }
      ],
      "yaxis": {
        "align": false
      }
    },
    {
      "collapsed": true,
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 20
      },
      "id": 265,
      "panels": [
        {
          "aliasColors": {
            "Idle - Waiting for something to happen": "#052B51",
            "guest": "#9AC48A",
            "idle": "#052B51",
            "iowait": "#EAB839",
            "irq": "#BF1B00",
            "nice": "#C15C17",
            "softirq": "#E24D42",
            "steal": "#FCE2DE",
            "system": "#508642",
            "user": "#5195CE"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "decimals": 2,
          "description": "",
          "fieldConfig": {
            "defaults": {
              "custom": {},
              "links": []
            },
            "overrides": []
          },
          "fill": 4,
          "fillGradient": 0,
          "gridPos": {
            "h": 12,
            "w": 12,
            "x": 0,
            "y": 3
          },
          "hiddenSeries": false,
          "id": 3,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 250,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": true,
          "pluginVersion": "7.3.7",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": true,
          "steppedLine": false,
          "targets": [
            {
              "expr": "sum by (mode)(rate(node_cpu_seconds_total{mode=\"system\",instance=\"$node\",job=\"$job\"}[$__rate_interval])) * 100",
              "format": "time_series",
              "interval": "10s",
              "intervalFactor": 1,
              "legendFormat": "System - Processes executing in kernel mode",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "sum by (mode)(rate(node_cpu_seconds_total{mode='user',instance=\"$node\",job=\"$job\"}[$__rate_interval])) * 100",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "User - Normal processes executing in user mode",
              "refId": "B",
              "step": 240
            },
            {
              "expr": "sum by (mode)(rate(node_cpu_seconds_total{mode='nice',instance=\"$node\",job=\"$job\"}[$__rate_interval])) * 100",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "Nice - Niced processes executing in user mode",
              "refId": "C",
              "step": 240
            },
            {
              "expr": "sum by (mode)(rate(node_cpu_seconds_total{mode='idle',instance=\"$node\",job=\"$job\"}[$__rate_interval])) * 100",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "Idle - Waiting for something to happen",
              "refId": "D",
              "step": 240
            },
            {
              "expr": "sum by (mode)(rate(node_cpu_seconds_total{mode='iowait',instance=\"$node\",job=\"$job\"}[$__rate_interval])) * 100",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "Iowait - Waiting for I/O to complete",
              "refId": "E",
              "step": 240
            },
            {
              "expr": "sum by (mode)(rate(node_cpu_seconds_total{mode='irq',instance=\"$node\",job=\"$job\"}[$__rate_interval])) * 100",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "Irq - Servicing interrupts",
              "refId": "F",
              "step": 240
            },
            {
              "expr": "sum by (mode)(rate(node_cpu_seconds_total{mode='softirq',instance=\"$node\",job=\"$job\"}[$__rate_interval])) * 100",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "Softirq - Servicing softirqs",
              "refId": "G",
              "step": 240
            },
            {
              "expr": "sum by (mode)(rate(node_cpu_seconds_total{mode='steal',instance=\"$node\",job=\"$job\"}[$__rate_interval])) * 100",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "Steal - Time spent in other operating systems when running in a virtualized environment",
              "refId": "H",
              "step": 240
            },
            {
              "expr": "sum by (mode)(rate(node_cpu_seconds_total{mode='guest',instance=\"$node\",job=\"$job\"}[$__rate_interval])) * 100",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "Guest - Time spent running a virtual CPU for a guest operating system",
              "refId": "I",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "CPU",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "percentage",
              "logBase": 1,
              "max": "100",
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {
            "Apps": "#629E51",
            "Buffers": "#614D93",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Free": "#0A437C",
            "Hardware Corrupted - Amount of RAM that the kernel identified as corrupted / not working": "#CFFAFF",
            "Inactive": "#584477",
            "PageTables": "#0A50A1",
            "Page_Tables": "#0A50A1",
            "RAM_Free": "#E0F9D7",
            "Slab": "#806EB7",
            "Slab_Cache": "#E0752D",
            "Swap": "#BF1B00",
            "Swap - Swap memory usage": "#BF1B00",
            "Swap_Cache": "#C15C17",
            "Swap_Free": "#2F575E",
            "Unused": "#EAB839",
            "Unused - Free memory unassigned": "#052B51"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "decimals": 2,
          "description": "",
          "fieldConfig": {
            "defaults": {
              "custom": {},
              "links": []
            },
            "overrides": []
          },
          "fill": 4,
          "fillGradient": 0,
          "gridPos": {
            "h": 12,
            "w": 12,
            "x": 12,
            "y": 3
          },
          "hiddenSeries": false,
          "id": 24,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 350,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "7.3.7",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Hardware Corrupted - *./",
              "stack": false
            }
          ],
          "spaceLength": 10,
          "stack": true,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_MemTotal_bytes{instance=\"$node\",job=\"$job\"} - node_memory_MemFree_bytes{instance=\"$node\",job=\"$job\"} - node_memory_Buffers_bytes{instance=\"$node\",job=\"$job\"} - node_memory_Cached_bytes{instance=\"$node\",job=\"$job\"} - node_memory_Slab_bytes{instance=\"$node\",job=\"$job\"} - node_memory_PageTables_bytes{instance=\"$node\",job=\"$job\"} - node_memory_SwapCached_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 1,
              "legendFormat": "Apps - Memory used by user-space applications",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_memory_PageTables_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 1,
              "legendFormat": "PageTables - Memory used to map between virtual and physical memory addresses",
              "refId": "B",
              "step": 240
            },
            {
              "expr": "node_memory_SwapCached_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "SwapCache - Memory that keeps track of pages that have been fetched from swap but not yet been modified",
              "refId": "C",
              "step": 240
            },
            {
              "expr": "node_memory_Slab_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 1,
              "legendFormat": "Slab - Memory used by the kernel to cache data structures for its own use (caches like inode, dentry, etc)",
              "refId": "D",
              "step": 240
            },
            {
              "expr": "node_memory_Cached_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 1,
              "legendFormat": "Cache - Parked file data (file content) cache",
              "refId": "E",
              "step": 240
            },
            {
              "expr": "node_memory_Buffers_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 1,
              "legendFormat": "Buffers - Block device (e.g. harddisk) cache",
              "refId": "F",
              "step": 240
            },
            {
              "expr": "node_memory_MemFree_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 1,
              "legendFormat": "Unused - Free memory unassigned",
              "refId": "G",
              "step": 240
            },
            {
              "expr": "(node_memory_SwapTotal_bytes{instance=\"$node\",job=\"$job\"} - node_memory_SwapFree_bytes{instance=\"$node\",job=\"$job\"})",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 1,
              "legendFormat": "Swap - Swap space used",
              "refId": "H",
              "step": 240
            },
            {
              "expr": "node_memory_HardwareCorrupted_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 1,
              "legendFormat": "Hardware Corrupted - Amount of RAM that the kernel identified as corrupted / not working",
              "refId": "I",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Memory Stack",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {
            "receive_packets_eth0": "#7EB26D",
            "receive_packets_lo": "#E24D42",
            "transmit_packets_eth0": "#7EB26D",
            "transmit_packets_lo": "#E24D42"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fieldConfig": {
            "defaults": {
              "custom": {},
              "links": []
            },
            "overrides": []
          },
          "fill": 4,
          "fillGradient": 0,
          "gridPos": {
            "h": 12,
            "w": 12,
            "x": 0,
            "y": 15
          },
          "hiddenSeries": false,
          "id": 84,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "7.3.7",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "$$hashKey": "object:5871",
              "alias": "/.*Trans.*/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_network_receive_bytes_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])*8",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "{{`device`}} - Receive",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "rate(node_network_transmit_bytes_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])*8",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "{{`device`}} - Transmit",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Network Traffic",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:5884",
              "format": "bps",
              "label": "bits out (-) / in (+)",
              "logBase": 1,
              "show": true
            },
            {
              "$$hashKey": "object:5885",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "decimals": 3,
          "description": "",
          "fieldConfig": {
            "defaults": {
              "custom": {},
              "links": []
            },
            "overrides": []
          },
          "fill": 4,
          "fillGradient": 0,
          "gridPos": {
            "h": 12,
            "w": 12,
            "x": 12,
            "y": 15
          },
          "height": "",
          "hiddenSeries": false,
          "id": 156,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sort": "current",
            "sortDesc": false,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "7.3.7",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_filesystem_size_bytes{instance=\"$node\",job=\"$job\",device!~'rootfs'} - node_filesystem_avail_bytes{instance=\"$node\",job=\"$job\",device!~'rootfs'}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "{{`mountpoint`}}",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Disk Space Used",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "description": "",
          "fieldConfig": {
            "defaults": {
              "custom": {},
              "links": []
            },
            "overrides": []
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 12,
            "w": 12,
            "x": 0,
            "y": 27
          },
          "hiddenSeries": false,
          "id": 229,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideZero": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "7.3.7",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Read.*/",
              "transform": "negative-Y"
            },
            {
              "alias": "/.*sda_.*/",
              "color": "#7EB26D"
            },
            {
              "alias": "/.*sdb_.*/",
              "color": "#EAB839"
            },
            {
              "alias": "/.*sdc_.*/",
              "color": "#6ED0E0"
            },
            {
              "alias": "/.*sdd_.*/",
              "color": "#EF843C"
            },
            {
              "alias": "/.*sde_.*/",
              "color": "#E24D42"
            },
            {
              "alias": "/.*sda1.*/",
              "color": "#584477"
            },
            {
              "alias": "/.*sda2_.*/",
              "color": "#BA43A9"
            },
            {
              "alias": "/.*sda3_.*/",
              "color": "#F4D598"
            },
            {
              "alias": "/.*sdb1.*/",
              "color": "#0A50A1"
            },
            {
              "alias": "/.*sdb2.*/",
              "color": "#BF1B00"
            },
            {
              "alias": "/.*sdb2.*/",
              "color": "#BF1B00"
            },
            {
              "alias": "/.*sdb3.*/",
              "color": "#E0752D"
            },
            {
              "alias": "/.*sdc1.*/",
              "color": "#962D82"
            },
            {
              "alias": "/.*sdc2.*/",
              "color": "#614D93"
            },
            {
              "alias": "/.*sdc3.*/",
              "color": "#9AC48A"
            },
            {
              "alias": "/.*sdd1.*/",
              "color": "#65C5DB"
            },
            {
              "alias": "/.*sdd2.*/",
              "color": "#F9934E"
            },
            {
              "alias": "/.*sdd3.*/",
              "color": "#EA6460"
            },
            {
              "alias": "/.*sde1.*/",
              "color": "#E0F9D7"
            },
            {
              "alias": "/.*sdd2.*/",
              "color": "#FCEACA"
            },
            {
              "alias": "/.*sde3.*/",
              "color": "#F9E2D2"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_disk_reads_completed_total{instance=\"$node\",job=\"$job\",device=~\"$diskdevices\"}[$__rate_interval])",
              "intervalFactor": 4,
              "legendFormat": "{{`device`}} - Reads completed",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "rate(node_disk_writes_completed_total{instance=\"$node\",job=\"$job\",device=~\"$diskdevices\"}[$__rate_interval])",
              "intervalFactor": 1,
              "legendFormat": "{{`device`}} - Writes completed",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Disk IOps",
          "tooltip": {
            "shared": false,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "iops",
              "label": "IO read (-) / write (+)",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {
            "io time": "#890F02"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "decimals": 3,
          "description": "",
          "fieldConfig": {
            "defaults": {
              "custom": {},
              "links": []
            },
            "overrides": []
          },
          "fill": 4,
          "fillGradient": 0,
          "gridPos": {
            "h": 12,
            "w": 12,
            "x": 12,
            "y": 27
          },
          "hiddenSeries": false,
          "id": 42,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "7.3.7",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*read*./",
              "transform": "negative-Y"
            },
            {
              "alias": "/.*sda.*/",
              "color": "#7EB26D"
            },
            {
              "alias": "/.*sdb.*/",
              "color": "#EAB839"
            },
            {
              "alias": "/.*sdc.*/",
              "color": "#6ED0E0"
            },
            {
              "alias": "/.*sdd.*/",
              "color": "#EF843C"
            },
            {
              "alias": "/.*sde.*/",
              "color": "#E24D42"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_disk_read_bytes_total{instance=\"$node\",job=\"$job\",device=~\"$diskdevices\"}[$__rate_interval])",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 1,
              "legendFormat": "{{`device`}} - Successfully read bytes",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "rate(node_disk_written_bytes_total{instance=\"$node\",job=\"$job\",device=~\"$diskdevices\"}[$__rate_interval])",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 1,
              "legendFormat": "{{`device`}} - Successfully written bytes",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "I/O Usage Read / Write",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": false,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:965",
              "format": "Bps",
              "label": "bytes read (-) / write (+)",
              "logBase": 1,
              "show": true
            },
            {
              "$$hashKey": "object:966",
              "format": "ms",
              "label": "",
              "logBase": 1,
              "show": true
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {
            "io time": "#890F02"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "decimals": 3,
          "description": "",
          "fieldConfig": {
            "defaults": {
              "custom": {},
              "links": []
            },
            "overrides": []
          },
          "fill": 4,
          "fillGradient": 0,
          "gridPos": {
            "h": 12,
            "w": 12,
            "x": 0,
            "y": 39
          },
          "hiddenSeries": false,
          "id": 127,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "7.3.7",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_disk_io_time_seconds_total{instance=\"$node\",job=\"$job\",device=~\"$diskdevices\"} [$__rate_interval])",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "{{`device`}}",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "I/O Utilization",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": false,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:1041",
              "format": "percentunit",
              "label": "%util",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "$$hashKey": "object:1042",
              "format": "s",
              "label": "",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        }
      ],
      "title": "CPU / Memory / Net / Disk",
      "type": "row"
    },
    {
      "collapsed": true,
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 21
      },
      "id": 266,
      "panels": [
        {
          "aliasColors": {
            "Apps": "#629E51",
            "Buffers": "#614D93",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Free": "#0A437C",
            "Hardware Corrupted - Amount of RAM that the kernel identified as corrupted / not working": "#CFFAFF",
            "Inactive": "#584477",
            "PageTables": "#0A50A1",
            "Page_Tables": "#0A50A1",
            "RAM_Free": "#E0F9D7",
            "Slab": "#806EB7",
            "Slab_Cache": "#E0752D",
            "Swap": "#BF1B00",
            "Swap_Cache": "#C15C17",
            "Swap_Free": "#2F575E",
            "Unused": "#EAB839"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "decimals": 2,
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 70
          },
          "hiddenSeries": false,
          "id": 136,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 350,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 2,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": true,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_Inactive_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "Inactive - Memory which has been less recently used.  It is more eligible to be reclaimed for other purposes",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_memory_Active_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "Active - Memory that has been used more recently and usually not reclaimed unless absolutely necessary",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Memory Active / Inactive",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "cumulative"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {
            "Apps": "#629E51",
            "Buffers": "#614D93",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Free": "#0A437C",
            "Hardware Corrupted - Amount of RAM that the kernel identified as corrupted / not working": "#CFFAFF",
            "Inactive": "#584477",
            "PageTables": "#0A50A1",
            "Page_Tables": "#0A50A1",
            "RAM_Free": "#E0F9D7",
            "Slab": "#806EB7",
            "Slab_Cache": "#E0752D",
            "Swap": "#BF1B00",
            "Swap_Cache": "#C15C17",
            "Swap_Free": "#2F575E",
            "Unused": "#EAB839"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "decimals": 2,
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 70
          },
          "hiddenSeries": false,
          "id": 135,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 350,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Committed_AS - *./"
            },
            {
              "alias": "/.*CommitLimit - *./",
              "color": "#BF1B00",
              "fill": 0
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_Committed_AS_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "Committed_AS - Amount of memory presently allocated on the system",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_memory_CommitLimit_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "CommitLimit - Amount of  memory currently available to be allocated on the system",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Memory Commited",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "cumulative"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {
            "Apps": "#629E51",
            "Buffers": "#614D93",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Free": "#0A437C",
            "Hardware Corrupted - Amount of RAM that the kernel identified as corrupted / not working": "#CFFAFF",
            "Inactive": "#584477",
            "PageTables": "#0A50A1",
            "Page_Tables": "#0A50A1",
            "RAM_Free": "#E0F9D7",
            "Slab": "#806EB7",
            "Slab_Cache": "#E0752D",
            "Swap": "#BF1B00",
            "Swap_Cache": "#C15C17",
            "Swap_Free": "#2F575E",
            "Unused": "#EAB839"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "decimals": 2,
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 80
          },
          "hiddenSeries": false,
          "id": 191,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 350,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": true,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_Inactive_file_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 1,
              "legendFormat": "Inactive_file - File-backed memory on inactive LRU list",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_memory_Inactive_anon_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 1,
              "legendFormat": "Inactive_anon - Anonymous and swap cache on inactive LRU list, including tmpfs (shmem)",
              "refId": "B",
              "step": 240
            },
            {
              "expr": "node_memory_Active_file_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 1,
              "legendFormat": "Active_file - File-backed memory on active LRU list",
              "refId": "C",
              "step": 240
            },
            {
              "expr": "node_memory_Active_anon_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 1,
              "legendFormat": "Active_anon - Anonymous and swap cache on active least-recently-used (LRU) list, including tmpfs",
              "refId": "D",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Memory Active / Inactive Detail",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "cumulative"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "format": "bytes",
              "logBase": 1,
              "show": true
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {
            "Active": "#99440A",
            "Buffers": "#58140C",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Dirty": "#6ED0E0",
            "Free": "#B7DBAB",
            "Inactive": "#EA6460",
            "Mapped": "#052B51",
            "PageTables": "#0A50A1",
            "Page_Tables": "#0A50A1",
            "Slab_Cache": "#EAB839",
            "Swap": "#BF1B00",
            "Swap_Cache": "#C15C17",
            "Total": "#511749",
            "Total RAM": "#052B51",
            "Total RAM + Swap": "#052B51",
            "Total Swap": "#614D93",
            "VmallocUsed": "#EA6460"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "decimals": 2,
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 80
          },
          "hiddenSeries": false,
          "id": 130,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 2,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_Writeback_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "Writeback - Memory which is actively being written back to disk",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_memory_WritebackTmp_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "WritebackTmp - Memory used by FUSE for temporary writeback buffers",
              "refId": "B",
              "step": 240
            },
            {
              "expr": "node_memory_Dirty_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "Dirty - Memory which is waiting to get written back to the disk",
              "refId": "C",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Memory Writeback and Dirty",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {
            "Apps": "#629E51",
            "Buffers": "#614D93",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Free": "#0A437C",
            "Hardware Corrupted - Amount of RAM that the kernel identified as corrupted / not working": "#CFFAFF",
            "Inactive": "#584477",
            "PageTables": "#0A50A1",
            "Page_Tables": "#0A50A1",
            "RAM_Free": "#E0F9D7",
            "Slab": "#806EB7",
            "Slab_Cache": "#E0752D",
            "Swap": "#BF1B00",
            "Swap_Cache": "#C15C17",
            "Swap_Free": "#2F575E",
            "Unused": "#EAB839"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "decimals": 2,
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 90
          },
          "hiddenSeries": false,
          "id": 138,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 350,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "$$hashKey": "object:4131",
              "alias": "ShmemHugePages - Memory used by shared memory (shmem) and tmpfs allocated  with huge pages",
              "fill": 0
            },
            {
              "$$hashKey": "object:4138",
              "alias": "ShmemHugePages - Memory used by shared memory (shmem) and tmpfs allocated  with huge pages",
              "fill": 0
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_Mapped_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "Mapped - Used memory in mapped pages files which have been mmaped, such as libraries",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_memory_Shmem_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "Shmem - Used shared memory (shared between several processes, thus including RAM disks)",
              "refId": "B",
              "step": 240
            },
            {
              "expr": "node_memory_ShmemHugePages_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "ShmemHugePages - Memory used by shared memory (shmem) and tmpfs allocated  with huge pages",
              "refId": "C",
              "step": 240
            },
            {
              "expr": "node_memory_ShmemPmdMapped_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "ShmemPmdMapped - Ammount of shared (shmem/tmpfs) memory backed by huge pages",
              "refId": "D",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Memory Shared and Mapped",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "cumulative"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:4106",
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "$$hashKey": "object:4107",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {
            "Active": "#99440A",
            "Buffers": "#58140C",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Dirty": "#6ED0E0",
            "Free": "#B7DBAB",
            "Inactive": "#EA6460",
            "Mapped": "#052B51",
            "PageTables": "#0A50A1",
            "Page_Tables": "#0A50A1",
            "Slab_Cache": "#EAB839",
            "Swap": "#BF1B00",
            "Swap_Cache": "#C15C17",
            "Total": "#511749",
            "Total RAM": "#052B51",
            "Total RAM + Swap": "#052B51",
            "Total Swap": "#614D93",
            "VmallocUsed": "#EA6460"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "decimals": 2,
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 90
          },
          "hiddenSeries": false,
          "id": 131,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 2,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": true,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_SUnreclaim_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "SUnreclaim - Part of Slab, that cannot be reclaimed on memory pressure",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_memory_SReclaimable_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "SReclaimable - Part of Slab, that might be reclaimed, such as caches",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Memory Slab",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {
            "Active": "#99440A",
            "Buffers": "#58140C",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Dirty": "#6ED0E0",
            "Free": "#B7DBAB",
            "Inactive": "#EA6460",
            "Mapped": "#052B51",
            "PageTables": "#0A50A1",
            "Page_Tables": "#0A50A1",
            "Slab_Cache": "#EAB839",
            "Swap": "#BF1B00",
            "Swap_Cache": "#C15C17",
            "Total": "#511749",
            "Total RAM": "#052B51",
            "Total RAM + Swap": "#052B51",
            "VmallocUsed": "#EA6460"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "decimals": 2,
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 100
          },
          "hiddenSeries": false,
          "id": 70,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_VmallocChunk_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 1,
              "legendFormat": "VmallocChunk - Largest contigious block of vmalloc area which is free",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_memory_VmallocTotal_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 1,
              "legendFormat": "VmallocTotal - Total size of vmalloc memory area",
              "refId": "B",
              "step": 240
            },
            {
              "expr": "node_memory_VmallocUsed_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 1,
              "legendFormat": "VmallocUsed - Amount of vmalloc area which is used",
              "refId": "C",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Memory Vmalloc",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {
            "Apps": "#629E51",
            "Buffers": "#614D93",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Free": "#0A437C",
            "Hardware Corrupted - Amount of RAM that the kernel identified as corrupted / not working": "#CFFAFF",
            "Inactive": "#584477",
            "PageTables": "#0A50A1",
            "Page_Tables": "#0A50A1",
            "RAM_Free": "#E0F9D7",
            "Slab": "#806EB7",
            "Slab_Cache": "#E0752D",
            "Swap": "#BF1B00",
            "Swap_Cache": "#C15C17",
            "Swap_Free": "#2F575E",
            "Unused": "#EAB839"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "decimals": 2,
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 100
          },
          "hiddenSeries": false,
          "id": 159,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 350,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_Bounce_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "Bounce - Memory used for block device bounce buffers",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Memory Bounce",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "cumulative"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {
            "Active": "#99440A",
            "Buffers": "#58140C",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Dirty": "#6ED0E0",
            "Free": "#B7DBAB",
            "Inactive": "#EA6460",
            "Mapped": "#052B51",
            "PageTables": "#0A50A1",
            "Page_Tables": "#0A50A1",
            "Slab_Cache": "#EAB839",
            "Swap": "#BF1B00",
            "Swap_Cache": "#C15C17",
            "Total": "#511749",
            "Total RAM": "#052B51",
            "Total RAM + Swap": "#052B51",
            "VmallocUsed": "#EA6460"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "decimals": 2,
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 110
          },
          "hiddenSeries": false,
          "id": 129,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Inactive *./",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_AnonHugePages_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "AnonHugePages - Memory in anonymous huge pages",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_memory_AnonPages_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "AnonPages - Memory in user pages not backed by files",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Memory Anonymous",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {
            "Apps": "#629E51",
            "Buffers": "#614D93",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Free": "#0A437C",
            "Hardware Corrupted - Amount of RAM that the kernel identified as corrupted / not working": "#CFFAFF",
            "Inactive": "#584477",
            "PageTables": "#0A50A1",
            "Page_Tables": "#0A50A1",
            "RAM_Free": "#E0F9D7",
            "Slab": "#806EB7",
            "Slab_Cache": "#E0752D",
            "Swap": "#BF1B00",
            "Swap_Cache": "#C15C17",
            "Swap_Free": "#2F575E",
            "Unused": "#EAB839"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "decimals": 2,
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 110
          },
          "hiddenSeries": false,
          "id": 160,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 350,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 2,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_KernelStack_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "KernelStack - Kernel memory stack. This is not reclaimable",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_memory_Percpu_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "PerCPU - Per CPU memory allocated dynamically by loadable modules",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Memory Kernel / CPU",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "cumulative"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {
            "Active": "#99440A",
            "Buffers": "#58140C",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Dirty": "#6ED0E0",
            "Free": "#B7DBAB",
            "Inactive": "#EA6460",
            "Mapped": "#052B51",
            "PageTables": "#0A50A1",
            "Page_Tables": "#0A50A1",
            "Slab_Cache": "#EAB839",
            "Swap": "#BF1B00",
            "Swap_Cache": "#C15C17",
            "Total": "#511749",
            "Total RAM": "#806EB7",
            "Total RAM + Swap": "#806EB7",
            "VmallocUsed": "#EA6460"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "decimals": 2,
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 120
          },
          "hiddenSeries": false,
          "id": 140,
          "legend": {
            "alignAsTable": true,
            "avg": false,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_HugePages_Free{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "HugePages_Free - Huge pages in the pool that are not yet allocated",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_memory_HugePages_Rsvd{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "HugePages_Rsvd - Huge pages for which a commitment to allocate from the pool has been made, but no allocation has yet been made",
              "refId": "B",
              "step": 240
            },
            {
              "expr": "node_memory_HugePages_Surp{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "HugePages_Surp - Huge pages in the pool above the value in /proc/sys/vm/nr_hugepages",
              "refId": "C",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Memory HugePages Counter",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "pages",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": "",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {
            "Active": "#99440A",
            "Buffers": "#58140C",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Dirty": "#6ED0E0",
            "Free": "#B7DBAB",
            "Inactive": "#EA6460",
            "Mapped": "#052B51",
            "PageTables": "#0A50A1",
            "Page_Tables": "#0A50A1",
            "Slab_Cache": "#EAB839",
            "Swap": "#BF1B00",
            "Swap_Cache": "#C15C17",
            "Total": "#511749",
            "Total RAM": "#806EB7",
            "Total RAM + Swap": "#806EB7",
            "VmallocUsed": "#EA6460"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "decimals": 2,
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 120
          },
          "hiddenSeries": false,
          "id": 71,
          "legend": {
            "alignAsTable": true,
            "avg": false,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 2,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_HugePages_Total{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "HugePages - Total size of the pool of huge pages",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_memory_Hugepagesize_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "Hugepagesize - Huge Page size",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Memory HugePages Size",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": "",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {
            "Active": "#99440A",
            "Buffers": "#58140C",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Dirty": "#6ED0E0",
            "Free": "#B7DBAB",
            "Inactive": "#EA6460",
            "Mapped": "#052B51",
            "PageTables": "#0A50A1",
            "Page_Tables": "#0A50A1",
            "Slab_Cache": "#EAB839",
            "Swap": "#BF1B00",
            "Swap_Cache": "#C15C17",
            "Total": "#511749",
            "Total RAM": "#052B51",
            "Total RAM + Swap": "#052B51",
            "VmallocUsed": "#EA6460"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "decimals": 2,
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 130
          },
          "hiddenSeries": false,
          "id": 128,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": false,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_DirectMap1G_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "DirectMap1G - Amount of pages mapped as this size",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_memory_DirectMap2M_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "DirectMap2M - Amount of pages mapped as this size",
              "refId": "B",
              "step": 240
            },
            {
              "expr": "node_memory_DirectMap4k_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "DirectMap4K - Amount of pages mapped as this size",
              "refId": "C",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Memory DirectMap",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {
            "Apps": "#629E51",
            "Buffers": "#614D93",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Free": "#0A437C",
            "Hardware Corrupted - Amount of RAM that the kernel identified as corrupted / not working": "#CFFAFF",
            "Inactive": "#584477",
            "PageTables": "#0A50A1",
            "Page_Tables": "#0A50A1",
            "RAM_Free": "#E0F9D7",
            "Slab": "#806EB7",
            "Slab_Cache": "#E0752D",
            "Swap": "#BF1B00",
            "Swap_Cache": "#C15C17",
            "Swap_Free": "#2F575E",
            "Unused": "#EAB839"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "decimals": 2,
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 130
          },
          "hiddenSeries": false,
          "id": 137,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 350,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_Unevictable_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "Unevictable - Amount of unevictable memory that can't be swapped out for a variety of reasons",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_memory_Mlocked_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "MLocked - Size of pages locked to memory using the mlock() system call",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Memory Unevictable and MLocked",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "cumulative"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {
            "Active": "#99440A",
            "Buffers": "#58140C",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Dirty": "#6ED0E0",
            "Free": "#B7DBAB",
            "Inactive": "#EA6460",
            "Mapped": "#052B51",
            "PageTables": "#0A50A1",
            "Page_Tables": "#0A50A1",
            "Slab_Cache": "#EAB839",
            "Swap": "#BF1B00",
            "Swap_Cache": "#C15C17",
            "Total": "#511749",
            "Total RAM": "#052B51",
            "Total RAM + Swap": "#052B51",
            "Total Swap": "#614D93",
            "VmallocUsed": "#EA6460"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "decimals": 2,
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 140
          },
          "hiddenSeries": false,
          "id": 132,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_NFS_Unstable_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "NFS Unstable - Memory in NFS pages sent to the server, but not yet commited to the storage",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Memory NFS",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        }
      ],
      "title": "Memory Meminfo",
      "type": "row"
    },
    {
      "collapsed": true,
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 22
      },
      "id": 267,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 23
          },
          "hiddenSeries": false,
          "id": 176,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*out/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_vmstat_pgpgin{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "Pagesin - Page in operations",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "rate(node_vmstat_pgpgout{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "Pagesout - Page out operations",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Memory Pages In / Out",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "pages out (-) / in (+)",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 23
          },
          "hiddenSeries": false,
          "id": 22,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*out/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_vmstat_pswpin{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "Pswpin - Pages swapped in",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "rate(node_vmstat_pswpout{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "Pswpout - Pages swapped out",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Memory Pages Swap In / Out",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "pages out (-) / in (+)",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {
            "Apps": "#629E51",
            "Buffers": "#614D93",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Free": "#0A437C",
            "Hardware Corrupted - Amount of RAM that the kernel identified as corrupted / not working": "#CFFAFF",
            "Inactive": "#584477",
            "PageTables": "#0A50A1",
            "Page_Tables": "#0A50A1",
            "RAM_Free": "#E0F9D7",
            "Slab": "#806EB7",
            "Slab_Cache": "#E0752D",
            "Swap": "#BF1B00",
            "Swap_Cache": "#C15C17",
            "Swap_Free": "#2F575E",
            "Unused": "#EAB839"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "decimals": 2,
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 33
          },
          "hiddenSeries": false,
          "id": 175,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 350,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "$$hashKey": "object:6118",
              "alias": "Pgfault - Page major and minor fault operations",
              "fill": 0,
              "stack": false
            }
          ],
          "spaceLength": 10,
          "stack": true,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_vmstat_pgfault{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "Pgfault - Page major and minor fault operations",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "rate(node_vmstat_pgmajfault{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "Pgmajfault - Major page fault operations",
              "refId": "B",
              "step": 240
            },
            {
              "expr": "rate(node_vmstat_pgfault{instance=\"$node\",job=\"$job\"}[$__rate_interval])  - rate(node_vmstat_pgmajfault{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "Pgminfault - Minor page fault operations",
              "refId": "C",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Memory Page Faults",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "cumulative"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:6133",
              "format": "short",
              "label": "faults",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "$$hashKey": "object:6134",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {
            "Active": "#99440A",
            "Buffers": "#58140C",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Dirty": "#6ED0E0",
            "Free": "#B7DBAB",
            "Inactive": "#EA6460",
            "Mapped": "#052B51",
            "PageTables": "#0A50A1",
            "Page_Tables": "#0A50A1",
            "Slab_Cache": "#EAB839",
            "Swap": "#BF1B00",
            "Swap_Cache": "#C15C17",
            "Total": "#511749",
            "Total RAM": "#052B51",
            "Total RAM + Swap": "#052B51",
            "Total Swap": "#614D93",
            "VmallocUsed": "#EA6460"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "decimals": 2,
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 33
          },
          "hiddenSeries": false,
          "id": 307,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_vmstat_oom_kill{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "oom killer invocations ",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "OOM Killer",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:5373",
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "$$hashKey": "object:5374",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        }
      ],
      "title": "Memory Vmstat",
      "type": "row"
    },
    {
      "collapsed": true,
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 23
      },
      "id": 293,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "description": "",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 24
          },
          "hiddenSeries": false,
          "id": 260,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Variation*./",
              "color": "#890F02"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_timex_estimated_error_seconds{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "Estimated error in seconds",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_timex_offset_seconds{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "Time offset in between local system and reference clock",
              "refId": "B",
              "step": 240
            },
            {
              "expr": "node_timex_maxerror_seconds{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "Maximum error in seconds",
              "refId": "C",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Time Syncronized Drift",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "s",
              "label": "seconds",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "description": "",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 24
          },
          "hiddenSeries": false,
          "id": 291,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_timex_loop_time_constant{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "Phase-locked loop time adjust",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Time PLL Adjust",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "description": "",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 34
          },
          "hiddenSeries": false,
          "id": 168,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Variation*./",
              "color": "#890F02"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_timex_sync_status{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "Is clock synchronized to a reliable server (1 = yes, 0 = no)",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_timex_frequency_adjustment_ratio{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "Local clock frequency adjustment",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Time Syncronized Status",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "description": "",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 34
          },
          "hiddenSeries": false,
          "id": 294,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_timex_tick_seconds{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "Seconds between clock ticks",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_timex_tai_offset_seconds{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "International Atomic Time (TAI) offset",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Time Misc",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "s",
              "label": "seconds",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        }
      ],
      "title": "System Timesync",
      "type": "row"
    },
    {
      "collapsed": true,
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 24
      },
      "id": 312,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 7
          },
          "hiddenSeries": false,
          "id": 62,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_procs_blocked{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "Processes blocked waiting for I/O to complete",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_procs_running{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "Processes in runnable state",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Processes Status",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:6500",
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "$$hashKey": "object:6501",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 7
          },
          "hiddenSeries": false,
          "id": 315,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": true,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_processes_state{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "{{` state `}}",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Processes State",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:6500",
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "$$hashKey": "object:6501",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 17
          },
          "hiddenSeries": false,
          "id": 148,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_forks_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 1,
              "legendFormat": "Processes forks second",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Processes  Forks",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:6640",
              "format": "short",
              "label": "forks / sec",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "$$hashKey": "object:6641",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 17
          },
          "hiddenSeries": false,
          "id": 149,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Max.*/",
              "fill": 0
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(process_virtual_memory_bytes{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "hide": false,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "Processes virtual memory size in bytes",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "process_resident_memory_max_bytes{instance=\"$node\",job=\"$job\"}",
              "hide": false,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "Maximum amount of virtual memory available in bytes",
              "refId": "B",
              "step": 240
            },
            {
              "expr": "rate(process_virtual_memory_bytes{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "hide": false,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "Processes virtual memory size in bytes",
              "refId": "C",
              "step": 240
            },
            {
              "expr": "rate(process_virtual_memory_max_bytes{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "hide": false,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "Maximum amount of virtual memory available in bytes",
              "refId": "D",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Processes Memory",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "decbytes",
              "label": "bytes",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 27
          },
          "hiddenSeries": false,
          "id": 313,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "$$hashKey": "object:709",
              "alias": "PIDs limit",
              "color": "#F2495C",
              "fill": 0
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_processes_pids{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "Number of PIDs",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_processes_max_processes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "PIDs limit",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "PIDs Number and Limit",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:6500",
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "$$hashKey": "object:6501",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 27
          },
          "hiddenSeries": false,
          "id": 305,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "$$hashKey": "object:4963",
              "alias": "/.*waiting.*/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_schedstat_running_seconds_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "CPU {{` cpu `}} - seconds spent running a process",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "rate(node_schedstat_waiting_seconds_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "CPU {{` cpu `}} - seconds spent by processing waiting for this CPU",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Process schedule stats Running / Waiting",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:4860",
              "format": "s",
              "label": "seconds",
              "logBase": 1,
              "show": true
            },
            {
              "$$hashKey": "object:4861",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 37
          },
          "hiddenSeries": false,
          "id": 314,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "$$hashKey": "object:709",
              "alias": "Threads limit",
              "color": "#F2495C",
              "fill": 0
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_processes_threads{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "Allocated threads",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_processes_max_threads{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "Threads limit",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Threads Number and Limit",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:6500",
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "$$hashKey": "object:6501",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        }
      ],
      "title": "System Processes",
      "type": "row"
    },
    {
      "collapsed": true,
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 25
      },
      "id": 269,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 8
          },
          "hiddenSeries": false,
          "id": 8,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_context_switches_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "Context switches",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "rate(node_intr_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 1,
              "legendFormat": "Interrupts",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Context Switches / Interrupts",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 8
          },
          "hiddenSeries": false,
          "id": 7,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_load1{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 4,
              "legendFormat": "Load 1m",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_load5{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 4,
              "legendFormat": "Load 5m",
              "refId": "B",
              "step": 240
            },
            {
              "expr": "node_load15{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 4,
              "legendFormat": "Load 15m",
              "refId": "C",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "System Load",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:6261",
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "$$hashKey": "object:6262",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 18
          },
          "hiddenSeries": false,
          "id": 259,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Critical*./",
              "color": "#E24D42",
              "fill": 0
            },
            {
              "alias": "/.*Max*./",
              "color": "#EF843C",
              "fill": 0
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_interrupts_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "{{` type `}} - {{` info `}}",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Interrupts Detail",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 18
          },
          "hiddenSeries": false,
          "id": 306,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_schedstat_timeslices_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "CPU {{` cpu `}}",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Schedule timeslices executed by each cpu",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:4860",
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "show": true
            },
            {
              "$$hashKey": "object:4861",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 28
          },
          "hiddenSeries": false,
          "id": 151,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_entropy_available_bits{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "Entropy available to random number generators",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Entropy",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:6568",
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "$$hashKey": "object:6569",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 28
          },
          "hiddenSeries": false,
          "id": 308,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(process_cpu_seconds_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "Time spent",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "CPU time spent in user and system contexts",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:4860",
              "format": "s",
              "label": "seconds",
              "logBase": 1,
              "show": true
            },
            {
              "$$hashKey": "object:4861",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 38
          },
          "hiddenSeries": false,
          "id": 64,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "$$hashKey": "object:6323",
              "alias": "/.*Max*./",
              "color": "#890F02",
              "fill": 0
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "process_max_fds{instance=\"$node\",job=\"$job\"}",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "Maximum open file descriptors",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "process_open_fds{instance=\"$node\",job=\"$job\"}",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "Open file descriptors",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "File Descriptors",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:6338",
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "$$hashKey": "object:6339",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        }
      ],
      "title": "System Misc",
      "type": "row"
    },
    {
      "collapsed": true,
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 26
      },
      "id": 304,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 26
          },
          "hiddenSeries": false,
          "id": 158,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "$$hashKey": "object:6726",
              "alias": "/.*Critical*./",
              "color": "#E24D42",
              "fill": 0
            },
            {
              "$$hashKey": "object:6727",
              "alias": "/.*Max*./",
              "color": "#EF843C",
              "fill": 0
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_hwmon_temp_celsius{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "{{` chip `}} {{` sensor `}} temp",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_hwmon_temp_crit_alarm_celsius{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "hide": true,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "{{` chip `}} {{` sensor `}} Critical Alarm",
              "refId": "B",
              "step": 240
            },
            {
              "expr": "node_hwmon_temp_crit_celsius{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "{{` chip `}} {{` sensor `}} Critical",
              "refId": "C",
              "step": 240
            },
            {
              "expr": "node_hwmon_temp_crit_hyst_celsius{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "hide": true,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "{{` chip `}} {{` sensor `}} Critical Historical",
              "refId": "D",
              "step": 240
            },
            {
              "expr": "node_hwmon_temp_max_celsius{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "hide": true,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "{{` chip `}} {{` sensor `}} Max",
              "refId": "E",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Hardware temperature monitor",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:6750",
              "format": "celsius",
              "label": "temperature",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "$$hashKey": "object:6751",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 26
          },
          "hiddenSeries": false,
          "id": 300,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "$$hashKey": "object:1655",
              "alias": "/.*Max*./",
              "color": "#EF843C",
              "fill": 0
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_cooling_device_cur_state{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "Current {{` name `}} in {{` type `}}",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_cooling_device_max_state{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "Max {{` name `}} in {{` type `}}",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Throttle cooling device",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:1678",
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "show": true
            },
            {
              "$$hashKey": "object:1679",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 36
          },
          "hiddenSeries": false,
          "id": 302,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_power_supply_online{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "{{` power_supply `}} online",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Power supply",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:1678",
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "show": true
            },
            {
              "$$hashKey": "object:1679",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        }
      ],
      "title": "Hardware Misc",
      "type": "row"
    },
    {
      "collapsed": true,
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 27
      },
      "id": 296,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 10
          },
          "hiddenSeries": false,
          "id": 297,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_systemd_socket_accepted_connections_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "{{` name `}} Connections",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Systemd Sockets",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 10
          },
          "hiddenSeries": false,
          "id": 298,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "Failed",
              "color": "#F2495C"
            },
            {
              "alias": "Inactive",
              "color": "#FF9830"
            },
            {
              "alias": "Active",
              "color": "#73BF69"
            },
            {
              "alias": "Deactivating",
              "color": "#FFCB7D"
            },
            {
              "alias": "Activating",
              "color": "#C8F2C2"
            }
          ],
          "spaceLength": 10,
          "stack": true,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_systemd_units{instance=\"$node\",job=\"$job\",state=\"activating\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "Activating",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_systemd_units{instance=\"$node\",job=\"$job\",state=\"active\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "Active",
              "refId": "B",
              "step": 240
            },
            {
              "expr": "node_systemd_units{instance=\"$node\",job=\"$job\",state=\"deactivating\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "Deactivating",
              "refId": "C",
              "step": 240
            },
            {
              "expr": "node_systemd_units{instance=\"$node\",job=\"$job\",state=\"failed\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "Failed",
              "refId": "D",
              "step": 240
            },
            {
              "expr": "node_systemd_units{instance=\"$node\",job=\"$job\",state=\"inactive\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "Inactive",
              "refId": "E",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Systemd Units State",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        }
      ],
      "title": "Systemd",
      "type": "row"
    },
    {
      "collapsed": true,
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 28
      },
      "id": 270,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "description": "The number (after merges) of I/O requests completed per second for the device",
          "fieldConfig": {
            "defaults": {
              "custom": {},
              "links": []
            },
            "overrides": []
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 11
          },
          "hiddenSeries": false,
          "id": 9,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideZero": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "7.3.7",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "$$hashKey": "object:2033",
              "alias": "/.*Read.*/",
              "transform": "negative-Y"
            },
            {
              "$$hashKey": "object:2034",
              "alias": "/.*sda_.*/",
              "color": "#7EB26D"
            },
            {
              "$$hashKey": "object:2035",
              "alias": "/.*sdb_.*/",
              "color": "#EAB839"
            },
            {
              "$$hashKey": "object:2036",
              "alias": "/.*sdc_.*/",
              "color": "#6ED0E0"
            },
            {
              "$$hashKey": "object:2037",
              "alias": "/.*sdd_.*/",
              "color": "#EF843C"
            },
            {
              "$$hashKey": "object:2038",
              "alias": "/.*sde_.*/",
              "color": "#E24D42"
            },
            {
              "$$hashKey": "object:2039",
              "alias": "/.*sda1.*/",
              "color": "#584477"
            },
            {
              "$$hashKey": "object:2040",
              "alias": "/.*sda2_.*/",
              "color": "#BA43A9"
            },
            {
              "$$hashKey": "object:2041",
              "alias": "/.*sda3_.*/",
              "color": "#F4D598"
            },
            {
              "$$hashKey": "object:2042",
              "alias": "/.*sdb1.*/",
              "color": "#0A50A1"
            },
            {
              "$$hashKey": "object:2043",
              "alias": "/.*sdb2.*/",
              "color": "#BF1B00"
            },
            {
              "$$hashKey": "object:2044",
              "alias": "/.*sdb3.*/",
              "color": "#E0752D"
            },
            {
              "$$hashKey": "object:2045",
              "alias": "/.*sdc1.*/",
              "color": "#962D82"
            },
            {
              "$$hashKey": "object:2046",
              "alias": "/.*sdc2.*/",
              "color": "#614D93"
            },
            {
              "$$hashKey": "object:2047",
              "alias": "/.*sdc3.*/",
              "color": "#9AC48A"
            },
            {
              "$$hashKey": "object:2048",
              "alias": "/.*sdd1.*/",
              "color": "#65C5DB"
            },
            {
              "$$hashKey": "object:2049",
              "alias": "/.*sdd2.*/",
              "color": "#F9934E"
            },
            {
              "$$hashKey": "object:2050",
              "alias": "/.*sdd3.*/",
              "color": "#EA6460"
            },
            {
              "$$hashKey": "object:2051",
              "alias": "/.*sde1.*/",
              "color": "#E0F9D7"
            },
            {
              "$$hashKey": "object:2052",
              "alias": "/.*sdd2.*/",
              "color": "#FCEACA"
            },
            {
              "$$hashKey": "object:2053",
              "alias": "/.*sde3.*/",
              "color": "#F9E2D2"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_disk_reads_completed_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "intervalFactor": 4,
              "legendFormat": "{{`device`}} - Reads completed",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "rate(node_disk_writes_completed_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "intervalFactor": 1,
              "legendFormat": "{{`device`}} - Writes completed",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Disk IOps Completed",
          "tooltip": {
            "shared": false,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:2186",
              "format": "iops",
              "label": "IO read (-) / write (+)",
              "logBase": 1,
              "show": true
            },
            {
              "$$hashKey": "object:2187",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "description": "The number of bytes read from or written to the device per second",
          "fieldConfig": {
            "defaults": {
              "custom": {},
              "links": []
            },
            "overrides": []
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 11
          },
          "hiddenSeries": false,
          "id": 33,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideZero": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "7.3.7",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Read.*/",
              "transform": "negative-Y"
            },
            {
              "alias": "/.*sda_.*/",
              "color": "#7EB26D"
            },
            {
              "alias": "/.*sdb_.*/",
              "color": "#EAB839"
            },
            {
              "alias": "/.*sdc_.*/",
              "color": "#6ED0E0"
            },
            {
              "alias": "/.*sdd_.*/",
              "color": "#EF843C"
            },
            {
              "alias": "/.*sde_.*/",
              "color": "#E24D42"
            },
            {
              "alias": "/.*sda1.*/",
              "color": "#584477"
            },
            {
              "alias": "/.*sda2_.*/",
              "color": "#BA43A9"
            },
            {
              "alias": "/.*sda3_.*/",
              "color": "#F4D598"
            },
            {
              "alias": "/.*sdb1.*/",
              "color": "#0A50A1"
            },
            {
              "alias": "/.*sdb2.*/",
              "color": "#BF1B00"
            },
            {
              "alias": "/.*sdb3.*/",
              "color": "#E0752D"
            },
            {
              "alias": "/.*sdc1.*/",
              "color": "#962D82"
            },
            {
              "alias": "/.*sdc2.*/",
              "color": "#614D93"
            },
            {
              "alias": "/.*sdc3.*/",
              "color": "#9AC48A"
            },
            {
              "alias": "/.*sdd1.*/",
              "color": "#65C5DB"
            },
            {
              "alias": "/.*sdd2.*/",
              "color": "#F9934E"
            },
            {
              "alias": "/.*sdd3.*/",
              "color": "#EA6460"
            },
            {
              "alias": "/.*sde1.*/",
              "color": "#E0F9D7"
            },
            {
              "alias": "/.*sdd2.*/",
              "color": "#FCEACA"
            },
            {
              "alias": "/.*sde3.*/",
              "color": "#F9E2D2"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_disk_read_bytes_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "intervalFactor": 4,
              "legendFormat": "{{`device`}} - Read bytes",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "rate(node_disk_written_bytes_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "{{`device`}} - Written bytes",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Disk R/W Data",
          "tooltip": {
            "shared": false,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:369",
              "format": "Bps",
              "label": "bytes read (-) / write (+)",
              "logBase": 1,
              "show": true
            },
            {
              "$$hashKey": "object:370",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "description": "The average time for requests issued to the device to be served. This includes the time spent by the requests in queue and the time spent servicing them.",
          "fieldConfig": {
            "defaults": {
              "custom": {},
              "links": []
            },
            "overrides": []
          },
          "fill": 3,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 21
          },
          "hiddenSeries": false,
          "id": 37,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideZero": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "7.3.7",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Read.*/",
              "transform": "negative-Y"
            },
            {
              "alias": "/.*sda_.*/",
              "color": "#7EB26D"
            },
            {
              "alias": "/.*sdb_.*/",
              "color": "#EAB839"
            },
            {
              "alias": "/.*sdc_.*/",
              "color": "#6ED0E0"
            },
            {
              "alias": "/.*sdd_.*/",
              "color": "#EF843C"
            },
            {
              "alias": "/.*sde_.*/",
              "color": "#E24D42"
            },
            {
              "alias": "/.*sda1.*/",
              "color": "#584477"
            },
            {
              "alias": "/.*sda2_.*/",
              "color": "#BA43A9"
            },
            {
              "alias": "/.*sda3_.*/",
              "color": "#F4D598"
            },
            {
              "alias": "/.*sdb1.*/",
              "color": "#0A50A1"
            },
            {
              "alias": "/.*sdb2.*/",
              "color": "#BF1B00"
            },
            {
              "alias": "/.*sdb3.*/",
              "color": "#E0752D"
            },
            {
              "alias": "/.*sdc1.*/",
              "color": "#962D82"
            },
            {
              "alias": "/.*sdc2.*/",
              "color": "#614D93"
            },
            {
              "alias": "/.*sdc3.*/",
              "color": "#9AC48A"
            },
            {
              "alias": "/.*sdd1.*/",
              "color": "#65C5DB"
            },
            {
              "alias": "/.*sdd2.*/",
              "color": "#F9934E"
            },
            {
              "alias": "/.*sdd3.*/",
              "color": "#EA6460"
            },
            {
              "alias": "/.*sde1.*/",
              "color": "#E0F9D7"
            },
            {
              "alias": "/.*sdd2.*/",
              "color": "#FCEACA"
            },
            {
              "alias": "/.*sde3.*/",
              "color": "#F9E2D2"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_disk_read_time_seconds_total{instance=\"$node\",job=\"$job\"}[$__rate_interval]) / rate(node_disk_reads_completed_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "hide": false,
              "interval": "",
              "intervalFactor": 4,
              "legendFormat": "{{`device`}} - Read wait time avg",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "rate(node_disk_write_time_seconds_total{instance=\"$node\",job=\"$job\"}[$__rate_interval]) / rate(node_disk_writes_completed_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "hide": false,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "{{`device`}} - Write wait time avg",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Disk Average Wait Time",
          "tooltip": {
            "shared": false,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:441",
              "format": "s",
              "label": "time. read (-) / write (+)",
              "logBase": 1,
              "show": true
            },
            {
              "$$hashKey": "object:442",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "description": "The average queue length of the requests that were issued to the device",
          "fieldConfig": {
            "defaults": {
              "custom": {},
              "links": []
            },
            "overrides": []
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 21
          },
          "hiddenSeries": false,
          "id": 35,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideZero": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "7.3.7",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*sda_.*/",
              "color": "#7EB26D"
            },
            {
              "alias": "/.*sdb_.*/",
              "color": "#EAB839"
            },
            {
              "alias": "/.*sdc_.*/",
              "color": "#6ED0E0"
            },
            {
              "alias": "/.*sdd_.*/",
              "color": "#EF843C"
            },
            {
              "alias": "/.*sde_.*/",
              "color": "#E24D42"
            },
            {
              "alias": "/.*sda1.*/",
              "color": "#584477"
            },
            {
              "alias": "/.*sda2_.*/",
              "color": "#BA43A9"
            },
            {
              "alias": "/.*sda3_.*/",
              "color": "#F4D598"
            },
            {
              "alias": "/.*sdb1.*/",
              "color": "#0A50A1"
            },
            {
              "alias": "/.*sdb2.*/",
              "color": "#BF1B00"
            },
            {
              "alias": "/.*sdb3.*/",
              "color": "#E0752D"
            },
            {
              "alias": "/.*sdc1.*/",
              "color": "#962D82"
            },
            {
              "alias": "/.*sdc2.*/",
              "color": "#614D93"
            },
            {
              "alias": "/.*sdc3.*/",
              "color": "#9AC48A"
            },
            {
              "alias": "/.*sdd1.*/",
              "color": "#65C5DB"
            },
            {
              "alias": "/.*sdd2.*/",
              "color": "#F9934E"
            },
            {
              "alias": "/.*sdd3.*/",
              "color": "#EA6460"
            },
            {
              "alias": "/.*sde1.*/",
              "color": "#E0F9D7"
            },
            {
              "alias": "/.*sdd2.*/",
              "color": "#FCEACA"
            },
            {
              "alias": "/.*sde3.*/",
              "color": "#F9E2D2"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_disk_io_time_weighted_seconds_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "interval": "",
              "intervalFactor": 4,
              "legendFormat": "{{`device`}}",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Average Queue Size",
          "tooltip": {
            "shared": false,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:513",
              "format": "none",
              "label": "aqu-sz",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "$$hashKey": "object:514",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "description": "The number of read and write requests merged per second that were queued to the device",
          "fieldConfig": {
            "defaults": {
              "custom": {},
              "links": []
            },
            "overrides": []
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 31
          },
          "hiddenSeries": false,
          "id": 133,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideZero": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "7.3.7",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Read.*/",
              "transform": "negative-Y"
            },
            {
              "alias": "/.*sda_.*/",
              "color": "#7EB26D"
            },
            {
              "alias": "/.*sdb_.*/",
              "color": "#EAB839"
            },
            {
              "alias": "/.*sdc_.*/",
              "color": "#6ED0E0"
            },
            {
              "alias": "/.*sdd_.*/",
              "color": "#EF843C"
            },
            {
              "alias": "/.*sde_.*/",
              "color": "#E24D42"
            },
            {
              "alias": "/.*sda1.*/",
              "color": "#584477"
            },
            {
              "alias": "/.*sda2_.*/",
              "color": "#BA43A9"
            },
            {
              "alias": "/.*sda3_.*/",
              "color": "#F4D598"
            },
            {
              "alias": "/.*sdb1.*/",
              "color": "#0A50A1"
            },
            {
              "alias": "/.*sdb2.*/",
              "color": "#BF1B00"
            },
            {
              "alias": "/.*sdb3.*/",
              "color": "#E0752D"
            },
            {
              "alias": "/.*sdc1.*/",
              "color": "#962D82"
            },
            {
              "alias": "/.*sdc2.*/",
              "color": "#614D93"
            },
            {
              "alias": "/.*sdc3.*/",
              "color": "#9AC48A"
            },
            {
              "alias": "/.*sdd1.*/",
              "color": "#65C5DB"
            },
            {
              "alias": "/.*sdd2.*/",
              "color": "#F9934E"
            },
            {
              "alias": "/.*sdd3.*/",
              "color": "#EA6460"
            },
            {
              "alias": "/.*sde1.*/",
              "color": "#E0F9D7"
            },
            {
              "alias": "/.*sdd2.*/",
              "color": "#FCEACA"
            },
            {
              "alias": "/.*sde3.*/",
              "color": "#F9E2D2"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_disk_reads_merged_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "intervalFactor": 1,
              "legendFormat": "{{`device`}} - Read merged",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "rate(node_disk_writes_merged_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "intervalFactor": 1,
              "legendFormat": "{{`device`}} - Write merged",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Disk R/W Merged",
          "tooltip": {
            "shared": false,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:585",
              "format": "iops",
              "label": "I/Os",
              "logBase": 1,
              "show": true
            },
            {
              "$$hashKey": "object:586",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "description": "Percentage of elapsed time during which I/O requests were issued to the device (bandwidth utilization for the device). Device saturation occurs when this value is close to 100% for devices serving requests serially.  But for devices  serving requests in parallel, such as RAID arrays and modern SSDs, this number does not reflect their performance limits.",
          "fieldConfig": {
            "defaults": {
              "custom": {},
              "links": []
            },
            "overrides": []
          },
          "fill": 3,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 31
          },
          "hiddenSeries": false,
          "id": 36,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideZero": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "7.3.7",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*sda_.*/",
              "color": "#7EB26D"
            },
            {
              "alias": "/.*sdb_.*/",
              "color": "#EAB839"
            },
            {
              "alias": "/.*sdc_.*/",
              "color": "#6ED0E0"
            },
            {
              "alias": "/.*sdd_.*/",
              "color": "#EF843C"
            },
            {
              "alias": "/.*sde_.*/",
              "color": "#E24D42"
            },
            {
              "alias": "/.*sda1.*/",
              "color": "#584477"
            },
            {
              "alias": "/.*sda2_.*/",
              "color": "#BA43A9"
            },
            {
              "alias": "/.*sda3_.*/",
              "color": "#F4D598"
            },
            {
              "alias": "/.*sdb1.*/",
              "color": "#0A50A1"
            },
            {
              "alias": "/.*sdb2.*/",
              "color": "#BF1B00"
            },
            {
              "alias": "/.*sdb3.*/",
              "color": "#E0752D"
            },
            {
              "alias": "/.*sdc1.*/",
              "color": "#962D82"
            },
            {
              "alias": "/.*sdc2.*/",
              "color": "#614D93"
            },
            {
              "alias": "/.*sdc3.*/",
              "color": "#9AC48A"
            },
            {
              "alias": "/.*sdd1.*/",
              "color": "#65C5DB"
            },
            {
              "alias": "/.*sdd2.*/",
              "color": "#F9934E"
            },
            {
              "alias": "/.*sdd3.*/",
              "color": "#EA6460"
            },
            {
              "alias": "/.*sde1.*/",
              "color": "#E0F9D7"
            },
            {
              "alias": "/.*sdd2.*/",
              "color": "#FCEACA"
            },
            {
              "alias": "/.*sde3.*/",
              "color": "#F9E2D2"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_disk_io_time_seconds_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "interval": "",
              "intervalFactor": 4,
              "legendFormat": "{{`device`}} - IO",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "rate(node_disk_discard_time_seconds_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "interval": "",
              "intervalFactor": 4,
              "legendFormat": "{{`device`}} - discard",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Time Spent Doing I/Os",
          "tooltip": {
            "shared": false,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:657",
              "format": "percentunit",
              "label": "%util",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "$$hashKey": "object:658",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "description": "The number of outstanding requests at the instant the sample was taken. Incremented as requests are given to appropriate struct request_queue and decremented as they finish.",
          "fieldConfig": {
            "defaults": {
              "custom": {},
              "links": []
            },
            "overrides": []
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 41
          },
          "hiddenSeries": false,
          "id": 34,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideZero": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "7.3.7",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*sda_.*/",
              "color": "#7EB26D"
            },
            {
              "alias": "/.*sdb_.*/",
              "color": "#EAB839"
            },
            {
              "alias": "/.*sdc_.*/",
              "color": "#6ED0E0"
            },
            {
              "alias": "/.*sdd_.*/",
              "color": "#EF843C"
            },
            {
              "alias": "/.*sde_.*/",
              "color": "#E24D42"
            },
            {
              "alias": "/.*sda1.*/",
              "color": "#584477"
            },
            {
              "alias": "/.*sda2_.*/",
              "color": "#BA43A9"
            },
            {
              "alias": "/.*sda3_.*/",
              "color": "#F4D598"
            },
            {
              "alias": "/.*sdb1.*/",
              "color": "#0A50A1"
            },
            {
              "alias": "/.*sdb2.*/",
              "color": "#BF1B00"
            },
            {
              "alias": "/.*sdb3.*/",
              "color": "#E0752D"
            },
            {
              "alias": "/.*sdc1.*/",
              "color": "#962D82"
            },
            {
              "alias": "/.*sdc2.*/",
              "color": "#614D93"
            },
            {
              "alias": "/.*sdc3.*/",
              "color": "#9AC48A"
            },
            {
              "alias": "/.*sdd1.*/",
              "color": "#65C5DB"
            },
            {
              "alias": "/.*sdd2.*/",
              "color": "#F9934E"
            },
            {
              "alias": "/.*sdd3.*/",
              "color": "#EA6460"
            },
            {
              "alias": "/.*sde1.*/",
              "color": "#E0F9D7"
            },
            {
              "alias": "/.*sdd2.*/",
              "color": "#FCEACA"
            },
            {
              "alias": "/.*sde3.*/",
              "color": "#F9E2D2"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_disk_io_now{instance=\"$node\",job=\"$job\"}",
              "interval": "",
              "intervalFactor": 4,
              "legendFormat": "{{`device`}} - IO now",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Instantaneous Queue Size",
          "tooltip": {
            "shared": false,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:729",
              "format": "none",
              "label": "Outstanding req.",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "$$hashKey": "object:730",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "description": "",
          "fieldConfig": {
            "defaults": {
              "custom": {},
              "links": []
            },
            "overrides": []
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 41
          },
          "hiddenSeries": false,
          "id": 301,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideZero": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null as zero",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "7.3.7",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "$$hashKey": "object:2034",
              "alias": "/.*sda_.*/",
              "color": "#7EB26D"
            },
            {
              "$$hashKey": "object:2035",
              "alias": "/.*sdb_.*/",
              "color": "#EAB839"
            },
            {
              "$$hashKey": "object:2036",
              "alias": "/.*sdc_.*/",
              "color": "#6ED0E0"
            },
            {
              "$$hashKey": "object:2037",
              "alias": "/.*sdd_.*/",
              "color": "#EF843C"
            },
            {
              "$$hashKey": "object:2038",
              "alias": "/.*sde_.*/",
              "color": "#E24D42"
            },
            {
              "$$hashKey": "object:2039",
              "alias": "/.*sda1.*/",
              "color": "#584477"
            },
            {
              "$$hashKey": "object:2040",
              "alias": "/.*sda2_.*/",
              "color": "#BA43A9"
            },
            {
              "$$hashKey": "object:2041",
              "alias": "/.*sda3_.*/",
              "color": "#F4D598"
            },
            {
              "$$hashKey": "object:2042",
              "alias": "/.*sdb1.*/",
              "color": "#0A50A1"
            },
            {
              "$$hashKey": "object:2043",
              "alias": "/.*sdb2.*/",
              "color": "#BF1B00"
            },
            {
              "$$hashKey": "object:2044",
              "alias": "/.*sdb3.*/",
              "color": "#E0752D"
            },
            {
              "$$hashKey": "object:2045",
              "alias": "/.*sdc1.*/",
              "color": "#962D82"
            },
            {
              "$$hashKey": "object:2046",
              "alias": "/.*sdc2.*/",
              "color": "#614D93"
            },
            {
              "$$hashKey": "object:2047",
              "alias": "/.*sdc3.*/",
              "color": "#9AC48A"
            },
            {
              "$$hashKey": "object:2048",
              "alias": "/.*sdd1.*/",
              "color": "#65C5DB"
            },
            {
              "$$hashKey": "object:2049",
              "alias": "/.*sdd2.*/",
              "color": "#F9934E"
            },
            {
              "$$hashKey": "object:2050",
              "alias": "/.*sdd3.*/",
              "color": "#EA6460"
            },
            {
              "$$hashKey": "object:2051",
              "alias": "/.*sde1.*/",
              "color": "#E0F9D7"
            },
            {
              "$$hashKey": "object:2052",
              "alias": "/.*sdd2.*/",
              "color": "#FCEACA"
            },
            {
              "$$hashKey": "object:2053",
              "alias": "/.*sde3.*/",
              "color": "#F9E2D2"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_disk_discards_completed_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "interval": "",
              "intervalFactor": 4,
              "legendFormat": "{{`device`}} - Discards completed",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "rate(node_disk_discards_merged_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "{{`device`}} - Discards merged",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Disk IOps Discards completed / merged",
          "tooltip": {
            "shared": false,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:2186",
              "format": "iops",
              "label": "IOs",
              "logBase": 1,
              "show": true
            },
            {
              "$$hashKey": "object:2187",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        }
      ],
      "title": "Storage Disk",
      "type": "row"
    },
    {
      "collapsed": true,
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 29
      },
      "id": 271,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "decimals": 3,
          "description": "",
          "fieldConfig": {
            "defaults": {
              "custom": {},
              "links": []
            },
            "overrides": []
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 12
          },
          "hiddenSeries": false,
          "id": 43,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "7.3.7",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_filesystem_avail_bytes{instance=\"$node\",job=\"$job\",device!~'rootfs'}",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 1,
              "legendFormat": "{{`mountpoint`}} - Available",
              "metric": "",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_filesystem_free_bytes{instance=\"$node\",job=\"$job\",device!~'rootfs'}",
              "format": "time_series",
              "hide": true,
              "intervalFactor": 1,
              "legendFormat": "{{`mountpoint`}} - Free",
              "refId": "B",
              "step": 240
            },
            {
              "expr": "node_filesystem_size_bytes{instance=\"$node\",job=\"$job\",device!~'rootfs'}",
              "format": "time_series",
              "hide": true,
              "intervalFactor": 1,
              "legendFormat": "{{`mountpoint`}} - Size",
              "refId": "C",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Filesystem space available",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:3826",
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "$$hashKey": "object:3827",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "description": "",
          "fieldConfig": {
            "defaults": {
              "custom": {},
              "links": []
            },
            "overrides": []
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 12
          },
          "hiddenSeries": false,
          "id": 41,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideZero": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "7.3.7",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_filesystem_files_free{instance=\"$node\",job=\"$job\",device!~'rootfs'}",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 1,
              "legendFormat": "{{`mountpoint`}} - Free file nodes",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "File Nodes Free",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:3894",
              "format": "short",
              "label": "file nodes",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "$$hashKey": "object:3895",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "description": "",
          "fieldConfig": {
            "defaults": {
              "custom": {},
              "links": []
            },
            "overrides": []
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 22
          },
          "hiddenSeries": false,
          "id": 28,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "7.3.7",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_filefd_maximum{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 4,
              "legendFormat": "Max open files",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_filefd_allocated{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "Open files",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "File Descriptor",
          "tooltip": {
            "shared": false,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "files",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "description": "",
          "fieldConfig": {
            "defaults": {
              "custom": {},
              "links": []
            },
            "overrides": []
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 22
          },
          "hiddenSeries": false,
          "id": 219,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideZero": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "7.3.7",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_filesystem_files{instance=\"$node\",job=\"$job\",device!~'rootfs'}",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 1,
              "legendFormat": "{{`mountpoint`}} - File nodes total",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "File Nodes Size",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "file Nodes",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {
            "/ ReadOnly": "#890F02"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "description": "",
          "fieldConfig": {
            "defaults": {
              "custom": {},
              "links": []
            },
            "overrides": []
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 32
          },
          "hiddenSeries": false,
          "id": 44,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": true,
            "hideZero": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "7.3.7",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": true,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_filesystem_readonly{instance=\"$node\",job=\"$job\",device!~'rootfs'}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "{{`mountpoint`}} - ReadOnly",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_filesystem_device_error{instance=\"$node\",job=\"$job\",device!~'rootfs',fstype!~'tmpfs'}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "{{`mountpoint`}} - Device error",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Filesystem in ReadOnly / Error",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:3670",
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "max": "1",
              "min": "0",
              "show": true
            },
            {
              "$$hashKey": "object:3671",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        }
      ],
      "title": "Storage Filesystem",
      "type": "row"
    },
    {
      "collapsed": true,
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 30
      },
      "id": 272,
      "panels": [
        {
          "aliasColors": {
            "receive_packets_eth0": "#7EB26D",
            "receive_packets_lo": "#E24D42",
            "transmit_packets_eth0": "#7EB26D",
            "transmit_packets_lo": "#E24D42"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 30
          },
          "hiddenSeries": false,
          "id": 60,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 300,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Trans.*/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_network_receive_packets_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "{{`device`}} - Receive",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "rate(node_network_transmit_packets_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "{{`device`}} - Transmit",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Network Traffic by Packets",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "pps",
              "label": "packets out (-) / in (+)",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 30
          },
          "hiddenSeries": false,
          "id": 142,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 300,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Trans.*/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_network_receive_errs_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "{{`device`}} - Receive errors",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "rate(node_network_transmit_errs_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "{{`device`}} - Rransmit errors",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Network Traffic Errors",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "pps",
              "label": "packets out (-) / in (+)",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 40
          },
          "hiddenSeries": false,
          "id": 143,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 300,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Trans.*/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_network_receive_drop_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "{{`device`}} - Receive drop",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "rate(node_network_transmit_drop_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "{{`device`}} - Transmit drop",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Network Traffic Drop",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "pps",
              "label": "packets out (-) / in (+)",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 40
          },
          "hiddenSeries": false,
          "id": 141,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 300,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Trans.*/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_network_receive_compressed_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "{{`device`}} - Receive compressed",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "rate(node_network_transmit_compressed_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "{{`device`}} - Transmit compressed",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Network Traffic Compressed",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "pps",
              "label": "packets out (-) / in (+)",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 50
          },
          "hiddenSeries": false,
          "id": 146,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 300,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Trans.*/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_network_receive_multicast_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "{{`device`}} - Receive multicast",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Network Traffic Multicast",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "pps",
              "label": "packets out (-) / in (+)",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 50
          },
          "hiddenSeries": false,
          "id": 144,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 300,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Trans.*/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_network_receive_fifo_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "{{`device`}} - Receive fifo",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "rate(node_network_transmit_fifo_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "{{`device`}} - Transmit fifo",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Network Traffic Fifo",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "pps",
              "label": "packets out (-) / in (+)",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 60
          },
          "hiddenSeries": false,
          "id": 145,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 300,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "$$hashKey": "object:576",
              "alias": "/.*Trans.*/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_network_receive_frame_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 1,
              "legendFormat": "{{`device`}} - Receive frame",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Network Traffic Frame",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:589",
              "format": "pps",
              "label": "packets out (-) / in (+)",
              "logBase": 1,
              "show": true
            },
            {
              "$$hashKey": "object:590",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 60
          },
          "hiddenSeries": false,
          "id": 231,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 300,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_network_transmit_carrier_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "{{`device`}} - Statistic transmit_carrier",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Network Traffic Carrier",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 70
          },
          "hiddenSeries": false,
          "id": 232,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 300,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Trans.*/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_network_transmit_colls_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "{{`device`}} - Transmit colls",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Network Traffic Colls",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 70
          },
          "hiddenSeries": false,
          "id": 61,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "$$hashKey": "object:663",
              "alias": "NF conntrack limit",
              "color": "#890F02",
              "fill": 0
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_nf_conntrack_entries{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "NF conntrack entries",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_nf_conntrack_entries_limit{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "NF conntrack limit",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "NF Contrack",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:678",
              "format": "short",
              "label": "entries",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "$$hashKey": "object:679",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 80
          },
          "hiddenSeries": false,
          "id": 230,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_arp_entries{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "{{` device `}} - ARP entries",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "ARP Entries",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "Entries",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 80
          },
          "hiddenSeries": false,
          "id": 288,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 1,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_network_mtu_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "{{` device `}} - Bytes",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "MTU",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "decimals": 0,
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 90
          },
          "hiddenSeries": false,
          "id": 280,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 1,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_network_speed_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "{{` device `}} - Speed",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Speed",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "decimals": 0,
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 90
          },
          "hiddenSeries": false,
          "id": 289,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 1,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_network_transmit_queue_length{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "{{` device `}} -   Interface transmit queue length",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Queue Length",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "decimals": 0,
              "format": "none",
              "label": "packets",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 100
          },
          "hiddenSeries": false,
          "id": 290,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 300,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "$$hashKey": "object:232",
              "alias": "/.*Dropped.*/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_softnet_processed_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "CPU {{`cpu`}} - Processed",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "rate(node_softnet_dropped_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "CPU {{`cpu`}} - Dropped",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Softnet Packets",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:207",
              "format": "short",
              "label": "packetes drop (-) / process (+)",
              "logBase": 1,
              "show": true
            },
            {
              "$$hashKey": "object:208",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 100
          },
          "hiddenSeries": false,
          "id": 310,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 300,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_softnet_times_squeezed_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "CPU {{`cpu`}} - Squeezed",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Softnet Out of Quota",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:207",
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "show": true
            },
            {
              "$$hashKey": "object:208",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 110
          },
          "hiddenSeries": false,
          "id": 309,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 300,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_network_up{operstate=\"up\",instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "{{`interface`}} - Operational state UP",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_network_carrier{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "instant": false,
              "legendFormat": "{{`device`}} - Physical link state",
              "refId": "B"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Network Operational Status",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        }
      ],
      "title": "Network Traffic",
      "type": "row"
    },
    {
      "collapsed": true,
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 31
      },
      "id": 273,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fieldConfig": {
            "defaults": {
              "custom": {},
              "links": []
            },
            "overrides": []
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 32
          },
          "hiddenSeries": false,
          "id": 63,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 300,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "7.3.7",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_sockstat_TCP_alloc{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "TCP_alloc - Allocated sockets",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_sockstat_TCP_inuse{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "TCP_inuse - Tcp sockets currently in use",
              "refId": "B",
              "step": 240
            },
            {
              "expr": "node_sockstat_TCP_mem{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "hide": true,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "TCP_mem - Used memory for tcp",
              "refId": "C",
              "step": 240
            },
            {
              "expr": "node_sockstat_TCP_orphan{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "TCP_orphan - Orphan sockets",
              "refId": "D",
              "step": 240
            },
            {
              "expr": "node_sockstat_TCP_tw{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "TCP_tw - Sockets wating close",
              "refId": "E",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Sockstat TCP",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fieldConfig": {
            "defaults": {
              "custom": {},
              "links": []
            },
            "overrides": []
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 32
          },
          "hiddenSeries": false,
          "id": 124,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 300,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "7.3.7",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_sockstat_UDPLITE_inuse{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "UDPLITE_inuse - Udplite sockets currently in use",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_sockstat_UDP_inuse{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "UDP_inuse - Udp sockets currently in use",
              "refId": "B",
              "step": 240
            },
            {
              "expr": "node_sockstat_UDP_mem{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "UDP_mem - Used memory for udp",
              "refId": "C",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Sockstat UDP",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fieldConfig": {
            "defaults": {
              "custom": {},
              "links": []
            },
            "overrides": []
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 42
          },
          "hiddenSeries": false,
          "id": 125,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 300,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "7.3.7",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_sockstat_FRAG_inuse{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "FRAG_inuse - Frag sockets currently in use",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_sockstat_RAW_inuse{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "RAW_inuse - Raw sockets currently in use",
              "refId": "C",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Sockstat FRAG / RAW",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:1572",
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "$$hashKey": "object:1573",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fieldConfig": {
            "defaults": {
              "custom": {},
              "links": []
            },
            "overrides": []
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 42
          },
          "hiddenSeries": false,
          "id": 220,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 300,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "7.3.7",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_sockstat_TCP_mem_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "mem_bytes - TCP sockets in that state",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_sockstat_UDP_mem_bytes{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "mem_bytes - UDP sockets in that state",
              "refId": "B",
              "step": 240
            },
            {
              "expr": "node_sockstat_FRAG_memory{instance=\"$node\",job=\"$job\"}",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "FRAG_memory - Used memory for frag",
              "refId": "C"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Sockstat Memory Size",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fieldConfig": {
            "defaults": {
              "custom": {},
              "links": []
            },
            "overrides": []
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 52
          },
          "hiddenSeries": false,
          "id": 126,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 300,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "7.3.7",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_sockstat_sockets_used{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "Sockets_used - Sockets currently in use",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Sockstat Used",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "sockets",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        }
      ],
      "title": "Network Sockstat",
      "type": "row"
    },
    {
      "collapsed": true,
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 32
      },
      "id": 274,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fieldConfig": {
            "defaults": {
              "custom": {},
              "links": []
            },
            "overrides": []
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 33
          },
          "height": "",
          "hiddenSeries": false,
          "id": 221,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 300,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 12,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "7.3.7",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "$$hashKey": "object:1876",
              "alias": "/.*Out.*/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_netstat_IpExt_InOctets{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "InOctets - Received octets",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "rate(node_netstat_IpExt_OutOctets{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "intervalFactor": 1,
              "legendFormat": "OutOctets - Sent octets",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Netstat IP In / Out Octets",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:1889",
              "format": "short",
              "label": "octects out (-) / in (+)",
              "logBase": 1,
              "show": true
            },
            {
              "$$hashKey": "object:1890",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fieldConfig": {
            "defaults": {
              "custom": {},
              "links": []
            },
            "overrides": []
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 33
          },
          "height": "",
          "hiddenSeries": false,
          "id": 81,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 300,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "7.3.7",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_netstat_Ip_Forwarding{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "Forwarding - IP forwarding",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Netstat IP Forwarding",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:1957",
              "format": "short",
              "label": "datagrams",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "$$hashKey": "object:1958",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fieldConfig": {
            "defaults": {
              "custom": {},
              "links": []
            },
            "overrides": []
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 43
          },
          "height": "",
          "hiddenSeries": false,
          "id": 115,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 12,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "7.3.7",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Out.*/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_netstat_Icmp_InMsgs{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "InMsgs -  Messages which the entity received. Note that this counter includes all those counted by icmpInErrors",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "rate(node_netstat_Icmp_OutMsgs{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "OutMsgs - Messages which this entity attempted to send. Note that this counter includes all those counted by icmpOutErrors",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "ICMP In / Out",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "messages out (-) / in (+)",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fieldConfig": {
            "defaults": {
              "custom": {},
              "links": []
            },
            "overrides": []
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 43
          },
          "height": "",
          "hiddenSeries": false,
          "id": 50,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 12,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "7.3.7",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Out.*/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_netstat_Icmp_InErrors{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "InErrors - Messages which the entity received but determined as having ICMP-specific errors (bad ICMP checksums, bad length, etc.)",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "ICMP Errors",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "messages out (-) / in (+)",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fieldConfig": {
            "defaults": {
              "custom": {},
              "links": []
            },
            "overrides": []
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 53
          },
          "height": "",
          "hiddenSeries": false,
          "id": 55,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 12,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "7.3.7",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Out.*/",
              "transform": "negative-Y"
            },
            {
              "alias": "/.*Snd.*/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_netstat_Udp_InDatagrams{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "InDatagrams - Datagrams received",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "rate(node_netstat_Udp_OutDatagrams{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "OutDatagrams - Datagrams sent",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "UDP In / Out",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "datagrams out (-) / in (+)",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fieldConfig": {
            "defaults": {
              "custom": {},
              "links": []
            },
            "overrides": []
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 53
          },
          "height": "",
          "hiddenSeries": false,
          "id": 109,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 12,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "7.3.7",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_netstat_Udp_InErrors{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "InErrors - UDP Datagrams that could not be delivered to an application",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "rate(node_netstat_Udp_NoPorts{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "NoPorts - UDP Datagrams received on a port with no listener",
              "refId": "B",
              "step": 240
            },
            {
              "expr": "rate(node_netstat_UdpLite_InErrors{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "interval": "",
              "legendFormat": "InErrors Lite - UDPLite Datagrams that could not be delivered to an application",
              "refId": "C"
            },
            {
              "expr": "rate(node_netstat_Udp_RcvbufErrors{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "RcvbufErrors - UDP buffer errors received",
              "refId": "D",
              "step": 240
            },
            {
              "expr": "rate(node_netstat_Udp_SndbufErrors{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "SndbufErrors - UDP buffer errors send",
              "refId": "E",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "UDP Errors",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:4232",
              "format": "short",
              "label": "datagrams",
              "logBase": 1,
              "show": true
            },
            {
              "$$hashKey": "object:4233",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fieldConfig": {
            "defaults": {
              "custom": {},
              "links": []
            },
            "overrides": []
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 63
          },
          "height": "",
          "hiddenSeries": false,
          "id": 299,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 12,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "7.3.7",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Out.*/",
              "transform": "negative-Y"
            },
            {
              "alias": "/.*Snd.*/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_netstat_Tcp_InSegs{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "instant": false,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "InSegs - Segments received, including those received in error. This count includes segments received on currently established connections",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "rate(node_netstat_Tcp_OutSegs{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "OutSegs - Segments sent, including those on current connections but excluding those containing only retransmitted octets",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "TCP In / Out",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "datagrams out (-) / in (+)",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "description": "",
          "fieldConfig": {
            "defaults": {
              "custom": {},
              "links": []
            },
            "overrides": []
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 63
          },
          "height": "",
          "hiddenSeries": false,
          "id": 104,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 12,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "7.3.7",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_netstat_TcpExt_ListenOverflows{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "ListenOverflows - Times the listen queue of a socket overflowed",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "rate(node_netstat_TcpExt_ListenDrops{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "ListenDrops - SYNs to LISTEN sockets ignored",
              "refId": "B",
              "step": 240
            },
            {
              "expr": "rate(node_netstat_TcpExt_TCPSynRetrans{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "TCPSynRetrans - SYN-SYN/ACK retransmits to break down retransmissions in SYN, fast/timeout retransmits",
              "refId": "C",
              "step": 240
            },
            {
              "expr": "rate(node_netstat_Tcp_RetransSegs{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "interval": "",
              "legendFormat": "RetransSegs - Segments retransmitted - that is, the number of TCP segments transmitted containing one or more previously transmitted octets",
              "refId": "D"
            },
            {
              "expr": "rate(node_netstat_Tcp_InErrs{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "interval": "",
              "legendFormat": "InErrs - Segments received in error (e.g., bad TCP checksums)",
              "refId": "E"
            },
            {
              "expr": "rate(node_netstat_Tcp_OutRsts{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "interval": "",
              "legendFormat": "OutRsts - Segments sent with RST flag",
              "refId": "F"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "TCP Errors",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fieldConfig": {
            "defaults": {
              "custom": {},
              "links": []
            },
            "overrides": []
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 73
          },
          "height": "",
          "hiddenSeries": false,
          "id": 85,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 12,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "7.3.7",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "$$hashKey": "object:454",
              "alias": "/.*MaxConn *./",
              "color": "#890F02",
              "fill": 0
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_netstat_Tcp_CurrEstab{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "CurrEstab - TCP connections for which the current state is either ESTABLISHED or CLOSE- WAIT",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_netstat_Tcp_MaxConn{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "MaxConn - Limit on the total number of TCP connections the entity can support (Dinamic is \"-1\")",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "TCP Connections",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:469",
              "format": "short",
              "label": "connections",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "$$hashKey": "object:470",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "description": "",
          "fieldConfig": {
            "defaults": {
              "custom": {},
              "links": []
            },
            "overrides": []
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 73
          },
          "height": "",
          "hiddenSeries": false,
          "id": 91,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 12,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "7.3.7",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Sent.*/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_netstat_TcpExt_SyncookiesFailed{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "SyncookiesFailed - Invalid SYN cookies received",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "rate(node_netstat_TcpExt_SyncookiesRecv{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "SyncookiesRecv - SYN cookies received",
              "refId": "B",
              "step": 240
            },
            {
              "expr": "rate(node_netstat_TcpExt_SyncookiesSent{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "SyncookiesSent - SYN cookies sent",
              "refId": "C",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "TCP SynCookie",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter out (-) / in (+)",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "fieldConfig": {
            "defaults": {
              "custom": {},
              "links": []
            },
            "overrides": []
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 83
          },
          "height": "",
          "hiddenSeries": false,
          "id": 82,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 12,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "7.3.7",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "rate(node_netstat_Tcp_ActiveOpens{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "ActiveOpens - TCP connections that have made a direct transition to the SYN-SENT state from the CLOSED state",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "rate(node_netstat_Tcp_PassiveOpens{instance=\"$node\",job=\"$job\"}[$__rate_interval])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "PassiveOpens - TCP connections that have made a direct transition to the SYN-RCVD state from the LISTEN state",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "TCP Direct Transition",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "connections",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        }
      ],
      "title": "Network Netstat",
      "type": "row"
    },
    {
      "collapsed": true,
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 33
      },
      "id": 279,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "description": "",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 54
          },
          "hiddenSeries": false,
          "id": 40,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": true,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_scrape_collector_duration_seconds{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "{{`collector`}} - Scrape duration",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Node Exporter Scrape Time",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "s",
              "label": "seconds",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "description": "",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 54
          },
          "hiddenSeries": false,
          "id": 157,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "$$hashKey": "object:1969",
              "alias": "/.*error.*/",
              "color": "#F2495C",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": true,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_scrape_collector_success{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "{{`collector`}} - Scrape success",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_textfile_scrape_error{instance=\"$node\",job=\"$job\"}",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "{{`collector`}} - Scrape textfile error (1 = true)",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Node Exporter Scrape",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:1484",
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "show": true
            },
            {
              "$$hashKey": "object:1485",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        }
      ],
      "title": "Node Exporter",
      "type": "row"
    }
  ],
  "refresh": "5s",
  "schemaVersion": 36,
  "style": "dark",
  "tags": [
    "linux"
  ],
  "templating": {
    "list": [
      {
        "current": {
          "selected": false,
          "text": "Prometheus",
          "value": "Prometheus"
        },
        "hide": 0,
        "includeAll": false,
        "label": "datasource",
        "multi": false,
        "name": "DS_PROMETHEUS",
        "options": [],
        "query": "prometheus",
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "type": "datasource"
      },
      {
        "current": {
          "selected": false,
          "text": "node-exporter",
          "value": "node-exporter"
        },
        "datasource": {
          "type": "prometheus",
          "uid": "PBFA97CFB590B2093"
        },
        "definition": "",
        "hide": 0,
        "includeAll": false,
        "label": "Job",
        "multi": false,
        "name": "job",
        "options": [],
        "query": {
          "query": "label_values(node_uname_info, job)",
          "refId": "Prometheus-job-Variable-Query"
        },
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "sort": 1,
        "tagValuesQuery": "",
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      },
      {
        "current": {
          "selected": false,
          "text": "node-exporter:9100",
          "value": "node-exporter:9100"
        },
        "datasource": {
          "type": "prometheus",
          "uid": "PBFA97CFB590B2093"
        },
        "definition": "label_values(node_uname_info{job=\"$job\"}, instance)",
        "hide": 0,
        "includeAll": false,
        "label": "Host:",
        "multi": false,
        "name": "node",
        "options": [],
        "query": {
          "query": "label_values(node_uname_info{job=\"$job\"}, instance)",
          "refId": "Prometheus-node-Variable-Query"
        },
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "sort": 1,
        "tagValuesQuery": "",
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      },
      {
        "current": {
          "selected": false,
          "text": "[a-z]+|nvme[0-9]+n[0-9]+|mmcblk[0-9]+",
          "value": "[a-z]+|nvme[0-9]+n[0-9]+|mmcblk[0-9]+"
        },
        "hide": 2,
        "includeAll": false,
        "multi": false,
        "name": "diskdevices",
        "options": [
          {
            "selected": true,
            "text": "[a-z]+|nvme[0-9]+n[0-9]+|mmcblk[0-9]+",
            "value": "[a-z]+|nvme[0-9]+n[0-9]+|mmcblk[0-9]+"
          }
        ],
        "query": "[a-z]+|nvme[0-9]+n[0-9]+|mmcblk[0-9]+",
        "skipUrlSync": false,
        "type": "custom"
      }
    ]
  },
  "time": {
    "from": "now-30m",
    "to": "now"
  },
  "timepicker": {
    "refresh_intervals": [
      "5s",
      "10s",
      "30s",
      "1m",
      "5m",
      "15m",
      "30m",
      "1h",
      "2h",
      "1d"
    ],
    "time_options": [
      "5m",
      "15m",
      "1h",
      "6h",
      "12h",
      "24h",
      "2d",
      "7d",
      "30d"
    ]
  },
  "timezone": "browser",
  "title": "Node Exporter",
  "uid": "rYdddlPWk",
  "version": 1,
  "weekStart": ""
}
{{- end }}