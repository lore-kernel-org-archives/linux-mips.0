Message-ID: <000601bf9243$ba783f10$0ceca8c0@satanas.mips.com>
From: "Kevin D. Kissell" <kevink@mips.com>
Subject: Re: header files state
Date: Mon, 20 Mar 2000 09:09:51 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: Florian Lohoff <flo@rfc822.org>, linux@cthulhu.engr.sgi.com
Message-ID: <20000320080951.kNFxXIV-jGupXeT5_XPLfcPTFrEw87MTonKUYHZLMNw@z>

Like the problem with sigaction definitions described in
another thread, the problem with "SOCK_STREAM" seems
to come from the fact that we're not on the same level of glibc
as the rest of the Linux community.  The "correct" definition
of SOCK_STREAM is in asm/socket.h, but it is
#ifdef __KERNEL__, and no alternate definition is
available.  On a PC, one can find it in /usr/include/bits/socket.h,
but no equivalent exists in the MIPS glibc 2.0 universe.
I have suppressed the #ifdef on my build system in order
to bulid kaffe, etc.  as it seems intuitively reasonable to have
the same values used by user code as by the kernel, but I don't
know it that's really what needs to be done.

And I note with some concernt that, while in the PC Linux
universe, asm/socket.h, linux/socket.h, and bits/socket.h
all have the same definitions for the socket types
(SOCK_STREAM = 1, for example), in the MIPS/LINUX
kernel, SOCK_STREAM = 2, though there is still the
definition, conditional on
#if !defined(__KERNEL__) && (!defined(__GLIBC__) || (__GLIBC__ < 2))
that defines SOCK_STREAM to be 1.  Fortunately, the
probability of someone using non-glibc or glibc < 2 in
a MIPS/Linux universe seems to be essentially zero.

-----Original Message-----
From: Florian Lohoff <flo@rfc822.org>
To: linux@cthulhu.engr.sgi.com <linux@cthulhu.engr.sgi.com>
Date: Sunday, March 19, 2000 10:17 PM
Subject: header files state


>Hi,
>I am currently trying to waste some cpu cycles with blindly compiling
>packages instead of leaving the machine idle.
>
>Most of the packages (~1/3) fail because of the already discussed problems
>with the headers.
>
>gcc -c  -g -O2 -Wall  -MD  -DHAVE_SYS_SELECT_H -DFLICK_VERSION=\"2.1\" -I. -I..
/
>../../../runtime/libraries/link/iiop -I- -I../../../../runtime/headers -I../../
.
>./../runtime/headers -I../../../../runtime/libraries/link -I../../../.. -I../..
/
>../..  communication.c
>communication.c: In function `flick_client_send_request':
>communication.c:390: `SOCK_STREAM' undeclared (first use this function)
>communication.c:390: (Each undeclared identifier is reported only once
>communication.c:390: for each function it appears in.)
>
>
>gcc -O2 -g -I. -DHAVE_CONFIG_H -DPREFIX=\"/usr\"  -c -o additional.o
additional.
>c
>In file included from /usr/include/sys/resource.h:27,
>                 from additional.c:14:
>/usr/include/resourcebits.h:103: warning: `RLIM_INFINITY' redefined
>/usr/include/asm/resource.h:32: warning: this is the location of the previous
de
>finition
>In file included from /usr/include/sys/resource.h:27,
>                 from additional.c:14:
>/usr/include/resourcebits.h:102: parse error before `0x7fffffffUL'
>
>
>I am unsure where the problem is located exactly and how to fix it
>correctly - So probably somebody else more knowledged and timely equipped
>might fix this in the CVS (probably it is alread fixed ? - My CVS kernel
>is 3-5 days old)
>
>Flo
>--
>Florian Lohoff flo@rfc822.org       +49-5241-470566
>"Technology is a constant battle between manufacturers producing bigger and
>more idiot-proof systems and nature producing bigger and better idiots."
>
