# zephyr-action
Run Zephyr as a GitHub Action

## Inputs

### `args`

**Required** The list of arguments to pass to `zephyr`.

## Example usage

```yaml
uses actions/zephyr-action@v1
with:
  args: "-f -e Main"
```
