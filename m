Message-ID: <003b01c23256$b262f080$1604c0d8@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <Pine.GSO.3.96.1020722222909.2373P-100000@delta.ds2.pg.gda.pl>
Subject: Re: [patch] linux: cpu_probe(): remove 32-bit CPU bits for MIPS64
Date: Tue, 23 Jul 2002 16:38:58 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>, linux-mips@fnet.fr, linux-mips@oss.sgi.com, Ralf Baechle <ralf@uni-koblenz.de>
Message-ID: <20020723143858.KaIyqAw7w3v6VUI-OSbutSnyD0HTucHt9qzp9SjXYTA@z>

>  There is no need to carry support for pure 32-bit CPUs around in
> cpu_probe() in arch/mips64/kernel/setup.c, since such CPUs are not
> supported by the port and likely won't ever reach that code due to a
> reserved instruction exception earlier.  The code is misleading and a
> possible cause of troubles, e.g. the 2.4 branch doesn't link now because
> of an unresolved reference to cpu_has_fpu() which is only needed for
> R2000/R3000. 
> 
>  The following patch removes the code for 2.4.  For the trunk
> cpu_has_fpu() would be removed as well.  Any objections?

I'm on the road and don't have ready access to the sources,
but if I understand you correctly, I object.  The MIPS 5Kc and 
the NEC Vr41xx are two examples of 64-bit CPUs which don't 
have FPUs, and I believe there is at least one other from
Toshiba. (Tx49-something-or-other).

My personal bleief is that the mips and mips64 trees 
should ultimately be merged, and that creating additional 
and gratuitous differences should be avoided.
