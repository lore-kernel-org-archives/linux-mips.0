Message-ID: <016201c26bb0$b8609a30$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <3D9D484B.4C149BD8@mips.com><200210041153.MAA12052@mudchute.algor.co.uk><3D9D855B.12128FA2@mips.com><1033734968.31839.5.camel@irongate.swansea.linux .org.uk> <00fe01c26ba6$04943480$10eca8c0@grendel><1033737330.31861.30.camel@irongate.swansea.linux.org.uk> <010e01c26ba8$2c9400d0$10eca8c0@grendel> <1033739046.31861.35.camel@irongate.swansea.linux.org.uk>
Subject: Re: Promblem with PREF (prefetching) in memcpy
Date: Fri, 4 Oct 2002 16:17:01 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-mips@linux-mips.org
Message-ID: <20021004141701.IwkMaMn9OX6Qq_Obghrp7X0j5pqGyncr_P1s21SEW1s@z>

From: "Alan Cox" <alan@lxorguk.ukuu.org.uk>
> On Fri, 2002-10-04 at 14:15, Kevin D. Kissell wrote:
> > Which is excatly the point that Carsten was raising when he started this thread!
> > 
> > The question is how, i.e. throttle memcpy or thow away a "guard band" of RAM?
> 
> 
> The x86 code basically says
> 
> while(over 320 bytes left)
> {
> prefetch ahead
> copy bits
> }
> while(bytes left)
> copy bits

Which is safe, simple, and efficient, but does seem to have the property
that there's a "cursed" page in the system that can be randomly allocated
and which will be curiously slow on memcopy().  That might or might not
be a problem in the embedded application space.

            Regards,

            Kevin K.
