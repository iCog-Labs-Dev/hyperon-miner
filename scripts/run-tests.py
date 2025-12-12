import subprocess
import pathlib
import sys
import os
import shutil
from concurrent.futures import ThreadPoolExecutor, as_completed

# Colors
RESET = "\033[0m"
GREEN = "\033[92m"
RED = "\033[91m"
YELLOW = "\033[93m"
CYAN = "\033[96m"


def print_ascii_art(text):
    print(CYAN + f"\n{text}\n" + RESET)


def extract_and_print(result, path, idx):
    """
    Print result of one test.
    Returns True on failure, False on success.
    """
    output = result.stdout if result.stdout else result.stderr
    text = output.strip()

    # Simple Petta failure logic
    has_failure = (result.returncode != 0) or ("❌" in text)

    print(YELLOW + f"Test {idx + 1}: {path}" + RESET)
    print((RED if has_failure else GREEN) +
          ("test failed" if has_failure else "test passed") +
          RESET)
    print(YELLOW + f"Exit-code: {result.returncode}" + RESET)
    print("-" * 40)

    return has_failure


def run_test_file(test_file):
    """
    Run a single Petta test file using run.sh.
    """
    try:
        run_sh = shutil.which("run.sh")
        if not run_sh:
            raise FileNotFoundError("run.sh not found in PATH")

        result = subprocess.run(
            [run_sh, str(test_file)],
            capture_output=True,
            text=True,
            check=False
        )
        return result, test_file, False

    except Exception as e:
        # Create fallback result
        class MockResult:
            returncode = -1
            stdout = ""
            stderr = str(e)

        return MockResult(), test_file, True


# ------------------------------
# Main Script
# ------------------------------

print_ascii_art("Parallel Test Runner")

# Whitelist
allowed_tests = {
    "test-isurp-old.metta",
    "test-common-utils.metta",
    "test-isurp.metta",
    "test-est-tv.metta",
    "test-surp.metta",
    "test-emp-tv.metta",
    "test-jsd.metta",
}

# Collect tests inside ../
root = pathlib.Path("../")
test_files = [
    f for f in root.rglob("test-*.metta")
    if f.name in allowed_tests
]

if not test_files:
    print("⚠️  No whitelisted tests found.")
    sys.exit(0)

total = len(test_files)
fails = 0
failed_tests = []

# Run tests in parallel (keeping behavior similar to your original script)
with ThreadPoolExecutor() as executor:
    future_to_test = {
        executor.submit(run_test_file, path): idx
        for idx, path in enumerate(test_files)
    }

    for future in as_completed(future_to_test):
        idx = future_to_test[future]
        result, path, _ = future.result()
        failed = extract_and_print(result, path, idx)
        if failed:
            fails += 1
            failed_tests.append(str(path))

# ------------------------------
# Summary
# ------------------------------

print(CYAN + "\nTest Summary\n" + RESET)
print(f"{total} files tested.")
print(RED + f"{fails} failed." + RESET)
print(GREEN + f"{total - fails} succeeded." + RESET)

if fails:
    print(RED + "\nFailed test files:" + RESET)
    for f in failed_tests:
        print(" - " + f)
    print(RED + "\nTests failed. Exiting with code 1." + RESET)
    sys.exit(1)
