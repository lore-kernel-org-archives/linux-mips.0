Date: Mon, 21 May 2001 21:07:29 +0900
Message-ID: <200105211207.VAA12651@intranet.medialincs.com>
From: =?EUC-KR?B?wba+58iv?=<joey@medialincs.com>
Subject: udp, tcp checksum error?
MIME-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 8bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20010521120729.gNZOXVhC2a8WvcMVaWFEg09MhETL-C_MpNBrDQIeY1A@z>

hello.
I'm booting up by nfs-root.

nfs server is RH-7.0 and kernel 2.4.4 , this machine's nfs is good working

but when target mips machine connect to host by UDP, 
wrong checksum UDP packet  is discarded.

i use mips big endian toolchains(20010303), kernel sorce is CVS update version.

I thinks include/asm-mips/checksum.h logic is different from i386's

anyone have idea this problem?

thanx.
