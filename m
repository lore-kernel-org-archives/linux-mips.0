content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Subject: Mozilla Firefox compile problem
Date: Mon, 18 Oct 2004 10:24:59 +0200
Message-ID: <34A8108658DCCE4B8595675ABFD8172709FAFE@dusse201.eu.infineon.com>
From: <Andre.Messerschmidt@infineon.com>
Return-Path: <Andre.Messerschmidt@infineon.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20041018082459.0YRvW4wsfXQmNpIqY1RjrBsc9RXYamfgDlEmEwnzQTQ@z>

Hi,

I am trying to compile Mozilla Firefox 1.0PR with Montavista Pro 3.1 toolchain (I linked mips_fp_be to mips-linux), but I get the following error messages:

---- snip ---------------------------------------------------
mips-linux-g++  -I/opt/mvx/usr/X11R6/include -fno-rtti -fno-exceptions -Wall -Wconversion -Wpointer-arith -Wcast-align -Woverloaded-virtual -Wsynth -Wno-ctor-dtor-privacy -Wno-non-virtual-dtor -Wno-long-long -Wa,-xgot -pthread -pipe  -DDEBUG -D_DEBUG -DDEBUG_am -DTRACING -g -fno-inline -o nsIFileEnumerator nsIFileEnumerator.o           -L../../dist/bin -L../../dist/lib -L../../dist/bin -lxpcom  -L/data2/Sources/inca/mozilla/dist/lib -lplds4 -lplc4 -lnspr4 -lpthread -ldl   -ldl -lm
../../dist/bin/libxpcom.so: undefined reference to `nsXPTCStubBase::Stub203()'
../../dist/bin/libxpcom.so: undefined reference to `nsXPTCStubBase::Stub156()'
../../dist/bin/libxpcom.so: undefined reference to `nsXPTCStubBase::Stub184()'
../../dist/bin/libxpcom.so: undefined reference to `nsXPTCStubBase::Stub128()'
../../dist/bin/libxpcom.so: undefined reference to `nsXPTCStubBase::Stub226()'
../../dist/bin/libxpcom.so: undefined reference to `nsXPTCStubBase::Stub246()'
../../dist/bin/libxpcom.so: undefined reference to `nsXPTCStubBase::Stub112()'
../../dist/bin/libxpcom.so: undefined reference to `nsXPTCStubBase::Stub180()'
../../dist/bin/libxpcom.so: undefined reference to `nsXPTCStubBase::Stub230()'
../../dist/bin/libxpcom.so: undefined reference to `nsXPTCStubBase::Stub147()'
../../dist/bin/libxpcom.so: undefined reference to `nsXPTCStubBase::Stub151()'
../../dist/bin/libxpcom.so: undefined reference to `nsXPTCStubBase::Stub116()'
../../dist/bin/libxpcom.so: undefined reference to `nsXPTCStubBase::Stub111()'
../../dist/bin/libxpcom.so: undefined reference to `nsXPTCStubBase::Stub231()'
../../dist/bin/libxpcom.so: undefined reference to `nsXPTCStubBase::Stub141()'
../../dist/bin/libxpcom.so: undefined reference to `nsXPTCStubBase::Stub104()'
../../dist/bin/libxpcom.so: undefined reference to `nsXPTCStubBase::Stub58()'
../../dist/bin/libxpcom.so: undefined reference to `nsXPTCStubBase::Stub53()'

...

---- snap ---------------------------------------------------

I found some similar error messages from 2002 via Google, but the provided patches were for PPC and I do not know how to port them to MIPS. (Also i assume that such patches would have made it into the main branch by now)

Has anybody compiled Firefox successfully with Montavista and can give me some hints on how to proceed?

Thanks and regards 
André Messerschmidt
