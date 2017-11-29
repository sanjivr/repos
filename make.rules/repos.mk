include .repos/repos.def.mk
all: $(REPOS)
$(REPOS):
	git clone $(GIT_ORG_SSH)/$@.git

update: $(addsuffix /update, $(REPOS))
%/update:
	cd $*; \
	git stash; \
	git checkout master; \
	git pull; \
	git checkout -; \
	git stash pop || true; 

.PHONY: %/update
