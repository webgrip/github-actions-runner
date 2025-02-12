### MYoung's GIthub Runner Docker Image

## Environment variables

```
RUN_AS_ROOT	Boolean to run as root. If true: will run as root. If True and the user is overridden it will error. If any other value it will run as the runner user and allow an optional override. Default is true
RUNNER_NAME	The name of the runner to use. Supersedes (overrides) RUNNER_NAME_PREFIX
RUNNER_NAME_PREFIX	A prefix for runner name (See RANDOM_RUNNER_SUFFIX for how the full name is generated). Note: will be overridden by RUNNER_NAME if provided. Defaults to github-runner
RANDOM_RUNNER_SUFFIX	Boolean to use a randomized runner name suffix (preceded by RUNNER_NAME_PREFIX). Will use a 13 character random string by default. If set to a value other than true it will attempt to use the contents of /etc/hostname or fall back to a random string if the file does not exist or is empty. Note: will be overridden by RUNNER_NAME if provided. Defaults to true.
ACCESS_TOKEN	A github PAT to use to generate RUNNER_TOKEN dynamically at container start. Not using this requires a valid RUNNER_TOKEN
APP_ID	The github application ID. Must be paired with APP_PRIVATE_KEY and should not be used with ACCESS_TOKEN or RUNNER_TOKEN
APP_PRIVATE_KEY	The github application private key. Must be paired with APP_ID and should not be used with ACCESS_TOKEN or RUNNER_TOKEN
APP_LOGIN	The github application login id. Can be paired with APP_ID and APP_PRIVATE_KEY if default value extracted from REPO_URL or ORG_NAME is not correct. Note that no default is present when RUNNER_SCOPE is 'enterprise'.
RUNNER_SCOPE	The scope the runner will be registered on. Valid values are repo, org and ent. For 'org' and 'enterprise', ACCESS_TOKEN is required and REPO_URL is unnecessary. If 'org', requires ORG_NAME; if 'ent', requires ENTERPRISE_NAME. Default is 'repo'.
ORG_NAME	The organization name for the runner to register under. Requires RUNNER_SCOPE to be 'org'. No default value.
ENTERPRISE_NAME	The enterprise name for the runner to register under. Requires RUNNER_SCOPE to be 'enterprise'. No default value.
LABELS	A comma separated string to indicate the labels. Default is 'default'
REPO_URL	If using a non-organization runner this is the full repository url to register under such as 'https://github.com/myoung34/repo'
RUNNER_TOKEN	If not using a PAT for ACCESS_TOKEN this will be the runner token provided by the Add Runner UI (a manual process). Note: This token is short lived and will change frequently. ACCESS_TOKEN is likely preferred.
RUNNER_WORKDIR	The working directory for the runner. Runners on the same host should not share this directory. Default is '/_work'. This must match the source path for the bind-mounted volume at RUNNER_WORKDIR, in order for container actions to access files.
RUNNER_GROUP	Name of the runner group to add this runner to (defaults to the default runner group)
GITHUB_HOST	Optional URL of the Github Enterprise server e.g github.mycompany.com. Defaults to github.com.
DISABLE_AUTOMATIC_DEREGISTRATION	Optional flag to disable signal catching for deregistration. Default is false. Any value other than exactly false is considered true. See here
CONFIGURED_ACTIONS_RUNNER_FILES_DIR	Path to use for runner data. It allows avoiding reregistration each the start of the runner. No default value.
EPHEMERAL	Optional flag to configure runner with --ephemeral option. Ephemeral runners are suitable for autoscaling.
DISABLE_AUTO_UPDATE	Optional environment variable to disable auto updates. Auto updates are enabled by default to preserve past behavior. Any value is considered truthy and will disable them.
START_DOCKER_SERVICE	Optional flag which automatically starts the docker service if set to true. Useful when using sysbox. Defaults to false.
NO_DEFAULT_LABELS	Optional environment variable to disable adding the default self-hosted, platform, and architecture labels to the runner. Any value is considered truthy and will disable them.
```
