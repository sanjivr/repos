install:
	cp bin/repos ~/bin/
	mkdir -p ~/.repos/
	cp make.rules/Makefile.orgs ~/.repos/
	cp make.rules/Makefile.repos ~/.repos/

clean:
	-rm ~/bin/repos
	-rm -rf ~/.repos

default: install
