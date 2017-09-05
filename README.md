## Installation

```
make install
```

`Note: installs into /usr/local`

## Usage

* YAML configuration : `repos.yaml`

```
➜ tree -L 1 | grep "repos.yaml"
├── repos.yaml
```

```
git.corp.yahoo.com:
    token: ./.corp.token
    orgs:
        - dhrainbow
        - dhrainbow-archive
    users:
        - sanjivr
```

```
➜ repos -h
usage: repos [-h] [-d] (-i | -s | -up | -x)

repositories in a git organization

optional arguments:
  -h, --help     show this help message and exit
  -d, --debug    print debug information
  -i, --init     initialize with repos.yaml
  -s, --sync     clone all repositories in organizations
  -up, --update  update master branch on all repositories
  -x, --clean    undo initialization
```


## Internals

### init

```
➜ tree .repos dhrainbow/.repos dhrainbow-archive/.repos sanjivr/.repos
.repos
├── Makefile -> /usr/local/share/repos/orgs.mk
└── orgs.def.mk
dhrainbow/.repos
├── Makefile -> /usr/local/share/repos/repos.mk
└── repos.def.mk
dhrainbow-archive/.repos
├── Makefile -> /usr/local/share/repos/repos.mk
└── repos.def.mk
sanjivr/.repos
├── Makefile -> /usr/local/share/repos/repos.mk
└── repos.def.mk
```

### sync
```
    make -f ./repos/Makefile
```

### update
```
    make -f ./repos/Makefile update
```

### clean
```
    make -f ./repos/Makefile clean
        find . -name ".repos" -type d

```
