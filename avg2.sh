curl -XGET --header 'Content-Type: application/json' http://35.223.179.2:9200/sport/_search -d '{
        "query": {
    "bool": {
      "must": [
        {
          "range": {
            "vecesporsemana": {
              "gt": 3
            }
          }
        },
        {
          "range": {
            "edad": {
              "gt": 40
            }
          }
        }
      ]
    }
  },
  "aggs": {
    "avg_edad": {
      "avg": {
        "field": "edad"
      }
    }
  }
}'  | jq .aggregations.avg_edad.value
