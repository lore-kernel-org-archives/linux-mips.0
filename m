Received: from mailapp01.imgtec.com ([195.59.15.196]:31976 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010926AbbANQhhZ7Wt7 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 14 Jan 2015 17:37:37 +0100
From: James Cowgill <James.Cowgill@imgtec.com>
Subject: [PATCH] MIPS: ELF: fix loading o32 binaries on 64-bit kernels
Date: Wed, 14 Jan 2015 16:37:14 +0000
Message-ID: <1421253434-49869-1-git-send-email-James.Cowgill@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Cowgill@imgtec.com>
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
Cc: James Cowgill <James.Cowgill@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20150114163714.hMnpRhvZtoH1da2U8EXP-Dq0jTI_K7-18RTv-ka2_Gg@z>

Commit 90cee759f08a ("MIPS: ELF: Set FP mode according to .MIPS.abiflags")
introduced checking of the .MIPS.abiflags ELF section but did so through
the native sized "elfhdr" and "elf_phdr" structures regardless whether the
ELF was actually 32-bit or 64-bit. This produces wrong results when trying
to use a 64-bit kernel to load o32 ELF files.

Change the uses of the generic elf structures to their 32-bit versions.
Since the code bails out on any 64-bit cases, this is OK until they are
implemented.

Fixes: 90cee759f08a ("MIPS: ELF: Set FP mode according to .MIPS.abiflags")
Signed-off-by: James Cowgill <James.Cowgill@imgtec.com>
Cc: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
---
 arch/mips/kernel/elf.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/mips/kernel/elf.c b/arch/mips/kernel/elf.c
index c92b15d..a5b5b56 100644
--- a/arch/mips/kernel/elf.c
+++ b/arch/mips/kernel/elf.c
@@ -19,8 +19,8 @@ enum {
 int arch_elf_pt_proc(void *_ehdr, void *_phdr, struct file *elf,
 		     bool is_interp, struct arch_elf_state *state)
 {
-	struct elfhdr *ehdr = _ehdr;
-	struct elf_phdr *phdr = _phdr;
+	struct elf32_hdr *ehdr = _ehdr;
+	struct elf32_phdr *phdr = _phdr;
 	struct mips_elf_abiflags_v0 abiflags;
 	int ret;
 
@@ -48,7 +48,7 @@ int arch_elf_pt_proc(void *_ehdr, void *_phdr, struct file *elf,
 	return 0;
 }
 
-static inline unsigned get_fp_abi(struct elfhdr *ehdr, int in_abi)
+static inline unsigned get_fp_abi(struct elf32_hdr *ehdr, int in_abi)
 {
 	/* If the ABI requirement is provided, simply return that */
 	if (in_abi != -1)
@@ -65,7 +65,7 @@ static inline unsigned get_fp_abi(struct elfhdr *ehdr, int in_abi)
 int arch_check_elf(void *_ehdr, bool has_interpreter,
 		   struct arch_elf_state *state)
 {
-	struct elfhdr *ehdr = _ehdr;
+	struct elf32_hdr *ehdr = _ehdr;
 	unsigned fp_abi, interp_fp_abi, abi0, abi1;
 
 	/* Ignore non-O32 binaries */
-- 
2.1.4
