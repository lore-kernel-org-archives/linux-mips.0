content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Subject: RE: How to add more memory?
Date: Fri, 23 Jan 2004 09:14:44 -0600
Message-ID: <CFD808D1D39ACB47ABFF586D484CC52EADE218@hqmailnode1.commstor.crossroads.com>
From: "Nils Larson" <nlarson@Crossroads.com>
Return-Path: <nlarson@Crossroads.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20040123151444.qnDcwPPXXqJaMfAi409Bb5IjBCSvs4VP33Dtlkj_jRI@z>

Ralf,
That's for responding.
We're using the RM7000A on one platform and the RM7065C on another.
Also, how exactly does highmem work? I can't seem to find a description
of how highmem works (without reading code). I've read comments about hits
on performance using this. How much of a hit is it? Is it 
possible to DMA to this memory?
Thanks,
Nils

-----Original Message-----
From: Ralf Baechle [mailto:ralf@linux-mips.org]
Sent: Wednesday, January 21, 2004 6:28 PM
To: Nils Larson
Subject: Re: How to add more memory?


On Wed, Jan 21, 2004 at 03:58:24PM -0600, Nils Larson wrote:

> We currently have a mips platform running Linux with 256MB of
> RAM starting at 0x8000_0000. We would like to add an additional
> 1GB of RAM, maybe starting at 0x4000_0000, that would be used
> for user apps (user virtual memory). The memory map is:
> 0x8000_0000 - 256MB RAM
> 0xA000_0000 - uncached version of the same 256MB
> 0xB000_0000 - PCI memory windows.
> This is a diskless setup booting from a ramdisk.
> So, the (sort of newbie) questions are:
> 1. How do we tell Linux to use the new memory?
> 2. Is this feasible?
> 3. Is there a better way to add more memory?
> We need more space for user data.

I wrote the highmem code for Linux/MIPS.  It's currently limited
to processor configurations that don't suffer from virtual aliases but
that limitation can be removed; depending of your application and hardware
that may be anywhere from trivial to hard.   What is your processor?

  Ralf
