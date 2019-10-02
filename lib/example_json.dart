class ExampleJson {
  //https://arcgis.argyll-bute.gov.uk/arcgis/rest/services/CAG_and_Council_Property/MapServer/0/query?text=PA31%208JW&outFields=ADDRESS%2C+UPRN&f=pjson
  final String json = """{
    "displayFieldName": "ADDRESS",
    "fieldAliases": {
      "ADDRESS": "ADDRESS",
      "UPRN": "UPRN"
    },
    "geometryType": "esriGeometryPoint",
    "spatialReference": {
      "wkid": 27700,
      "latestWkid": 27700
    },
    "fields": [
      {
        "name": "ADDRESS",
        "type": "esriFieldTypeString",
        "alias": "ADDRESS",
        "length": 240
      },
      {
        "name": "UPRN",
        "type": "esriFieldTypeString",
        "alias": "UPRN",
        "length": 12
      }
    ],
    "features": [
      {
        "attributes": {
          "ADDRESS": "3 Cossack Street Lochgilphead Argyll And Bute PA31 8JW ",
          "UPRN": "000125006813"
        },
        "geometry": {
          "x": 186468.64000000001,
          "y": 687747.67000000004
        }
      },
      {
        "attributes": {
          "ADDRESS": "Burnside Cossack Street Lochgilphead Argyll And Bute PA31 8JW ",
          "UPRN": "000125003011"
        },
        "geometry": {
          "x": 186481.64000000001,
          "y": 687752.67000000004
        }
      },
      {
        "attributes": {
          "ADDRESS": "Drimlea Cossack Street Lochgilphead Argyll And Bute PA31 8JW ",
          "UPRN": "000125028326"
        },
        "geometry": {
          "x": 186493.64000000001,
          "y": 687729.67000000004
        }
      },
      {
        "attributes": {
          "ADDRESS": "Ardtalla Cossack Street Lochgilphead Argyll And Bute PA31 8JW ",
          "UPRN": "000125009260"
        },
        "geometry": {
          "x": 186499.64000000001,
          "y": 687715.67000000004
        }
      },
      {
        "attributes": {
          "ADDRESS": "2 Cossack Street Lochgilphead Argyll And Bute PA31 8JW ",
          "UPRN": "000125017272"
        },
        "geometry": {
          "x": 186444.33500000002,
          "y": 687743.47699999996
        }
      },
      {
        "attributes": {
          "ADDRESS": "6 Cossack Street Lochgilphead Argyll And Bute PA31 8JW ",
          "UPRN": "000125006815"
        },
        "geometry": {
          "x": 186452.185,
          "y": 687730.50699999998
        }
      },
      {
        "attributes": {
          "ADDRESS": "5 Cossack Street Lochgilphead Argyll And Bute PA31 8JW ",
          "UPRN": "000125033214"
        },
        "geometry": {
          "x": 186486.71899999998,
          "y": 687744.72499999998
        }
      },
      {
        "attributes": {
          "ADDRESS": "Flat Ground/2 21 Cossack Street Lochgilphead Argyll And Bute PA31 8JW ",
          "UPRN": "000125048907"
        },
        "geometry": {
          "x": 186492.348,
          "y": 687685.85199999996
        }
      },
      {
        "attributes": {
          "ADDRESS": "21A Cossack Street Lochgilphead Argyll And Bute PA31 8JW ",
          "UPRN": "000125046187"
        },
        "geometry": {
          "x": 186489.31300000002,
          "y": 687693.54399999999
        }
      },
      {
        "attributes": {
          "ADDRESS": "Flat 1/2 21 Cossack Street Lochgilphead Argyll And Bute PA31 8JW ",
          "UPRN": "000125016904"
        },
        "geometry": {
          "x": 186493.38400000002,
          "y": 687695.12
        }
      }
    ]
  }""";
}
