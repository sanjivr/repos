INSTALL_ROOT:=/usr/local

install:
	cp bin/repos $(INSTALL_ROOT)/bin
	cp bin/pulls $(INSTALL_ROOT)/bin
	mkdir -p $(INSTALL_ROOT)/share/repos
	cp make.rules/orgs.mk $(INSTALL_ROOT)/share/repos/
	cp make.rules/repos.mk $(INSTALL_ROOT)/share/repos/

clean:
	-rm $(INSTALL_ROOT)/bin/repos
	-rm -rf $(INSTALL_ROOT)/share/repos

default: install
