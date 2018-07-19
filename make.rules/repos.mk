include .repos/repos.def.mk
all: $(REPOS)
$(REPOS):
	git clone $(GIT_ORG_SSH)/$@.git

update: $(addsuffix /update, $(REPOS))
%/update:
	@cd $* && git checkout master > /dev/null 2>&1 && git pull > /dev/null 2>&1 &&  git checkout - > /dev/null 2>&1 && echo "$* done" || echo "$* failed"

.PHONY: %/update
