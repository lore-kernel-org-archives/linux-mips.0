Received: from IBMJP (unknown [10.42.1.6])
	by rocket.glaze.se (Postfix) with ESMTP id 8AE6537646C
	for <linux-mips@linux-mips.org>; Tue, 20 Sep 2005 23:02:04 +0200 (CEST)
From: "Jan Pedersen" <jan.pedersen@glaze.dk>
Subject: kernel panic in cfi
Date: Tue, 20 Sep 2005 23:02:05 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <20050920210204.8AE6537646C@rocket.glaze.se>
Return-Path: <jan.pedersen@glaze.dk>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20050920210205.z4IhJU97spFOOQ_irsFcWL0Kg-Pagj2ErpFWbPXtlRc@z>

For any of you who are using flash with the cfi driver, this may be of your
interrest:

When using the cfi (common flash interface) driver, every word written to
the flash chips is followed by a operation complete poll. This poll is
intended to have a timeout of 1 ms. However this timeout is calculated by
HZ/1000, which happends to be 0 because HZ < 1000. The result of this is
that there will be just one poll for operation complete. If this single poll
fails, the kernel panics. I have not had the time to investigate this panic
further. Instead, I have made a workaround that increases this timeout to HZ
(1 second). 1 second is far more than needed, but is preferred over a panic.

The patch is available at http://www.jp-embedded.com.
