Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0zPntI-000aNTC@the-village.bc.nu>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: HAL2
Date: Sun, 4 Oct 1998 14:08:00 +0100 (BST)
In-Reply-To: <Pine.LNX.3.96.981004140033.2695B-100000@calypso.saturn> from "Ulf Carlsson" at Oct 4, 98 02:06:40 pm
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Ulf Carlsson <grim@zigzegv.ml.org>
Cc: alan@lxorguk.ukuu.org.uk, linux@cthulhu.engr.sgi.com
Message-ID: <19981004130800.Uct6VyeNGXNdl1kJNTJmq-Hk6l386BQc5pQKiGq157Y@z>

> If you run Linux on a sparc, it provides access to an interface,
> /dev/audio, similar to the one you find in Solaris (I don't have Solaris,
> but the include file, asm-sparc/audioio.h tells me that it does). 

Yes

> You just told me that you thought my way to do it was an incorrect way og
> doing it, tell me how it should be done instead. 

Supporting the Indy ioctls is fine. However like the sparc, ppc, m68k,
ix86, alpha and arm you need to support the common OSS API. I don't know
if supporting the OSS API is sufficient alone to write libaudio over since
I dont know a ton about the internals of the libaudio stuff on SGI's.

Basically though the OSS API is a common API across all the linux platforms.

Alan
