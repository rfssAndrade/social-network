{{- define "socialnetwork.templates.grafana.grafana-dashboard-kube-state-metrics.json"  }}

{
    "annotations": {
      "list": [
        {
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
    "description": "Summary metrics about kube-state-metrics v2 version(https://github.com/kubernetes/kube-state-metrics); Referenced 6417",
    "editable": true,
    "fiscalYearStartMonth": 0,
    "gnetId": 16520,
    "graphTooltip": 1,
    "id": 6,
    "links": [
      {
        "asDropdown": true,
        "icon": "external link",
        "includeVars": true,
        "keepTime": false,
        "tags": [
          "kubernetes-app"
        ],
        "title": "Dashboards",
        "type": "dashboards"
      }
    ],
    "liveNow": false,
    "panels": [
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
          "y": 0
        },
        "id": 58,
        "panels": [
          {
            "datasource": {
              "uid": "$datasource"
            },
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
                      "color": "#299c46"
                    },
                    {
                      "color": "rgba(237, 129, 40, 0.89)",
                      "value": 80
                    },
                    {
                      "color": "#d44a3a",
                      "value": 90
                    }
                  ]
                },
                "unit": "percentunit"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 4,
              "w": 6,
              "x": 0,
              "y": 1
            },
            "id": 4,
            "links": [],
            "maxDataPoints": 100,
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
              "showThresholdMarkers": true,
              "text": {}
            },
            "pluginVersion": "8.2.0",
            "targets": [
              {
                "datasource": {
                  "uid": "$datasource"
                },
                "expr": "sum(kube_pod_info{cluster=~\"$cluster\",node=~\"$node\"}) / sum(kube_node_status_allocatable{cluster=~\"$cluster\",resource=\"pods\",node=~\"$node\"})",
                "format": "time_series",
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "",
                "refId": "A"
              }
            ],
            "title": "Cluster Pod Requested",
            "type": "gauge"
          },
          {
            "datasource": {
              "uid": "$datasource"
            },
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
                      "color": "#299c46"
                    },
                    {
                      "color": "rgba(237, 129, 40, 0.89)",
                      "value": 80
                    },
                    {
                      "color": "#d44a3a",
                      "value": 90
                    }
                  ]
                },
                "unit": "percentunit"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 4,
              "w": 6,
              "x": 6,
              "y": 1
            },
            "id": 5,
            "links": [],
            "maxDataPoints": 100,
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
              "showThresholdMarkers": true,
              "text": {}
            },
            "pluginVersion": "8.2.0",
            "targets": [
              {
                "datasource": {
                  "uid": "$datasource"
                },
                "expr": "sum(kube_pod_container_resource_requests{cluster=~\"$cluster\",resource=\"cpu\",node=~\"$node\"})/ sum(kube_node_status_allocatable{node=~\"$node\",cluster=~\"$cluster\",resource=\"cpu\"})",
                "format": "time_series",
                "intervalFactor": 1,
                "refId": "A"
              }
            ],
            "title": "Cluster CPU Requested",
            "type": "gauge"
          },
          {
            "datasource": {
              "uid": "$datasource"
            },
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
                      "color": "#299c46"
                    },
                    {
                      "color": "rgba(237, 129, 40, 0.89)",
                      "value": 80
                    },
                    {
                      "color": "#d44a3a",
                      "value": 90
                    }
                  ]
                },
                "unit": "percentunit"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 4,
              "w": 6,
              "x": 12,
              "y": 1
            },
            "id": 6,
            "links": [],
            "maxDataPoints": 100,
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
              "showThresholdMarkers": true,
              "text": {}
            },
            "pluginVersion": "8.2.0",
            "targets": [
              {
                "datasource": {
                  "uid": "$datasource"
                },
                "expr": "sum(kube_pod_container_resource_requests{cluster=~\"$cluster\",resource=\"memory\",node=~\"$node\"}) / sum(kube_node_status_allocatable{node=~\"$node\",cluster=~\"$cluster\",resource=\"memory\"})",
                "format": "time_series",
                "intervalFactor": 1,
                "refId": "A"
              }
            ],
            "title": "Cluster Memory  Requested",
            "type": "gauge"
          },
          {
            "aliasColors": {},
            "bars": false,
            "dashLength": 10,
            "dashes": false,
            "datasource": {
              "uid": "$datasource"
            },
            "fill": 1,
            "fillGradient": 0,
            "gridPos": {
              "h": 5,
              "w": 6,
              "x": 0,
              "y": 5
            },
            "hiddenSeries": false,
            "id": 9,
            "legend": {
              "avg": false,
              "current": false,
              "max": false,
              "min": false,
              "show": true,
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
            "pluginVersion": "8.2.0",
            "pointradius": 5,
            "points": false,
            "renderer": "flot",
            "seriesOverrides": [],
            "spaceLength": 10,
            "stack": false,
            "steppedLine": false,
            "targets": [
              {
                "datasource": {
                  "uid": "$datasource"
                },
                "expr": "sum(kube_node_status_allocatable{cluster=~\"$cluster\",resource=\"pods\",node=~\"$node\"})",
                "format": "time_series",
                "intervalFactor": 1,
                "legendFormat": "allocatable",
                "refId": "A"
              },
              {
                "datasource": {
                  "uid": "$datasource"
                },
                "expr": "sum(kube_pod_info{node=~\"$node\",cluster=~\"$cluster\"})",
                "format": "time_series",
                "intervalFactor": 1,
                "legendFormat": "requested",
                "refId": "C"
              }
            ],
            "thresholds": [],
            "timeRegions": [],
            "title": "Cluster Pod Capacity",
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
                "label": "pods",
                "logBase": 1,
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
            "aliasColors": {},
            "bars": false,
            "dashLength": 10,
            "dashes": false,
            "datasource": {
              "uid": "$datasource"
            },
            "fill": 1,
            "fillGradient": 0,
            "gridPos": {
              "h": 5,
              "w": 6,
              "x": 6,
              "y": 5
            },
            "hiddenSeries": false,
            "id": 10,
            "legend": {
              "avg": false,
              "current": false,
              "max": false,
              "min": false,
              "show": true,
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
            "pluginVersion": "8.2.0",
            "pointradius": 5,
            "points": false,
            "renderer": "flot",
            "seriesOverrides": [],
            "spaceLength": 10,
            "stack": false,
            "steppedLine": false,
            "targets": [
              {
                "datasource": {
                  "uid": "$datasource"
                },
                "expr": "sum(kube_node_status_capacity{node=~\"$node\",cluster=~\"$cluster\",resource=\"cpu\"})",
                "format": "time_series",
                "intervalFactor": 1,
                "legendFormat": "allocatable",
                "refId": "A"
              },
              {
                "datasource": {
                  "uid": "$datasource"
                },
                "expr": "sum(kube_node_status_allocatable{node=~\"$node\",cluster=~\"$cluster\",resource=\"cpu\"})",
                "format": "time_series",
                "intervalFactor": 1,
                "legendFormat": "capacity",
                "refId": "B"
              },
              {
                "datasource": {
                  "uid": "$datasource"
                },
                "expr": "sum(kube_pod_container_resource_requests{cluster=~\"$cluster\",resource=\"cpu\",node=~\"$node\"})",
                "format": "time_series",
                "intervalFactor": 1,
                "legendFormat": "requested",
                "refId": "C"
              },
              {
                "datasource": {
                  "uid": "$datasource"
                },
                "expr": "sum(kube_pod_container_resource_limits{cluster=~\"$cluster\",resource=\"cpu\",node=~\"$node\"})",
                "format": "time_series",
                "intervalFactor": 1,
                "legendFormat": "limited",
                "refId": "D"
              }
            ],
            "thresholds": [],
            "timeRegions": [],
            "title": "Cluster CPU Capacity",
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
                "label": "cores",
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
              "uid": "$datasource"
            },
            "fill": 1,
            "fillGradient": 0,
            "gridPos": {
              "h": 5,
              "w": 6,
              "x": 12,
              "y": 5
            },
            "hiddenSeries": false,
            "id": 11,
            "legend": {
              "avg": false,
              "current": false,
              "max": false,
              "min": false,
              "show": true,
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
            "pluginVersion": "8.2.0",
            "pointradius": 5,
            "points": false,
            "renderer": "flot",
            "seriesOverrides": [],
            "spaceLength": 10,
            "stack": false,
            "steppedLine": false,
            "targets": [
              {
                "datasource": {
                  "uid": "$datasource"
                },
                "expr": "sum(kube_node_status_allocatable{node=~\"$node\",cluster=~\"$cluster\",resource=\"memory\"})",
                "format": "time_series",
                "intervalFactor": 1,
                "legendFormat": "allocatable",
                "refId": "A"
              },
              {
                "datasource": {
                  "uid": "$datasource"
                },
                "expr": "sum(kube_node_status_capacity{node=~\"$node\",cluster=~\"$cluster\",resource=\"memory\"})",
                "format": "time_series",
                "intervalFactor": 1,
                "legendFormat": "capacity",
                "refId": "B"
              },
              {
                "datasource": {
                  "uid": "$datasource"
                },
                "expr": "sum(kube_pod_container_resource_requests{cluster=~\"$cluster\",resource=\"memory\",node=~\"$node\"})",
                "format": "time_series",
                "intervalFactor": 1,
                "legendFormat": "requested",
                "refId": "C"
              },
              {
                "datasource": {
                  "uid": "$datasource"
                },
                "expr": "sum(kube_pod_container_resource_limits{cluster=~\"$cluster\",resource=\"memory\",node=~\"$node\"})",
                "format": "time_series",
                "intervalFactor": 1,
                "legendFormat": "limited",
                "refId": "D"
              }
            ],
            "thresholds": [],
            "timeRegions": [],
            "title": "Cluster Mem Capacity",
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
                "format": "bits",
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
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "PBFA97CFB590B2093"
            },
            "refId": "A"
          }
        ],
        "title": "Cluster",
        "type": "row"
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
          "y": 1
        },
        "id": 22,
        "panels": [],
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "PBFA97CFB590B2093"
            },
            "refId": "A"
          }
        ],
        "title": "Node",
        "type": "row"
      },
      {
        "datasource": {
          "uid": "$datasource"
        },
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
            "unit": "none"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 3,
          "w": 4,
          "x": 0,
          "y": 2
        },
        "id": 24,
        "links": [],
        "maxDataPoints": 100,
        "options": {
          "colorMode": "none",
          "graphMode": "none",
          "justifyMode": "auto",
          "orientation": "horizontal",
          "reduceOptions": {
            "calcs": [
              "mean"
            ],
            "fields": "",
            "values": false
          },
          "text": {},
          "textMode": "auto"
        },
        "pluginVersion": "9.1.4",
        "targets": [
          {
            "datasource": {
              "uid": "$datasource"
            },
            "expr": "sum(kube_node_info{cluster=~\"$cluster\"})",
            "format": "time_series",
            "instant": true,
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "",
            "refId": "A"
          }
        ],
        "title": "Number Of Nodes",
        "type": "stat"
      },
      {
        "datasource": {
          "uid": "$datasource"
        },
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
                  "color": "#299c46",
                  "value": null
                },
                {
                  "color": "rgba(237, 129, 40, 0.89)",
                  "value": 1
                },
                {
                  "color": "#d44a3a"
                }
              ]
            },
            "unit": "none"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 3,
          "w": 4,
          "x": 4,
          "y": 2
        },
        "id": 26,
        "links": [],
        "maxDataPoints": 100,
        "options": {
          "colorMode": "background",
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
          "text": {},
          "textMode": "auto"
        },
        "pluginVersion": "9.1.4",
        "targets": [
          {
            "datasource": {
              "uid": "$datasource"
            },
            "expr": "sum(kube_node_spec_unschedulable{cluster=~\"$cluster\"})",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "",
            "refId": "A"
          }
        ],
        "title": "Nodes Unavailable",
        "type": "stat"
      },
      {
        "aliasColors": {},
        "bars": false,
        "dashLength": 10,
        "dashes": false,
        "datasource": {
          "uid": "$datasource"
        },
        "fill": 1,
        "fillGradient": 0,
        "gridPos": {
          "h": 3,
          "w": 8,
          "x": 8,
          "y": 2
        },
        "hiddenSeries": false,
        "id": 78,
        "legend": {
          "alignAsTable": true,
          "avg": false,
          "current": false,
          "max": false,
          "min": false,
          "rightSide": true,
          "show": true,
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
        "pluginVersion": "9.1.4",
        "pointradius": 2,
        "points": false,
        "renderer": "flot",
        "seriesOverrides": [],
        "spaceLength": 10,
        "stack": false,
        "steppedLine": false,
        "targets": [
          {
            "datasource": {
              "uid": "$datasource"
            },
            "exemplar": true,
            "expr": "kube_node_status_condition{condition=\"Ready\",status=\"false\"}",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat":  {{ printf "{{node}}" | quote }},
            "refId": "A"
          }
        ],
        "thresholds": [],
        "timeRegions": [],
        "title": "Node NotReady",
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
            "$$hashKey": "object:1449",
            "decimals": 0,
            "format": "short",
            "logBase": 1,
            "show": true
          },
          {
            "$$hashKey": "object:1450",
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
        "aliasColors": {},
        "bars": false,
        "dashLength": 10,
        "dashes": false,
        "datasource": {
          "uid": "$datasource"
        },
        "fill": 1,
        "fillGradient": 0,
        "gridPos": {
          "h": 3,
          "w": 8,
          "x": 16,
          "y": 2
        },
        "hiddenSeries": false,
        "id": 51,
        "legend": {
          "alignAsTable": true,
          "avg": false,
          "current": false,
          "max": false,
          "min": false,
          "rightSide": true,
          "show": true,
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
        "pluginVersion": "9.1.4",
        "pointradius": 2,
        "points": false,
        "renderer": "flot",
        "seriesOverrides": [],
        "spaceLength": 10,
        "stack": false,
        "steppedLine": false,
        "targets": [
          {
            "datasource": {
              "uid": "$datasource"
            },
            "exemplar": true,
            "expr": "kube_node_status_condition{condition=\"DiskPressure\",status=\"true\"}",
            "format": "time_series",
            "instant": false,
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": {{ printf "{{node}} {{condition}}" | quote }},
            "refId": "A"
          },
          {
            "datasource": {
              "uid": "$datasource"
            },
            "expr": "kube_node_status_condition{condition=\"MemoryPressure\",node=~\"$node\",cluster=~\"$cluster\",status=\"true\"}==1",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": {{ printf "{{node}} {{condition}}" | quote }},
            "refId": "B"
          },
          {
            "datasource": {
              "uid": "$datasource"
            },
            "expr": "kube_node_status_condition{condition=~\"PIDPressure\",node=~\"$node\",cluster=~\"$cluster\",status=\"true\"}==1",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": {{ printf "{{node}} {{condition}}" | quote }},
            "refId": "C"
          }
        ],
        "thresholds": [],
        "timeRegions": [],
        "title": "Node Pressure",
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
            "$$hashKey": "object:1539",
            "decimals": 0,
            "format": "short",
            "logBase": 1,
            "show": true
          },
          {
            "$$hashKey": "object:1540",
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
        "aliasColors": {},
        "bars": false,
        "dashLength": 10,
        "dashes": false,
        "datasource": {
          "type": "prometheus",
          "uid": "PBFA97CFB590B2093"
        },
        "decimals": 0,
        "fill": 1,
        "fillGradient": 0,
        "gridPos": {
          "h": 7,
          "w": 24,
          "x": 0,
          "y": 5
        },
        "hiddenSeries": false,
        "id": 88,
        "legend": {
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
        "nullPointMode": "null",
        "options": {
          "alertThreshold": true
        },
        "percentage": false,
        "pluginVersion": "9.1.4",
        "pointradius": 2,
        "points": false,
        "renderer": "flot",
        "seriesOverrides": [],
        "spaceLength": 10,
        "stack": false,
        "steppedLine": false,
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "PBFA97CFB590B2093"
            },
            "expr": "sum(kube_node_info{cluster=~\"$cluster\"})",
            "interval": "",
            "legendFormat": "",
            "refId": "A"
          }
        ],
        "thresholds": [],
        "timeRegions": [],
        "title": "node number",
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
            "logBase": 1,
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
        "collapsed": false,
        "datasource": {
          "type": "prometheus",
          "uid": "PBFA97CFB590B2093"
        },
        "gridPos": {
          "h": 1,
          "w": 24,
          "x": 0,
          "y": 12
        },
        "id": 14,
        "panels": [],
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "PBFA97CFB590B2093"
            },
            "refId": "A"
          }
        ],
        "title": "Deployments",
        "type": "row"
      },
      {
        "columns": [],
        "datasource": {
          "uid": "$datasource"
        },
        "fontSize": "100%",
        "gridPos": {
          "h": 5,
          "w": 6,
          "x": 0,
          "y": 13
        },
        "id": 16,
        "links": [],
        "scroll": true,
        "showHeader": true,
        "sort": {
          "col": 2,
          "desc": true
        },
        "styles": [
          {
            "alias": "Time",
            "align": "auto",
            "dateFormat": "YYYY-MM-DD HH:mm:ss",
            "pattern": "Time",
            "type": "date"
          },
          {
            "alias": "",
            "align": "auto",
            "colorMode": "row",
            "colors": [
              "rgba(245, 54, 54, 0.9)",
              "rgba(237, 129, 40, 0.89)",
              "rgba(50, 172, 45, 0.97)"
            ],
            "decimals": 0,
            "pattern": "Metric",
            "thresholds": [
              "0",
              "0",
              ".9"
            ],
            "type": "string",
            "unit": "none"
          },
          {
            "alias": "",
            "align": "auto",
            "colorMode": "row",
            "colors": [
              "rgba(245, 54, 54, 0.9)",
              "rgba(237, 129, 40, 0.89)",
              "rgba(50, 172, 45, 0.97)"
            ],
            "dateFormat": "YYYY-MM-DD HH:mm:ss",
            "decimals": 0,
            "link": false,
            "pattern": "Value",
            "thresholds": [
              "0",
              "1"
            ],
            "type": "number",
            "unit": "none"
          }
        ],
        "targets": [
          {
            "datasource": {
              "uid": "$datasource"
            },
            "expr": "kube_deployment_status_replicas{namespace=~\"$namespace\",cluster=~\"$cluster\"}",
            "format": "time_series",
            "instant": true,
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": {{ printf "{{ deployment }}" | quote }},
            "refId": "A"
          }
        ],
        "title": "Deployment Replicas - Up To Date",
        "transform": "timeseries_to_rows",
        "type": "table-old"
      },
      {
        "datasource": {
          "uid": "$datasource"
        },
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
            "unit": "none"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 5,
          "w": 6,
          "x": 6,
          "y": 13
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
              "mean"
            ],
            "fields": "",
            "values": false
          },
          "text": {},
          "textMode": "auto"
        },
        "pluginVersion": "9.1.4",
        "targets": [
          {
            "datasource": {
              "uid": "$datasource"
            },
            "expr": "sum(kube_deployment_status_replicas{namespace=~\"$namespace\",cluster=~\"$cluster\"})",
            "format": "time_series",
            "intervalFactor": 1,
            "refId": "A"
          }
        ],
        "title": "Deployment Replicas",
        "type": "stat"
      },
      {
        "datasource": {
          "uid": "$datasource"
        },
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
            "unit": "none"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 5,
          "w": 6,
          "x": 12,
          "y": 13
        },
        "id": 19,
        "links": [],
        "maxDataPoints": 100,
        "options": {
          "colorMode": "none",
          "graphMode": "none",
          "justifyMode": "auto",
          "orientation": "horizontal",
          "reduceOptions": {
            "calcs": [
              "mean"
            ],
            "fields": "",
            "values": false
          },
          "text": {},
          "textMode": "auto"
        },
        "pluginVersion": "9.1.4",
        "targets": [
          {
            "datasource": {
              "uid": "$datasource"
            },
            "expr": "sum(kube_deployment_status_replicas_updated{namespace=~\"$namespace\",cluster=~\"$cluster\"})",
            "format": "time_series",
            "intervalFactor": 1,
            "refId": "A"
          }
        ],
        "title": "Deployment Replicas - Updated",
        "type": "stat"
      },
      {
        "datasource": {
          "uid": "$datasource"
        },
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
            "unit": "none"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 5,
          "w": 6,
          "x": 18,
          "y": 13
        },
        "id": 20,
        "links": [],
        "maxDataPoints": 100,
        "options": {
          "colorMode": "none",
          "graphMode": "none",
          "justifyMode": "auto",
          "orientation": "horizontal",
          "reduceOptions": {
            "calcs": [
              "mean"
            ],
            "fields": "",
            "values": false
          },
          "text": {},
          "textMode": "auto"
        },
        "pluginVersion": "9.1.4",
        "targets": [
          {
            "datasource": {
              "uid": "$datasource"
            },
            "expr": "sum(kube_deployment_status_replicas_unavailable{namespace=~\"$namespace\",cluster=~\"$cluster\"})",
            "format": "time_series",
            "intervalFactor": 1,
            "refId": "A"
          }
        ],
        "title": "Deployment Replicas - Unavailable",
        "type": "stat"
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
          "y": 18
        },
        "id": 71,
        "panels": [
          {
            "columns": [],
            "datasource": {
              "uid": "$datasource"
            },
            "fontSize": "100%",
            "gridPos": {
              "h": 5,
              "w": 6,
              "x": 0,
              "y": 19
            },
            "id": 75,
            "links": [],
            "scroll": true,
            "showHeader": true,
            "sort": {
              "col": 2,
              "desc": true
            },
            "styles": [
              {
                "alias": "Time",
                "align": "auto",
                "dateFormat": "YYYY-MM-DD HH:mm:ss",
                "pattern": "Time",
                "type": "date"
              },
              {
                "alias": "",
                "align": "auto",
                "colorMode": "row",
                "colors": [
                  "rgba(245, 54, 54, 0.9)",
                  "rgba(237, 129, 40, 0.89)",
                  "rgba(50, 172, 45, 0.97)"
                ],
                "decimals": 0,
                "pattern": "Metric",
                "thresholds": [
                  "0",
                  "0",
                  ".9"
                ],
                "type": "string",
                "unit": "none"
              },
              {
                "alias": "",
                "align": "auto",
                "colorMode": "row",
                "colors": [
                  "rgba(245, 54, 54, 0.9)",
                  "rgba(237, 129, 40, 0.89)",
                  "rgba(50, 172, 45, 0.97)"
                ],
                "dateFormat": "YYYY-MM-DD HH:mm:ss",
                "decimals": 0,
                "link": false,
                "pattern": "Value",
                "thresholds": [
                  "0",
                  "1"
                ],
                "type": "number",
                "unit": "none"
              }
            ],
            "targets": [
              {
                "datasource": {
                  "uid": "$datasource"
                },
                "exemplar": true,
                "expr": "kube_statefulset_status_replicas_ready{namespace=~\"$namespace\"}",
                "format": "time_series",
                "instant": true,
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": {{ printf "{{ statefulset}}" | quote }},
                "refId": "A"
              }
            ],
            "title": "Statefulset Replicas - Up To Date",
            "transform": "timeseries_to_rows",
            "type": "table-old"
          },
          {
            "aliasColors": {},
            "bars": false,
            "dashLength": 10,
            "dashes": false,
            "datasource": {
              "uid": "$datasource"
            },
            "fill": 1,
            "fillGradient": 0,
            "gridPos": {
              "h": 5,
              "w": 12,
              "x": 6,
              "y": 19
            },
            "hiddenSeries": false,
            "id": 73,
            "legend": {
              "avg": false,
              "current": false,
              "max": false,
              "min": false,
              "show": true,
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
            "pluginVersion": "8.2.0",
            "pointradius": 2,
            "points": false,
            "renderer": "flot",
            "seriesOverrides": [],
            "spaceLength": 10,
            "stack": false,
            "steppedLine": false,
            "targets": [
              {
                "datasource": {
                  "uid": "$datasource"
                },
                "exemplar": true,
                "expr": "kube_statefulset_status_replicas_ready{namespace=~\"$namespace\"}/kube_statefulset_status_replicas{namespace=~\"$namespace\"}*100",
                "format": "time_series",
                "instant": false,
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": {{ printf "{{statefulset}}" | quote }},
                "refId": "A"
              }
            ],
            "thresholds": [],
            "timeRegions": [],
            "title": "Statefulset replicas",
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
                "$$hashKey": "object:1619",
                "format": "percent",
                "logBase": 1,
                "show": true
              },
              {
                "$$hashKey": "object:1620",
                "format": "short",
                "logBase": 1,
                "show": true
              }
            ],
            "yaxis": {
              "align": false
            }
          }
        ],
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "PBFA97CFB590B2093"
            },
            "refId": "A"
          }
        ],
        "title": "Statefuleset",
        "type": "row"
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
          "y": 19
        },
        "id": 28,
        "panels": [],
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "PBFA97CFB590B2093"
            },
            "refId": "A"
          }
        ],
        "title": "Pods",
        "type": "row"
      },
      {
        "datasource": {
          "type": "datasource",
          "uid": "grafana"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 10,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": true,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "mappings": [],
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
            }
          },
          "overrides": []
        },
        "gridPos": {
          "h": 9,
          "w": 12,
          "x": 0,
          "y": 20
        },
        "id": 94,
        "options": {
          "legend": {
            "calcs": [],
            "displayMode": "list",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "single",
            "sort": "none"
          }
        },
        "pluginVersion": "8.2.0",
        "targets": [
          {
            "datasource": {
              "type": "datasource",
              "uid": "grafana"
            },
            "exemplar": true,
            "expr": "sum(rate(container_cpu_usage_seconds_total{namespace=\"$namespace\",pod=~\"$pod\"}[1m])*100) by (pod)",
            "interval": "",
            "legendFormat": {{ printf "{{pod}}" | quote }},
            "refId": "A"
          }
        ],
        "title": "container_cpu_usage_percent",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "datasource",
          "uid": "grafana"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisCenteredZero": false,
              "axisColorMode": "text",
              "axisLabel": "",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 10,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": true,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "mappings": [],
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
            }
          },
          "overrides": []
        },
        "gridPos": {
          "h": 9,
          "w": 12,
          "x": 12,
          "y": 20
        },
        "id": 95,
        "options": {
          "legend": {
            "calcs": [],
            "displayMode": "list",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "single",
            "sort": "none"
          }
        },
        "pluginVersion": "8.2.0",
        "targets": [
          {
            "datasource": {
              "type": "datasource",
              "uid": "grafana"
            },
            "exemplar": true,
            "expr": "(sum(container_memory_rss{container!=\"POD\",container!=\"alermanager\",image!=\"\",pod!=\"\",namespace=\"$namespace\",pod=~\"$pod\"})by(pod) / sum(container_spec_memory_limit_bytes{container!=\"POD\",container!=\"alermanager\",image!=\"\",pod!=\"\",namespace=\"$namespace\",pod=~\"$pod\"})by(pod)) * 100",
            "interval": "",
            "legendFormat": {{ printf "{{pod}}" | quote }},
            "refId": "A"
          }
        ],
        "title": "container_memory_usage_percent",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "datasource",
          "uid": "grafana"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisLabel": "",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 10,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": true,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            }
          },
          "overrides": []
        },
        "gridPos": {
          "h": 9,
          "w": 12,
          "x": 0,
          "y": 29
        },
        "id": 97,
        "options": {
          "legend": {
            "calcs": [],
            "displayMode": "list",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "single"
          }
        },
        "pluginVersion": "8.2.0",
        "targets": [
          {
            "datasource": {
              "type": "datasource",
              "uid": "grafana"
            },
            "exemplar": true,
            "expr": "container_file_descriptors{namespace=\"$namespace\",pod=~\"$pod\"}",
            "hide": false,
            "interval": "",
            "legendFormat": {{ printf "{{pod}}" | quote }},
            "refId": "A"
          }
        ],
        "title": "container_file_descriptors",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "datasource",
          "uid": "grafana"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisLabel": "",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 10,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": true,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            }
          },
          "overrides": []
        },
        "gridPos": {
          "h": 9,
          "w": 12,
          "x": 12,
          "y": 29
        },
        "id": 96,
        "options": {
          "legend": {
            "calcs": [],
            "displayMode": "list",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "single"
          }
        },
        "pluginVersion": "8.2.0",
        "targets": [
          {
            "datasource": {
              "type": "datasource",
              "uid": "grafana"
            },
            "exemplar": true,
            "expr": "container_fs_usage_bytes{device=~\"/dev/vda1|/dev/vdb\"} / container_fs_limit_bytes{device=~\"/dev/vda1|/dev/vdb\"} * 100",
            "hide": false,
            "interval": "",
            "legendFormat": "",
            "refId": "A"
          }
        ],
        "title": "container_fs_usage_percent",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "datasource",
          "uid": "grafana"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisLabel": "",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 10,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": true,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "Bps"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 9,
          "w": 12,
          "x": 0,
          "y": 38
        },
        "id": 98,
        "options": {
          "legend": {
            "calcs": [],
            "displayMode": "list",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "single"
          }
        },
        "pluginVersion": "8.2.0",
        "targets": [
          {
            "datasource": {
              "type": "datasource",
              "uid": "grafana"
            },
            "exemplar": true,
            "expr": "sum(rate(container_network_transmit_bytes_total{image!=\"\",namespace=~\"$namespace\",pod=~\"$pod\"}[1m])) without (interface)",
            "hide": false,
            "interval": "",
            "legendFormat": {{ printf "{{pod}}" | quote }},
            "refId": "A"
          }
        ],
        "title": "container_network_transmit_kB/s",
        "type": "timeseries"
      },
      {
        "datasource": {
          "type": "datasource",
          "uid": "grafana"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "mode": "palette-classic"
            },
            "custom": {
              "axisLabel": "",
              "axisPlacement": "auto",
              "barAlignment": 0,
              "drawStyle": "line",
              "fillOpacity": 10,
              "gradientMode": "none",
              "hideFrom": {
                "legend": false,
                "tooltip": false,
                "viz": false
              },
              "lineInterpolation": "linear",
              "lineWidth": 1,
              "pointSize": 5,
              "scaleDistribution": {
                "type": "linear"
              },
              "showPoints": "never",
              "spanNulls": true,
              "stacking": {
                "group": "A",
                "mode": "none"
              },
              "thresholdsStyle": {
                "mode": "off"
              }
            },
            "mappings": [],
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "Bps"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 9,
          "w": 12,
          "x": 12,
          "y": 38
        },
        "id": 99,
        "options": {
          "legend": {
            "calcs": [],
            "displayMode": "list",
            "placement": "bottom",
            "showLegend": true
          },
          "tooltip": {
            "mode": "single"
          }
        },
        "pluginVersion": "8.2.0",
        "targets": [
          {
            "datasource": {
              "type": "datasource",
              "uid": "grafana"
            },
            "exemplar": true,
            "expr": "sum(rate(container_network_receive_bytes_total{image!=\"\",namespace=~\"$namespace\",pod=~\"$pod\"}[1m])) without (interface)",
            "hide": false,
            "interval": "",
            "legendFormat": {{ printf "{{pod}}" | quote }},
            "refId": "A"
          }
        ],
        "title": "container_network_receive_kB/s",
        "type": "timeseries"
      },
      {
        "columns": [],
        "datasource": {
          "uid": "$datasource"
        },
        "fontSize": "100%",
        "gridPos": {
          "h": 9,
          "w": 6,
          "x": 0,
          "y": 47
        },
        "id": 68,
        "links": [],
        "pluginVersion": "6.2.5",
        "scroll": true,
        "showHeader": true,
        "sort": {
          "col": 2,
          "desc": true
        },
        "styles": [
          {
            "$$hashKey": "object:180",
            "alias": "Time",
            "align": "auto",
            "colors": [
              "rgba(245, 54, 54, 0.9)",
              "rgba(237, 129, 40, 0.89)",
              "rgba(50, 172, 45, 0.97)"
            ],
            "dateFormat": "YYYY-MM-DD HH:mm:ss",
            "decimals": 2,
            "mappingType": 1,
            "pattern": "Time",
            "thresholds": [],
            "type": "hidden",
            "unit": "short"
          },
          {
            "$$hashKey": "object:181",
            "alias": "",
            "align": "auto",
            "colors": [
              "#56A64B",
              "#73BF69",
              "#B877D9"
            ],
            "decimals": 2,
            "pattern": "/.*/",
            "thresholds": [
              ""
            ],
            "type": "number",
            "unit": "short"
          }
        ],
        "targets": [
          {
            "datasource": {
              "uid": "$datasource"
            },
            "exemplar": true,
            "expr": "changes(kube_pod_container_status_restarts_total{namespace=~\"$namespace\"}[30m])",
            "format": "time_series",
            "instant": true,
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": {{ printf "{{pod}}" | quote }},
            "refId": "A"
          }
        ],
        "title": "Pods restart in 30m",
        "transform": "timeseries_to_rows",
        "type": "table-old"
      },
      {
        "aliasColors": {},
        "bars": false,
        "dashLength": 10,
        "dashes": false,
        "datasource": {
          "uid": "$datasource"
        },
        "fill": 1,
        "fillGradient": 0,
        "gridPos": {
          "h": 9,
          "w": 6,
          "x": 6,
          "y": 47
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
        "pluginVersion": "8.2.0",
        "pointradius": 2,
        "points": false,
        "renderer": "flot",
        "seriesOverrides": [],
        "spaceLength": 10,
        "stack": false,
        "steppedLine": false,
        "targets": [
          {
            "datasource": {
              "uid": "$datasource"
            },
            "exemplar": true,
            "expr": "kube_pod_status_reason{cluster=~\"$cluster\",namespace=~\"$namespace\", reason=\"Evicted\"}",
            "format": "time_series",
            "instant": false,
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": {{ printf "{{pod}}" | quote }},
            "refId": "A"
          }
        ],
        "thresholds": [],
        "timeRegions": [],
        "title": "Evicted",
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
            "$$hashKey": "object:2121",
            "decimals": 0,
            "format": "short",
            "label": "",
            "logBase": 1,
            "show": true
          },
          {
            "$$hashKey": "object:2122",
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
        "datasource": {
          "uid": "$datasource"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "fixedColor": "#629e51",
              "mode": "fixed"
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
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "none"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 3,
          "w": 12,
          "x": 12,
          "y": 47
        },
        "id": 30,
        "links": [],
        "maxDataPoints": 100,
        "options": {
          "colorMode": "none",
          "graphMode": "area",
          "justifyMode": "auto",
          "orientation": "horizontal",
          "reduceOptions": {
            "calcs": [
              "lastNotNull"
            ],
            "fields": "",
            "values": false
          },
          "text": {},
          "textMode": "auto"
        },
        "pluginVersion": "8.2.0",
        "targets": [
          {
            "datasource": {
              "uid": "$datasource"
            },
            "expr": "sum(kube_pod_status_phase{cluster=~\"$cluster\",namespace=~\"$namespace\", phase=\"Running\"})",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "refId": "A"
          }
        ],
        "title": "Pods Running",
        "type": "stat"
      },
      {
        "datasource": {
          "uid": "$datasource"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "fixedColor": "#629e51",
              "mode": "fixed"
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
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "none"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 3,
          "w": 6,
          "x": 12,
          "y": 50
        },
        "id": 33,
        "links": [],
        "maxDataPoints": 100,
        "options": {
          "colorMode": "none",
          "graphMode": "area",
          "justifyMode": "auto",
          "orientation": "horizontal",
          "reduceOptions": {
            "calcs": [
              "lastNotNull"
            ],
            "fields": "",
            "values": false
          },
          "text": {},
          "textMode": "auto"
        },
        "pluginVersion": "8.2.0",
        "targets": [
          {
            "datasource": {
              "uid": "$datasource"
            },
            "expr": "sum(kube_pod_status_phase{cluster=~\"$cluster\",namespace=~\"$namespace\", phase=\"Succeeded\"})",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "refId": "A"
          }
        ],
        "title": "Pods Succeeded",
        "type": "stat"
      },
      {
        "datasource": {
          "uid": "$datasource"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "fixedColor": "#629e51",
              "mode": "fixed"
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
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "none"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 3,
          "w": 6,
          "x": 18,
          "y": 50
        },
        "id": 32,
        "links": [],
        "maxDataPoints": 100,
        "options": {
          "colorMode": "none",
          "graphMode": "area",
          "justifyMode": "auto",
          "orientation": "horizontal",
          "reduceOptions": {
            "calcs": [
              "lastNotNull"
            ],
            "fields": "",
            "values": false
          },
          "text": {},
          "textMode": "auto"
        },
        "pluginVersion": "8.2.0",
        "targets": [
          {
            "datasource": {
              "uid": "$datasource"
            },
            "expr": "sum(kube_pod_status_phase{cluster=~\"$cluster\",namespace=~\"$namespace\", phase=\"Failed\"})",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "refId": "A"
          }
        ],
        "title": "Pods Failed",
        "type": "stat"
      },
      {
        "datasource": {
          "uid": "$datasource"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "fixedColor": "#629e51",
              "mode": "fixed"
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
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "none"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 3,
          "w": 6,
          "x": 12,
          "y": 53
        },
        "id": 31,
        "links": [],
        "maxDataPoints": 100,
        "options": {
          "colorMode": "none",
          "graphMode": "area",
          "justifyMode": "auto",
          "orientation": "horizontal",
          "reduceOptions": {
            "calcs": [
              "lastNotNull"
            ],
            "fields": "",
            "values": false
          },
          "text": {},
          "textMode": "auto"
        },
        "pluginVersion": "8.2.0",
        "targets": [
          {
            "datasource": {
              "uid": "$datasource"
            },
            "exemplar": true,
            "expr": "sum(kube_pod_status_phase{cluster=~\"$cluster\",namespace=~\"$namespace\", phase=\"Pending\"})",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "",
            "refId": "A"
          }
        ],
        "title": "Pods Pending",
        "type": "stat"
      },
      {
        "datasource": {
          "uid": "$datasource"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "fixedColor": "#629e51",
              "mode": "fixed"
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
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "none"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 3,
          "w": 6,
          "x": 18,
          "y": 53
        },
        "id": 34,
        "links": [],
        "maxDataPoints": 100,
        "options": {
          "colorMode": "none",
          "graphMode": "area",
          "justifyMode": "auto",
          "orientation": "horizontal",
          "reduceOptions": {
            "calcs": [
              "lastNotNull"
            ],
            "fields": "",
            "values": false
          },
          "text": {},
          "textMode": "auto"
        },
        "pluginVersion": "8.2.0",
        "targets": [
          {
            "datasource": {
              "uid": "$datasource"
            },
            "expr": "sum(kube_pod_status_phase{cluster=~\"$cluster\",namespace=~\"$namespace\", phase=\"Unknown\"})",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "refId": "A"
          }
        ],
        "title": "Pods Unknown",
        "type": "stat"
      },
      {
        "datasource": {
          "uid": "$datasource"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "fixedColor": "rgb(31, 120, 193)",
              "mode": "fixed"
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
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "decbytes"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 3,
          "w": 12,
          "x": 12,
          "y": 56
        },
        "id": 42,
        "links": [],
        "maxDataPoints": 100,
        "options": {
          "colorMode": "none",
          "graphMode": "area",
          "justifyMode": "auto",
          "orientation": "horizontal",
          "reduceOptions": {
            "calcs": [
              "lastNotNull"
            ],
            "fields": "",
            "values": false
          },
          "text": {},
          "textMode": "auto"
        },
        "pluginVersion": "8.2.0",
        "targets": [
          {
            "datasource": {
              "uid": "$datasource"
            },
            "expr": "sum(kube_pod_container_resource_requests_memory_bytes{namespace=~\"$namespace\" ,cluster=~\"$cluster\"})",
            "format": "time_series",
            "intervalFactor": 1,
            "refId": "A"
          }
        ],
        "title": "Memory Requested By Containers",
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
          "y": 59
        },
        "id": 36,
        "panels": [],
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "PBFA97CFB590B2093"
            },
            "refId": "A"
          }
        ],
        "title": "Containers",
        "type": "row"
      },
      {
        "datasource": {
          "uid": "$datasource"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "fixedColor": "rgb(31, 120, 193)",
              "mode": "fixed"
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
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "none"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 3,
          "w": 6,
          "x": 0,
          "y": 60
        },
        "id": 38,
        "links": [],
        "maxDataPoints": 100,
        "options": {
          "colorMode": "none",
          "graphMode": "area",
          "justifyMode": "auto",
          "orientation": "horizontal",
          "reduceOptions": {
            "calcs": [
              "lastNotNull"
            ],
            "fields": "",
            "values": false
          },
          "text": {},
          "textMode": "auto"
        },
        "pluginVersion": "8.2.0",
        "targets": [
          {
            "datasource": {
              "uid": "$datasource"
            },
            "exemplar": true,
            "expr": "sum(kube_pod_container_status_running{namespace=~\"$namespace\",cluster=~\"$cluster\"})",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "",
            "refId": "A"
          }
        ],
        "title": "Containers Running",
        "type": "stat"
      },
      {
        "datasource": {
          "uid": "$datasource"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "fixedColor": "rgb(31, 120, 193)",
              "mode": "fixed"
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
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "none"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 3,
          "w": 6,
          "x": 6,
          "y": 60
        },
        "id": 39,
        "links": [],
        "maxDataPoints": 100,
        "options": {
          "colorMode": "none",
          "graphMode": "area",
          "justifyMode": "auto",
          "orientation": "horizontal",
          "reduceOptions": {
            "calcs": [
              "lastNotNull"
            ],
            "fields": "",
            "values": false
          },
          "text": {},
          "textMode": "auto"
        },
        "pluginVersion": "8.2.0",
        "targets": [
          {
            "datasource": {
              "uid": "$datasource"
            },
            "expr": "sum(kube_pod_container_status_waiting{namespace=~\"$namespace\",cluster=~\"$cluster\"})",
            "format": "time_series",
            "intervalFactor": 1,
            "refId": "A"
          }
        ],
        "title": "Containers Waiting",
        "type": "stat"
      },
      {
        "datasource": {
          "uid": "$datasource"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "fixedColor": "rgb(31, 120, 193)",
              "mode": "fixed"
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
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "none"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 3,
          "w": 6,
          "x": 12,
          "y": 60
        },
        "id": 40,
        "links": [],
        "maxDataPoints": 100,
        "options": {
          "colorMode": "none",
          "graphMode": "area",
          "justifyMode": "auto",
          "orientation": "horizontal",
          "reduceOptions": {
            "calcs": [
              "lastNotNull"
            ],
            "fields": "",
            "values": false
          },
          "text": {},
          "textMode": "auto"
        },
        "pluginVersion": "8.2.0",
        "targets": [
          {
            "datasource": {
              "uid": "$datasource"
            },
            "expr": "sum(kube_pod_container_status_terminated{namespace=~\"$namespace\",cluster=~\"$cluster\"})",
            "format": "time_series",
            "intervalFactor": 1,
            "refId": "A"
          }
        ],
        "title": "Containers Terminated",
        "type": "stat"
      },
      {
        "datasource": {
          "uid": "$datasource"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "fixedColor": "rgb(31, 120, 193)",
              "mode": "fixed"
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
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "none"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 3,
          "w": 6,
          "x": 18,
          "y": 60
        },
        "id": 41,
        "links": [],
        "maxDataPoints": 100,
        "options": {
          "colorMode": "none",
          "graphMode": "area",
          "justifyMode": "auto",
          "orientation": "horizontal",
          "reduceOptions": {
            "calcs": [
              "lastNotNull"
            ],
            "fields": "",
            "values": false
          },
          "text": {},
          "textMode": "auto"
        },
        "pluginVersion": "8.2.0",
        "targets": [
          {
            "datasource": {
              "uid": "$datasource"
            },
            "expr": "sum(changes(kube_pod_container_status_restarts_total{namespace=~\"$namespace\",cluster=~\"$cluster\"}[30m]))",
            "format": "time_series",
            "intervalFactor": 1,
            "refId": "A"
          }
        ],
        "title": "Containers Restarts (Last 30 Minutes)",
        "type": "stat"
      },
      {
        "datasource": {
          "uid": "$datasource"
        },
        "fieldConfig": {
          "defaults": {
            "color": {
              "fixedColor": "rgb(31, 120, 193)",
              "mode": "fixed"
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
                  "color": "green"
                },
                {
                  "color": "red",
                  "value": 80
                }
              ]
            },
            "unit": "none"
          },
          "overrides": []
        },
        "gridPos": {
          "h": 3,
          "w": 12,
          "x": 0,
          "y": 63
        },
        "id": 43,
        "links": [],
        "maxDataPoints": 100,
        "options": {
          "colorMode": "none",
          "graphMode": "area",
          "justifyMode": "auto",
          "orientation": "horizontal",
          "reduceOptions": {
            "calcs": [
              "lastNotNull"
            ],
            "fields": "",
            "values": false
          },
          "text": {},
          "textMode": "auto"
        },
        "pluginVersion": "8.2.0",
        "targets": [
          {
            "datasource": {
              "uid": "$datasource"
            },
            "expr": "sum(kube_pod_container_resource_requests_cpu_cores{namespace=~\"$namespace\",cluster=~\"$cluster\"})",
            "format": "time_series",
            "intervalFactor": 1,
            "refId": "A"
          }
        ],
        "title": "CPU Cores Requested by Containers",
        "type": "stat"
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
          "y": 66
        },
        "id": 80,
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
            "fill": 1,
            "fillGradient": 0,
            "gridPos": {
              "h": 8,
              "w": 24,
              "x": 0,
              "y": 51
            },
            "hiddenSeries": false,
            "id": 82,
            "legend": {
              "alignAsTable": false,
              "avg": false,
              "current": false,
              "max": false,
              "min": false,
              "rightSide": true,
              "show": true,
              "total": false,
              "values": false
            },
            "lines": true,
            "linewidth": 1,
            "nullPointMode": "null",
            "options": {
              "alertThreshold": true
            },
            "percentage": false,
            "pluginVersion": "8.2.0",
            "pointradius": 2,
            "points": false,
            "renderer": "flot",
            "seriesOverrides": [],
            "spaceLength": 10,
            "stack": false,
            "steppedLine": false,
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "PBFA97CFB590B2093"
                },
                "expr": "kube_hpa_status_current_replicas{cluster=~\"$cluster\",namespace=~\"$namespace\"}",
                "instant": false,
                "interval": "",
                "legendFormat": {{ printf "current_{{hpa}}" | quote }},
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "PBFA97CFB590B2093"
                },
                "expr": "kube_hpa_spec_max_replicas{cluster=~\"$cluster\",namespace=~\"$namespace\"}",
                "instant": false,
                "interval": "",
                "legendFormat": {{ printf "max_{{hpa}}" | quote }},
                "refId": "B"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "PBFA97CFB590B2093"
                },
                "expr": "kube_hpa_spec_min_replicas{cluster=~\"$cluster\",namespace=~\"$namespace\"}",
                "instant": false,
                "interval": "",
                "legendFormat": {{ printf "min_{{hpa}}" | quote }},
                "refId": "C"
              }
            ],
            "thresholds": [],
            "timeRegions": [],
            "title": "hpa",
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
                "logBase": 1,
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
            "aliasColors": {},
            "bars": false,
            "dashLength": 10,
            "dashes": false,
            "datasource": {
              "type": "prometheus",
              "uid": "PBFA97CFB590B2093"
            },
            "fill": 1,
            "fillGradient": 0,
            "gridPos": {
              "h": 8,
              "w": 24,
              "x": 0,
              "y": 59
            },
            "hiddenSeries": false,
            "id": 89,
            "legend": {
              "alignAsTable": false,
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
            "nullPointMode": "null",
            "options": {
              "alertThreshold": true
            },
            "percentage": false,
            "pluginVersion": "8.2.0",
            "pointradius": 2,
            "points": false,
            "renderer": "flot",
            "seriesOverrides": [],
            "spaceLength": 10,
            "stack": false,
            "steppedLine": false,
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "PBFA97CFB590B2093"
                },
                "expr": "sum(kube_hpa_status_current_replicas{hpa=~\".*\"})",
                "instant": false,
                "interval": "",
                "legendFormat": "kube_hpa_status_current_replicas",
                "refId": "A"
              }
            ],
            "thresholds": [],
            "timeRegions": [],
            "title": "total-hpa-current",
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
                "logBase": 1,
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
            "aliasColors": {},
            "bars": false,
            "dashLength": 10,
            "dashes": false,
            "datasource": {
              "type": "prometheus",
              "uid": "PBFA97CFB590B2093"
            },
            "fill": 1,
            "fillGradient": 0,
            "gridPos": {
              "h": 10,
              "w": 12,
              "x": 0,
              "y": 67
            },
            "hiddenSeries": false,
            "id": 90,
            "legend": {
              "alignAsTable": false,
              "avg": false,
              "current": false,
              "max": false,
              "min": false,
              "rightSide": false,
              "show": true,
              "total": false,
              "values": false
            },
            "lines": true,
            "linewidth": 1,
            "nullPointMode": "null",
            "options": {
              "alertThreshold": true
            },
            "percentage": false,
            "pluginVersion": "8.2.0",
            "pointradius": 2,
            "points": false,
            "renderer": "flot",
            "seriesOverrides": [],
            "spaceLength": 10,
            "stack": false,
            "steppedLine": false,
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "PBFA97CFB590B2093"
                },
                "expr": "kube_hpa_status_current_replicas{hpa=~\".*\"} == kube_hpa_spec_max_replicas{hpa=~\".*\"}",
                "instant": false,
                "interval": "",
                "legendFormat": {{ printf "{{hpa}}" | quote }},
                "refId": "A"
              }
            ],
            "thresholds": [],
            "timeRegions": [],
            "title": "current==max",
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
                "$$hashKey": "object:2217",
                "format": "short",
                "logBase": 1,
                "show": true
              },
              {
                "$$hashKey": "object:2218",
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
            "aliasColors": {},
            "bars": false,
            "dashLength": 10,
            "dashes": false,
            "datasource": {
              "type": "prometheus",
              "uid": "PBFA97CFB590B2093"
            },
            "fill": 1,
            "fillGradient": 0,
            "gridPos": {
              "h": 10,
              "w": 12,
              "x": 12,
              "y": 67
            },
            "hiddenSeries": false,
            "id": 92,
            "legend": {
              "alignAsTable": false,
              "avg": false,
              "current": false,
              "max": false,
              "min": false,
              "rightSide": false,
              "show": true,
              "total": false,
              "values": false
            },
            "lines": true,
            "linewidth": 1,
            "nullPointMode": "null",
            "options": {
              "alertThreshold": true
            },
            "percentage": false,
            "pluginVersion": "8.2.0",
            "pointradius": 2,
            "points": false,
            "renderer": "flot",
            "seriesOverrides": [],
            "spaceLength": 10,
            "stack": false,
            "steppedLine": false,
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "PBFA97CFB590B2093"
                },
                "expr": "kube_hpa_status_current_replicas{hpa=~\".*\"} == kube_hpa_spec_min_replicas{hpa=~\".*\"}",
                "instant": false,
                "interval": "",
                "legendFormat": {{ printf "{{hpa}}" | quote }},
                "refId": "B"
              }
            ],
            "thresholds": [],
            "timeRegions": [],
            "title": "current==min",
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
                "logBase": 1,
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
          }
        ],
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "PBFA97CFB590B2093"
            },
            "refId": "A"
          }
        ],
        "title": "HPA",
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
          "y": 67
        },
        "id": 45,
        "panels": [
          {
            "datasource": {
              "uid": "$datasource"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "fixedColor": "rgb(31, 120, 193)",
                  "mode": "fixed"
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
                      "color": "green"
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 3,
              "w": 8,
              "x": 0,
              "y": 52
            },
            "id": 47,
            "links": [],
            "maxDataPoints": 100,
            "options": {
              "colorMode": "none",
              "graphMode": "area",
              "justifyMode": "auto",
              "orientation": "horizontal",
              "reduceOptions": {
                "calcs": [
                  "lastNotNull"
                ],
                "fields": "",
                "values": false
              },
              "text": {},
              "textMode": "auto"
            },
            "pluginVersion": "8.2.0",
            "targets": [
              {
                "datasource": {
                  "uid": "$datasource"
                },
                "expr": "sum(kube_job_status_succeeded{namespace=~\"$namespace\",cluster=~\"$cluster\"})",
                "format": "time_series",
                "intervalFactor": 1,
                "refId": "A"
              }
            ],
            "title": "Jobs Succeeded",
            "type": "stat"
          },
          {
            "columns": [],
            "datasource": {
              "uid": "$datasource"
            },
            "description": "",
            "fontSize": "100%",
            "gridPos": {
              "h": 9,
              "w": 8,
              "x": 8,
              "y": 52
            },
            "hideTimeOverride": false,
            "id": 62,
            "links": [],
            "pluginVersion": "6.2.5",
            "scroll": true,
            "showHeader": true,
            "sort": {
              "desc": false
            },
            "styles": [
              {
                "alias": "Time",
                "align": "auto",
                "dateFormat": "YYYY-MM-DD HH:mm:ss",
                "pattern": "Time",
                "type": "date"
              },
              {
                "alias": "Job",
                "align": "auto",
                "colors": [
                  "rgba(245, 54, 54, 0.9)",
                  "rgba(237, 129, 40, 0.89)",
                  "rgba(50, 172, 45, 0.97)"
                ],
                "decimals": 2,
                "pattern": "Metric",
                "thresholds": [],
                "type": "string",
                "unit": "short"
              },
              {
                "alias": "Day",
                "align": "auto",
                "colors": [
                  "rgba(245, 54, 54, 0.9)",
                  "rgba(237, 129, 40, 0.89)",
                  "rgba(50, 172, 45, 0.97)"
                ],
                "dateFormat": "YYYY-MM-DD HH:mm:ss",
                "decimals": 4,
                "mappingType": 1,
                "pattern": "Value",
                "thresholds": [],
                "type": "number",
                "unit": "none"
              }
            ],
            "targets": [
              {
                "datasource": {
                  "uid": "$datasource"
                },
                "expr": "(time()-kube_job_status_completion_time{namespace=~\"$namespace\",cluster=~\"$cluster\"})/60/60/24>1",
                "format": "time_series",
                "instant": true,
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": {{ printf "{{job_name}}" | quote }},
                "refId": "A"
              }
            ],
            "title": "Job last success time from now",
            "transform": "timeseries_to_rows",
            "transparent": true,
            "type": "table-old"
          },
          {
            "columns": [],
            "datasource": {
              "uid": "$datasource"
            },
            "description": "",
            "fontSize": "100%",
            "gridPos": {
              "h": 9,
              "w": 8,
              "x": 16,
              "y": 52
            },
            "hideTimeOverride": false,
            "id": 76,
            "links": [],
            "pluginVersion": "6.2.5",
            "scroll": true,
            "showHeader": true,
            "sort": {
              "col": 2,
              "desc": true
            },
            "styles": [
              {
                "alias": "Time",
                "align": "auto",
                "dateFormat": "YYYY-MM-DD HH:mm:ss",
                "pattern": "Time",
                "type": "date"
              },
              {
                "alias": "Job",
                "align": "auto",
                "colors": [
                  "rgba(245, 54, 54, 0.9)",
                  "rgba(237, 129, 40, 0.89)",
                  "rgba(50, 172, 45, 0.97)"
                ],
                "decimals": 2,
                "pattern": "Metric",
                "thresholds": [],
                "type": "number",
                "unit": "short"
              },
              {
                "alias": "Failed Pod number",
                "align": "auto",
                "colors": [
                  "rgba(245, 54, 54, 0.9)",
                  "rgba(237, 129, 40, 0.89)",
                  "rgba(50, 172, 45, 0.97)"
                ],
                "dateFormat": "YYYY-MM-DD HH:mm:ss",
                "decimals": 0,
                "mappingType": 1,
                "pattern": "Value",
                "thresholds": [],
                "type": "number",
                "unit": "short"
              }
            ],
            "targets": [
              {
                "datasource": {
                  "uid": "$datasource"
                },
                "expr": "kube_job_status_failed{namespace=~\"$namespace\",cluster=~\"$cluster\"}>1",
                "format": "time_series",
                "instant": true,
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": {{ printf "{{job_name}}" | quote }},
                "refId": "A"
              }
            ],
            "title": "Job failed",
            "transform": "timeseries_to_rows",
            "transparent": true,
            "type": "table-old"
          },
          {
            "datasource": {
              "uid": "$datasource"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "fixedColor": "rgb(31, 120, 193)",
                  "mode": "fixed"
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
                      "color": "green"
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 3,
              "w": 8,
              "x": 0,
              "y": 55
            },
            "id": 48,
            "links": [],
            "maxDataPoints": 100,
            "options": {
              "colorMode": "none",
              "graphMode": "area",
              "justifyMode": "auto",
              "orientation": "horizontal",
              "reduceOptions": {
                "calcs": [
                  "lastNotNull"
                ],
                "fields": "",
                "values": false
              },
              "text": {},
              "textMode": "auto"
            },
            "pluginVersion": "8.2.0",
            "targets": [
              {
                "datasource": {
                  "uid": "$datasource"
                },
                "expr": "sum(kube_job_status_active{namespace=~\"$namespace\",cluster=~\"$cluster\"})",
                "format": "time_series",
                "intervalFactor": 1,
                "refId": "A"
              }
            ],
            "title": "Jobs Active",
            "type": "stat"
          },
          {
            "datasource": {
              "uid": "$datasource"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "fixedColor": "rgb(31, 120, 193)",
                  "mode": "fixed"
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
                      "color": "green"
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 3,
              "w": 8,
              "x": 0,
              "y": 58
            },
            "id": 49,
            "links": [],
            "maxDataPoints": 100,
            "options": {
              "colorMode": "none",
              "graphMode": "area",
              "justifyMode": "auto",
              "orientation": "horizontal",
              "reduceOptions": {
                "calcs": [
                  "lastNotNull"
                ],
                "fields": "",
                "values": false
              },
              "text": {},
              "textMode": "auto"
            },
            "pluginVersion": "8.2.0",
            "targets": [
              {
                "datasource": {
                  "uid": "$datasource"
                },
                "expr": "sum(kube_job_status_failed{namespace=~\"$namespace\",cluster=~\"$cluster\"})",
                "format": "time_series",
                "intervalFactor": 1,
                "refId": "A"
              }
            ],
            "title": "Jobs Failed",
            "type": "stat"
          }
        ],
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "PBFA97CFB590B2093"
            },
            "refId": "A"
          }
        ],
        "title": "Jobs",
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
          "y": 68
        },
        "id": 64,
        "panels": [
          {
            "datasource": {
              "uid": "$datasource"
            },
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
                      "color": "green"
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 6,
              "x": 0,
              "y": 53
            },
            "id": 66,
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
              "text": {},
              "textMode": "auto"
            },
            "pluginVersion": "8.2.0",
            "targets": [
              {
                "datasource": {
                  "uid": "$datasource"
                },
                "expr": "sum(kube_persistentvolumeclaim_status_phase{phase=\"Bound\"}==1)",
                "format": "time_series",
                "intervalFactor": 1,
                "legendFormat": {{ printf "{{persistentvolumeclaim=}}" | quote }},
                "refId": "A"
              }
            ],
            "title": "pvc is bound",
            "type": "stat"
          },
          {
            "datasource": {
              "uid": "$datasource"
            },
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
                      "color": "green"
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 6,
              "x": 6,
              "y": 53
            },
            "id": 69,
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
              "text": {},
              "textMode": "auto"
            },
            "pluginVersion": "8.2.0",
            "targets": [
              {
                "datasource": {
                  "uid": "$datasource"
                },
                "expr": "sum(kube_persistentvolumeclaim_status_phase{phase!=\"Bound\"}==1)",
                "format": "time_series",
                "intervalFactor": 1,
                "legendFormat": {{ printf "{{persistentvolumeclaim=}}" | quote }},
                "refId": "A"
              }
            ],
            "title": "pvc is not bound",
            "type": "stat"
          },
          {
            "columns": [],
            "datasource": {
              "uid": "$datasource"
            },
            "fontSize": "100%",
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 53
            },
            "id": 67,
            "links": [],
            "pluginVersion": "6.2.5",
            "scroll": true,
            "showHeader": true,
            "sort": {
              "col": 0,
              "desc": true
            },
            "styles": [
              {
                "alias": "Time",
                "align": "auto",
                "dateFormat": "YYYY-MM-DD HH:mm:ss",
                "pattern": "Time",
                "type": "date"
              },
              {
                "alias": "",
                "align": "auto",
                "colors": [
                  "rgba(245, 54, 54, 0.9)",
                  "rgba(237, 129, 40, 0.89)",
                  "rgba(50, 172, 45, 0.97)"
                ],
                "decimals": 2,
                "pattern": "/.*/",
                "thresholds": [],
                "type": "number",
                "unit": "short"
              }
            ],
            "targets": [
              {
                "datasource": {
                  "uid": "$datasource"
                },
                "expr": "kube_persistentvolumeclaim_resource_requests_storage_bytes/1024/1024/1024",
                "format": "time_series",
                "instant": true,
                "intervalFactor": 1,
                "legendFormat": {{ printf "{{persistentvolumeclaim}}" | quote }},
                "refId": "A"
              }
            ],
            "title": "pvc",
            "transform": "timeseries_to_rows",
            "type": "table-old"
          }
        ],
        "targets": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "PBFA97CFB590B2093"
            },
            "refId": "A"
          }
        ],
        "title": "PVC",
        "type": "row"
      }
    ],
    "refresh": false,
    "schemaVersion": 37,
    "style": "dark",
    "tags": [
      "kubernetes",
      "kubernetes-app"
    ],
    "templating": {
      "list": [
        {
          "current": {
            "isNone": true,
            "selected": false,
            "text": "None",
            "value": ""
          },
          "datasource": {
            "type": "prometheus",
            "uid": "$datasource"
          },
          "definition": "label_values(kube_node_info, cluster)",
          "hide": 0,
          "includeAll": false,
          "multi": false,
          "name": "cluster",
          "options": [],
          "query": {
            "query": "label_values(kube_node_info, cluster)",
            "refId": "Prometheus-cluster-Variable-Query"
          },
          "refresh": 1,
          "regex": "",
          "skipUrlSync": false,
          "sort": 0,
          "tagValuesQuery": "",
          "tagsQuery": "",
          "type": "query",
          "useTags": false
        },
        {
          "current": {
            "selected": false,
            "text": "All",
            "value": "$__all"
          },
          "datasource": {
            "type": "prometheus",
            "uid": "$datasource"
          },
          "definition": "label_values(kube_node_info{cluster=~\"$cluster\"}, node)",
          "hide": 0,
          "includeAll": true,
          "multi": false,
          "name": "node",
          "options": [],
          "query": {
            "query": "label_values(kube_node_info{cluster=~\"$cluster\"}, node)",
            "refId": "Prometheus-node-Variable-Query"
          },
          "refresh": 1,
          "regex": "",
          "skipUrlSync": false,
          "sort": 0,
          "tagValuesQuery": "",
          "tagsQuery": "",
          "type": "query",
          "useTags": false
        },
        {
          "allValue": "",
          "current": {
            "selected": false,
            "text": "All",
            "value": "$__all"
          },
          "datasource": {
            "type": "prometheus",
            "uid": "$datasource"
          },
          "definition": "label_values(kube_namespace_labels{cluster=~\"$cluster\"}, namespace)",
          "hide": 0,
          "includeAll": true,
          "label": "",
          "multi": false,
          "name": "namespace",
          "options": [],
          "query": {
            "query": "label_values(kube_namespace_labels{cluster=~\"$cluster\"}, namespace)",
            "refId": "StandardVariableQuery"
          },
          "refresh": 1,
          "regex": "",
          "skipUrlSync": false,
          "sort": 0,
          "tagValuesQuery": "",
          "tagsQuery": "",
          "type": "query",
          "useTags": false
        },
        {
          "hide": 2,
          "name": "datasource",
          "query": "Prometheus",
          "skipUrlSync": false,
          "type": "constant"
        },
        {
          "current": {
            "selected": false,
            "text": "All",
            "value": "$__all"
          },
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "definition": "kube_pod_container_info",
          "hide": 0,
          "includeAll": true,
          "multi": true,
          "name": "pod",
          "options": [],
          "query": {
            "query": "kube_pod_container_info",
            "refId": "StandardVariableQuery"
          },
          "refresh": 1,
          "regex": "/.*namespace=\"$namespace\",pod=\"(.*)\",pod_name.*$/",
          "skipUrlSync": false,
          "sort": 0,
          "type": "query"
        }
      ]
    },
    "time": {
      "from": "now-1h",
      "to": "now"
    },
    "timepicker": {
      "refresh_intervals": [
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
    "title": "kube-state-metrics-v2",
    "uid": "garysdevil-kube-state-metrics-v2",
    "version": 1,
    "weekStart": ""
  }
{{- end }}