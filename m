Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E083C353A77;
	Sat, 19 Sep 2026 15:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789830863; cv=none; b=WaOOviWlpGm7o7WsnDkDShSnqzcCRl1bZq9J/uLSLSpPAZCYRAohdjF9AnaGycccFYfWWM5QGfB0evVCEJIgmzDOtnV+pzQ3CMM/rZNNQTK21RLC7vcGmjIi5gWJaWZ+lYAyv5Jc2PAsQpORn8KzpQlb011pKIXks0UgnjWL4jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789830863; c=relaxed/simple;
	bh=iHXRVYn3jX2WXb6sDeUZ8NPWVaWCnhzxBSkCc9ow9fo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cL2NamHyAyffslaPkcYtjtPWD+3YDB6mZTigOVdlIK/XPK+a5PIbY4NFKJZevHwwdXiUs1flOshWMrGZvoZj+USO3rOrl4zQ/l9mcNw2aTkCf8FWTjp3Ha2kn5OkJLy+KBzMfrnSVLy951aG3GssJYsnHkFcTcORulfVbqwjmpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 7EB6792009C; Sat, 19 Sep 2026 17:14:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 793B692009B;
	Sat, 19 Sep 2026 16:14:20 +0100 (BST)
Date: Sat, 19 Sep 2026 16:14:20 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: WangYuli <wangyuli@aosc.io>, Chen Linxuan <chenlinxuan@uniontech.com>, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/7] MIPS: dec: Add missing <linux/interrupt.h> inclusion
 to reset.h
In-Reply-To: <alpine.DEB.2.21.2609191504030.27665@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2609191536110.27665@angie.orcam.me.uk>
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

Pull the header directly that is required for `irqreturn_t' type.

Fixes: 0eb77376912e ("MIPS: DEC: Fix prototypes for halt/reset handlers")
Signed-off-by: WangYuli <wangyuli@uniontech.com>
Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
Changes from v2 (3/6), 
<https://lore.kernel.org/r/3AD7E5DDE3F05C6D+20250422102253.137944-3-wangyuli@uniontech.com/>:

- Split off the part still required.
---
 arch/mips/include/asm/dec/reset.h |    1 +
 1 file changed, 1 insertion(+)

linux-wangyuli-mips-dec-reset-interrupt.diff
Index: linux-macro/arch/mips/include/asm/dec/reset.h
===================================================================
--- linux-macro.orig/arch/mips/include/asm/dec/reset.h
+++ linux-macro/arch/mips/include/asm/dec/reset.h
@@ -10,6 +10,7 @@
 #define __ASM_DEC_RESET_H
 
 #include <linux/compiler_attributes.h>
+#include <linux/interrupt.h>
 
 void __noreturn dec_machine_restart(char *command);
 void __noreturn dec_machine_halt(void);
