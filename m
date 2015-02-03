Received: from mailapp01.imgtec.com ([195.59.15.196]:61969 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27014448AbbBCNiMvm56H (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 3 Feb 2015 14:38:12 +0100
From: Daniel Sanders <daniel.sanders@imgtec.com>
Subject: [PATCH 5/5] MIPS: LLVMLinux: Silence unicode warnings when preprocessing assembly.
Date: Tue, 3 Feb 2015 13:37:19 +0000
Message-ID: <1422970639-7922-6-git-send-email-daniel.sanders@imgtec.com>
In-Reply-To: <1422970639-7922-1-git-send-email-daniel.sanders@imgtec.com>
References: <1422970639-7922-1-git-send-email-daniel.sanders@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Daniel.Sanders@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Cc: Toma Tabacu <toma.tabacu@imgtec.com>, Daniel Sanders <daniel.sanders@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>, Paul Bolle <pebolle@tiscali.nl>, "Steven J. Hill" <Steven.Hill@imgtec.com>, Manuel Lauss <manuel.lauss@gmail.com>, Jim Quinlan <jim2101024@gmail.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20150203133719.FIciLaEUzveNvbroeziq9ieKFLkPUzs4ZvDIL3hZ6Jk@z>

From: Toma Tabacu <toma.tabacu@imgtec.com>

Differentiate the 'u' GAS .macro argument from the '\u' C preprocessor unicode
escape sequence by renaming it to '_u'.

When the 'u' argument is evaluated, we end up writing '\u', which causes
clang to emit -Wunicode warnings.

This silences a couple of -Wunicode warnings reported by clang.
The changed code can be preprocessed without warnings by both gcc and clang.

Signed-off-by: Toma Tabacu <toma.tabacu@imgtec.com>
Signed-off-by: Daniel Sanders <daniel.sanders@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>
Cc: Paul Bolle <pebolle@tiscali.nl>
Cc: "Steven J. Hill" <Steven.Hill@imgtec.com>
Cc: Manuel Lauss <manuel.lauss@gmail.com>
Cc: Jim Quinlan <jim2101024@gmail.com>
Cc: linux-mips@linux-mips.org
Cc: linux-kernel@vger.kernel.org
---
 arch/mips/include/asm/asmmacro.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/asmmacro.h b/arch/mips/include/asm/asmmacro.h
index 6caf876..c657932 100644
--- a/arch/mips/include/asm/asmmacro.h
+++ b/arch/mips/include/asm/asmmacro.h
@@ -200,12 +200,12 @@
 	.word	0x41600021 | (\reg << 16)
 	.endm
 
-	.macro	MFTR	rt=0, rd=0, u=0, sel=0
-	 .word	0x41000000 | (\rt << 16) | (\rd << 11) | (\u << 5) | (\sel)
+	.macro	MFTR	rt=0, rd=0, _u=0, sel=0
+	 .word	0x41000000 | (\rt << 16) | (\rd << 11) | (\_u << 5) | (\sel)
 	.endm
 
-	.macro	MTTR	rt=0, rd=0, u=0, sel=0
-	 .word	0x41800000 | (\rt << 16) | (\rd << 11) | (\u << 5) | (\sel)
+	.macro	MTTR	rt=0, rd=0, _u=0, sel=0
+	 .word	0x41800000 | (\rt << 16) | (\rd << 11) | (\_u << 5) | (\sel)
 	.endm
 
 #ifdef TOOLCHAIN_SUPPORTS_MSA
-- 
2.1.4
