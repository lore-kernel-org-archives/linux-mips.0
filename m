Subject: Re: errno assignment in _syscall macros and glibc
Date: Sun, 25 Jun 2000 20:26:42 +0100 (BST)
In-Reply-To: <20000625204334.E1572@bacchus.dhis.org> from "Ralf Baechle" at Jun 25, 2000 08:43:34 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E136I3I-0002yR-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Ralf Baechle <ralf@uni-koblenz.de>
Cc: Andreas Jaeger <aj@suse.de>, Mike Klar <mfklar@ponymail.com>, linux-mips@oss.sgi.com, linux-mips@fnet.fr, linux-mips@vger.rutgers.edu
Message-ID: <20000625192642.npeW7I-FnEyAMJq-nxal0nD6i0uUVQOSn6CqNT3tp2A@z>

> Andreas - I think the syscall interface should finally officially be
> declared a private interface between libc and the kernel, that is nobody
> except these two should use it.  Many of the other attempts to use it
> have been quite problematic - portabilitywise and worse.

Don't make it too private. glibc is still worryingly large for some embedded
applications. Between a libc and the kernel yes, between glibc and the kernel
no.

Alan
