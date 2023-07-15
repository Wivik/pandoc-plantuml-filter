# pandoc-plantuml-filter
A container image for Pandoc integrating a filter to render PlantUML diagrams.

## How to use

Map your workspace in a volume to let Pandoc transform the content.

Command line example using Podman (Docker works too) : 

```bash
podman run \
--rm \
-v .:/workspace \
--workdir /workspace \
ghcr.io/wivik/pandoc-plantuml:latest \
-o test.epub \
--filter=/filters/plantuml.py \
--standalone \
$(ls book/00-*.md book/01-*.md) 
```

Podman arguments :

- `--rm` : delete the container after execution
- `-v .:/workspace` : bind your current directory in a folder name `/workspace` inside the container
- `--workdir /workspace` : when the container starts, it will be the start directory

Pandoc arguments :

- `-o test.epub` : will produce a file named `test.epub` in `/workspace`, which is also your current local workspace.
- `--filter=/filters/plantuml.py` : call the plantUML filter. The file is located there in the container.
- `--standalone` : a Pandoc argument, usually required to generated the Table of Content
- `$(ls book/00-*.md book/01-*.md)` : this is how I import the markdown content

## How to integrate a diagram in Markdown

Use the code markup with `plantuml` type, and paste the PlantUML content. You don't need `@startuml` and `@enduml`, they'll be automatically added.

Example : 

[Integration example](integration.png)
