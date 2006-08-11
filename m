Received: from mail.zeugmasystems.com ([192.139.122.66]:27215 "EHLO
	zeugmasystems.com") by ftp.linux-mips.org with ESMTP
	id S20044438AbWHKAsp convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Fri, 11 Aug 2006 01:48:45 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: 2.6.17 on Broadcom BigSur (BCM91x80 A/B)
Date: Thu, 10 Aug 2006 17:48:35 -0700
Message-ID: <66910A579C9312469A7DF9ADB54A8B7D33AEC6@exchange.ZeugmaSystems.local>
From: "Kaz Kylheku" <kaz@zeugmasystems.com>
Return-Path: <kaz@zeugmasystems.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20060811004835.blWQZ805nKWRrxtM3pgOtGkxGq11t9trQe0d2lIJfpc@z>

Anyone running 2.6.17 on the above Broadcom board or derivative?

I'm trying to run it an our hardware that is based on this
board. It's slightly patched so that it builds :), and so
that certain things work right on our board.

Kernel 2.6.14 works, and the patches migrated to 2.6.17
without too many difficulties.

It hangs on startup around the point where dynamic IP
configuration is done.

Sometimes the last output that is seen is the printk message

  Sending DHCP and RARP requests .

Sometimes it doesn't appear.

So before I dive into it head first, I thought I'd
poke the mailing list.
