Received: from mail.zeugmasystems.com ([192.139.122.66]:43179 "EHLO
	zeugmasystems.com") by ftp.linux-mips.org with ESMTP
	id S20037833AbWIRQaO convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Mon, 18 Sep 2006 17:30:14 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: Kernel debugging contd.
Date: Mon, 18 Sep 2006 09:29:52 -0700
Message-ID: <66910A579C9312469A7DF9ADB54A8B7D390BF9@exchange.ZeugmaSystems.local>
From: "Kaz Kylheku" <kaz@zeugmasystems.com>
Return-Path: <kaz@zeugmasystems.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20060918162952.mNYXnARW_KdHM7u7_6H-RfKHSdhu3Xtiir9qlTl5TpY@z>

Manoj Ekbote wrote:
> If I may add, the changes made when the flush_icache_page call was
> retired seems to cause this problem.
> I reversed some of the changes and the kernel boots fine atleast on
> 1480.
> 
> commit id : 4bbd62a93a1ab4b7d8a5b402b0c78ac265b35661

Speaking of the 1480, I'm still running a 2.6.17.7 kernel in which I
patched back the old assembly-language IRQ handler. 

I can't boot our board with the IRQ handler rewritten in C.
