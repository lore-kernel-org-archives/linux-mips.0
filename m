From: "Mike Klar" <mfklar@ponymail.com>
Subject: RE: stable binutils, gcc, glibc ...
Date: Sun, 15 Oct 2000 18:33:42 -0700
Message-ID: <NDBBIDGAOKMNJNDAHDDMAENPCMAA.mfklar@ponymail.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20001016023523.D15377@bacchus.dhis.org>
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: Jay Carlson <nop@nop.com>, linux-mips@fnet.fr, linux-mips@oss.sgi.com
Message-ID: <20001016013342.bVOIeQPwhPCybmYaIajMHnddPeIvtApd5yak6W1ZN9E@z>

Ralf Baechle wrote:

> Have the other tools - in particular binutils and gcc actually
> been modified
> except maybe changing defaults?

binutils we use unmodified from the cross- SRPM on ftp://oss.sgi.com.
egcs-1.0.3a did require a small patch, which Jay has at:
ftp://ftp.place.org/pub/nop/linuxce/egcs-1.0.3a-mips-softfloat.patch
I've reworked it slightly to patch cleanly against the latest Linux-MIPS
egcs-1.0.3a release, but the server that's on is a bit whacked at the moment
(the patch conflict was pretty trivial, though...).

We actually did not change the compiler default from hard-float, to compile
soft-float, the flag -msoft-float still has to be used.  Jay's patch just
makes -msoft-float work (with glibc), at least that's my understanding.

Mike Klar
