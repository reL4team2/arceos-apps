#!/bin/bash

AX_ROOT=.arceos
RLK_ROOT=.rlk

test ! -d "$AX_ROOT" && echo "Cloning repositories ..." || true
test ! -d "$AX_ROOT" && git clone https://github.com/reL4team2/arceos.git "$AX_ROOT" --branch sel4-porting --depth=1 || true


test ! -d "$AX_ROOT" && echo "Cloning rel4 linx kit ..." || true
test ! -d "$RLK_ROOT" && git clone https://github.com/reL4team2/rel4-linux-kit.git "$RLK_ROOT" --branch croak/arceos_support2 --depth=1 || true

$(dirname $0)/set_ax_root.sh $AX_ROOT
