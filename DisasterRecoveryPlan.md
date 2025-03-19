# Disaster Recovery Plan

## Rollback Script
We have implemented a script (`rollback.sh`) that enables rapid rollback to the last stable version in our Git repository. The script fetches tags, identifies the last stable tag, and checks out to that tag.

## Step-by-Step Recovery Plan
### Simulated Disaster Scenarios
#### Data Corruption
- **Step 1:** Simulate data corruption by introducing a fault in the database on a test system.
- **Step 2:** Execute the rollback script:
```bash
chmod +x rollback.sh
./rollback.sh
```
- **Step 3:** Verify the system is operational and document the outcome.

## General Recovery Procedures
In the event of a system failure or data corruption, follow these steps:
1. Identify the issue and the affected systems.
2. Communicate the issue to the relevant team members.
3. Execute the rollback script to revert to the last stable release.
4. Assess the system's functionality post-rollback.
5. Document the incident, actions taken, and any lessons learned.

## Checkpoint
- Ensure that the rollback scripts are tested regularly.
- Maintain and update the recovery plan as new scenarios or procedures are identified.
