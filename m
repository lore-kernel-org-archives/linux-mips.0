Received: from mailapp01.imgtec.com ([195.89.28.115]:33389 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6869196AbaB1UAvSpex1 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 28 Feb 2014 21:00:51 +0100
From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Subject: [PATCH 2/3] MIPS: APRP: Unregister rtlx interrupt hook at module exit
Date: Fri, 28 Feb 2014 10:23:02 -0800
Message-ID: <1393611783-7037-3-git-send-email-dengcheng.zhu@imgtec.com>
In-Reply-To: <1393611783-7037-1-git-send-email-dengcheng.zhu@imgtec.com>
References: <1393611783-7037-1-git-send-email-dengcheng.zhu@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <DengCheng.Zhu@imgtec.com>
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
Cc: john@phrozen.org, ralf@linux-mips.org, Steven.Hill@imgtec.com, Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Message-ID: <20140228182302.2iSNoQlJ8lPTRCgeHimP-vOFyRqS3ippzaZS5Km5m7E@z>

From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>

If the aprp_hook is not assigned back to NULL, it will still be called
after module exits. This is not wanted.

Reviewed-by: Steven J. Hill <Steven.Hill@imgtec.com>
Signed-off-by: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
---
 arch/mips/kernel/rtlx-cmp.c | 3 +++
 arch/mips/kernel/rtlx-mt.c  | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/mips/kernel/rtlx-cmp.c b/arch/mips/kernel/rtlx-cmp.c
index 56dc696..758fb3c 100644
--- a/arch/mips/kernel/rtlx-cmp.c
+++ b/arch/mips/kernel/rtlx-cmp.c
@@ -112,5 +112,8 @@ void __exit rtlx_module_exit(void)
 
 	for (i = 0; i < RTLX_CHANNELS; i++)
 		device_destroy(mt_class, MKDEV(major, i));
+
 	unregister_chrdev(major, RTLX_MODULE_NAME);
+
+	aprp_hook = NULL;
 }
diff --git a/arch/mips/kernel/rtlx-mt.c b/arch/mips/kernel/rtlx-mt.c
index 91d61ba..9c1aca0 100644
--- a/arch/mips/kernel/rtlx-mt.c
+++ b/arch/mips/kernel/rtlx-mt.c
@@ -144,5 +144,8 @@ void __exit rtlx_module_exit(void)
 
 	for (i = 0; i < RTLX_CHANNELS; i++)
 		device_destroy(mt_class, MKDEV(major, i));
+
 	unregister_chrdev(major, RTLX_MODULE_NAME);
+
+	aprp_hook = NULL;
 }
-- 
1.8.5.3
