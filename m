Subject: Re: origtest failure with MIPS-Linux glibc
References: <u8og4j6w9r.fsf@gromit.rhein-neckar.de>
	<m33dlvgii3.fsf@otr.mynet.cygnus.com>
	<u8d7kz3uly.fsf@gromit.rhein-neckar.de>
	<m3n1k3f2hq.fsf@otr.mynet.cygnus.com>
From: Andreas Jaeger <aj@suse.de>
Date: 30 Jun 2000 20:35:09 +0200
In-Reply-To: Ulrich Drepper's message of "30 Jun 2000 11:27:45 -0700"
Message-ID: <u88zvn3tlu.fsf@gromit.rhein-neckar.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Ulrich Drepper <drepper@cygnus.com>
Cc: libc-alpha Mailinglist <libc-alpha@sourceware.cygnus.com>, linux-mips@oss.sgi.com
Message-ID: <20000630183509.GPqfpilkpMw2PQBPIOIbmVv_lZY9RwdwuzPpAsTSSXA@z>

>>>>> Ulrich Drepper writes:

Uli> Andreas Jaeger <aj@suse.de> writes:
>> But origtest doesn't have -rdynamic.  There's no
>> LDFLAGS-origtest = -rdynamic
>> in elf/Makefile.  Should it be there?

Uli> Look again :-)

Thanks!

Andreas
-- 
 Andreas Jaeger
  SuSE Labs aj@suse.de
   private aj@arthur.inka.de
