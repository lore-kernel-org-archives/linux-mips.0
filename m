Received: from mailapp01.imgtec.com ([195.59.15.196]:32737 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007993AbaLCB6dH-65d (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 3 Dec 2014 02:58:33 +0100
Subject: [PATCH v3 3/3] MIPS: set stack/data protection as non-executable
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Date: Tue, 2 Dec 2014 17:58:24 -0800
Message-ID: <20141203015824.13886.74616.stgit@linux-yegoshin>
In-Reply-To: <20141203015537.13886.50830.stgit@linux-yegoshin>
References: <20141203015537.13886.50830.stgit@linux-yegoshin>
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
To: linux-mips@linux-mips.org, Zubair.Kakakhel@imgtec.com, geert+renesas@glider.be, david.daney@cavium.com, peterz@infradead.org, paul.gortmaker@windriver.com, davidlohr@hp.com, macro@linux-mips.org, chenhc@lemote.com, cl@linux.com, mingo@kernel.org, richard@nod.at, zajec5@gmail.com, james.hogan@imgtec.com, keescook@chromium.org, tj@kernel.org, alex@alex-smith.me.uk, pbonzini@redhat.com, blogic@openwrt.org, paul.burton@imgtec.com, qais.yousef@imgtec.com, linux-kernel@vger.kernel.org, ralf@linux-mips.org, markos.chandras@imgtec.com, dengcheng.zhu@imgtec.com, manuel.lauss@gmail.com, lars.persson@axis.com
Message-ID: <20141203015824.Zb9Q7klkk5GPjTPExks5mesZz_F4aqNHRy_dtY5aVEA@z>

This is a last step of 3 patches which shift FPU emulation out of
stack into protected area. So, it disables a default executable stack.

Additionally, it sets a default data area non-executable protection.

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
---
 arch/mips/include/asm/page.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/page.h b/arch/mips/include/asm/page.h
index 3be81803595d..d49ba81cb4ed 100644
--- a/arch/mips/include/asm/page.h
+++ b/arch/mips/include/asm/page.h
@@ -230,7 +230,7 @@ extern int __virt_addr_valid(const volatile void *kaddr);
 #define virt_addr_valid(kaddr)						\
 	__virt_addr_valid((const volatile void *) (kaddr))
 
-#define VM_DATA_DEFAULT_FLAGS	(VM_READ | VM_WRITE | VM_EXEC | \
+#define VM_DATA_DEFAULT_FLAGS	(VM_READ | VM_WRITE | \
 				 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
 
 #define UNCAC_ADDR(addr)	((addr) - PAGE_OFFSET + UNCAC_BASE)
