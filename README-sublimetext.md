# Sublimetext console debugging

```python
import json

sublimetext_vars = window.extract_variables()

print(json.dumps(sublimetext_vars, sort_keys=True, indent=4))
```
