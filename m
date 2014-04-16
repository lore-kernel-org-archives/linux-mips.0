Received: from mailapp01.imgtec.com ([195.89.28.114]:33976 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6837072AbaDPNAcpMqYT (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 16 Apr 2014 15:00:32 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 705337C8158BD
        for <linux-mips@linux-mips.org>; Wed, 16 Apr 2014 14:00:23 +0100 (IST)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 20/39] MIPS: inst.h: define microMIPS wait op
Date: Wed, 16 Apr 2014 13:53:11 +0100
Message-ID: <1397652810-4336-21-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1397652810-4336-1-git-send-email-paul.burton@imgtec.com>
References: <1397652810-4336-1-git-send-email-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20140416125311.zckeCCTJNFcT_fZyEtOWmUp6E9GDi6RypMxiOrSdBEc@z>

The opcode for the wait instruction within POOL32AXf was missing. This
patch adds it for use by a subsequent patch.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/include/uapi/asm/inst.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/include/uapi/asm/inst.h b/arch/mips/include/uapi/asm/inst.h
index 89e9155..e6e7fe3 100644
--- a/arch/mips/include/uapi/asm/inst.h
+++ b/arch/mips/include/uapi/asm/inst.h
@@ -305,6 +305,7 @@ enum mm_32axf_minor_op {
 	mm_jalrshb_op = 0x17c,
 	mm_sync_op = 0x1ad,
 	mm_syscall_op = 0x22d,
+	mm_wait_op = 0x24d,
 	mm_eret_op = 0x3cd,
 };
 
-- 
1.8.5.3
