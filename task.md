# Read the Github Action information on other repos

## Task

- Create a github action workflow to auto fetch the information from all the repos start with `homework-3-`

- For each repo, there is a test called `test-calculate-temp-r.yml` with the output 

echo "Rscript calculate_Temp.R ran in ${runtime} seconds."

- You should create a workflow to 

1. First check if the repo has pass the Test Calculate Temp R test run by `test-calculate-temp-r.yml`
2. If the test passed, then fetch the ${runtime} in the "Rscript calculate_Temp.R ran in ${runtime} seconds."
3. Record the runtime in a json file.
4. Do these run step for all the repos start with `homework-3-`

## Output

- Record all the runtime fetched in the json file. Rank the runtimes from fastest to slowest.
- Update the README.md file with the result.
- Commit and push the changes to the main branch.