Received: from mail.zeugmasystems.com ([192.139.122.66]:22669 "EHLO
	zeugmasystems.com") by ftp.linux-mips.org with ESMTP
	id S20045119AbWHKVbz convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Fri, 11 Aug 2006 22:31:55 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: Version control question.
Date: Fri, 11 Aug 2006 14:31:49 -0700
Message-ID: <66910A579C9312469A7DF9ADB54A8B7D33AFE9@exchange.ZeugmaSystems.local>
From: "Kaz Kylheku" <kaz@zeugmasystems.com>
Return-Path: <kaz@zeugmasystems.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20060811213149.heiy8UDUuYIVJ5xgVoo3SZf7ae-ROHXOSa4cD2Z7MAM@z>

Is there any document that makes the linux-mips configuration management
structure more obvious?

I see that the 2.6.16 and 2.6.17 lines are in fact parallel branches, so
that 2.6.16.27 is newer than 2.6.17.

If something is broken in 2.6.17 but isn't in 2.6.16.27, what's the best
way to find it?

Just compare 2.6.16.27 to the closest parallel 2.6.17.x to see what the
differences are?
