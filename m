From: "Bryan Althouse" <bryan.althouse@3phoenix.com>
Subject: RE: 
Date: Wed, 4 May 2005 10:22:08 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1115214949.13387.13.camel@euskadi.packetvision>
Message-ID: <20050504142226Z8225804-1340+6519@linux-mips.org>
Return-Path: <bryan.althouse@3phoenix.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'Alex Gonzalez' <linux-mips@packetvision.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20050504142208.ElFwTYk8Kv19AdSkwE5tV42Oboz5_6FK00KPdkl_FL8@z>

Thanks for your help.  Yes I do need SMP.  Jason Liu of PMC did a check on
my serial number, and found that I have rev 1.1 silicon.  He says I need rev
1.2 in order to use a 2.6.x kernel.  I have shipped my hardware back to them
for an upgrade.  Hopefully, I'll be back in business in a week or two.

Bryan

-----Original Message-----
From: Alex Gonzalez [mailto:linux-mips@packetvision.com] 
Sent: Wednesday, May 04, 2005 9:56 AM
To: Bryan Althouse
Cc: linux-mips@linux-mips.org; TheNop@gmx.net
Subject: Re:

I had no problems compiling the linux-2.6.10 kernel from pmc-sierra's
ftp.

>       Make[3]: *** [drivers/char/agp/backend.o] Error 1

Do you need AGP support? My kernel is configured without it.

Alex

On Thu, 2005-04-28 at 20:15, Bryan Althouse wrote:
> Hello,
> 
> I would like to use a 2.6.x kernel with my Yosemite/HalfDome board.
> Somehow, I am unable to compile the kernel.  I have tried the 2.6.10
kernel
> trees from ftp.pmc-sierra.com and also the latest 2.6.12 snapshot from
> linux-mips.  I am using the 3.3.x cross compile tools from
> ftp.pmc-sierra.com .  The 2.4.x kernels from PMC compile fine.
> 
> In the case of 2.6.10 from ftp.pmc-sierra.com, my error looks like:
>        Make[3]: *** [drivers/char/agp/backend.o] Error 1
> 
> 	
> In the case of 2.6.12 from linux-mips, my error looks like:
> 	drivers/net/titan_ge.c1950: error: 'titan_device_remove"  undeclared
> here (not in a function)
> 
> My compile process is like so:
> make mrproper
> make xconfig
> make oldconfig
> make ARCH=mips CROSS_COMPILE=/<tool_path>/mips64-linux-gnu-    vmlinux
> 
> Could someone share their .config with me, or make some suggestions?
> 
> Thank you,
> Bryan
> 
> 
