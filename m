Message-ID: <01b401c079c3$095c4740$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <XFMail.791030042838.Harald.Koerfgen@home.ivm.de>
Subject: Re: Current CVS kernel no-go on R4k Decstation
Date: Mon, 8 Jan 2001 23:33:25 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Harald Koerfgen <Harald.Koerfgen@home.ivm.de>, Karsten Merker <karsten@excalibur.cologne.de>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010108223325.V-jXK6lzwRQ9Pp8j6Z7rIRtCOCvjauULtcOMvkdSO4E@z>

> > Similar effect for me (DS5000/150, Checkout @ Sat Jan 6 ~22:30 CET),
> > except that I do not get the "illigal instruction" lines. Harald has the
> > same problem on his /260. It looks like sometime in December 2000
> > something has gone broken in the R4K-support, or are we perhaps
> > triggering a compiler bug in egcs 1.1.2?
>
> I don't think so. This hang appeared in the middle of December and may or
may
> not be related to the MIPS32 patches which were commited then.
Unfortunately I
> haven't had the time to track this down.

If you're referring to the MIPS32 patches that came from the MIPS 2.2 tree,
we generally test those on an R4600 Indy and a couple R5xxx platforms as
a matter of routine.  This is not to say that there might not be some change
to the R4x00 support between 2.2 and 2.4 that interacts pathologically with
the MIPS32 code...

           Kevin K.
