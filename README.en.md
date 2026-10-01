# Manim Hand-Draw Creator Skill

**Turn a matched pencil drawing and colour illustration into a reproducible Manim hand-drawing workflow.** The pencil drawing supplies traced paths and faithful facial ink; the colour reference supplies layers and the final picture.

[中文说明](README.md) · [manim-handdraw on PyPI](https://pypi.org/project/manim-handdraw/0.1.1/) · [library source](https://github.com/FTZ-OPUS/manim-handdraw)

These GIFs were clipped from the author's actual Manim films. They show what was achieved with careful preparation and review, not a guarantee that any single image automatically becomes a finished video.

| Order Goddess | Purple Knight |
| --- | --- |
| ![Order Goddess line art and colouring](assets/showcase/order-goddess-colour.gif) | ![Purple Knight layered colouring](assets/showcase/purple-knight-colour.gif) |

![Flame Queen colouring](assets/showcase/flame-queen-colour.gif)

The [short runnable preview](assets/portrait-preview.gif) comes with a real matched pencil/colour pair, preparation scripts and Manim scene source.

## Use

Read [SKILL.md](SKILL.md). Run the [paired-input walkthrough](examples/paired-inputs.md), and consult [portrait-workflow.md](references/portrait-workflow.md) for line quality, face patches, layered colouring and visual review. Copy this **whole directory** into an AI tool's skill directory, or give the agent this repository and the `SKILL.md` path.

The eyes and other fine facial details are extracted from **the original pencil pixels** and revealed in the animation. Other paths are traced with Manim. A tight cut window prevents duplicate facial strokes without deleting hair that crosses the window. The documentation describes this technique as it actually works.

## Install

Python 3.9+ is required. The `vendor/` directory contains the `manim-handdraw 0.1.1` wheel. `requirements.txt` installs its extraction dependencies into a local `.venv`; other packages are fetched by pip.

```bash
bash install.sh                 # macOS / Linux
```

On Windows PowerShell, run `powershell -File .\install.ps1`. System prerequisites such as Cairo, Pango and FFmpeg vary by operating system; follow the [official Manim Community installation guide](https://docs.manim.community/en/stable/installation.html) if pip reports missing prerequisites. You can also use an existing environment that already has `manim-handdraw[extract]>=0.1.1`.

This workflow reduces repeated extraction, face-window and colour-layer code. It still needs matched inputs, visual decisions and render review. A lone arbitrary colour image is not enough for the faithful pencil workflow, and output quality is not automatic.

The code and skill text use the [MIT License](LICENSE). See [ASSET-NOTICE.md](ASSET-NOTICE.md) for the bundled artwork and video-derived GIFs.
