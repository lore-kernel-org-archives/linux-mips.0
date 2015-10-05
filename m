Received: from mailapp01.imgtec.com ([195.59.15.196]:28729 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009473AbbJEJw6UkFB5 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 5 Oct 2015 11:52:58 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 0A2C6E893338D
        for <linux-mips@linux-mips.org>; Mon,  5 Oct 2015 10:52:51 +0100 (IST)
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [RFC PATCH 3/7] MIPS: Reserve space for relocation table
Date: Mon, 5 Oct 2015 10:52:27 +0100
Message-ID: <1444038751-25105-4-git-send-email-matt.redfearn@imgtec.com>
In-Reply-To: <1444038751-25105-1-git-send-email-matt.redfearn@imgtec.com>
References: <1444038751-25105-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@imgtec.com>
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
Cc: Matt Redfearn <matt.redfearn@imgtec.com>
Message-ID: <20151005095227.PKn9-PJmP5olvlHD6Fm5vp2nzlhO2B-Vt70ereeAZ_o@z>

When CONFIG_RELOCATABLE is enabled, reserve space in the
memory map for the relocation table to appear
once it is appended by the relocation tool.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
---
 arch/mips/kernel/vmlinux.lds.S | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.S
index 07d32a4aea60..a17551260f88 100644
--- a/arch/mips/kernel/vmlinux.lds.S
+++ b/arch/mips/kernel/vmlinux.lds.S
@@ -128,6 +128,15 @@ SECTIONS
 #ifdef CONFIG_SMP
 	PERCPU_SECTION(1 << CONFIG_MIPS_L1_CACHE_SHIFT)
 #endif
+
+#ifdef CONFIG_RELOCATABLE
+	. = ALIGN(4);
+	_relocation_start = .;
+	/* Space for relocation table */
+	. += 0x100000;
+	_relocation_end = .;
+#endif
+
 #ifdef CONFIG_MIPS_RAW_APPENDED_DTB
 	__appended_dtb = .;
 	/* leave space for appended DTB */
-- 
2.1.4
