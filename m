Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Alan Cox <alan@cymru.net>
Message-ID: <199605300943.KAA23935@snowcrash.cymru.net>
Subject: Re: linux needs bsd networking stack
Date: Thu, 30 May 1996 10:43:42 +0100 (BST)
In-Reply-To: <199605292159.OAA09070@lanta.engr.sgi.com> from "Neal Nuckolls" at May 29, 96 02:59:58 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Neal Nuckolls <nn@lanta.engr.sgi.com>
Cc: torvalds@cs.helsinki.fi, alan@cymru.net, sparclinux-cvs@caipfs.rutgers.edu, lmlinux@neteng.engr.sgi.com
Message-ID: <19960530094342.ncaYqnHKkzkBYwv6N6XpT5Cg6aMevhxvppT-WKlEfVI@z>

> customization to turn them into networking switches,
> routers, firewalls, etc.  Rather than embedding a RTOS,
> they are choosing a free unix and usually this is FreeBSD
> since Linux networking is not the de facto BSD stack.

So we should use a defacto BSD stack because its a defacto stack. Ok there is this
great OS called windows3. See you later

> The "unique" tcp/ip implementation is a liability to linux.

I'm not convinced it is. A whole load of SGI people (LM notably) seem intent on "BSD
stack, BSD stack, BSD stack". Everyone else I hear is saying "How fast can it go",
"How stable can we make it", "Will you please make sure its as solid in 2.0 as in 1.2"

> Is anyone working to replace the standard linux stack
> with port derived from the 4.4BSD code?

No -

o	The BSD stack doesnt do IPX, AX25, NetROM, Appletalk
o	There will be no defacto IPv6 for BSD, there are several species
o	The licensing doesnt permit the two to meet easily
o	You can't do 400Mbits/second with mbufs so you'd have to break the BSD code
	anyway

Im not convinced about the rest of the argument either. I know one big vendor using
the BSD stack for a project. I know several using Linux (Things like the firewall
from Mazama). We are seeing primary rate ISDN support for Linux starting to appear,
and already have the heavy provider end multiple serial cards.

For routers, anyone using a PC style architecture is bounding themselves to small
routers anyway. No matter how good the code is you will soon need fancy hardware to
handle BGP4, 50,000 routes and fast 100baseT speed switching. And there is no
defacto BSD IPv6

Alan
