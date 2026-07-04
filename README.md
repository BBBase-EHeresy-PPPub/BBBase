# Blood Bowl Base

**Requirements**

```sh
pip install mkdocs-material mike
```

**Running Both Versions**

```bat
start_both.bat
```

Local URLs:

```text
http://127.0.0.1:8000/        - Blood Bowl 2025 default
http://127.0.0.1:8000/bb2020/ - Blood Bowl 2020
http://127.0.0.1:8000/bb2025/ - Blood Bowl 2025
```

**Running One Version**

```sh
mkdocs serve --config-file mkdocs-2025.yml
mkdocs serve --config-file mkdocs-2020.yml
```
