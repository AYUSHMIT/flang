#
# Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
# See https://llvm.org/LICENSE.txt for license information.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
#

########## Make rule for test kqnint  ########


qp139: run
	

build:  $(SRC)/qp139.f08
	-$(RM) qp139.$(EXESUFFIX) core *.d *.mod FOR*.DAT FTN* ftn* fort.*
	@echo ------------------------------------ building test $@
	-$(FC) -c $(FFLAGS) $(SRC)/check_mod.F90 -o check_mod.$(OBJX)
	-$(FC) -c $(FFLAGS) $(LDFLAGS) $(SRC)/qp139.f08 -o qp139.$(OBJX)
	-$(FC) $(FFLAGS) $(LDFLAGS) qp139.$(OBJX) check_mod.$(OBJX) $(LIBS) -o qp139.$(EXESUFFIX)


run: 
	@echo ------------------------------------ executing test qp139 
	qp139.$(EXESUFFIX)

verify: ;


