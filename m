Reply-To: <a.voropay@vmb-service.ru>
From: "Alexander Voropay" <a.voropay@vmb-service.ru>
Subject: MS VC++ compiler / MIPS
Date: Wed, 14 Jul 2004 17:53:11 +0400
Message-ID: <07d301c469a9$e708f550$0200000a@ALEC>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-Path: <a.voropay@vmb-service.ru>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20040714135311.sz7ma4Sv1X46S8KvtFWwJfwITIjqZNo3ag-m6hzhsUI@z>

Hi!

 Is it possible to use it for the something useful ??
(to compie a kernel 8-))

 As it is known, MS provides eMbedded Visual Tools 3.0
for free download. It contains a free C++ MIPS cross compiler .

evt2002web_min.exe [210485 KB]






========================
C:\...ft eMbedded Tools\EVC\WCE300\BIN>CLMIPS.EXE /help 
Microsoft (R) 32-bit/16-bit C/C++ Optimizing Compiler Version 12.01.8667
for MIPS R-Series
Copyright (C) Microsoft Corp 1984-1999. All rights reserved.

[....]
                             -CODE GENERATION-

/QMRWCE optimize for WinCE (Default)     /QMOb<n> basic block threshold
/QMR3900 optimize for r3900              /QMOu<n> unroll n loop
iterations
/QMR4100 optimize for r4100              /QMFPE[-] FP emulation
(default)
/QMR4200 optimize for r4200              /Gd __cdecl calling convention
/QMR4300 optimize for r4300              /GA optimize for Windows
Application
/QMmips16 code for MIPS16 ASE            /GD optimize for Windows DLL
/QMmips1 MIPS1 ISA                       /Gr __fastcall calling
convention
/QMmips2 MIPS2 ISA (default)             /Gf enable string pooling
/QMNoDivCheck no divide by zero check    /GF enable read-only string
pooling
/QMNoUnalign no LWL,LWR,SWL,SWR          /Gh enable hook function call
/QMNoULoad do not generate LWL,LWR       /GR[-] enable C++ RTTI
/QMNoUStore do not generate SWL,SWR      /Gy separate functions for
linker
/QMOC use old float comparison helpers

[....]


--
-=AV=-
