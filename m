Received: from mail.zeugmasystems.com ([192.139.122.66]:53141 "EHLO
	zeugmasystems.com") by ftp.linux-mips.org with ESMTP
	id S20045180AbWHLANH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Sat, 12 Aug 2006 01:13:07 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: 2.6.17 on Broadcom BigSur (BCM91x80 A/B)
Date: Fri, 11 Aug 2006 17:12:59 -0700
Message-ID: <66910A579C9312469A7DF9ADB54A8B7D33B059@exchange.ZeugmaSystems.local>
From: "Kaz Kylheku" <kaz@zeugmasystems.com>
Return-Path: <kaz@zeugmasystems.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20060812001259.mBZ5rfq_CKlBtyYbg8BUFUh1XD5Lhl473P7H62wolMU@z>

Ralf Baechle:
> I've got a success and a failure report for BCM1480 systems, both with
> fairly recent kernels and 2.6.17.
> 
>   Ralf
> 

Thanks a lot Ralf.

The git bisect tool looks very cool; I will probably make use of it in
the future. However, I solved the problem at hand. It's the interrupt
dispatcher. I forward-ported the old assembly-language interrupt
dispatcher and the system now boots.

If I have time, I might look at the C code to see what it does
differently from the assembly code and try to fix it.

Cheers ...
