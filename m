Reply-To: <a.voropay@vmb-service.ru>
From: "Alexander Voropay" <a.voropay@vmb-service.ru>
Subject: RE: MS VC++ compiler / MIPS
Date: Wed, 14 Jul 2004 21:32:23 +0400
Message-ID: <07f501c469c8$85f86240$0200000a@ALEC>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
In-Reply-To: <003001c469b4$3b5ae960$10eca8c0@grendel>
Return-Path: <a.voropay@vmb-service.ru>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "'Kevin D. Kissell'" <kevink@mips.com>, linux-mips@linux-mips.org
Message-ID: <20040714173223.SoPRacKx3dt6qanlh6hqzjZZxJLSa9qC9xGmS1zyzH8@z>

Kevin D. Kissell [mailto:kevink@mips.com] wrote:

>If I recall correctly, the MS compiler uses a subltly different calling
convention/ABI
>than the "o32" gcc conventions assumed by MIPS Linux,

 The ABI is identical if the number of the int arguments <=4
(n1-> $4, n2 -> $5, n3 -> $6, n4 -> $7)
(return value --> $2)
 It should be enought for simply functions.

 Otherwise, the MSVC/MIPS does not use $fp, so stack frame structure
seems different.

 MSVC/MIPS supports 2 calling conventions (/Gd __cdecl calling
convention;
/Gr __fastcall calling convention) but I can't grok a difference.

> and certainly the assembler directives will be different from those
assumed by the Linux sources.

 Yes.

 It sems, it is impossible to build a full Linux toolcain at the MSVC
base. The MS linker
(LINK.EXE) is weak (comparing to `ld` monster) and can produce only COFF
.EXE (a.out)
MIPS executables.

>  It *might* be possible to hack up a MIPS Linux kernel source tree to
build with the MS
>tool kit, but it would be a lot of work,  some of it subtle.

 I have no plans to do it, I'm not a MIPS guru :)

--
-=AV=-
