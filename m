Message-ID: <002601c121a0$de4f2fa0$237900d9@shodan>
From: "Armin F. Gnosa" <mipslist@gnosa.com>
References: <Pine.GSO.3.96.1010810110057.2724F-100000@delta.ds2.pg.gda.pl>
Subject: Re: Problem with PMAD-AA / DECStation 5000/200
Date: Fri, 10 Aug 2001 15:32:13 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010810133213.x_7__LFCZZlOfqhwbcKoMM8w8RJA1gZQiQc89WPvlfU@z>

>  I'm not sure how exactly the ROMs are wired (they're usually 8-bit);
> hopefully in a "natural" way.  You can read most of ROMs under Linux via
> mmap()ping /dev/mem -- parts of ROMs may not be directly available to the
> host CPU if they contain option's CPU firmware.  The MB ROM is remapped
> (byte-merged) by the chipset so that it can be read in 32-bit quantities
> as parts of it get executed directly (the I/O ASIC permits switching the
> byte merging off).  Option ROMs are not remapped as they always get copied
> to the system RAM before execution.  Their organization can be read from
> their headers as specified by the TURBOchannel firmware specification.

That sounds like an interesting alternative to pulling the PROM out of
its socket. Then, a program running on a DECStation 5000/200 should be
reading from 0x1F81C0000..0x1F1FFFFF, right? One question about Byte
Merging: Does it mean that I don't have to read bytewise but instead
DWORD-wise?

Regards,
Armin
