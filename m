Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0yxF1A-000aOoC@the-village.bc.nu>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: What about...
Date: Fri, 17 Jul 1998 19:14:04 +0100 (BST)
In-Reply-To: <9807171047.ZM18720@xtp.engr.sgi.com> from "Greg Chesson" at Jul 17, 98 10:47:02 am
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Greg Chesson <greg@xtp.engr.sgi.com>
Cc: wje@fir.engr.sgi.com, adevries@engsoc.carleton.ca, anubis@BanjaLuka.NET, linux@cthulhu.engr.sgi.com
Message-ID: <19980717181404.31OFf3lUf372M8k5MgqBSx_CSGdldLfdCIr9ARe2SRc@z>

> many "holes"...  The idea of a simple buddy-system allocator as is
> ingrained in the Linux kernel falls apart completely in the face of
> this kind of architecture.   I suppose you could run a copy of Linux
> on every node, but I consider that an excuse rather than a solution.

Actually the Linux buddy stuff is quite happy with holes. Its still
completely inappropriate. From the above I deduce we'd have to do
mips64 before we even considerd it anyway
