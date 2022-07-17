# Spritepack Check Action

Simple composite action for GitHub Actions workflows to perform checks on
your spritepack code.

## Usage

*For complete example see [spritepack-check-example.](https://github.com/friends-of-monika/spritepack-check-example)*

Add this step to your workflow `steps` section (make sure it goes
*after* `actions/checkout`):

```yaml
# ... the rest of your workflow .yml file ...
- name: "Check"
  uses: "friends-of-monika/spritepack-check-action@v1"
```
