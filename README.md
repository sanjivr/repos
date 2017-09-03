## Installation

* Executable `repos` into `~/bin/`
* Makefile rules into `~/.repos/`

## Usage

* YAML configuration : `repos.yaml`

```
git.corp.yahoo.com:
    token: ./.corp.token
    orgs:
        - dhrainbow
        - dhrainbow-archive
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
    pwd
    ls `pwd/repos.yaml`
    cp ~/.repos/Makefile.orgs ./.Makefile
    # Generated 
    ./.Makefile.repos.def
    mkdir -p ./${ORG}
    cp ~/.repos/Makefile.repos ./${ORG}/.Makefile
    # Generated
    ${ORG}/.Makefile.repos.def
```

### sync
```
    make -f ./.Makefile
```

### update
```
    make -f ./Makefile update
```

### clean
```
    make -f ./Makefile clean
        rm ./${ORG}/.Makefile.repos.def
        rm ./${ORG}/.Makefile
        rm ./Makefile
```
