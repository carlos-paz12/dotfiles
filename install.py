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
    #: Checks if the path of `target` is a directory.
    if not target.is_dir():
        sys.exit(1) #: If not, finish the program with error.

    #: Creates the destination directory (`link_name`) if it doesn't exist.
    #:
    #: With `parents=True` and `exist_ok=True, there will be no error
    #: if it exists and it will create parent directories as needed
    link_name.mkdir(parents=True, exist_ok=True)

    #: For each entry (dir or file) in the target directory...
    for entry in target.iterdir():
        #: DDefines the absolute path where the symbolic link will be created.
        dest: Path = link_name / entry.name
        #: If there is already a file, directory or symlink with the same
        #: name in the destination, it will be removed first.
        if dest.exists() or dest.is_symlink():
            if dest.is_symlink() or dest.is_file():
                dest.unlink()
            elif dest.is_dir():
                shutil.rmtree(dest)

        #: Creates a symlink pointing to the real path of the original item.
        dest.symlink_to(entry.resolve())


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
    for _ in range(3):
        print(".", end="", flush=True)
        time.sleep(0.6)
    print("\n" + Fore.RESET)

    setup()
    print(Fore.GREEN + "\nFinish!" + Fore.RESET)


if __name__ == "__main__":
    main()
