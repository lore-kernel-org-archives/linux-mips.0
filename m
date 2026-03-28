Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E969A387582;
	Sat, 28 Mar 2026 15:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774713004; cv=none; b=PMaPf/eSTz/I/HICN7VvhfN79rm05ORYnpgjiCaKU+DuAdGr5WhMgdm7UdM3g23qWDANZwC/ObjhALBGS40ecirk4FuKC6cd6xX1VlkeArinhymzzO/ZmX56z3SwbbKRwTLQcpfBZokMQwxhqzv6GWC5e97lNUEECqNJ4pvf+m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774713004; c=relaxed/simple;
	bh=z43/IEmW/ES6bq+gVhx4qcIV7gcTgXnq2zS0b43QB/8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=aT+vCTKRptb8fwv5T829X/VDxtX/aBO6BN4jf3y6Sa+0p1jbmD4RbgzRgNF7Cuphw6r0R7YNrmfNu/KtvPbHYBpGru4Gz9a/NK13ixu1o+2/vPkNJgR61LqVJ7LFahGKjN/ODsuNltCIgFICgaI3ttCSFs1lyFxZTHnPLStO5IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 8630C92009D; Sat, 28 Mar 2026 16:50:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 83CD292009B;
	Sat, 28 Mar 2026 15:50:01 +0000 (GMT)
Date: Sat, 28 Mar 2026 15:50:01 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] MIPS: DEC: Rate-limit memory errors for KN01 systems
In-Reply-To: <alpine.DEB.2.21.2603281455390.60268@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2603281514220.60268@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2603281455390.60268@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Similarly to memory errors in ECC systems also rate-limit memory parity 
errors for KN01 DECstation and DECsystem models.  Unlike with ECC these 
events are always fatal and are less likely to cause a message flood, 
but handle them the same way for consistency.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
 arch/mips/dec/kn01-berr.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

linux-mips-dec-berr-ratelimit-kn01.diff
Index: linux-macro/arch/mips/dec/kn01-berr.c
===================================================================
--- linux-macro.orig/arch/mips/dec/kn01-berr.c
+++ linux-macro/arch/mips/dec/kn01-berr.c
@@ -4,7 +4,7 @@
  *	and 2100 (KN01) systems equipped with parity error detection
  *	logic.
  *
- *	Copyright (c) 2005  Maciej W. Rozycki
+ *	Copyright (c) 2005, 2026  Maciej W. Rozycki
  */
 
 #include <linux/init.h>
@@ -134,8 +134,8 @@ static int dec_kn01_be_backend(struct pt
 		action = MIPS_BE_FIXUP;
 
 	if (action != MIPS_BE_FIXUP)
-		printk(KERN_ALERT "Bus error %s: %s %s %s at %#010lx\n",
-			kind, agent, cycle, event, address);
+		pr_alert_ratelimited("Bus error %s: %s %s %s at %#010lx\n",
+				     kind, agent, cycle, event, address);
 
 	return action;
 }
