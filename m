Received: from fnoeppeil48.netpark.at ([217.175.205.176]:64678 "EHLO
	roarinelk.homelinux.net") by ftp.linux-mips.org with ESMTP
	id S20027443AbYHGGpv (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Thu, 7 Aug 2008 07:45:51 +0100
Date: Thu, 7 Aug 2008 08:45:47 +0200
From: Manuel Lauss <mano@roarinelk.homelinux.net>
Subject: Re: Au1550 Nandflash
Message-ID: <20080807084547.243d803a@scarran>
In-Reply-To: <S20023167AbYHGETq/20080807041946Z+558223@ftp.linux-mips.org>
References: <S20023167AbYHGETq/20080807041946Z+558223@ftp.linux-mips.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-Path: <mano@roarinelk.homelinux.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: maowy <maowy@avit.org.cn>
Cc: borasah@netone.com.trborasah@netone.com.tr, L-M-O <linux-mips@linux-mips.org>linux-mips@linux-mips.orglinux-mips@linux-mips.org
Message-ID: <20080807064547.FLUKLm1Voq3rAbDm8CWpLEKvgm3dyKXzMoxMxWLgswo@z>

On Thu, 7 Aug 2008 12:16:19 +0800
"maowy" <maowy@avit.org.cn> wrote:

> borasah____________
> 	I have the same problem with you when using nandflash.
>     Our kernel can recognize nandflash but it seems to be all bad block.
> 	How dou you successfully solve this problem of  nandflash .
> 	Can you tell how to solve this problem.
> 	Hope to receive your letter as soon as possible.Thanks.
> 	
> 
> our platform:AU1550
> OS:linux-2.6.13

Please give the "gen_nand" driver a try.  I ran into identical problems
on Au1200; the in-kernel au1550nd.c code seems to be explicitly
tailored for small-page nands on the PB1550/DB1200 boards and doesn't
seem to work anywhere else.

FWIW, here's a snippet I use on Au1200 which you can paste into your
board setup code; it should work on Au1550 too since the NAND parts are
identical.

---------- 8< --------------------- 8< -----------------

#include <linux/mtd/mtd.h>
#include <linux/mtd/map.h>
#include <linux/mtd/nand.h>
#include <linux/mtd/partitions.h>
#include <asm/mach-au1x00/au1000.h>

static void au1200_nand_cmd_ctrl(struct mtd_info *mtd, int cmd,
				 unsigned int ctrl)
{
	struct nand_chip *this = mtd->priv;
	unsigned long ioaddr = (unsigned long)this->IO_ADDR_W;

	ioaddr &= 0xffffff00;

	if (ctrl & NAND_CLE) {
		ioaddr += MEM_STNAND_CMD;
	} else if (ctrl & NAND_ALE) {
		ioaddr += MEM_STNAND_ADDR;
	} else {
		/* assume we want to r/w real data  by default */
		ioaddr += MEM_STNAND_DATA;
	}
	this->IO_ADDR_R = this->IO_ADDR_W = (void __iomem *)ioaddr;
	if (cmd != NAND_CMD_NONE) {
		au_writeb(cmd, ioaddr);
		au_sync();
	}
}

static int au1200_nand_device_ready(struct mtd_info *mtd)
{
	int ret = (au_readl(MEM_STSTAT) & 1);
	au_sync();
	return ret;
}

static const char *au1200_part_probes[] = { "cmdlinepart", NULL };

static struct mtd_partition au1200_nand_parts[] = {
	[0] = {
		.name	= "NAND FS 0",
		.offset	= 0,
		.size	= MTDPART_SIZ_FULL,
	},
};

struct platform_nand_data au1200_nand_platdata = {
	.chip = {
		.nr_chips = 1,
		.chip_offset = 0,
		.nr_partitions = ARRAY_SIZE(au1200_nand_parts),
		.partitions = au1200_nand_parts,
		.chip_delay = 20,
		.part_probe_types = au1200_part_probes,
	},
	.ctrl = {
		.hwcontrol = 0,
		.dev_ready = au1200_nand_device_ready,
		.select_chip = 0,
		.cmd_ctrl = au1200_nand_cmd_ctrl,
	},
};

static struct resource au1200_nand_res[] = {
	[0] = {
		.start = 0x20000000,
		.end   = 0x200000ff,
		.flags = IORESOURCE_MEM,
	},
};

static struct platform_device au1200_nand_dev = {
	.name		= "gen_nand",
	.num_resources	= ARRAY_SIZE(au1200_nand_res),
	.resource	= au1200_nand_res,
	.id		= -1,
	.dev		= {
		.platform_data = &au1200_nand_platdata,
	}
};

---------- 8< --------------------- 8< -----------------


Best regards,
	Manuel Lauss
