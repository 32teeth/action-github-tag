# Get tag Github Action

Simple Action that have only one responsibility - output tag name (parsed from `GITHUB_REF` environment variable).

## Usage

Should be used only when actual tag is pushed, otherwise the Action will exit with an error.

```yaml
on:
  push:
    tags:
      - 'v*.*.*'
      - '*.*.*'
      - '*'
```

```yaml
- name: Get latest tag pushed
  id: tag
  uses: 32teeth/action-get-tag@v1
  with:
    # Return only the tag number (ex: v1.0.0 -> 1.0.0)
    numbers_only: true
- name: Use latest tag pushed
  run: echo ${{steps.tag.outputs.tag}}
```
