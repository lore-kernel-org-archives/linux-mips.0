Message-ID: <00fe01c26ba6$04943480$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <3D9D484B.4C149BD8@mips.com><200210041153.MAA12052@mudchute.algor.co.uk>  <3D9D855B.12128FA2@mips.com> <1033734968.31839.5.camel@irongate.swansea.linux.org.uk>
Subject: Re: Promblem with PREF (prefetching) in memcpy
Date: Fri, 4 Oct 2002 15:00:18 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Alan Cox <alan@lxorguk.ukuu.org.uk>, Carsten Langgaard <carstenl@mips.com>
Cc: Dominic Sweetman <dom@algor.co.uk>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20021004130018._p7D1xQEtx0CyD38_I48nDMrfz4_L_SoSz3Oe4RLdMY@z>

> On Fri, 2002-10-04 at 13:11, Carsten Langgaard wrote:
> > Is a bus error exception an address related exception ?
> > I'm afraid some implementation think it's not.
> 
> So you need an option for broken systems, no new news 8)

Alas, it's not so simple.  Bus errors are often not even
precise exceptions, which is to say, they cannot be
associated with a specific causing instruction.

> > What about an UART RX register, we might loose a character ?
> > You can also configure you system, so you get a external interrupt from you
> > system controller in case of a bus error, there is no way the CPU can
> > relate this interrupt to the prefetching.
> 
> The use of memcpy for I/O space isnt permitted in Linux, thats why we
> have memcpy_*_io stuff. Thus prefetches should never touch 'special'
> spaces. (On x86 the older Athlons corrupt their cache if you do this so
> its not a mips specific matter)

The issue isn't that anyone would deliberately use memcpy() in I/O
space.  Rather, it's that memcpy() prefetches quite a ways ahead,
and if one has I/O space assigned just after the end of physical
memory, Bad Things might happen on a perfectly legal memcpy()
that references the last couple hundred bytes of memory in a 
way that not even a clever and well-informed bus error handler 
could undo.

            Kevin K.
