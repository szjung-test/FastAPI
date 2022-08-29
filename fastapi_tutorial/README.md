# Fast API 기초

# 1. FastAPI 설치
- 그동안 가상환경하면서 안된 이유 python3
```python
szjung@esp:/workspace/newworld/fastapi_tutorial$ python3 -m venv venv
The virtual environment was not created successfully because ensurepip is not
available.  On Debian/Ubuntu systems, you need to install the python3-venv
package using the following command.

    apt install python3.8-venv

You may need to use sudo with that command.  After installing the python3-venv
package, recreate your virtual environment.

Failing command: ['/workspace/newworld/fastapi_tutorial/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']
```
- apt install python3.8-venv 이게 설치가 안되어 있었음
- 설치시 또 에러 발생
```python
szjung@esp:/workspace/newworld/fastapi_tutorial$ sudo apt update install python3.8-venv
E: The update command takes no arguments
szjung@esp:/workspace/newworld/fastapi_tutorial$ sudo apt update
Get:1 http://security.ubuntu.com/ubuntu focal-security InRelease [114 kB]
Hit:2 http://archive.ubuntu.com/ubuntu focal InRelease                                 
Get:3 http://archive.ubuntu.com/ubuntu focal-updates InRelease [114 kB]                
Get:4 http://security.ubuntu.com/ubuntu focal-security/main amd64 Packages [2,099 kB]
Get:5 http://archive.ubuntu.com/ubuntu focal-backports InRelease [108 kB]
Get:6 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 Packages [2,555 kB]
Get:7 http://security.ubuntu.com/ubuntu focal-security/restricted amd64 Packages [1,472 kB]
Get:8 http://security.ubuntu.com/ubuntu focal-security/universe amd64 Packages [889 kB]
Get:9 http://security.ubuntu.com/ubuntu focal-security/multiverse amd64 Packages [27.5 kB]
Get:10 http://archive.ubuntu.com/ubuntu focal-updates/universe amd64 Packages [1,183 kB]   
Get:11 http://archive.ubuntu.com/ubuntu focal-updates/restricted amd64 Packages [1,583 kB]
Get:12 http://archive.ubuntu.com/ubuntu focal-updates/multiverse amd64 Packages [30.2 kB]
Get:13 http://archive.ubuntu.com/ubuntu focal-backports/main amd64 Packages [55.1 kB]
Get:14 http://archive.ubuntu.com/ubuntu focal-backports/universe amd64 Packages [27.4 kB]
Fetched 10.3 MB in 4s (2,562 kB/s)                           
Reading package lists... Done
Building dependency tree       
Reading state information... Done
57 packages can be upgraded. Run 'apt list --upgradable' to see them.
```

