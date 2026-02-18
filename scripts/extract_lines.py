#!/usr/bin/env python3
"""Write the first N lines of a file to a new file.

Output name rule:
- If N is at least 1000 and divisible by 1000, use N/1000 as suffix (e.g., 50000 -> _50).
- Otherwise, use N directly (e.g., 750 -> _750).
"""

from __future__ import annotations

import argparse
from pathlib import Path


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Write the first N lines of a file to a new file."
    )
    parser.add_argument("input", help="Path to the input file")
    parser.add_argument("lines", type=int, help="Number of lines to copy")
    parser.add_argument(
        "--output",
        help="Optional explicit output path (overrides auto naming)",
    )
    return parser.parse_args()


def make_output_path(input_path: Path, lines: int) -> Path:
    if lines >= 1000 and lines % 1000 == 0:
        suffix = str(lines // 1000)
    else:
        suffix = str(lines)
    return input_path.with_name(f"{input_path.stem}_{suffix}{input_path.suffix}")


def write_first_n_lines(input_path: Path, output_path: Path, lines: int) -> None:
    if lines < 0:
        raise ValueError("lines must be non-negative")

    with input_path.open("r", encoding="utf-8", errors="replace") as src, output_path.open(
        "w", encoding="utf-8", errors="replace"
    ) as dst:
        for idx, line in enumerate(src, start=1):
            if idx > lines:
                break
            dst.write(line)


def main() -> int:
    args = parse_args()
    input_path = Path(args.input)

    if not input_path.exists():
        raise SystemExit(f"Input file not found: {input_path}")

    output_path = Path(args.output) if args.output else make_output_path(input_path, args.lines)
    write_first_n_lines(input_path, output_path, args.lines)
    print(f"Wrote {args.lines} lines to {output_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
