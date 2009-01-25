Received: from rtp-iport-1.cisco.com ([64.102.122.148]:33455 "EHLO
	rtp-iport-1.cisco.com") by ftp.linux-mips.org with ESMTP
	id S21366344AbZAYB7u convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Sun, 25 Jan 2009 01:59:50 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: 2.6.28 will not boot on 24K processor, ebase incorrectly modified in set_uncached_handler
Date: Sat, 24 Jan 2009 20:59:42 -0500
Message-ID: <FF038EB85946AA46B18DFEE6E6F8A28976825D@xmb-rtp-218.amer.cisco.com>
From: "David VomLehn (dvomlehn)" <dvomlehn@cisco.com>
Return-Path: <dvomlehn@cisco.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Cc: "Dezhong Diao (dediao)" <dediao@cisco.com>, "Victor Williams Jr (williavi)" <williavi@cisco.com>, "Michael Sundius -X (msundius - Yoh Services LLC at Cisco)" <msundius@cisco.com>
Message-ID: <20090125015942.VnqBUBaMsDac3UPpwSGrSKBuNPcTcN_U8HG7FwBye-I@z>

The 2.6.28 kernel dies in memcpy when called from set_vi_srs_handler on
a
24K processor. The problem is that ebase has an invalid value. The
original
value of ebase comes from a bootmem allocation, but the following code
in
set_uncached_handler takes a perfectly good kseg0 address and turns it
into
an invalid kseg1 address.

	if (cpu_has_mips_r2)
		ebase += (read_c0_ebase() & 0x3ffff000);

This code was added in commit 566f74f6b2f8b85d5b8d6caaf97e5672cecd3e3e.
I
have no idea why ebase needs to be modified at all, so I have no patch
to
offer. When I removed these two lines, my kernel booted to a shell
prompt.
--
David VomLehn, dvomlehn@cisco.com
