Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: ariel@oz.engr.sgi.com (Ariel Faigon)
Message-ID: <199801142355.PAA09106@oz.engr.sgi.com>
Subject: Re: boot problem
Date: Wed, 14 Jan 1998 15:55:29 -0800 (PST)
In-Reply-To: <34BD4F3E.7F86@cerf.net> from "William Ellis" at Jan 14, 98 03:50:22 pm
Reply-To: ariel@cthulhu.engr.sgi.com (Ariel Faigon)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: William Ellis <bellis@cerf.net>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19980114235529.xLe3PBS04MbdO0khukv6O5UbjUmwsmhjPRnp2xf3Rys@z>

:
:I'm working with a Challenge S, R5000 (Allegedly the same
:hardware as an Indy without a graphics card)
:
:Initially booting via tftp with various errors, I am
:now trying to just get the sash boot -f to work.
:I have tried several of the applicable precompiled kernels 
:at ftp.linux.sgi.com/pub/test all with similar errors:
:
:Standalone Shell SGI Version 6.2 ARCS   Mar  9, 1996 (32 Bit)
:sash: boot -f /vmlinux root=/dev/sda1
:1278928+236160 entry: 0x8800250c
:newport_probe: read back wrong value ;-(
:
:What is the newport_probe?  The only non-stock thing about
:the machine is it has a fddi card in it, (which I do not
:need to get going for linux).  Could this error be an effect
:of the fddi card being present, or that there is no graphics
:card present?  Or am I missing something else all together?
:Thanks in Advance, Bill
:
Newport == Indy graphics

So I guess the code should be changed so it doesn't assume
there's a newport hardware.

-- 
Peace, Ariel
