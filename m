Date: Mon, 15 Jan 2001 06:37:25 -0200
From: Ralf Baechle <ralf@oss.sgi.com>
Subject: Re: broken RM7000 in CVS ...
Message-ID: <20010115063725.C8866@bacchus.dhis.org>
References: <3A5F68CB.78D693B3@mvista.com> <E14HDwC-0005GH-00@the-village.bc.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E14HDwC-0005GH-00@the-village.bc.nu>; from alan@lxorguk.ukuu.org.uk on Fri, Jan 12, 2001 at 11:48:50PM +0000
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Jun Sun <jsun@mvista.com>, carlson@sibyte.com, linux-mips@oss.sgi.com
Message-ID: <20010115083725.Dlqq5J4_YgDw8ph9YApuz6MGkBtOr7iqnfJ6HECTaow@z>

On Fri, Jan 12, 2001 at 11:48:50PM +0000, Alan Cox wrote:

> > My understanding is that we don't have a standard way to probe for external
> > cache (L2 or L3).  So this problem is not only for MIPS32 cpus.
> 
> Cache is very arch specific. You don't want to know how you find L2 cache
> on a MacII for example 8)

Actually the Indy's R4600 / R5000 second level caches also call for the use
of LARTs in a while (1) loop ;-)  Read the generic code had to be changed
in order to support in a sane way.

  Ralf
