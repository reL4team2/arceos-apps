#!/bin/bash

AX_ROOT=.arceos

test ! -d "$AX_ROOT" && echo "Cloning repositories ..." || true
test ! -d "$AX_ROOT" && git clone https://github.com/reL4team2/arceos.git "$AX_ROOT" --branch sel4-porting --depth=1 || true

$(dirname $0)/set_ax_root.sh $AX_ROOT
