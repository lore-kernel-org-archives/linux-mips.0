Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0yUg1F-000aNhC@the-village.bc.nu>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: Rex and the Newport.
Date: Thu, 30 Apr 1998 00:12:04 +0100 (BST)
In-Reply-To: <19980430011402.A16267@loria.fr> from "Olivier Galibert" at Apr 30, 98 01:14:02 am
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Olivier Galibert <galibert@pobox.com>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19980429231204.C6WVWGDMHk9DxEERSv5fMuSiknx8M0b3N3zrUF65km8@z>

> > As of about now KGI provides accelerator and mode switching modules to
> > fbcon/abscon. Whatever the peanut gallery may be doing the KGI heads
> > _are_ clueful
> 
> I do  think so   too  actually.  They  just  have  a  "let's  reinvent
> everything" tendancy that plays against them. And very very bad PR.

Not the  clueful bits - the noisy bits yes

> The only problem I have seen with GGI (reading thier documentation) is
> that  non-framebuffer    devices   does   not seem   to     be  really
> supported... if  I'm wrong it may  be easier to  use KGI/GGI for video

They are not well supported.

> support on sgi instead of filling the gaps in XFree86.

Its easier to make XAA work on mips and go from there.

> This would have the additional side effect to allow the use of SVGAlib
> programs and maybe open the way to a nice Mesa integration.

Svgalib apps will run under X with the svgalib/ggi on ggi/xshm on X ..
