From: "Lyle Bainbridge" <lyle@zevion.com>
Subject: Mips cross toolchain
Date: Tue, 20 Aug 2002 10:58:13 -0500
Message-ID: <NCBBKGDBOEEBDOELAFOFKEGGCPAA.lyle@zevion.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20020820155813.KUfuMoWRTVQSUooLJWTP6Bt61q2NOuWXLMi3VsITG38@z>

Hi,

I'm a linux kernel newbie, and this is my first linux-mips posting.
I have built a big endian, elf, cross toolchain for mips32 (I'm using
an Alchemy Au1500 SOC) based on the GCC 3.0.4, Binutils 2.11.2 and
Newlib 1.9.0.  My intention is to now use it to compile the 2.4.19 kernel.

I am still figuring out how to cross compile the kernel, but I was
wondering if I had used the correct versions of GCC and Binutils to
succesfully build a stable kernel.  Also, are there any patches I would
need? So far I've used the stock distributions from gnu.org.

Any advice would be most appreciated.

Thanks,
Lyle Bainbridge
Minneapolis, MN
