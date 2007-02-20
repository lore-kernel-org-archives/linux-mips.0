Received: from mail.zeugmasystems.com ([192.139.122.66]:42937 "EHLO
	zeugmasystems.com") by ftp.linux-mips.org with ESMTP
	id S20038964AbXBTREc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Tue, 20 Feb 2007 17:04:32 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: [PATCH] Clean up serial console support on Sibyte 1250 duart
Date: Tue, 20 Feb 2007 09:03:56 -0800
Message-ID: <66910A579C9312469A7DF9ADB54A8B7D627017@exchange.ZeugmaSystems.local>
From: "Kaz Kylheku" <kaz@zeugmasystems.com>
Return-Path: <kaz@zeugmasystems.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Andrew Sharp <tigerand@gmail.com>, linux-mips@linux-mips.org
Message-ID: <20070220170356.9BPenguqjKdmPwEJCRsf5s6rSSuh2Kp-1T2X1zfjZfY@z>

Andrew Sharp wrote:
> Clean up the serial console support on the Sibyte 1250's
> built in duart.

Hi Andrew,

Would it be too much trouble to split the patch into two: the whitespace
changes, and the actual bugfix?
