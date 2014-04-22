Received: from mailapp01.imgtec.com ([195.89.28.114]:50839 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6817074AbaDVOmHhfZ5o (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 22 Apr 2014 16:42:07 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 3.15] MIPS: Add new AUDIT_ARCH token for the N32 ABI on MIPS64
Date: Tue, 22 Apr 2014 15:40:36 +0100
Message-ID: <1398177636-10442-1-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1397550996-14805-1-git-send-email-markos.chandras@imgtec.com>
References: <1397550996-14805-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, Andy Lutomirski <luto@amacapital.net>, Eric Paris <eparis@redhat.com>, Paul Moore <pmoore@redhat.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20140422144036.A4rT002z3d3wkE2kyVhogGfXsxTGytZGG6omVHAvz0o@z>

A MIPS64 kernel may support ELF files for all 3 MIPS ABIs
(O32, N32, N64). Furthermore, the AUDIT_ARCH_MIPS{,EL}64 token
does not provide enough information about the ABI for the 64-bit
process. As a result of which, userland needs to use complex
seccomp filters to decide whether a syscall belongs to the o32 or n32
or n64 ABI. Therefore, a new arch token for MIPS64/n32 is added so it
can be used by seccomp to explicitely set syscall filters for this ABI.

Link: http://sourceforge.net/p/libseccomp/mailman/message/32239040/
Cc: Andy Lutomirski <luto@amacapital.net>
Cc: Eric Paris <eparis@redhat.com>
Cc: Paul Moore <pmoore@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
Ralf, can we please have this in 3.15 (Assuming it's ACK'd)?

Thanks a lot!
---
 arch/mips/include/asm/syscall.h |  2 ++
 include/uapi/linux/audit.h      | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/mips/include/asm/syscall.h b/arch/mips/include/asm/syscall.h
index c6e9cd2..17960fe 100644
--- a/arch/mips/include/asm/syscall.h
+++ b/arch/mips/include/asm/syscall.h
@@ -133,6 +133,8 @@ static inline int syscall_get_arch(void)
 #ifdef CONFIG_64BIT
 	if (!test_thread_flag(TIF_32BIT_REGS))
 		arch |= __AUDIT_ARCH_64BIT;
+	if (test_thread_flag(TIF_32BIT_ADDR))
+		arch |= __AUDIT_ARCH_CONVENTION_MIPS64_N32;
 #endif
 #if defined(__LITTLE_ENDIAN)
 	arch |=  __AUDIT_ARCH_LE;
diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
index 11917f7..1b1efdd 100644
--- a/include/uapi/linux/audit.h
+++ b/include/uapi/linux/audit.h
@@ -331,9 +331,17 @@ enum {
 #define AUDIT_FAIL_PRINTK	1
 #define AUDIT_FAIL_PANIC	2
 
+/*
+ * These bits disambiguate different calling conventions that share an
+ * ELF machine type, bitness, and endianness
+ */
+#define __AUDIT_ARCH_CONVENTION_MASK 0x30000000
+#define __AUDIT_ARCH_CONVENTION_MIPS64_N32 0x20000000
+
 /* distinguish syscall tables */
 #define __AUDIT_ARCH_64BIT 0x80000000
 #define __AUDIT_ARCH_LE	   0x40000000
+
 #define AUDIT_ARCH_ALPHA	(EM_ALPHA|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
 #define AUDIT_ARCH_ARM		(EM_ARM|__AUDIT_ARCH_LE)
 #define AUDIT_ARCH_ARMEB	(EM_ARM)
@@ -346,7 +354,11 @@ enum {
 #define AUDIT_ARCH_MIPS		(EM_MIPS)
 #define AUDIT_ARCH_MIPSEL	(EM_MIPS|__AUDIT_ARCH_LE)
 #define AUDIT_ARCH_MIPS64	(EM_MIPS|__AUDIT_ARCH_64BIT)
+#define AUDIT_ARCH_MIPS64N32	(EM_MIPS|__AUDIT_ARCH_64BIT|\
+				 __AUDIT_ARCH_CONVENTION_MIPS64_N32)
 #define AUDIT_ARCH_MIPSEL64	(EM_MIPS|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
+#define AUDIT_ARCH_MIPSEL64N32	(EM_MIPS|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE\
+				 __AUDIT_ARCH_CONVENTION_MIPS64_N32)
 #define AUDIT_ARCH_OPENRISC	(EM_OPENRISC)
 #define AUDIT_ARCH_PARISC	(EM_PARISC)
 #define AUDIT_ARCH_PARISC64	(EM_PARISC|__AUDIT_ARCH_64BIT)
-- 
1.9.2
