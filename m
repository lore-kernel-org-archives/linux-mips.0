Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:59178 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993227AbeFPA41IZRhb (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 16 Jun 2018 02:56:27 +0200
From: Paul Burton <paul.burton@mips.com>
Subject: [PATCH 3/3] Revert "powerpc: fix build failure by disabling attribute-alias warning in pci_32"
Date: Fri, 15 Jun 2018 17:53:22 -0700
Message-ID: <20180616005323.7938-4-paul.burton@mips.com>
In-Reply-To: <20180616005323.7938-1-paul.burton@mips.com>
References: <20180616005323.7938-1-paul.burton@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-kbuild@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-mips@linux-mips.org, Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@kernel.org>, Matthew Wilcox <matthew@wil.cx>, Thomas Gleixner <tglx@linutronix.de>, Douglas Anderson <dianders@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Matthias Kaehlcke <mka@chromium.org>, He Zhe <zhe.he@windriver.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michal Marek <michal.lkml@markovi.net>, Khem Raj <raj.khem@gmail.com>, Christophe Leroy <christophe.leroy@c-s.fr>, Al Viro <viro@zeniv.linux.org.uk>, Stafford Horne <shorne@gmail.com>, Gideon Israel Dsouza <gidisrael@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Kees Cook <keescook@chromium.org>, Michael Ellerman <mpe@ellerman.id.au>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, Paul Burton <paul.burton@mips.com>
Message-ID: <20180616005322.QY0Bl3mIQjoazPkRjiH-pi2TQGrZulDMRByEbD8xer0@z>

With SYSCALL_DEFINEx() disabling -Wattribute-alias generically, there's
no need to duplicate that for PowerPC's pciconfig_iobase syscall.

This reverts commit 415520373975 ("powerpc: fix build failure by
disabling attribute-alias warning in pci_32").

Signed-off-by: Paul Burton <paul.burton@mips.com>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthew Wilcox <matthew@wil.cx>
Cc: Matthias Kaehlcke <mka@chromium.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Gideon Israel Dsouza <gidisrael@gmail.com>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Stafford Horne <shorne@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: He Zhe <zhe.he@windriver.com>
Cc: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mips@linux-mips.org
Cc: linuxppc-dev@lists.ozlabs.org

---

 arch/powerpc/kernel/pci_32.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/powerpc/kernel/pci_32.c b/arch/powerpc/kernel/pci_32.c
index 4f861055a852..d63b488d34d7 100644
--- a/arch/powerpc/kernel/pci_32.c
+++ b/arch/powerpc/kernel/pci_32.c
@@ -285,9 +285,6 @@ pci_bus_to_hose(int bus)
  * Note that the returned IO or memory base is a physical address
  */
 
-#pragma GCC diagnostic push
-#pragma GCC diagnostic ignored "-Wpragmas"
-#pragma GCC diagnostic ignored "-Wattribute-alias"
 SYSCALL_DEFINE3(pciconfig_iobase, long, which,
 		unsigned long, bus, unsigned long, devfn)
 {
@@ -313,4 +310,3 @@ SYSCALL_DEFINE3(pciconfig_iobase, long, which,
 
 	return result;
 }
-#pragma GCC diagnostic pop
-- 
2.17.1
