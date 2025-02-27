# Homework 3 Performance Tracker

This repository automatically tracks the performance of temperature calculation implementations from repositories starting with `homework-3-`. The performance data is collected from GitHub Actions workflow runs.

## How It Works

1. The GitHub Actions workflow (`fetch-performance-data.yml`) runs on a schedule or can be triggered manually.
2. It searches for all repositories with the prefix `homework-3-`.
3. For each repository, it checks if the `test-calculate-temp-r.yml` workflow has passed.
4. If passed, it extracts the runtime information from the workflow logs.
5. The runtimes are collected, sorted from fastest to slowest, and recorded in a JSON file.
6. This README is updated with the latest performance results.

## Performance Results

No data available yet. The workflow will populate this section after it runs.

## Running the Workflow Manually

You can trigger the performance data collection manually by:
1. Going to the "Actions" tab
2. Selecting the "Fetch Performance Data" workflow
3. Clicking "Run workflow"

## Implementation Details

The performance tracking workflow:
- Uses PyGithub to interact with the GitHub API
- Extracts runtime information from workflow logs
- Updates this README with the latest results
- Creates a `performance_data.json` file with detailed results 