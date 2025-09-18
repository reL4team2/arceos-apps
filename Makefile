A ?= rust/helloworld
AX_ROOT ?= $(shell cat .axroot 2>/dev/null)

APP := $(A)
ifeq ($(filter /%,$(A)),)
  ifeq ($(filter ~%,$(A)),)
    APP := $(PWD)/$(A)
  endif
endif

$(if $(V), $(info AX_ROOT: "$(AX_ROOT)"))

all: build

config_rlk:
	@python3 .rlk/tools/app-parser.py -c $(APP)/app.toml

chaxroot:
	@./scripts/set_ax_root.sh $(AX_ROOT)

defconfig oldconfig justrun debug disasm disk_img clean clean_c:
	@make -C $(AX_ROOT) RLK=/workspace/arceos-apps/.rlk A=$(APP) $@

build: config_rlk
	@make -C $(AX_ROOT) RLK=/workspace/arceos-apps/.rlk A=$(APP) build

run: build
	@make -C $(AX_ROOT) RLK=/workspace/arceos-apps/.rlk A=$(APP) run

test:
ifneq ($(filter command line,$(origin A)),)
	@./scripts/app_test.sh $(A)
else
	@./scripts/app_test.sh
endif

.PHONY: all chaxroot defconfig oldconfig build run justrun debug disasm disk_img clean clean_c test config_rlk
