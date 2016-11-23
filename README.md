- [fuzetsu](https://github.com/nhirokinet/fuzetsu/) required prior to installation of this package.

## Installation

### Install from source
```
sudo apt install python python-daemon
sudo make install install_daemon_scripts
sudoedit /etc/flamehaze.ini
sudo service flamehaze start
```

### Build dpkg file
```
make dpkg
```

### Install dpkg file
```
sudo apt install python python-daemon
sudo dpkg -i flamehaze_0.0.1_amd.deb
sudoedit /etc/flamehaze.ini
sudo service flamehaze restart
```

## Notes
This package connects to [flamehaze-outlaw](https://github.com/nhirokinet/flamehaze-outlaw), the central judge system for competitive programming, configured in /etc/flamehaze.ini .