- 파이널리 설치 완료
```
szjung@esp:/workspace/newworld/fastapi_tutorial$ sudo apt install python3.8-venv
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  libpython3.8 libpython3.8-dev libpython3.8-minimal libpython3.8-stdlib python3.8 python3.8-dev python3.8-minimal
Suggested packages:
  python3.8-doc binfmt-support
The following NEW packages will be installed:
  python3.8-venv
The following packages will be upgraded:
  libpython3.8 libpython3.8-dev libpython3.8-minimal libpython3.8-stdlib python3.8 python3.8-dev python3.8-minimal
7 upgraded, 1 newly installed, 0 to remove and 50 not upgraded.
Need to get 10.8 MB of archives.
After this operation, 37.9 kB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 python3.8-dev amd64 3.8.10-0ubuntu1~20.04.5 [514 kB]
Get:2 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 libpython3.8-dev amd64 3.8.10-0ubuntu1~20.04.5 [3,951 kB]
Get:3 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 libpython3.8 amd64 3.8.10-0ubuntu1~20.04.5 [1,625 kB]
Get:4 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 python3.8 amd64 3.8.10-0ubuntu1~20.04.5 [387 kB]
Get:5 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 libpython3.8-stdlib amd64 3.8.10-0ubuntu1~20.04.5 [1,675 kB]
Get:6 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 python3.8-minimal amd64 3.8.10-0ubuntu1~20.04.5 [1,905 kB]
Get:7 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 libpython3.8-minimal amd64 3.8.10-0ubuntu1~20.04.5 [717 kB]
Get:8 http://archive.ubuntu.com/ubuntu focal-updates/universe amd64 python3.8-venv amd64 3.8.10-0ubuntu1~20.04.5 [5,444 B]
Fetched 10.8 MB in 4s (2,817 kB/s)         
debconf: unable to initialize frontend: Dialog
debconf: (No usable dialog-like program is installed, so the dialog based frontend cannot be used. at /usr/share/perl5/Debconf/FrontEnd/Dialog.pm line 76, <> line 8.)
debconf: falling back to frontend: Readline
(Reading database ... 23113 files and directories currently installed.)
Preparing to unpack .../0-python3.8-dev_3.8.10-0ubuntu1~20.04.5_amd64.deb ...
Unpacking python3.8-dev (3.8.10-0ubuntu1~20.04.5) over (3.8.10-0ubuntu1~20.04.4) ...
Preparing to unpack .../1-libpython3.8-dev_3.8.10-0ubuntu1~20.04.5_amd64.deb ...
Unpacking libpython3.8-dev:amd64 (3.8.10-0ubuntu1~20.04.5) over (3.8.10-0ubuntu1~20.04.4) ...
Preparing to unpack .../2-libpython3.8_3.8.10-0ubuntu1~20.04.5_amd64.deb ...
Unpacking libpython3.8:amd64 (3.8.10-0ubuntu1~20.04.5) over (3.8.10-0ubuntu1~20.04.4) ...
Preparing to unpack .../3-python3.8_3.8.10-0ubuntu1~20.04.5_amd64.deb ...
Unpacking python3.8 (3.8.10-0ubuntu1~20.04.5) over (3.8.10-0ubuntu1~20.04.4) ...
Preparing to unpack .../4-libpython3.8-stdlib_3.8.10-0ubuntu1~20.04.5_amd64.deb ...
Unpacking libpython3.8-stdlib:amd64 (3.8.10-0ubuntu1~20.04.5) over (3.8.10-0ubuntu1~20.04.4) ...
Preparing to unpack .../5-python3.8-minimal_3.8.10-0ubuntu1~20.04.5_amd64.deb ...
Unpacking python3.8-minimal (3.8.10-0ubuntu1~20.04.5) over (3.8.10-0ubuntu1~20.04.4) ...
Preparing to unpack .../6-libpython3.8-minimal_3.8.10-0ubuntu1~20.04.5_amd64.deb ...
Unpacking libpython3.8-minimal:amd64 (3.8.10-0ubuntu1~20.04.5) over (3.8.10-0ubuntu1~20.04.4) ...
Selecting previously unselected package python3.8-venv.
Preparing to unpack .../7-python3.8-venv_3.8.10-0ubuntu1~20.04.5_amd64.deb ...
Unpacking python3.8-venv (3.8.10-0ubuntu1~20.04.5) ...
Setting up libpython3.8-minimal:amd64 (3.8.10-0ubuntu1~20.04.5) ...
Setting up python3.8-minimal (3.8.10-0ubuntu1~20.04.5) ...
Setting up libpython3.8-stdlib:amd64 (3.8.10-0ubuntu1~20.04.5) ...
Setting up python3.8 (3.8.10-0ubuntu1~20.04.5) ...
Setting up libpython3.8:amd64 (3.8.10-0ubuntu1~20.04.5) ...
Setting up python3.8-venv (3.8.10-0ubuntu1~20.04.5) ...
Setting up libpython3.8-dev:amd64 (3.8.10-0ubuntu1~20.04.5) ...
Setting up python3.8-dev (3.8.10-0ubuntu1~20.04.5) ...
Processing triggers for libc-bin (2.31-0ubuntu9.7) ...
Processing triggers for mime-support (3.64ubuntu1) ...
```

- Next step 설치 후 작동시키기
```python
szjung@esp:/workspace/newworld/fastapi_tutorial$ source venv/bin/activate
bash: venv/bin/activate: No such file or directory
szjung@esp:/workspace/newworld/fastapi_tutorial$ source venv/bin/activate^C
szjung@esp:/workspace/newworld/fastapi_tutorial$ cd venv/
szjung@esp:/workspace/newworld/fastapi_tutorial/venv$ ls -a
.  ..  bin  include  lib  lib64  pyvenv.cfg
szjung@esp:/workspace/newworld/fastapi_tutorial/venv$ cd bin/
szjung@esp:/workspace/newworld/fastapi_tutorial/venv/bin$ ls -a
.  ..  python  python3
szjung@esp:/workspace/newworld/fastapi_tutorial/venv/bin$ cd ..
szjung@esp:/workspace/newworld/fastapi_tutorial/venv$ cd ..
szjung@esp:/workspace/newworld/fastapi_tutorial$ ls - a
ls: cannot access '-': No such file or directory
ls: cannot access 'a': No such file or directory
szjung@esp:/workspace/newworld/fastapi_tutorial$ rm -f venv/
rm: cannot remove 'venv/': Is a directory
szjung@esp:/workspace/newworld/fastapi_tutorial$ rm -rf venv
szjung@esp:/workspace/newworld/fastapi_tutorial$ python3 -m venv venv
szjung@esp:/workspace/newworld/fastapi_tutorial$ ls -l
total 12
-rw-r--r-- 1 szjung szjung  183  7월 21 00:38 main.py
-rw-r--r-- 1 szjung szjung  246  7월 25 08:30 schemas.py
drwxr-xr-x 6 szjung szjung 4096  8월 29 02:27 venv
```
```python
szjung@esp:/workspace/newworld/fastapi_tutorial$ source venv/bin/activate
(venv) szjung@esp:/workspace/newworld/fastapi_tutorial$ which python
/workspace/newworld/fastapi_tutorial/venv/bin/python
(venv) szjung@esp:/workspace/newworld/fastapi_tutorial$   pip install fastapi
```
- 가상환경 접속 
