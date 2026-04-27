from __future__ import annotations

import argparse

from backend.server import start_server


def _parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Run the AITD local dashboard server.")
    parser.add_argument(
        "--port",
        type=int,
        default=8788,
        help="Port for the local dashboard server. Default: 8788",
    )
    parser.add_argument(
        "--host",
        type=str,
        default="",
        help="Host to bind the server. Overrides config file. Default: use config value",
    )
    return parser.parse_args()


if __name__ == "__main__":
    args = _parse_args()
    start_server(port_override=args.port, host_override=args.host or None)
