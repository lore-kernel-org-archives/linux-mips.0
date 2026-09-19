Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08878353A77;
	Sat, 19 Sep 2026 15:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789830889; cv=none; b=cbBuR+Wplk5NvAzR7OO6LFHMxfdqMRK3RfuAz+G5GWXZ9cG2Bqy/Nvt2S5P9Nl7MTZlMQhVD08dRNwQHYYd/c36g+b5pj3rvDzcgK9UQK29k2cXctw/6HUkeLzRcBSQ1cUcePk5oEHqKbmgHBi9JP4b9SMRX/Cstr03DuzH8AVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789830889; c=relaxed/simple;
	bh=/xYwmBmYy+TIyqkLTDJ9nKmjECXb1uBZ3Vi9xbQ8e8k=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cxTRekPNvXn8SR9a8dTkUYC9YLn485Msj5vq8e4Vu8VQ2WeVvL6ia1TsKhfjwDndphXz7U7eSPjc8n8lfz7Mx4r/EonHkAC7EgCINktDc2Ktf1JFNmd4kERICeaen3tHDoJ58yG2MxUpyooPF+3CSHKUAICIGCBbgfhHj+oCyOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 009DC92009D; Sat, 19 Sep 2026 17:14:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id EF05892009C;
	Sat, 19 Sep 2026 16:14:46 +0100 (BST)
Date: Sat, 19 Sep 2026 16:14:46 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: WangYuli <wangyuli@aosc.io>, Chen Linxuan <chenlinxuan@uniontech.com>, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/7] MIPS: Eliminate redundant KBUILD_SYM32 check
In-Reply-To: <alpine.DEB.2.21.2609191504030.27665@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2609191555522.27665@angie.orcam.me.uk>
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

Given that KBUILD_SYM32=y is a prerequisite for this statement to be 
executed, it's logically redundant to verify KBUILD_SYM32 is y again.

Signed-off-by: WangYuli <wangyuli@uniontech.com>
Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
Changes from v2 (2/6),
<https://lore.kernel.org/r/5D20D311FB1FCDF1+20250422102253.137944-2-wangyuli@uniontech.com/>:

- Fix the style with the commit heading.
---
 arch/mips/Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

linux-wangyuli-mips-dec-kbuild-sym32-y.diff
Index: linux-macro/arch/mips/Makefile
===================================================================
--- linux-macro.orig/arch/mips/Makefile
+++ linux-macro/arch/mips/Makefile
@@ -299,7 +299,7 @@ ifdef need-compiler
     endif
 
     ifeq ($(KBUILD_SYM32), y)
-      cflags-$(KBUILD_SYM32) += -msym32 -DKBUILD_64BIT_SYM32
+      cflags-y += -msym32 -DKBUILD_64BIT_SYM32
     else
       ifeq ($(CONFIG_CPU_DADDI_WORKAROUNDS), y)
         $(error CONFIG_CPU_DADDI_WORKAROUNDS unsupported without -msym32)
