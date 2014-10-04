Received: from mailapp01.imgtec.com ([195.59.15.196]:54223 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009702AbaJDDRsu1O4Z (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 4 Oct 2014 05:17:48 +0200
Subject: [PATCH 3/3] MIPS: set stack/data protection as non-executable
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Date: Fri, 3 Oct 2014 20:17:39 -0700
Message-ID: <20141004031739.28569.12863.stgit@linux-yegoshin>
In-Reply-To: <20141004030438.28569.85536.stgit@linux-yegoshin>
References: <20141004030438.28569.85536.stgit@linux-yegoshin>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-Path: <Leonid.Yegoshin@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, Zubair.Kakakhel@imgtec.com, david.daney@cavium.com, peterz@infradead.org, paul.gortmaker@windriver.com, davidlohr@hp.com, macro@linux-mips.org, chenhc@lemote.com, zajec5@gmail.com, james.hogan@imgtec.com, keescook@chromium.org, alex@alex-smith.me.uk, tglx@linutronix.de, blogic@openwrt.org, jchandra@broadcom.com, paul.burton@imgtec.com, qais.yousef@imgtec.com, linux-kernel@vger.kernel.org, ralf@linux-mips.org, markos.chandras@imgtec.com, manuel.lauss@gmail.com, akpm@linux-foundation.org, lars.persson@axis.com
Message-ID: <20141004031739.c9OYuPiiab_m8auEPi5iWH1zVlvdV-KTArLeBTNw7HU@z>

This is a last step of 3 patches which shift FPU emulation out of
stack into protected area. So, it disables a default executable stack.

Additionally, it sets a default data area non-executable protection.

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
---
 arch/mips/include/asm/page.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/mips/include/asm/page.h b/arch/mips/include/asm/page.h
index 3be8180..d49ba81 100644
--- a/arch/mips/include/asm/page.h
+++ b/arch/mips/include/asm/page.h
@@ -230,7 +230,7 @@ extern int __virt_addr_valid(const volatile void *kaddr);
 #define virt_addr_valid(kaddr)						\
 	__virt_addr_valid((const volatile void *) (kaddr))
 
-#define VM_DATA_DEFAULT_FLAGS	(VM_READ | VM_WRITE | VM_EXEC | \
+#define VM_DATA_DEFAULT_FLAGS	(VM_READ | VM_WRITE | \
 				 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
 
 #define UNCAC_ADDR(addr)	((addr) - PAGE_OFFSET + UNCAC_BASE)
