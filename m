Subject: Re: broken RM7000 in CVS ...
Date: Fri, 12 Jan 2001 23:48:50 +0000 (GMT)
In-Reply-To: <3A5F68CB.78D693B3@mvista.com> from "Jun Sun" at Jan 12, 2001 12:27:55 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E14HDwC-0005GH-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Jun Sun <jsun@mvista.com>
Cc: carlson@sibyte.com, linux-mips@oss.sgi.com
Message-ID: <20010112234850.3lgoDYfohWx5r8ADbb2OzdswRXBA7VJ-fCItAYRd0DU@z>

> My understanding is that we don't have a standard way to probe for external
> cache (L2 or L3).  So this problem is not only for MIPS32 cpus.

Cache is very arch specific. You don't want to know how you find L2 cache
on a MacII for example 8)
