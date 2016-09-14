Received: from mailapp01.imgtec.com ([195.59.15.196]:13507 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992236AbcINKBPAIs2d (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 14 Sep 2016 12:01:15 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 1/2] cpu/hotplug: Include linux/types.h in linux/cpuhotplug.h
Date: Wed, 14 Sep 2016 11:00:26 +0100
Message-ID: <20160914100027.20945-1-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Anna-Maria Gleixner <anna-maria@linutronix.de>, Richard Cochran <rcochran@linutronix.de>
Message-ID: <20160914100026.nf-ZBsYA8oC7VBwYhCvQ3uN59jyn_7V3PDc05tpmYDQ@z>

The linux/cpuhotplug.h header makes use of the bool type, but wasn't
including linux/types.h to ensure that type has been defined. Fix this
by including linux/types.h in preparation for including
linux/cpuhotplug.h in a file that doesn't do so already.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 include/linux/cpuhotplug.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index 242bf53..34bd805 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -1,6 +1,8 @@
 #ifndef __CPUHOTPLUG_H
 #define __CPUHOTPLUG_H
 
+#include <linux/types.h>
+
 enum cpuhp_state {
 	CPUHP_OFFLINE,
 	CPUHP_CREATE_THREADS,
-- 
2.9.3
