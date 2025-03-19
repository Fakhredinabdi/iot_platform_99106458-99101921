# OS-Lab-1-2-99106458-99101921
Os Lab

# IoT Platform Development Project

This repository is dedicated to the development of an IoT platform with multiple modules, including IoT sensors and a web dashboard. The following document provides an overview of the project setup, branching strategy, commit standards, milestones, and development workflow for Phase 1.

---

## Project Overview

The IoT platform aims to support modular development with simultaneous contributions to different features. During Phase 1, the repository was set up, essential branches were created, commit standards were defined, and milestones were introduced to streamline development.

---

## Repository Setup

### Main Branch
- **Branch Name**: `main` (or `master`)
- This is the **protected branch** containing production-ready and stable code.
- Protection rules:
  - Changes to this branch require a **pull request**.
  - CI checks must pass before merging.
  - At least **1 reviewer approval** is required for pull requests.
  - Direct pushes to this branch are restricted.

### Feature Branches
Each feature is developed in a separate branch to ensure modular development.
- **feature/iot-sensors**: For IoT sensor integration and related functionality.
- **feature/web-dashboard**: For designing and implementing the web dashboard interface.

Feature branches are used to maintain code separation and proper integration workflows.


# Automating Feature Branch Merging

## Objective
Set up a pipeline such that after successful testing, feature branches are automatically merged into the target branch (e.g., `main` or `develop`).

---

## Steps to Implement

### Step 1: Script for Automated Merging
Create a script that automates the process of merging feature branches into the target branch. This script checks the test results, ensures successful execution, and proceeds with merging the branch.

Example Bash Script (`auto-merge.sh`):
```bash
#!/bin/bash

# Variables
FEATURE_BRANCH=$1         
TARGET_BRANCH="develop"   

cd /path/to/repository

git fetch origin

git checkout $TARGET_BRANCH

git pull origin $TARGET_BRANCH

git merge origin/$FEATURE_BRANCH

git push origin $TARGET_BRANCH
```

### Step 2: Configure CI/CD Pipeline
Integrate the automation script into the CI/CD pipeline. This pipeline ensures that merging only occurs if all tests pass successfully.

Example GitHub Actions (.github/workflows/ci-cd.yml):

```yaml
name: CI/CD Pipeline with Auto-Merge

on:
  pull_request:
    branches:
      - main
      - develop

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Code
        uses: actions/checkout@v2

      - name: Setup Node.js
        uses: actions/setup-node@v2
        with:
          node-version: '14'

      - name: Install Dependencies
        run: npm install

      - name: Run Tests
        run: npm test
      
  merge:
    needs: test
    if: success() # Proceed only if tests succeed
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Code
        uses: actions/checkout@v2

      - name: Auto-Merge Feature Branch
        run: ./auto-merge.sh feature-branch-name
```

### Step 3: Documentation
Document the automation process and how it is configured. Ensure the documentation covers:

What the automation does:
Merges feature branches into the target branch after successful test execution.

How the automation is triggered:
Pipeline triggers on pull requests or specified branches.

Script details:
Include the bash script used for merging and instructions for its usage.

Example README Section:

