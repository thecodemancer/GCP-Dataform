#!/usr/bin/env zsh

# Data Download Directory
DATA_FOLDER="../data"
FILE="ml-latest-small.zip"

# Download the latest Movielens Public Dataset
print "\nDownloading 'ml-latest.zip' ...\n"
curl -SL -o "${DATA_FOLDER}/${FILE}" "https://files.grouplens.org/datasets/movielens/${FILE}"

# Extract all of the CSV data files
unzip -oj -d "${DATA_FOLDER}" "${DATA_FOLDER}/${FILE}" "ml-latest-small/*.csv"

# Delete the downloaded ZIP archive
rm -f "${DATA_FOLDER}/${FILE}"
