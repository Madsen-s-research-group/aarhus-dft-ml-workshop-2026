# Aarhus DFT-ML Workshop 2026

> Supplementary files for a workshop on density functional theory and machine learning interatomic potentials and their practical applications in materials science.

## Info

| | |
|---|---|
| **Date** | May 4-6, 2026 |
| **Presenters** | Prof. Georg Madsen |
|  | Ralf Wanzenböck |
|  | Sandro Wieser |

## Contents

*Coming soon — check back before the workshop!*

- [x] Setup instructions
- [x] Jupyter notebooks
  - [x] Exercises
  - [x] Solutions
- [ ] Slides & theory notebooks

## Workshop environment (Jupyter)

**Important prerequisite for Windows systems:**

GPAW (the DFT code we are using) does not support using Windows natively.

The first step is to install WSL2 which will serve as your Linux system within the Windows operating system. The following steps present a rough guide for Windows 11. The official setup guide can be found [here](https://learn.microsoft.com/en-us/windows/wsl/install). However, sometimes it is insufficient, so we cover the manual steps here:

- Download the latest version of WSL from [here](https://github.com/microsoft/WSL/releases). Use one
of the msi files such as “wsl.2.6.3.0.x64.msi” suited for your system (x64 is the typical standard, more
specialized CPUs are based on arm64).
- Run the installer
- Restart your PC
- Go to the “Windows Features” control panel (use the search function). And make sure that “Virtual
Machine Platform” and “Windows Subsystem for Linux” are turned on. Note that on some systems
“Virtual Machine Platform” has a slightly different name, also containing “Virtual”. See https://
superuser.com/questions/1736443/wsl-2-installing-linux-failed-error-code-0x80370114 for
further details if you encounter other issues.
- Go to the app store and search for your preferred Linux distribution and install it. A beginner friendly
example that comes with everything we need preinstalled: Ubuntu
- Follow the instructions to set up a name and password. The password is required if you want to install
additional programs in your Linux distribution.

A known issue that can occur is identified by the following error:
```
Failed to attach disk 'C:\Users\USERNAME\AppData\Local\Packages\
CanonicalGroupLimited.Ubuntu_79rhkp1fndgsc\LocalState\ext4.vhdx' to
WSL2: The system cannot find the file specified.
Error code: Wsl/Service/CreateInstance/MountDisk/HCS/ERROR_FILE_NOT_FOUND
```
In that case open the powershell and execute:
```
wsl --unregister ubuntu
wsl --install
```

After the setup is successful, search for Ubuntu in your apps and run it. A terminal window should appear with the content `USER_NAME@SYSTEM_NAME:~`. From there, follow the instructions for Unix-based operating systems below. The only other difference is that once you start the jupyter lab instance it will offer you to open it in a browser or "copy one of the URLs". You will have to manualy copy one of the URLs and put it in your browser.


### Setup

In order to set up the rest, [the version control system git](https://git-scm.com/) and [the command line download tool curl](https://curl.se/) need to be installed on your system, if not already available.

- Run `git --version` and in case of an error run `sudo apt install git`.
- Run `curl --help` (`--version` works too, but the output is a bit convoluted). In case of an error run `sudo apt install curl`.

First, you need to clone the repository. Open a Terminal and execute TODO: add `git clone https://github.com/Madsen-s-research-group/aarhus-dft-ml-workshop-2026`. After cloning this repository, change into the new directory.

We use [miniforge3](https://github.com/conda-forge/miniforge) to create an environment for all dependencies such as libraries for GPAW and the `uv` [package manager](https://docs.astral.sh/uv/getting-started/) to create a Python environment with all the required packages.




#### Preferred: Miniforge3, mamba, and uv


This is the cleanest option, separate from your system setup, and creates all needed environments.

For unix-based operating systems, we can create an isolated setup:

- [`source install_unix.sh`](install_unix.sh)


#### Alternative: use pre-installed mamba / conda

Use the already installed version or simply use the isolated Miniforge3 from the preferred option.

- `mamba create -n workshop_dependencies -c conda-forge python=3.12 libxc blas-devel lapack mpich-mpicc uv gxx -y`
- `conda activate workshop_dependencies`
- `uv sync --extra=cpu` OR  `uv sync --extra=cu126` (if you have an NVIDIA gpu)
- `uv run python -m ipykernel install --user --name workshop_env --display-name "Python (Workshop)"`


### Usage

Whenever you get back to the workshop notebooks, activate the workshop_dependencies environment.

- [`source load_env.sh`](load_env.sh)

With `uv` all Python commands should be run using the `uv run` prefix:

- `uv run ipython`opens a Python shell
- `uv run jupyter lab`starts a Jupyter server and opens it in your browser

### Testing the set up

After starting jupyter lab, look for the file called `test_notebook.ipynb`. Open this file. In case you get asked about an environment, choose the one containing "Workshop". Then, click into the cell and run it by clicking the play button in the top bar. The execution might need a couple of seconds. The output lists the successful and failed imports. Do not feel obligated to solve this beforehand, please tell us at the beginning of the workshop, if any "Import failed" messages were printed.

## License

Code and exercises are licensed under the [MIT License](LICENSE).
Slides and written materials are licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).
