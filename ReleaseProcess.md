# Release Process

## Version Tagging
To prepare for a new release:
1. Ensure all new features and bug fixes are merged into the master branch.
2. Update the version number in the relevant files, typically in the package.json or similar configuration files.
3. Tag the release using Git:

```bash
git tag -a <version> -m "Release version <version>"
```
4. Push the tags to the repository:
```bash
git push --tags
```
## Release Notes
Document the changes, enhancements, and bug fixes in this release in a `CHANGELOG.md` file or directly in the GitHub releases section.

## Deployment
Deploy the tagged version to the production environment using your deployment scripts or manual steps as configured.
