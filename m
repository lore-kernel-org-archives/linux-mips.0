Message-ID: <00e201c0877f$1acfdb80$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <3A6E132B.9000103@Lineo.COM> <3A6E1977.2B18484D@mvista.com> <3A6F36B8.4F10759B@mvista.com> <20010124163101.F863@bacchus.dhis.org>
Subject: Re: CONFIG_MIPS_UNCACHED
Date: Fri, 26 Jan 2001 11:02:24 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Ralf Baechle <ralf@oss.sgi.com>, Jun Sun <jsun@mvista.com>
Cc: Pete Popov <ppopov@mvista.com>, Quinn Jensen <jensenq@lineo.com>, linux-mips@oss.sgi.com
Message-ID: <20010126100224.ynZUFDb6ME2teh9iuYpTj0Bi-6K7P8L8p5-4onBgyrA@z>

>
> > It is really surprising to know this.  It sounds like a CPU bug to me.
Can
> > some MIPS "gods" clarify if such a behaviour is a bug or allowed?
> >
> > BTW, the CPU in EV96100 is QED RM7000, I believe.
>
> If you want to be strictly correct you have to execute the code that
> disables caching of KSEG0 in uncached space like KSEG1, then flush the
> caches before you can resume execution in KSEG0.  Otherwise you might
> end up with dirty d-caches which when flushed will overwrite more
> uptodate data in memory.  The window is very small but yet exists if
> things are just right.

That's one possible failure mode.   The other is that there
are dirty lines (those that were brought into the cache and
modified by stores, but never written back to memory) that
are rendered invisible by forcing KSEG0 to go uncached.
This will cause failure of any code that is expecting to see
the results of those stores if said code executes before
some other event causes the write-back - and if the
machine is running with cacheing completely disabled,
as it would be in the case under discussion, such an
event may never occur!

            Regards,

            Kevin K.
