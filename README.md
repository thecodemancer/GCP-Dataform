# GCP-Dataform

## Configurating your local development

mkdir scripts
mkdir data

sh download_data.sh

For more information about the dataset, go to https://files.grouplens.org/datasets/movielens/ml-latest-small-README.html

## Create repository
Repositories contain a single Dataform project that can be connected to your Git provider. Within a repository you can create workspaces for development and execute your SQL workflows against BigQuery.

New repositories start empty and can be connected to a git provider after being created.

ℹ Dataform will execute workflows as the service account service-[PROJECT_NUMBER]]@gcp-sa-dataform.iam.gserviceaccount.com. Ensure that the service account has been granted the role roles/bigquery.user in order to create datasets, tables and jobs. Also ensure that the service account has been granted access to read any datasets or tables that your workflow will consume.

## Create Development Workspace

Development workspaces contain an editable copy of your team's repository. Using development workspaces, you can develop code without affecting other users, commit changes, and push commits to your remote Git repository. If your repository is connected to a remote Git provider, changes from your development workspace will be pushed to a remote branch named after your development workspace. Otherwise, your changes will be pushed to your default branch.

## Initialize your Dataform workspace

This appears to be an empty Dataform workspace. To start developing with Dataform, first initialize your project with the required configuration files.

