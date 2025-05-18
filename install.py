import shutil
import sys
import time

from pathlib import Path
from typing import Dict
from colorama import Fore, init

DOTFILES_DIR: Path = Path(__file__).resolve().parent
HOME_USER_DIR: Path = Path.home()

init()


def remove_target_if_exists(target: Path) -> None:
    if target.is_symlink():
        target.unlink()
    elif target.is_dir():
        shutil.rmtree(target)


def create_symlink(target: Path, link_name: Path) -> None:
    if target.is_dir():
        link_name.symlink_to(target)
    else:
        sys.exit(1)


def setup() -> None:
    directories: Dict[Path, Path] = {
        DOTFILES_DIR / "kitty": HOME_USER_DIR / ".config" / "kitty",
        DOTFILES_DIR / "neofetch": HOME_USER_DIR / ".config" / "neofetch",
        DOTFILES_DIR / "oh-my-zsh/custom": HOME_USER_DIR / ".oh-my-zsh" / "custom",
    }

    for source_dir, target_path in directories.items():
        print(f"📦 Setting {source_dir}...")
        time.sleep(0.5)
        remove_target_if_exists(target_path)
        create_symlink(source_dir, target_path)


def main() -> None:
    print(Fore.GREEN + "Initializing", end="", flush=True)
    for i in range(3):
        print(".", end="", flush=True)
        time.sleep(0.6)
    print("\n" + Fore.RESET)

    setup()
    print(Fore.GREEN + "\nFinish!" + Fore.RESET)


if __name__ == "__main__":
    main()
