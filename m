Subject: Re: origtest failure with MIPS-Linux glibc
References: <u8og4j6w9r.fsf@gromit.rhein-neckar.de>
	<m33dlvgii3.fsf@otr.mynet.cygnus.com>
From: Andreas Jaeger <aj@suse.de>
Date: 30 Jun 2000 20:13:29 +0200
In-Reply-To: Ulrich Drepper's message of "30 Jun 2000 10:56:36 -0700"
Message-ID: <u8d7kz3uly.fsf@gromit.rhein-neckar.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Ulrich Drepper <drepper@cygnus.com>
Cc: libc-alpha Mailinglist <libc-alpha@sourceware.cygnus.com>, linux-mips@oss.sgi.com
Message-ID: <20000630181329.r9kVExR1eOKw2pTTP50KZ-71LF2a6TQhTiTXJl_VhjM@z>

>>>>> Ulrich Drepper writes:

Uli> Andreas Jaeger <aj@suse.de> writes:
>> This test fails on MIPS-Linux since testobj1.so contains an undefined
>> reference to foo which can't be fulfilled.  

Uli> I thought we went over this alread.  There is a definition of `foo',
We spoke about it - but didn't fix it.
Uli> it is in origtest.c.  I MIPS has problems it's in not doing what
Uli> -rdynamic is expected to do.

Uli> $ nm elf/origtest|grep foo
Uli> 08048680 T foo

But origtest doesn't have -rdynamic.  There's no
LDFLAGS-origtest = -rdynamic
in elf/Makefile.  Should it be there?

Andreas
-- 
 Andreas Jaeger
  SuSE Labs aj@suse.de
   private aj@arthur.inka.de
