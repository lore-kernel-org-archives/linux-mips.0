Received: from mailapp01.imgtec.com ([195.59.15.196]:38467 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008439AbaIILxLxqSzT (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 9 Sep 2014 13:53:11 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH linux-next] MIPS: ioctls: Add missing TIOC{S,G}RS485 definitions
Date: Tue, 9 Sep 2014 12:52:55 +0100
Message-ID: <1410263575-26720-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Markos.Chandras@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Cc: Markos Chandras <markos.chandras@imgtec.com>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Message-ID: <20140909115255.nmYZCFxToB1nL8YgIEQCbTnfEFwmNkvFcNdbE1f7lWg@z>

Commit e676253b19b2d269cccf67fdb1592120a0cd0676
(serial/8250: Add support for RS485 IOCTLs) added cases for the
TIOC{S,G}RS485 commands but this broke the build for MIPS:

drivers/tty/serial/8250/8250_core.c: In function 'serial8250_ioctl':
drivers/tty/serial/8250/8250_core.c:2874:7: error: 'TIOCSRS485' undeclared
(first use in this function)
drivers/tty/serial/8250/8250_core.c:2886:7: error: 'TIOCGRS485' undeclared
(first use in this function)

This patch adds these missing definitions

Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: <linux-next@vger.kernel.org>
Cc: <linux-kernel@vger.kernel.org>
Cc: <linux-serial@vger.kernel.org>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/uapi/asm/ioctls.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/include/uapi/asm/ioctls.h b/arch/mips/include/uapi/asm/ioctls.h
index b1e637757fe3..34050cb6b631 100644
--- a/arch/mips/include/uapi/asm/ioctls.h
+++ b/arch/mips/include/uapi/asm/ioctls.h
@@ -76,6 +76,8 @@
 
 #define TIOCSBRK	0x5427	/* BSD compatibility */
 #define TIOCCBRK	0x5428	/* BSD compatibility */
+#define TIOCGRS485	0x542E
+#define TIOCSRS485	0x542F
 #define TIOCGSID	0x7416	/* Return the session ID of FD */
 #define TCGETS2		_IOR('T', 0x2A, struct termios2)
 #define TCSETS2		_IOW('T', 0x2B, struct termios2)
-- 
2.1.0
