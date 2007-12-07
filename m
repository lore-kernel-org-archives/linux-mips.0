Received: from mail.zeugmasystems.com ([70.79.96.174]:52343 "EHLO
	zeugmasystems.com") by ftp.linux-mips.org with ESMTP
	id S20022438AbXLGV50 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Fri, 7 Dec 2007 21:57:26 +0000
Content-class: urn:content-classes:message
Subject: SiByte 1480 & Branch Likely instructions?
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Date: Fri, 7 Dec 2007 13:54:30 -0800
Message-ID: <DDFD17CC94A9BD49A82147DDF7D545C5590CF0@exchange.ZeugmaSystems.local>
From: "Kaz Kylheku" <kaz@zeugmasystems.com>
Return-Path: <kaz@zeugmasystems.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20071207215430.qLmff2uClQ7qVutXrLhtJa5jFkgP0R3-nyWPxHYTUro@z>

Hi All,

Not really a kernel-related question. I've discovered that GCC 4.1.1
(which I'm not using for kernel compiling, but user space) generates
branch likely instructions by default, even though the documentation
says that their use is off by default for MIPS32 and MIPS64, because
they are considered deprecated. They are documented as obsolete for the
Broadcom chips I am working with.

I'm investigating a software anomaly which looks like might be caused by
failure to annul the delay slot of a branch-likely in the fall-through
case. 

In parallel with writing some tests, I thought I would ask whether
anyone happens know whether or not these instructions are known to
actually work correctly on the SB1480 silicon (and perhaps any
additional details, like what revisions, etc)?

Thanks
