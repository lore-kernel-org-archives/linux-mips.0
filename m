Received: from imsantv37.netvigator.com ([210.87.250.143]:12996 "EHLO
	imsantv37.netvigator.com") by ftp.linux-mips.org with ESMTP
	id S8133638AbVJ1Jvl (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Fri, 28 Oct 2005 10:51:41 +0100
Received: from imsantv44.netvigator.com (imsantv37 [127.0.0.1])
	by imsantv37.netvigator.com (8.13.1/8.13.1) with ESMTP id j9S9pmtU026535
	for <linux-mips@linux-mips.org>; Fri, 28 Oct 2005 17:51:49 +0800
From: "Louis Lai" <louis.lai@entone.com>
Subject: missing /dev/tty0
Date: Fri, 28 Oct 2005 17:46:23 +0800
Message-ID: <HAENJFHIMADGCOMALOKKOEELCBAA.louis.lai@entone.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <louis.lai@entone.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linuxconsole-dev@lists.sourceforge.net, linux-mips@linux-mips.org
Message-ID: <20051028094623.gmDO2_yolBmykISKwiwfnww_8cYt5DyFa_aTsWdBWS8@z>

Hi all,

I am using a 2.4.30 kernel for my MIPS embedded processor. The kernel can
start up properly but the tty0 doesn't exist under /dev. I have already
enable the virtual console during kernel configuration. is it something
configure not properly for the kernel?? Anyone can help??

Thanks in advance,
Louis
