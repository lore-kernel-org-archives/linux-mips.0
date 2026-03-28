Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED46233DEF7;
	Sat, 28 Mar 2026 15:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774713001; cv=none; b=l71QjHO5nEslsPHuzqTowGC6r2F8iYiL4C9ttBjSesCMqMPzpME+6vzBAjDUMN3JaeruUSVuNjgtNniuuHrr4CEFnHbMga2kEVUWQQPASOyFXfkSghcDyYcE+nQIIBsggC+Doi+hVdJ/Riv4+c8iXHPVAjVjXNAg79y93KUzL+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774713001; c=relaxed/simple;
	bh=WFn5ooLwSf5MqA9ihfEYpV1xJZmOEde7I0+xg7wZrOc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GKN/fL+w0F9JaCBlwNpHROZrATEQjplO1ktm++Emo2qoamYsbrRX9Uv3/suWUZ4T1TpfAiLw6lLfI+e66tNCEIX3SCr+kjCS+zDYNoOuWkvFeNsI5l7/VDWgRULFRYPetfiN5cVcbyXcN59FV2bGw6lwEPE/rbyN8mhsivbIJGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id DE39692009C; Sat, 28 Mar 2026 16:49:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id D819092009B;
	Sat, 28 Mar 2026 15:49:57 +0000 (GMT)
Date: Sat, 28 Mar 2026 15:49:57 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] MIPS: DEC: Rate-limit memory errors for ECC systems
In-Reply-To: <alpine.DEB.2.21.2603281455390.60268@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2603281456240.60268@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2603281455390.60268@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Prevent the system from becoming unusable due to a flood of memory error 
messages with DECstation and DECsystem models using ECC, that is KN02, 
KN03 and KN05 systems.  It seems common for gradual oxidation of memory 
module contacts to cause memory errors to eventually develop and while 
ECC takes care of correcting them and the system affected can continue 
operating normally until the contacts have been cleaned, the unlimited 
messages make the system spend all its time on producing them, therefore 
preventing it from being used.

Rate-limiting removes the load from the system and enables its normal 
operation, e.g.:

Bus error interrupt: CPU memory read ECC error at 0x139cfb04
  ECC syndrome 0x54 -- corrected single bit error at data bit D3
Bus error interrupt: CPU partial memory write ECC error at 0x138c1f5c
  ECC syndrome 0x54 -- corrected single bit error at data bit D3
Bus error interrupt: CPU partial memory write ECC error at 0x138c1f6c
  ECC syndrome 0x54 -- corrected single bit error at data bit D3
Bus error interrupt: CPU memory read ECC error at 0x139cff64
  ECC syndrome 0x54 -- corrected single bit error at data bit D3
Bus error interrupt: CPU memory read ECC error at 0x136af00c
  ECC syndrome 0x54 -- corrected single bit error at data bit D3
Bus error interrupt: CPU memory read ECC error at 0x136af044
  ECC syndrome 0x54 -- corrected single bit error at data bit D3
Bus error interrupt: CPU memory read ECC error at 0x136af0cc
  ECC syndrome 0x54 -- corrected single bit error at data bit D3
Bus error interrupt: CPU memory read ECC error at 0x136af0cc
  ECC syndrome 0x54 -- corrected single bit error at data bit D3
Bus error interrupt: CPU memory read ECC error at 0x136af0e4
  ECC syndrome 0x54 -- corrected single bit error at data bit D3
Bus error interrupt: CPU memory read ECC error at 0x136af104
  ECC syndrome 0x54 -- corrected single bit error at data bit D3
dec_ecc_be_backend: 34455 callbacks suppressed

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
 arch/mips/dec/ecc-berr.c |   16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

linux-mips-dec-berr-ratelimit-ecc.diff
Index: linux-macro/arch/mips/dec/ecc-berr.c
===================================================================
--- linux-macro.orig/arch/mips/dec/ecc-berr.c
+++ linux-macro/arch/mips/dec/ecc-berr.c
@@ -5,12 +5,13 @@
  *	5000/240 (KN03), 5000/260 (KN05) and DECsystem 5900 (KN03),
  *	5900/260 (KN05) systems.
  *
- *	Copyright (c) 2003, 2005  Maciej W. Rozycki
+ *	Copyright (c) 2003, 2005, 2026  Maciej W. Rozycki
  */
 
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
+#include <linux/ratelimit.h>
 #include <linux/sched.h>
 #include <linux/types.h>
 
@@ -51,6 +52,10 @@ static int dec_ecc_be_backend(struct pt_
 	static const char overstr[] = "overrun";
 	static const char eccstr[] = "ECC error";
 
+	static DEFINE_RATELIMIT_STATE(rs,
+				      DEFAULT_RATELIMIT_INTERVAL,
+				      DEFAULT_RATELIMIT_BURST);
+
 	const char *kind, *agent, *cycle, *event;
 	const char *status = "", *xbit = "", *fmt = "";
 	unsigned long address;
@@ -70,7 +75,7 @@ static int dec_ecc_be_backend(struct pt_
 
 	if (!(erraddr & KN0X_EAR_VALID)) {
 		/* No idea what happened. */
-		printk(KERN_ALERT "Unidentified bus error %s\n", kind);
+		pr_alert_ratelimited("Unidentified bus error %s\n", kind);
 		return action;
 	}
 
@@ -180,12 +185,13 @@ static int dec_ecc_be_backend(struct pt_
 		}
 	}
 
-	if (action != MIPS_BE_FIXUP)
+	if (action != MIPS_BE_FIXUP && __ratelimit(&rs)) {
 		printk(KERN_ALERT "Bus error %s: %s %s %s at %#010lx\n",
 			kind, agent, cycle, event, address);
 
-	if (action != MIPS_BE_FIXUP && erraddr & KN0X_EAR_ECCERR)
-		printk(fmt, "  ECC syndrome ", syn, status, xbit, i);
+		if (erraddr & KN0X_EAR_ECCERR)
+			printk(fmt, "  ECC syndrome ", syn, status, xbit, i);
+	}
 
 	return action;
 }
