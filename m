Message-ID: <002701c484e7$af440980$1422bdd3@roman>
From: "Roman Mashak" <mrv@tusur.ru>
References: <OFBBD37EA1.A7922B89-ON88256EF3.005D0F89-88256EF3.005D49DB@taec.com>
Subject: Re: Yamon compiling and linking
Date: Wed, 18 Aug 2004 14:53:18 +0900
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <mrv@tusur.ru>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Saugata.Chatterjee@taec.toshiba.com, linux-mips@linux-mips.org
Message-ID: <20040818055318.yRRklCJu0ggX8U7KIHH975LHHEOCSbJtmDO1SVtEJwI@z>

Hello, Saugata.Chatterjee@taec.toshiba.com!
You wrote to "Roman Mashak" <mrv@tusur.ru> on Tue, 17 Aug 2004
09:58:57 -0700:

SC> Reset code (reset.S) IS compiled and linked (at bfc00000 like it should
SC> be), and pretty early on in there YAMON detects endianness and jumps to
the
SC> location of the appropriate endian image. Dump the output of make to a
log
SC> file and look for the compilation of reset.S.

I have already investigated the 'makefile' and 'make' dump - and I've found
that reset code is compiled only in one case - when I compile both LE and BE
images.

Yes, I'm using AMD modified code and perhaps this is the reason, but their
support didn't answer yet.

Anyway - thank you for spending time for me.

With best regards, Roman Mashak.  E-mail: mrv@tusur.ru
