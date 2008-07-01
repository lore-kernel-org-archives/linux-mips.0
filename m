Received: from smtp3.infineon.com ([203.126.106.229]:10290 "EHLO
	smtp3.infineon.com") by ftp.linux-mips.org with ESMTP
	id S29047646AbYGAGF2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Tue, 1 Jul 2008 07:05:28 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: Kmem_cache handling in linux-2.6.2x kernel.
Date: Tue, 1 Jul 2008 14:05:17 +0800
Message-ID: <31E09F73562D7A4D82119D7F6C172986045B6E80@sinse303.ap.infineon.com>
From: <KokHow.Teh@infineon.com>
Return-Path: <KokHow.Teh@infineon.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org, bookquestions@oreilly.com
Cc: Bing-Tao.Xu@infineon.com
Message-ID: <20080701060517.-aV7z-Sn_E-VpA28iDNUf5icmKo-ax8irMmHPWwd65w@z>

Hi list;
	I have a question about kmem_cache implemented in Linux-2.6.2x
kernel. I have an application that allocates and free 64KByte chunks of
memory (32-byte aligned) quite often. Therefore, I create a lookaside
cache for that purpose and use kmem_cache_alloc(), kmem_cache_free() to
allocate and free the caches. The application works very well in this
model. However, my concern here is if kmem_cache_free() does return the
cache to the system-wide pool so that it could be used by other
applications when need arises; when system is low in memory resources,
for instance. This is a question about the internal workings of the
memory management system of the Linux-2.6.2x kernel as to how efficient
it manages this lookasie caches. The concern is valid because if this
lookaside cache is not managed well, i.e, it is not returned to the
system-wide pool of free memory pools to be used by other applications,
this will penalize the performace and throughput of the whole system due
to the dynamic behaviour of the utilization of system memory resources.
For example, other applications might be swapping in and out of the
harddisk and if the kmem_cache_free()'ed memory objects could be used by
these applications, it will help in this case to reduce the number of
swaps that happen, thereby freeing the CPU and/or DMA from doing the
swapping to do other critical tasks.

	Any insight and advice is appreciated.

Regards,
KH
