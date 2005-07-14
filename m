Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: Au1550 ethernet throughput low
Date: Thu, 14 Jul 2005 10:32:22 +0530
Message-ID: <A8A67F242940E246A515077CF9ECACC16B16C4@dbde01.ent.ti.com>
From: "Singh, Ajay" <ajaysingh@ti.com>
Return-Path: <ajaysingh@ti.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: jaypee@hotpop.com, linux-mips <linux-mips@linux-mips.org>
Message-ID: <20050714050222._BBUPB7_3HiMdePehKsKPWis8veqVAHvVA59fszz_XA@z>

Is your driver on Linux 2.6 NAPI enabled ? And is CONFIG_PREEMPT=y?

-----Original Message-----
From: linux-mips-bounce@linux-mips.org
[mailto:linux-mips-bounce@linux-mips.org] On Behalf Of jaypee@hotpop.com
Sent: Wednesday, July 13, 2005 9:30 PM
To: linux-mips
Subject: Au1550 ethernet throughput low

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi all,
I've got a au1550 board based largely on the pb1550. The ethernet
throughput is ~66Mbps using the 2.6 kernel. This also consumes a lot of
cpu cycles to send.

We have older designs using au1000 and mvista 2.4 kernel that achieve
full line rate throughput without using a lot of the cpu.

Can someone with a pb/db1550 and linux 2.6 do a quick test to verify
that is is not a 2.6 kernel problem, and is a problem with our HW/SW.

If anyone can do the same with a 2.4 kernel too that would be great.

Thanks,
JP

- --
mailto:jaypee@hotpop.com
http://www.jaypee.org.uk
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFC1TqCZDxnKy3oOpYRAhwaAKCoY/3lEX/DksOEq42FfxlsF2rjEgCeNI0G
/72t16fNrA4XvX+KVumsNDw=
=yoD8
-----END PGP SIGNATURE-----
