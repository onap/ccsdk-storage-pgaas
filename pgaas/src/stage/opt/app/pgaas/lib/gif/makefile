# Copyright (C) 2017 AT&T Intellectual Property. All rights reserved. 
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this code except in compliance
# with the License. You may obtain a copy of the License
# at http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software  
# distributed under the License is distributed on an "AS IS" BASIS,  
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or  
# implied. See the License for the specific language governing  
# permissions and limitations under the License. 


all:

test:

STAGEDIR=/dev/null
DISTPATH=/opt/app/pgaas

stage:
	mkdir -p $(STAGEDIR)/$(DISTPATH)/lib/gif
	for i in *; do \
	    case $$i in \
		*.py ) \
		    j=`basename $$i .py`; \
		    cp $$i $(STAGEDIR)/$(DISTPATH)/lib/gif/$$j; \
		    chmod a+x $(STAGEDIR)/$(DISTPATH)/lib/gif/$$j; \
		    ;; \
		makefile | *~ ) ;; \
		* ) \
		    cp $$i $(STAGEDIR)/$(DISTPATH)/lib/gif/$$i; \
		    chmod a+x $(STAGEDIR)/$(DISTPATH)/lib/gif/$$i; \
		    ;; \
	    esac; \
	done
