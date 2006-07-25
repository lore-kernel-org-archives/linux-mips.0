Received: from [202.99.27.194] ([202.99.27.194]:1752 "EHLO mail1.topsec.com.cn")
	by ftp.linux-mips.org with ESMTP id S8133966AbWGYCww (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Tue, 25 Jul 2006 03:52:52 +0100
Message-ID: <004001c6af95$14585900$0100000a@codingman>
From: <wyb@topsec.com.cn>
Subject: unmatched R_MIPS_HI16/LO16 on gcc 3.4.3
Date: Tue, 25 Jul 2006 10:49:56 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: 7bit
Return-Path: <wyb@topsec.com.cn>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: macro@linux-mips.org, ralf@linux-mips.org, sskowron@ET.PUT.Poznan.PL, rsandifo@redhat.com
Cc: linux-mips@linux-mips.org
Message-ID: <20060725024956.Dm7mEnG_skBmkqOroz4DRawO0yPzI_p484gtN4UznnA@z>

Sorry for disturbing you.

I met similar problem as Stanislaw Skowronek, but for gcc 3.4.3. I created a
kernel module, when insmod, kernel reported "dangerous relocation". I traced
the bug, found unmatched R_MIPS_HI16/LO16 in module's elf file, and kernel
refused to relocate:
...
00015a5c  00039a05 R_MIPS_HI16       0000000c   tos_net_debug
00015a68  00000204 R_MIPS_26         00000000   .text
00015a64  00046005 R_MIPS_HI16       0006b598   arp_proxy_list
00015a6c  00046006 R_MIPS_LO16       0006b598   arp_proxy_list
...

My problem arised when expression on tos_net_debug could be optimized out,
it seemed like gcc optimized out the LO16, but left HI16.

The original discussion on similar problem is at
http://www.linux-mips.org/archives/linux-mips/2005-05/msg00097.html

thanks very much
