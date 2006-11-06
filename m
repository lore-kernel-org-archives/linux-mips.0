Received: from ams-iport-1.cisco.com ([144.254.224.140]:28990 "EHLO
	ams-iport-1.cisco.com") by ftp.linux-mips.org with ESMTP
	id S20038498AbWKFOmz convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Mon, 6 Nov 2006 14:42:55 +0000
Received: from ams-core-1.cisco.com (ams-core-1.cisco.com [144.254.224.150])
	by ams-dkim-1.cisco.com (8.12.11.20060308/8.12.11) with ESMTP id kA6EgbkS032147
	for <linux-mips@linux-mips.org>; Mon, 6 Nov 2006 15:42:37 +0100
Received: from xbh-ams-331.emea.cisco.com (xbh-ams-331.cisco.com [144.254.231.71])
	by ams-core-1.cisco.com (8.12.10/8.12.6) with ESMTP id kA6EgZ4Z013558
	for <linux-mips@linux-mips.org>; Mon, 6 Nov 2006 15:42:37 +0100 (MET)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: Sync operation in atomic_add_return()
Date: Mon, 6 Nov 2006 15:42:32 +0100
Message-ID: <E98CBCB9ACC07244969BE4541EC0A78303137105@xmb-ams-33b.emea.cisco.com>
From: "Gideon Stupp \(gstupp\)" <gstupp@cisco.com>
Return-Path: <gstupp@cisco.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20061106144232.n0X8ZFbKhSN-qNokV2mCNcp2j4wrcTIySKyuEOmhDIk@z>

Hi,
I am trying to figure out why there is a sync operation in
linux/include/asm-mips/atomic.h:atomic_add_return(). 
I believe it was added in the linux-2.4.19 patch, but can't trace the
reason. Can anyone help?

Thanks, Gideon.
