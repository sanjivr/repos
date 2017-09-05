#ORGS := $(wildcard */)
include .repos/orgs.def.mk
all: $(ORGS)
$(ORGS):
	$(MAKE) -C $@ -f .repos/Makefile

update: $(addsuffix /update, $(ORGS))

%/update:
	$(MAKE) -C $* -f .repos/Makefile update

clean:
	find . -name ".repos" -type d -exec rm {} \;


.PHONY: all $(ORGS) update clean
