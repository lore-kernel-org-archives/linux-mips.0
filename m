From: "William J. Earl" <wje@cthulhu.engr.sgi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <14550.27493.513601.286883@liveoak.engr.sgi.com>
Date: Mon, 20 Mar 2000 10:18:13 -0800 (PST)
Subject: Re: header files state
In-Reply-To: <000601bf9243$ba783f10$0ceca8c0@satanas.mips.com>
References: <000601bf9243$ba783f10$0ceca8c0@satanas.mips.com>
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: "Kevin D. Kissell" <kevink@mips.com>
Cc: Florian Lohoff <flo@rfc822.org>, linux@cthulhu.engr.sgi.com
Message-ID: <20000320181813.5vc7HBw3n11Yu2jocxt8NU7BENM2T2cbOL_TY0Laxzg@z>

Kevin D. Kissell writes:
...
 > And I note with some concernt that, while in the PC Linux
 > universe, asm/socket.h, linux/socket.h, and bits/socket.h
 > all have the same definitions for the socket types
 > (SOCK_STREAM = 1, for example), in the MIPS/LINUX
 > kernel, SOCK_STREAM = 2, though there is still the
 > definition, conditional on
 > #if !defined(__KERNEL__) && (!defined(__GLIBC__) || (__GLIBC__ < 2))
 > that defines SOCK_STREAM to be 1.  Fortunately, the
 > probability of someone using non-glibc or glibc < 2 in
 > a MIPS/Linux universe seems to be essentially zero.
...

     SOCK_STREAM == 2 is correct for the MIPS ABI (which has to do with
some unfortunate choices made by AT&T in SVR4, and consequent binary-compatibility
issues for various of the MIPS ABI participants).
