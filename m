content-class: urn:content-classes:message
Subject: kmalloc question
Date: Wed, 8 Oct 2003 15:06:50 -1000
Message-ID: <DC1BF43A8FAE654DA6B3FB7836DD3A56DEB76D@iris.adtech-inc.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
From: "Finney, Steve" <Steve.Finney@SpirentCom.COM>
Return-Path: <Steve.Finney@SpirentCom.COM>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20031009010650.c3USoufr-bRR2ucZKyzb-vB0rTBNOri8wdwH6tixGA4@z>

Is kmalloc (GFP_KERNEL) on a 32 bit HIGHMEM enabled MIPS kernel (BCM/Sibyte processor) guaranteed to allocate memory from the low, KSEG0/1 addressible region? I'm having trouble sorting through the slab.c code. On this processor, only 256 MB of DRAM is directly addressible; with more than 256 MB of RAM, there is 256 MB in zone 0, and the remainder in zone 2. Zone 1 is empty.

Thanks,
sf
