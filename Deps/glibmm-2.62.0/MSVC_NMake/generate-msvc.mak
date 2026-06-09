# NMake Makefile portion for code generation and
# intermediate build directory creation
# Items in here should not need to be edited unless
# one is maintaining the NMake build files.

# Create the build directories
$(CFG)\$(PLAT)\gendef	\
$(CFG)\$(PLAT)\glibmm	\
$(CFG)\$(PLAT)\giomm	\
$(CFG)\$(PLAT)\glibmm-ex	\
$(CFG)\$(PLAT)\giomm-ex	\
$(CFG)\$(PLAT)\glibmm-tests	\
$(CFG)\$(PLAT)\giomm-tests	\
$(CFG)\$(PLAT)\extra_defs_gen:
	@-mkdir $@

# Generate .def files
$(CFG)\$(PLAT)\glibmm\glibmm.def: $(GENDEF) $(CFG)\$(PLAT)\glibmm $(glibmm_OBJS)
	$(CFG)\$(PLAT)\gendef.exe $@ $(GLIBMM_LIBNAME) $(CFG)\$(PLAT)\glibmm\*.obj
	@findstr /v "Avx2WmemEnabledWeakValue" $@ > $@.tmp && move /Y $@.tmp $@

$(CFG)\$(PLAT)\giomm\giomm.def: $(GENDEF) $(CFG)\$(PLAT)\giomm $(giomm_OBJS)
	$(CFG)\$(PLAT)\gendef.exe $@ $(GIOMM_LIBNAME) $(CFG)\$(PLAT)\giomm\*.obj
	@findstr /v "Avx2WmemEnabledWeakValue" $@ > $@.tmp && move /Y $@.tmp $@

# Generate .def file for glibmm_generate_extra_defs
$(EXTRADEFS_OUTDIR)\glibmm_generate_extra_defs.def: $(GENDEF) $(EXTRADEFS_OUTDIR) $(EXTRADEFS_OUTDIR)\generate_extra_defs.obj
	$(CFG)\$(PLAT)\gendef.exe $@ $(EXTRADEFS_LIBNAME) $(EXTRADEFS_OUTDIR)\*.obj

	@findstr /v "Avx2WmemEnabledWeakValue" $@ > $@.tmp && move /Y $@.tmp $@

# Compile schema for giomm settings example
