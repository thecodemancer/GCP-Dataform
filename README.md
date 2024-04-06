# GCP-Dataform

<img src="images/dataform.png" alt="Dataform | Google Cloud Platform | GCP | BigQuery | thecodemancer_" />

## 1. Configurating your local development

mkdir scripts
mkdir data

sh download_data.sh

For more information about the dataset, go to https://files.grouplens.org/datasets/movielens/ml-latest-small-README.html

## 2. Create the BigQuery dataset

In cloud shell run:

```
bq mk \
--project_id=[PROJECT_ID] \
--dataset_id=gcp_dataform \
--location=US
```

## 3. Grant Permissions to Dataform Service Account
When you create your first Dataform repository, Dataform automatically generates a service account. Dataform uses the service account to interact with BigQuery on your behalf.

Your Dataform service account ID is in the following format:

`service-PROJECT_NUMBER@gcp-sa-dataform.iam.gserviceaccount.com`

Replace PROJECT_NUMBER with the Project Number of your Google Cloud project.

The Dataform service account requires a number of IAM roles with which to be able to execute the workflows in BigQuery and load data from the Google Cloud Storage Bucket. Add the following roles to the Dataform service account:

- BigQuery Job User role.
- BigQuery Data Editor role.
- BigQuery Data Viewer role.
- Storage Object Viewer role.

## 4. Create a GitHub token

In this step, we're going to create a **fine-grained personal access token**. These types of tokens are fine-grained, repository-scoped tokens suitable for personal API use and for using Git over HTTPS.

Go to **Settings --> Developer Settings --> Personal access tokens**. Enter a token name, expiration, description, resource owner, and repository access. In **Permissions**, go to **contents** and select **Read and write**. Click on **Generate token**.

<img src="images/dataform_personal_access_tokens.png" alt="Dataform | Google Cloud Platform | GCP | BigQuery | thecodemancer_" />
<img src="images/dataform_personal_access_tokens_permissions.png" alt="Dataform | Google Cloud Platform | GCP | BigQuery | thecodemancer_" />

Make sure to copy your personal access token now as you will not be able to see it again.

## 5. Create a Secret

Secret Manager lets you store, manage, and secure access to your application secrets. In the Google Cloud console, go to the <a href="https://console.cloud.google.com/security/secret-manager">Secret Manager</a> page and create a secret. Enter a **Name** and paste your GitHub token as **Secret value**. Leave the rest of the fields with their default values.

## 6. Create a Repository
Repositories contain a single Dataform project that can be connected to your Git provider. Within a repository you can create `workspaces` for development and execute your SQL workflows against BigQuery.

New repositories start empty and can be connected to a git provider after being created.

ℹ Dataform will execute workflows as the service account `service-[PROJECT_NUMBER]]@gcp-sa-dataform.iam.gserviceaccount.com`. Ensure that the service account has been granted the role roles/bigquery.user in order to create datasets, tables and jobs. Also ensure that the service account has been granted access to read any datasets or tables that your workflow will consume.

## 7. Create a Development Workspace

Development workspaces contain an editable copy of your team's repository. Using development workspaces, you can develop code without affecting other users, commit changes, and push commits to your remote Git repository. If your repository is connected to a remote Git provider, changes from your development workspace will be pushed to a remote branch named after your development workspace. Otherwise, your changes will be pushed to your default branch.

## 8. Initialize your Dataform workspace

To start developing with Dataform, first initialize your project with the required configuration files.

## 9. Connect a Dataform repository

To link a Dataform repository to a remote Git repository, follow these steps:

1. In the Google Cloud console, go to the Dataform page.
2. Select the repository you want to connect.
3. On the repository page, click *Settings > Connect with Git*.
4. In the *Link to remote repository* pane, in the *Remote Git repository URL* field, enter the URL of the remote Git repository, ending with .git.

    For HTTPS authentication, the URL of the remote Git repository cannot contain usernames or passwords.

    For SSH authentication, the URL of the remote Git repository be in one of the following formats:

    - Absolute URL: `ssh://git@{host_name}[:{port}]/{repository_path}`, `port`` is optional.
    - SCP-like URL: `git@{host_name}:{repository_path}`.

5. In the *Default remote branch name* field, enter the name of the main development branch of the remote Git repository.
6. In the *Secret* drop-down, select your secret for the remote Git repository.
7. If you used SSH authentication for the remote repository, in the *SSH public host key value* field, enter a single public host key of your Git provider.

The SSH public host key value must be in the format of a `known_hosts` file. The value must contain an algorithm and a public key encoded in the `base64` format, but without the hostname or IP, in the following format:

```
ALGORITHM BASE64_KEY_VALUE
```

For the Azure DevOps Services public host key, see [Use SSH key authentication](https://learn.microsoft.com/en-us/azure/devops/repos/git/use-ssh-keys-to-authenticate?view=azure-devops).

For the Bitbucket public host key, see [Configure SSH](https://support.atlassian.com/bitbucket-cloud/docs/configure-ssh-and-two-step-verification/).

For the GitHub public host key, see [GitHub's SSH key fingerprints](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/githubs-ssh-key-fingerprints).

For the GitLab public host key, see [SSH known_hosts entries](https://docs.gitlab.com/ee/user/gitlab_com/#ssh-known_hosts-entries).

8. Click Link.

<img src="images/dataform_settings.png" alt="Dataform | Google Cloud Platform | GCP | BigQuery | thecodemancer_" />


ℹ Dataform needs a secret containing a personal access token (for HTTPS remotes) or a user private key (for SSH remotes) for connecting to your git provider. To proceed, create a secret in Secret Manager and grant roles/secretmanager.secretAccessor permissions to the default Dataform service account (service-[PROJECT_ID]@gcp-sa-dataform.iam.gserviceaccount.com).

