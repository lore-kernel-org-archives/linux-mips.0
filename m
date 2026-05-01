Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FEEC3603FC;
	Fri,  1 May 2026 23:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777677270; cv=none; b=BINWeJWwLeQ/DAvoqpfZI1Ma6SqhU0TO3zae4ZghRUUizE63/0VrGgfikD29I3rnZ7CVmY+vcJa7R/6rk67QLzVZF7f+Uy/3F1IBCZ8v2dZYFpm7NM2K2QZPqds/BfLtomTFXm9Y+OmZcf0T0BmtPRBODyIJHfTibisWxvpSe+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777677270; c=relaxed/simple;
	bh=tCWOcQ533B7x5m/vluI5paFFtXWAJfoAerA609/jWnI=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZI04DP+6/JYtVjh65vfOad45hj0BlgBc+DB9bV6jPtQ9fGDz0fLDoiN2uy6Fdo7Yo3hbV51jIdVPNuJvhCqoxWcwgXxKeuTKU1JHRQnNRN26mirpU731Q85+zZCpoSQWn2lRcYD30RyugA3NRuyA2IyLfOn2OwmayYBz73NDq4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id E83CA92009D; Sat,  2 May 2026 01:14:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id E511992009C;
	Sat,  2 May 2026 00:14:20 +0100 (BST)
Date: Sat, 2 May 2026 00:14:20 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Fix big-endian stack argument fetching in o32
 wrapper
Message-ID: <alpine.DEB.2.21.2604302350440.38805@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Fix an issue in call_o32() where the upper 32-bit half of incoming n64 
stack arguments is fetched and used for outgoing o32 stack arguments on 
big-endian platforms.

This code was adapted from arch/mips/dec/prom/call_o32.S which was meant 
for a little-endian platform only and therefore using 32-bit loads from 
64-bit stack slot locations holding incoming stack arguments resulted in 
correct values being retrieved for data that is expected to be 32-bit.  

This works on little-endian platforms where the lower 32-bit half of the 
64-bit value is located at every 64-bit stack slot location.  However on 
big-endian platforms the lower 32-bit half is instead located at offset 
4 from every 64-bit stack slot location.

So to fix the issue the offset of 4 would have to be used on big-endian 
platforms only, or alternatively a 64-bit load from the 64-bit stack 
slot location can be used across the board, as the subsequent 32-bit 
store to the corresponding outgoing stack argument slot will correctly 
truncate the value and cause no unpredictable result.  We already take 
advantage of this architectural feature for the incoming arguments held 
in $a6 and $a7 registers, since the o32 wrapper does not know how many 
incoming arguments there are and consequently propagates incoming data 
which may not be 32-bit.

Since this code is generally supposed to be used with the stack located 
in cached memory there is no extra overhead expected for 64-bit loads as 
opposed to 32-bit ones, so pick this variant for code simplicity.

Fixes: 231a35d37293 ("[MIPS] RM: Collected changes")
Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
 arch/mips/fw/lib/call_o32.S |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

linux-mips-call-o32-endian.diff
Index: linux-macro/arch/mips/fw/lib/call_o32.S
===================================================================
--- linux-macro.orig/arch/mips/fw/lib/call_o32.S
+++ linux-macro/arch/mips/fw/lib/call_o32.S
@@ -74,7 +74,7 @@ NESTED(call_o32, O32_FRAMESZ, ra)
 		PTR_LA		t1,6*O32_SZREG(fp)
 		li		t2,O32_ARGC-6
 1:
-		lw		t3,(t0)
+		ld		t3,(t0)
 		REG_ADDU	t0,SZREG
 		sw		t3,(t1)
 		REG_SUBU	t2,1
