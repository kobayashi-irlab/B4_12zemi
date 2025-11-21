# ===== Config =====
LATEXMK  ?= latexmk
ENGINE   ?= lualatex
MAIN     ?= main
BUILD    ?= build
.DEFAULT_GOAL := pdf

# ===== Targets =====
.PHONY: pdf view clean

pdf:
	@mkdir -p $(BUILD)
	$(LATEXMK) -$(ENGINE) -outdir=$(BUILD) $(MAIN).tex

view:
	@mkdir -p $(BUILD)
	$(LATEXMK) -$(ENGINE) -outdir=$(BUILD) -pvc $(MAIN).tex

clean:
	$(LATEXMK) -C -outdir=$(BUILD) $(MAIN).tex