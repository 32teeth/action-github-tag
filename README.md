# Get Tag GitHub Action

The "Get Tag" GitHub Action is a simple and lightweight tool designed for one specific task: extracting the tag name from the `GITHUB_REF` environment variable. This action can be useful when you want to work with tags in your GitHub Actions workflow.

## Usage

To use this action, you should configure it to run when tags are pushed to your repository. Ensure that the action is only triggered when actual tags are pushed; otherwise, it will exit with an error.

Here's an example of how to set up the workflow in your `.github/workflows/main.yml` file:

```yaml
on:
  push:
    tags:
      - 'v*.*.*'
      - '*.*.*'
      - '*'
```

This configuration ensures that the action runs when a tag is pushed, regardless of its format.

Next, add the action itself to your workflow:

```yaml
    - name: Get latest tag pushed
      id: tag
      uses: 32teeth/action-github-tag@v1
      with:
        # Return only the tag number (e.g., v1.0.0 -> 1.0.0)
        numbers_only: true
    - name: Use the latest tag pushed
      run: echo ${{steps.tag.outputs.tag}}
```

In this example, the action retrieves the latest tag pushed to your repository and makes it available as an output named tag. You can then use this tag in subsequent steps of your workflow as needed.

This "Get Tag" GitHub Action simplifies the process of working with tags in your GitHub Actions workflows, making it easier to automate tasks related to versioning and releases.