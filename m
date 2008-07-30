Received: from mail.zeugmasystems.com ([192.139.122.66]:4824 "EHLO
	zeugmasystems.com") by ftp.linux-mips.org with ESMTP
	id S20033822AbYG3Pag convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Wed, 30 Jul 2008 16:30:36 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: Swarm IDE bug in 2.6.26.
Date: Wed, 30 Jul 2008 08:30:28 -0700
Message-ID: <DDFD17CC94A9BD49A82147DDF7D545C5FC849E@exchange.ZeugmaSystems.local>
From: "Kaz Kylheku" <KKylheku@zeugmasystems.com>
Return-Path: <KKylheku@zeugmasystems.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20080730153028.ZKf3AteU56KwplhERJKMhdlZGbqKA_UpWIp8kMWj7GY@z>

Hi all,

Haven't checked git; maybe you guys fixed it already.

In drivers/ide/mips/swarm.c, function swarm_ide_probe, the hw_regs_t
structure is not memset to 0, leaving the struct device *dev member
uninitialized.

I found this because it caused a crash on boot. At first there was no
crash, but then I made some kernel changes
which caused it to repro.
