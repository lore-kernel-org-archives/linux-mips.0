Message-ID: <019d01bf9d8d$76b7a680$0ceca8c0@satanas.mips.com>
From: "Kevin D. Kissell" <kevink@mips.com>
Subject: Re: config.in revised #2
Date: Mon, 3 Apr 2000 18:55:41 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: Florian Lohoff <flo@rfc822.org>, linux@cthulhu.engr.sgi.com
Message-ID: <20000403165541.Mk1aTnYnbXcm7p5E05o2A8y4X5elJWhPcbPkXbhmAgo@z>

>-if [ "$CONFIG_CPU_LITTLE_ENDIAN" = "n" ]; then
>-   define_bool CONFIG_BINFMT_IRIX y
>-   define_bool CONFIG_FORWARD_KEYBOARD y
>-fi

As someone more concerned with embedded apps
than old SGI platforms, I would take issue with forcing
IRIX binary format support and keyboard forwarding just
because a big-endian CPU is configured.  Yes, I know
that this is for 2.3, and most of embedded apps are
2.0 or 2.2 based, but I figure it's better to speak up now...

            Regards,

            Kevin K.
__

Kevin D. Kissell
MIPS Technologies European Architecture Lab
kevink@mips.com
Tel. +33.4.78.38.70.67
FAX. +33.4.78.38.70.68
