# Git Commands for Managing Pull Requests

## Fetching and Checking Out Pull Requests

To fetch and check out a specific pull request:

1. Use the alias `fetch-pr` followed by the pull request ID. This command fetches the pull request branch and checks it out as a new local branch prefixed with `pr-`.

   Example:
```bash
git fetch-pr 7
```
This command fetches the pull request with ID 7 and checks it out into a local branch named `pr-7`.
