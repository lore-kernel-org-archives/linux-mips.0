Message-ID: <006601bf2df8$118a7850$0228a8c0@satanas>
From: "Kevin D. Kissell" <kevink@mips.com>
Subject: Re: Challenge "S" 
Date: Sat, 13 Nov 1999 17:56:43 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: Mark Spencer <markster@linux-support.net>, Joan Eslinger <wombat@kilimanjaro.engr.sgi.com>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19991113165643.kIDh52MF-qW58pw78gzbnDm83ZEbaGIh551Miqg3Qmk@z>

>Linux runs on a Challenge S, you just can't use the mezzanine peripheral
>cards yet.

I've never tried it, but the Indy kernel should run unmodified on a
Challenge S (which is essentially a "headless" Indy).  I've certainly
run Indy's off the serial console.   The one tricky bit would be that 
for the console serial port to work as the system console, one must 
ensure that /dev/console in the root filesystem actually maps to ttyS0.

            Regards,

            Kevin K.
__

Kevin D. Kissell
MIPS Technologies European Architecture Lab
kevink@mips.com
Tel. +33.4.78.38.70.67
FAX. +33.4.78.38.70.68
