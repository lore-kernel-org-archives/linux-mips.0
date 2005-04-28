From: "Bryan Althouse" <bryan.althouse@3phoenix.com>
Subject: 
Date: Thu, 28 Apr 2005 15:15:49 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <20050428191608Z8225923-1340+6320@linux-mips.org>
Return-Path: <bryan.althouse@3phoenix.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Cc: TheNop@gmx.net
Message-ID: <20050428191549.HuE_TLp8P8sriG7NYeWKXkNVwS3c4eDEWvAUMQPeEkI@z>

Hello,

I would like to use a 2.6.x kernel with my Yosemite/HalfDome board.
Somehow, I am unable to compile the kernel.  I have tried the 2.6.10 kernel
trees from ftp.pmc-sierra.com and also the latest 2.6.12 snapshot from
linux-mips.  I am using the 3.3.x cross compile tools from
ftp.pmc-sierra.com .  The 2.4.x kernels from PMC compile fine.

In the case of 2.6.10 from ftp.pmc-sierra.com, my error looks like:
       Make[3]: *** [drivers/char/agp/backend.o] Error 1

	
In the case of 2.6.12 from linux-mips, my error looks like:
	drivers/net/titan_ge.c1950: error: 'titan_device_remove"  undeclared
here (not in a function)

My compile process is like so:
make mrproper
make xconfig
make oldconfig
make ARCH=mips CROSS_COMPILE=/<tool_path>/mips64-linux-gnu-    vmlinux

Could someone share their .config with me, or make some suggestions?

Thank you,
Bryan
