Message-ID: <003001c469b4$3b5ae960$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <07d301c469a9$e708f550$0200000a@ALEC>
Subject: Re: MS VC++ compiler / MIPS
Date: Wed, 14 Jul 2004 17:07:06 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: a.voropay@vmb-service.ru, linux-mips@linux-mips.org
Message-ID: <20040714150706.V1G6vdIoK85CdaDueo1RY9UbgdrrhofUH5KZ-uhMD-k@z>

If I recall correctly, the MS compiler uses a subltly different
calling convention/ABI than the "o32" gcc conventions assumed
by MIPS Linux, and certainly the assembler directives will be
different from those assumed by the Linux sources.  It *might*
be possible to hack up a MIPS Linux kernel source tree to
build with the MS tool kit, but it would be a lot of work, 
some of it subtle.

            Regards,

            Kevin K.
