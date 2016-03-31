Received: from mailapp01.imgtec.com ([195.59.15.196]:27819 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27025621AbcCaJGVkoIAq (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 31 Mar 2016 11:06:21 +0200
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH v2 07/11] MIPS: bootmem: When relocatable, free memory below kernel
Date: Thu, 31 Mar 2016 10:05:38 +0100
Message-ID: <1459415142-3412-8-git-send-email-matt.redfearn@imgtec.com>
In-Reply-To: <1459415142-3412-1-git-send-email-matt.redfearn@imgtec.com>
References: <1459415142-3412-1-git-send-email-matt.redfearn@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, kernel-hardening@lists.openwall.com, Matt Redfearn <matt.redfearn@imgtec.com>, Aaro Koskinen <aaro.koskinen@nokia.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, linux-kernel@vger.kernel.org, Jaedon Shin <jaedon.shin@gmail.com>, James Hogan <james.hogan@imgtec.com>, Jonas Gorski <jogo@openwrt.org>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20160331090538.Ehr_Etd6LKmEptZycOe8eIfN9rdDmFnjaijmx6TbOKM@z>

The kernel reserves all memory before the _end symbol as bootmem,
however, once the kernel can be relocated elsewhere in memory this may
result in a large amount of wasted memory. The assumption is that the
memory between the link and relocated address of the kernel may be
released back to the available memory pool.

Memory statistics for a Malta with the kernel relocating by
16Mb, without the patch:
Memory: 105952K/131072K available (4604K kernel code, 242K rwdata,
892K rodata, 1280K init, 183K bss, 25120K reserved, 0K cma-reserved)
And with the patch:
Memory: 122336K/131072K available (4604K kernel code, 242K rwdata,
892K rodata, 1280K init, 183K bss, 8736K reserved, 0K cma-reserved)

The 16Mb offset is removed from the reserved region and added back to
the available region.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
---

Changes in v2: None

 arch/mips/kernel/setup.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 5fdaf8bdcd2e..d8376d7b3345 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -469,6 +469,20 @@ static void __init bootmem_init(void)
 	 */
 	reserve_bootmem(PFN_PHYS(mapstart), bootmap_size, BOOTMEM_DEFAULT);
 
+#ifdef CONFIG_RELOCATABLE
+	/*
+	 * The kernel reserves all memory below its _end symbol as bootmem,
+	 * but the kernel may now be at a much higher address. The memory
+	 * between the original and new locations may be returned to the system.
+	 */
+	if (__pa_symbol(_text) > __pa_symbol(VMLINUX_LOAD_ADDRESS)) {
+		unsigned long offset;
+
+		offset = __pa_symbol(_text) - __pa_symbol(VMLINUX_LOAD_ADDRESS);
+		free_bootmem(__pa_symbol(VMLINUX_LOAD_ADDRESS), offset);
+	}
+#endif
+
 	/*
 	 * Reserve initrd memory if needed.
 	 */
-- 
2.5.0
