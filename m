Received: from laf31-5-82-235-130-100.fbx.proxad.net ([82.235.130.100]:47077
	"EHLO lexbox.fr") by ftp.linux-mips.org with ESMTP id S8133575AbVLEIW7 convert rfc822-to-8bit
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Mon, 5 Dec 2005 08:22:59 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: Au1550 system bus masters issue
Date: Mon, 5 Dec 2005 09:18:50 +0100
Message-ID: <17AB476A04B7C842887E0EB1F268111E0271B7@xpserver.intra.lexbox.org>
From: "David Sanchez" <david.sanchez@lexbox.fr>
Return-Path: <david.sanchez@lexbox.fr>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20051205081850.1ITQg8Ez8ZVGSDSLNGl9VWVfnkRN8pW2USL4PB8WkKM@z>

Hi,

I notice the following issue in the specification update (v31420) of the
au1550:

"System bus masters (USB host, PCI, MAC0, MAC1, DDMA) may receive stale
data.

Description
-----------
System bus masters (USB host controller, PCI controller, MAC0, MAC1,
DDMA controller), when performing
coherent reads, may incorrectly receive stale data from memory instead
of valid modified data from the Au1
data cache. If the request for data arrives within a 3-clock window
prior to the cache line castout to memory,
the cache snoop response is incorrect and stale data is retrieved from
memory instead of the correct data from
the cache. The cache line castout then completes, and memory is updated.
Cache/memory data is not corrupted, but the specific bus read in not
valid.

Affected Step
-------------
AA

Workaround
----------
Do not enable cacheable master reads if the core modifies data in cache.

Status
------
Not Fixed"

Does somebody known if the linux kernel 2.6.10 integrates this
workaround ?

Thanks
