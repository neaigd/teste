# Test Documentation for create_project_v4.sh

## Default Configuration
| Parameter | Default Value | Description |
|-----------|---------------|-------------|
| License | MIT | Default license type |
| Organization | neaigd | Default GitHub organization |
| Template | basic | Default project template |
| Repository Visibility | Public | Default repository visibility |
| Branch Name | main | Default branch name |

## Test Cases

### 1. Basic Project Creation (using defaults)
```bash
curl -s https://raw.githubusercontent.com/{org}/test-repo/main/create_project_v4.sh | bash -s -- test-project
```

### 2. Node.js Template with Custom License
```bash
curl -s https://raw.githubusercontent.com/{org}/test-repo/main/create_project_v4.sh | bash -s -- -l GPL-3.0 -t node test-project
```

### 3. Python Template with Custom Org
```bash
curl -s https://raw.githubusercontent.com/{org}/test-repo/main/create_project_v4.sh | bash -s -- -o custom-org -t python test-project
```

## Parameter Reference
| Parameter | Values | Default | Description |
|-----------|--------|---------|-------------|
| -l, --license | MIT, GPL-3.0, Apache-2.0 | MIT | Project license type |
| -o, --org | GitHub org name | neaigd | Organization for repository |
| -t, --template | basic, node, python | basic | Project template type |
| -d, --dry-run | (flag) | false | Validate without changes |
| -h, --help | (flag) | - | Show help message |

## Expected Results
For each test case:
1. New GitHub repository created
2. Correct project structure initialized
3. Appropriate template files created
4. LICENSE file matches selected type
5. Initial commit pushed to main branch

## Test Results Documentation
| Test Case | Date | Tester | Result | Notes |
|-----------|------|--------|--------|-------|
|           |      |        |        |       |
|           |      |        |        |       |
|           |      |        |        |       |
