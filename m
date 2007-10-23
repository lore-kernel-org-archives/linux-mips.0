Received: from atlrel7.hp.com ([156.153.255.213]:45446 "EHLO atlrel7.hp.com")
	by ftp.linux-mips.org with ESMTP id S20031721AbXJWU4F (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Tue, 23 Oct 2007 21:56:05 +0100
Message-ID: <20071023204843.442608289@ldl.fc.hp.com>
Date: Tue, 23 Oct 2007 14:48:43 -0600
From: Bjorn Helgaas <bjorn.helgaas@hp.com>
Subject: [patch 0/2] RTC fixes
Return-Path: <helgaas@ldl.fc.hp.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Alessandro Zummo <a.zummo@towertech.it>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20071023204843.IXzw_opzPJS_6yIWWCcRc0RzowldZ-_KJ1f6_avcz_M@z>

Here are two fixes:

  - Minor bugfix on error path for mips.
  - If resource request fails, fall back to requesting only the
    ioports we actually use.  This is not a problem yet, but it
    will be if the PNP core claims resources before drivers attach.

--
