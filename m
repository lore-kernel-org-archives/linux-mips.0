Received: from mail.zeugmasystems.com ([192.139.122.66]:39527 "EHLO
	zeugmasystems.com") by ftp.linux-mips.org with ESMTP
	id S20038428AbWIFRrU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Wed, 6 Sep 2006 18:47:20 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: [PATCH] Wire up set_robust_list(2) and get_robust_list(2)
Date: Wed, 6 Sep 2006 10:47:16 -0700
Message-ID: <66910A579C9312469A7DF9ADB54A8B7D38FEF5@exchange.ZeugmaSystems.local>
From: "Kaz Kylheku" <kaz@zeugmasystems.com>
Return-Path: <kaz@zeugmasystems.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>, linux-mips@linux-mips.org
Cc: ralf@linux-mips.org, drow@false.org, libc-ports@sources.redhat.com
Message-ID: <20060906174716.X1Ho9eX025qPGVRm4St3lc2nlFjJM-MjSTIJIXcvqJw@z>

Arigato gozaimas, Nemoto-san!

I have applied your patch (actually back-ported it to the 2.6.17.7
kernel I'm using).

I built the kernel, and then recompiled glibc against the patched
headers, and booted into the SB1-based board.

The NPTL robust mutex test cases pass now, including the process-shared
one.
