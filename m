Received: from vps1.tull.net ([66.180.172.116]:44938 "HELO vps1.tull.net")
	by ftp.linux-mips.org with SMTP id S24119813AbYLEAhF (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Fri, 5 Dec 2008 00:37:05 +0000
Date: Fri, 05 Dec 2008 11:36:54 +1100
From: Nick Andrew <nick@nick-andrew.net>
Subject: Fix incorrect use of loose in vpe.c
Message-ID: <S24119813AbYLEAhF/20081205003705Z+68377@ftp.linux-mips.org>
Return-Path: <nick@nick-andrew.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Jonathan Corbet <corbet@lwn.net>, "Kevin D. Kissell" <kevink@mips.com>, Lucas Woods <woodzy@gmail.com>, Nick Andrew <nick@nick-andrew.net>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Message-ID: <20081205003654.tPO4H6N_SuwVJ2P1vjN89ang1CSzgfo6gF2ARr4E8Wg@z>

Fix incorrect use of loose in vpe.c

From: Nick Andrew <nick@nick-andrew.net>

It should be 'lose', not 'loose'.

Signed-off-by: Nick Andrew <nick@nick-andrew.net>
---

 arch/mips/kernel/vpe.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)


diff --git a/arch/mips/kernel/vpe.c b/arch/mips/kernel/vpe.c
index 972b2d2..a1b3da6 100644
--- a/arch/mips/kernel/vpe.c
+++ b/arch/mips/kernel/vpe.c
@@ -1134,7 +1134,7 @@ static int vpe_release(struct inode *inode, struct file *filp)
 
 	/* It's good to be able to run the SP and if it chokes have a look at
 	   the /dev/rt?. But if we reset the pointer to the shared struct we
-	   loose what has happened. So perhaps if garbage is sent to the vpe
+	   lose what has happened. So perhaps if garbage is sent to the vpe
 	   device, use it as a trigger for the reset. Hopefully a nice
 	   executable will be along shortly. */
 	if (ret < 0)