```markdown
# Automating Feature Branch Merging

## Objective
Automatically merge feature branches into the target branch (e.g., `develop`) once tests pass successfully.

## How It Works
1. CI/CD pipeline runs tests for the feature branch.
2. If tests pass successfully, the `auto-merge.sh` script is invoked to merge the feature branch into the target branch.
3. The merged branch is pushed back to the remote repository.

## Scripts
### `auto-merge.sh`
A bash script to automate the merge process:
```bash
#!/bin/bash
FEATURE_BRANCH=$1
TARGET_BRANCH="develop"
cd /path/to/repository
git fetch origin
git checkout $TARGET_BRANCH
git pull origin $TARGET_BRANCH
git merge origin/$FEATURE_BRANCH
git push origin $TARGET_BRANCH
```

## CI/CD Pipeline Configuration
The automation process is configured in the pipeline file (.github/workflows/ci-cd.yml). Key steps:

- Run tests to validate

---

## Branching Strategy

### Workflow

1. Pull the latest changes from the `main` branch:
   ```bash
   git pull origin main
   ```

2. Create a **feature branch** for new development:
   ```bash
   git checkout -b feature/<branch-name>
   ```

3. Push the feature branch to the remote repository:
   ```bash
   git push --set-upstream origin feature/<branch-name>
   ```

### Branch Usage

- The `main` branch is restricted to production-ready code.
- Feature branches are used to develop, test, and integrate individual modules.

---

## Commit Standards

Clear and descriptive commit messages are essential for tracking changes. Below is the standard format for commit messages:

### Commit Message Format

```
[Type]: [Brief Description]
```

#### **Types**
- `feat`: Adding a new feature.
- `fix`: Fixing a bug.
- `docs`: Updating documentation.
- `refactor`: Code refactoring.
- `test`: Adding or modifying tests.
- `build`: Modifying build configurations.

#### **Examples**
- `feat: Add motion sensor functionality`
- `fix: Resolve API processing error`
- `docs: Add details about branching strategy to README`

---

## Milestones

### Milestone Setup

Milestones are used to track major phases of development.

#### Initial Milestone
- **Title**: **Initial Release**
- **Content**:
  - Repository setup.
  - Creation of protected `main` branch.
  - Feature branch creation.
  - Commitment to descriptive commit standards.
  - Documentation updates.

Future milestones (e.g., module integration or CI/CD setup) will be created as development progresses.

---

## Development Workflow

### Development Steps

Follow the steps below to ensure proper collaboration and integration:

1. Pull the latest changes from `main`:
   ```bash
   git pull origin main
   ```

2. Switch to an appropriate feature branch:
   ```bash
   git checkout -b feature/<branch-name>
   ```

3. Commit changes following commit standards:
   ```bash
   git commit -m "[Type]: [Brief Description]"
   ```

4. Push changes to the remote feature branch:
   ```bash
   git push origin feature/<branch-name>
   ```

5. Open a pull request to merge changes into `main`:
   - Ensure pull requests are reviewed and approved.
   - Wait for CI checks to pass before merging.

---

## Current Progress

### Phase 1 Completed

1. **Repository Setup**
   - Created a GitHub repository with a protected `main` branch.

2. **Branching Strategy**
   - Defined and implemented the branching strategy.
   - Created feature branches (`feature/iot-sensors` and `feature/web-dashboard`).

3. **Commit Standards**
   - Established commit standards with examples for better traceability.

4. **Milestones**
   - Created the **Initial Release** milestone to track repository setup and Phase 1 tasks.

---

# Monitoring and Error Reporting

## Task
Configure notifications or error reporting in the CI/CD system to inform the team in case of errors or build failures.

## Instructions

### 1. Setting Up Email Notifications
- **Choose an Email Tool:** Use tools such as SendGrid or internal email services.
- **Configuration in CI/CD:**  
  - If you are using GitHub Actions, you can use a GitHub Action to send an email (like action-send-mail).
  - Add a step in the workflow file (.github/workflows/ci-cd.yml) that sends an email to the team if the build fails.

**Example of Email Configuration in GitHub Actions:**

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Code
        uses: actions/checkout@v2
      
      - name: Build and Test
        run: |
          npm install
          npm test

  notify_failure:
    needs: build
    if: failure() # Only runs if the build fails
    runs-on: ubuntu-latest
    steps:
      - name: Send Failure Email
        uses: dawidd6/action-send-mail@v3
        with:
          server_address: smtp.example.com
          server_port: 587
          username: ${{ secrets.EMAIL_USERNAME }}
          password: ${{ secrets.EMAIL_PASSWORD }}
          subject: "CI/CD Build Failed: Repository Name"
          body: "Hello Team,\n\nThe latest build failed due to an error. Please check for details."
          to: team@example.com
          from: ci@example.com
```

### Setting Up Slack Notifications
**Create a Webhook in Slack:** Set up a Slack Incoming Webhook for the desired channel.

**Configuration in CI/CD:**
Use an Action or script to send a message to the Slack channel if an error occurs in CI/CD.
You can use existing Actions like rtCamp/action-slack-notify.

**Example of Slack Notification Configuration:**

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Code
        uses: actions/checkout@v2
      
      - name: Build and Test
        run: |
          npm install
          npm test

  notify_failure_slack:
    needs: build
    if: failure() # Only runs if the build fails
    runs-on: ubuntu-latest
    steps:
      - name: Send Slack Notification
        uses: rtCamp/action-slack-notify@v2
        env:
          SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }}
          SLACK_MESSAGE: "Your repository build failed. Please check."
```


## Monitoring and Error Reporting

This project uses CI/CD tools for running builds and tests. If the build fails, the following notification systems activate:

* **Email**: Sends an email to the team with error details.
* **Slack**: Sends a message to a specific channel in Slack for quick notification.

### Troubleshooting Process
In case of an error, follow these steps:

1. Check build reports in the CI/CD system (job execution logs).
2. Review received messages in email or Slack to identify the error.
3. Refer to the troubleshooting documents in the /docs folder for more details.
4. Proceed according to the documented guidelines to resolve the issue.

### Related Documentation

[Release Process](ReleaseProcess.md): Guidelines for tagging versions and deploying releases. This document provides detailed steps for preparing your project for a production release.

[Disaster Recovery Plan](DisasterRecoveryPlan.md): Steps and strategies for rolling back to previous versions in case of deployment failures. A comprehensive plan that includes procedures for rapid recovery from various types of operational failures.

---
