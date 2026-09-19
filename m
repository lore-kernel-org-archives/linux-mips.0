Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB6D31717D;
	Sat, 19 Sep 2026 15:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789830905; cv=none; b=cyry2AD+QdDkbb9JPGacgcJzTPzk4Kt9uo3MyVlaZ9oeaT+R4EbAp16XDCZBowGp2WjSCklBG1u9sbUM78UhbNZ+DUjL6IJY2zp5r2xa4RNRdh8o7H5vP88fHwHZqMay5JiOMDnWS427XE0Mn23DqUikEOUNtDn1dXSU0HuV478=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789830905; c=relaxed/simple;
	bh=9Z1uJiJTpjt/RhMxoYKxDkHc5/6Q3elL1OYTFolJp/g=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NaHy5gVZMeEJ2BHcYuEbRFvFeewzIi1fZzjx/e9r5Vo1qhO0UK8jY/DkIgQrkwm2KCj/17sdHn8tqEgbh+gXfS2QF846CflfuLBe+UR6FR8iJFqcQWd5gIuhT4u1hmeo7uazSgfsw3lHFTUjgeriByiGpvwqwN2Ik7QsVdn6UXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 65CEE92009D; Sat, 19 Sep 2026 17:15:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 5F39A92009C;
	Sat, 19 Sep 2026 16:15:02 +0100 (BST)
Date: Sat, 19 Sep 2026 16:15:02 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: WangYuli <wangyuli@aosc.io>, Chen Linxuan <chenlinxuan@uniontech.com>, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/7] MIPS: dec: Reorder header inclusions in setup.c
In-Reply-To: <alpine.DEB.2.21.2609191504030.27665@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2609191606210.27665@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2609191504030.27665@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

From: WangYuli <wangyuli@uniontech.com>

Make the order alphabetic of headers included in setup.c.

Signed-off-by: WangYuli <wangyuli@uniontech.com>
Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
Changes from v2 (3/6),
<https://lore.kernel.org/r/3AD7E5DDE3F05C6D+20250422102253.137944-3-wangyuli@uniontech.com/>:

- Split off the part still required.

- Also fix <asm/*.h> ordering.
---
 arch/mips/dec/setup.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

linux-wangyuli-mips-dec-setup-headers.diff
Index: linux-macro/arch/mips/dec/setup.c
===================================================================
--- linux-macro.orig/arch/mips/dec/setup.c
+++ linux-macro/arch/mips/dec/setup.c
@@ -18,16 +18,16 @@
 #include <linux/memblock.h>
 #include <linux/param.h>
 #include <linux/percpu-defs.h>
+#include <linux/pm.h>
 #include <linux/sched.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
-#include <linux/pm.h>
 
 #include <asm/addrspace.h>
 #include <asm/bootinfo.h>
-#include <asm/cpu.h>
 #include <asm/cpu-features.h>
 #include <asm/cpu-type.h>
+#include <asm/cpu.h>
 #include <asm/irq.h>
 #include <asm/irq_cpu.h>
 #include <asm/mipsregs.h>
