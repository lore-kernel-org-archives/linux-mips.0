Received: from ozlabs.org ([IPv6:2401:3900:2:1::2]:49889 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23990393AbeFSNBhDcTRG (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 19 Jun 2018 15:01:37 +0200
From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 3/3] Revert "powerpc: fix build failure by disabling attribute-alias warning in pci_32"
In-Reply-To: <20180616005323.7938-4-paul.burton@mips.com>
References: <20180616005323.7938-1-paul.burton@mips.com> <20180616005323.7938-4-paul.burton@mips.com>
Date: Tue, 19 Jun 2018 23:01:27 +1000
Message-ID: <87tvpzvsk8.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <mpe@ellerman.id.au>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Burton <paul.burton@mips.com>, linux-kbuild@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-mips@linux-mips.org, Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@kernel.org>, Matthew Wilcox <matthew@wil.cx>, Thomas Gleixner <tglx@linutronix.de>, Douglas Anderson <dianders@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Matthias Kaehlcke <mka@chromium.org>, He Zhe <zhe.he@windriver.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michal Marek <michal.lkml@markovi.net>, Khem Raj <raj.khem@gmail.com>, Christophe Leroy <christophe.leroy@c-s.fr>, Al Viro <viro@zeniv.linux.org.uk>, Stafford Horne <shorne@gmail.com>, Gideon Israel Dsouza <gidisrael@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Kees Cook <keescook@chromium.org>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Message-ID: <20180619130127.bsT_FKr1ODJi_OPzgnZT3Wxq4KtcGwCmFEh3bB65wgU@z>

Paul Burton <paul.burton@mips.com> writes:
> With SYSCALL_DEFINEx() disabling -Wattribute-alias generically, there's
> no need to duplicate that for PowerPC's pciconfig_iobase syscall.
>
> This reverts commit 415520373975 ("powerpc: fix build failure by
> disabling attribute-alias warning in pci_32").
>
> Signed-off-by: Paul Burton <paul.burton@mips.com>

> ---
>
>  arch/powerpc/kernel/pci_32.c | 4 ----
>  1 file changed, 4 deletions(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers
