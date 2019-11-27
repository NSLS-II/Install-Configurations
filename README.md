# Install Configurations

This repository contains install configurations for use with [installSynApps](https://github.com/epicsNSLS2-deploy/installSynApps), and [Docker-Builder](https://github.com/epicsNSLS2-deploy/Docker-Builder).

### Included Configurations

* `configureDeb7` - A standard areaDetector build configuration for Debian 7 systems
* `configureDeb8` - A standard areaDetector build configuration for Debian 8 systems
* `configureDeb9` - A standard areaDetectorbuild configuration for Debian 9 systems
* `configureWindows` - A standard areaDetector build configuration for Windows systems
* `minConfigureLinux` - A minimum configuration for building ADSimDetector on Linux
* `minConfigureWindows` - A minimum configuration for building ADSimDetector on Windows
* `visionPluginConfig` - A linux configuration that adds several additional computer vision plugins to areaDetector build.

### Using Custom Configurations

If you would like to use custom `Install-Configurations`, the recommended way to do this is to do the following:

* First, fork this repository, using the `fork` button above.
* Clone your fork of `Install-Configurations`, and make edits or add configurations to the local clone.
* Push the changes you made locally to your fork on github.
* Clone `Docker-Builder` with:
```
git clone https://github.com/epicsNSLS2-deploy/Docker-Builder
```
* For the distribution you wish to build, edit the `DISTRIBUTION/run_build.sh` file, and change the url for `Install-Configurations` to that of your fork, and edit the path to the configuration (`-c` flag for `installCLI.py`)
* You can now run `Docker-Builder` using your custom configuraion.
```
./build_image.sh DISTRIBUTION
./run_container.sh DISTRIBUTION
```

### Included Helper Scripts

* check_module_deps.py - script that helps identify which EPICS modules are dependancies for a particular module
