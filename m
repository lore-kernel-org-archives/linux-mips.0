Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: ariel@yon.engr.sgi.com (Ariel Faigon)
Message-ID: <199705271948.MAA07850@yon.engr.sgi.com>
Subject: Re: strace/truss equiv?
Date: Tue, 27 May 1997 12:48:37 -0700 (PDT)
In-Reply-To: <199705271919.PAA21206@neon.ingenia.ca> from "Mike Shaver" at May 27, 97 03:19:29 pm
Reply-To: ariel@sgi.com (Ariel Faigon)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Mike Shaver <shaver@neon.ingenia.ca>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19970527194837.qWyJimGRxf2HYZPhHM3oDiB26kR63yqMPgdefuZmDEA@z>

:
:OK, I'll bite.
:What's the strace/truss equivalent under IRIX?
:
:I'm trying to figure out why my "dynamically-linked" hello world
:binaries are 115K, and I can't tell where the heck the linker is
:finding the static libs.
:
:Mike
:
As Luc mentioned, you may use 'par' the advantages are that it
has many more features and almost no overhead. One notable
disadvantage however (especially for userland debugging) is that
it uses some special kernel services for async event notifications
so its trace output is asynchronous to the traced process.

I guess you would prefer 'strace' to 'par' (like I do) you may get
a precompiled binary for IRIX at:

	http://reality.sgi.com/ariel/freeware/

Note that this version doesn't support tracing 64-bit binaries.

Thank David Miller for making strace work under 6.x.
-- 
Peace, Ariel
