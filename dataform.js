{
    "defaultSchema": "movielens",
    "assertionSchema": "DF_ASSERTIONS",
    "warehouse": "bigquery",
    "defaultDatabase": "gcp-dataform",
    "defaultLocation": "us-central1",
    "vars": {
      "LOAD_GCS_BUCKET": "gcp-dataform/movielens",
      "RAW_DATA": "movielens_staging",
      "BASE_DATA": "movielens"
    }
  }