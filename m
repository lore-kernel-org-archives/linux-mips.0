Message-ID: <001301c2ea02$d27a9bc0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <20030314021308.60082.qmail@web11905.mail.yahoo.com>
Subject: Re: Tips on inspecting / debuging cache
Date: Fri, 14 Mar 2003 09:22:13 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Wayne Gowcher <wgowcher@yahoo.com>, linux-mips@linux-mips.org
Message-ID: <20030314082213.R2DBhH4Wj0QSGUYmprvv5TKpku6aKg5a0MHCgfpGbqg@z>

> I am wondering if someone could point me towards
> articles / source code that would give me a little
> insight into how to debug cache problems in mips.
> 
> For example , how do I inspect the contents of the
> cache ? 

Which MIPS CPU are you using?  The CACHE instruction
was introduced with the R4000 CPU as an implementation
dependent feature, and was finally standardized in the MIPS32
and MIPS64 architecture specs.  See
http://www.mips.com/publications/processor_architecture.html
In MIPS32, to be able to properly inspect the cache, one needs
a CPU which implements the optional Index_Load_Tag CACHE 
operation and has both TagHi/TagLo (required) DataHi/DataLo 
(optional) registers. Pre-MIPS32 CPUs may offer the ability
to inspect the cache with variant mechanisms (see your chip
spec), or not at all.

>Are there routines to dump out the contents of
> the cache ?

People write them from time to time, but so far I don't
think anyone has written a "standard" cache dump API
or implementation in the Linux kernel.

            Kevin K.
