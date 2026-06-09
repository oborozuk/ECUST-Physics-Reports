import subprocess
from pathlib import Path


def compile_samples():
    TYPST_EXECUTABLE = "typst"
    SRC_DIR = Path("src")
    FONT_DIR = Path("fonts")
    SAMPLES_DIR = Path("samples")

    if not SRC_DIR.is_dir():
        print(f"Error: directory {SRC_DIR} not found")
        return
    
    SAMPLES_DIR.mkdir(parents=True, exist_ok=True)

    base_path = Path.cwd()
    src_absolute = SRC_DIR.resolve()
    font_absolute = (base_path / FONT_DIR).resolve()

    print(f"Source root directory: {src_absolute}")
    print(f"Font directory: {font_absolute}")
    print(f"Samples directory: {SAMPLES_DIR}")

    success_count = 0

    for entry in src_absolute.iterdir():
        if not entry.is_dir():
            continue

        entry_name = entry.name
        target_typ_file = entry / f"{entry_name}.typ"
        if not target_typ_file.exists():
            print(f"Skip {entry_name}: missing {entry_name}.typ")
            continue

        print(f"\nStart compiling target: {entry_name}")

        samples_file = (SAMPLES_DIR / f"{entry_name}.pdf").resolve()

        command = [
            str(TYPST_EXECUTABLE),
            "c",
            str(target_typ_file),
            "--root",
            str(src_absolute),
            "--font-path",
            str(font_absolute),
            "--input",
            "sample=T",
            "--ignore-system-fonts",
            str(samples_file),
        ]

        # print(f"Running command: {' '.join(command)}")

        try:
            subprocess.run(
                command,
                check=True,
                # capture_output=True,
                # text=True,
            )
            print(f"Compile succeeded: {entry_name}")
            success_count += 1

        except subprocess.CalledProcessError as err:
            print(f"Compile failed: {entry_name}")
            stderr = err.stderr.strip() if err.stderr else ""
            print(f"Error detail: {stderr}")

        except FileNotFoundError:
            print("Error: typst executable not found, check TYPST_EXECUTABLE path")
            return

    print(f"Task finished. Total successfully compiled targets: {success_count}")


if __name__ == "__main__":
    compile_samples()