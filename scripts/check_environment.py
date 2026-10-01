"""Check the Python parts required by this standalone skill."""

from __future__ import annotations

import importlib
import sys
from pathlib import Path


def main() -> int:
    if sys.version_info < (3, 9):
        print("Python 3.9 or newer is required")
        return 1

    failed = False
    for name in ("manim", "numpy", "scipy", "skimage", "PIL", "manim_handdraw"):
        try:
            module = importlib.import_module(name)
            version = getattr(module, "__version__", "installed")
            print(f"{name}: {version}")
        except ImportError as exc:
            print(f"{name}: missing ({exc})")
            failed = True

    if not failed:
        import manim_handdraw as hd

        if tuple(map(int, hd.__version__.split(".")[:3])) < (0, 1, 1):
            print("manim-handdraw 0.1.1 or newer is required")
            failed = True
        for method in ("cut_out_rectangles", "adaptive_widths"):
            if not hasattr(hd.StrokeSet, method):
                print(f"Missing StrokeSet.{method}")
                failed = True

    root = Path(__file__).resolve().parents[1]
    for relative in ("SKILL.md", "assets/order-goddess/pencil.png",
                     "assets/order-goddess/color_ref.png",
                     "examples/portrait_demo.py"):
        if not (root / relative).is_file():
            print(f"Missing skill file: {relative}")
            failed = True

    if failed:
        print("Check failed. Follow README.md and the Manim installation guide.")
        return 1
    print("Python dependencies and bundled skill files: OK")
    print("Render the example to verify the complete video toolchain.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
