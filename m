Message-ID: <004401bf924e$f0c526e0$0ceca8c0@satanas.mips.com>
From: "Kevin D. Kissell" <kevink@mips.com>
Subject: Re: header files state
Date: Mon, 20 Mar 2000 10:30:26 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: Andreas Jaeger <aj@suse.de>
Cc: Florian Lohoff <flo@rfc822.org>, linux@cthulhu.engr.sgi.com
Message-ID: <20000320093026.fi4eVKgl_z1TPJg_ASEuJR3yZWTAStOkxjRKdNLIars@z>

>Linus has stated quite violantly that glibc should not include any
>kernel headers at all - and we're now including less and less
>headers.  But this process needs time and occasionally breaks older
>glibc's.

What is Linus' rationale for his position?   It's true that 
having includes "reaching in" from libc imposes constraints
on kernel designers, but failure to do so is guaranteed
to induce error - as we have seen.

            Kevin K.
