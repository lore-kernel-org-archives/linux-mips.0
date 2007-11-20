Received: from mail.zeugmasystems.com ([192.139.122.66]:8141 "EHLO
	zeugmasystems.com") by ftp.linux-mips.org with ESMTP
	id S20021406AbXKTSY5 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Tue, 20 Nov 2007 18:24:57 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: futex_wake_op deadlock?
Date: Tue, 20 Nov 2007 10:24:27 -0800
Message-ID: <DDFD17CC94A9BD49A82147DDF7D545C54DCFB7@exchange.ZeugmaSystems.local>
In-Reply-To: <20071120112051.GB30675@linux-mips.org>
From: "Kaz Kylheku" <kaz@zeugmasystems.com>
Return-Path: <kaz@zeugmasystems.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20071120182427.TvmTJm27Y7t6QL6awV0tMfP5rDNq8wF9PI4zaAgY1xA@z>

Ralf Baechle wrote:
> Patch below.  It fixes your test case on a 32-bit kernel for me.

I'm running it now on 64 bit. The test case isn't causing any ill
effects.

Thanks a lot, Ralf!
