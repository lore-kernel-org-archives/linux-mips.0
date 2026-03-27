Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABC86379EE2;
	Fri, 27 Mar 2026 18:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774637845; cv=none; b=NiAcKuh1c9eWcS1PZagSbmxvP2RTrEzLUhlrTUFRnIWFmvnMQFqC7pbd1RpRC78uWDi/pdlortuEpFcxabcfmNjTggfq1EFPtAJ45hRPAqGXjF9NhdW3anBxHFEfGbC1S4f3aeWFpiZb6y81/qgrMKLhaFFlE1Saov1bk3a5wu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774637845; c=relaxed/simple;
	bh=+q0XuVPjC1nLQoexbjzuxwvSpUwSdKKkYsxsOLE2B3s=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bdPJ2KRL7sIhHEtqtXDNTkgtWJ8Cx4FQwand+MZe8e4LY65Mr/Wxg5DHhxSo2CR4Ops4jwpEo/qR3iWCbbSK2rL11f9H9PCIkK9vE50tJ4oPngGwReWjRjlhyf2bjeiGtHiiE6K8o5U7gWtJLlGBohDUhr7eP/nBoeadBWcHkR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id ACA1B9200B4; Fri, 27 Mar 2026 19:57:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id A984C92009B;
	Fri, 27 Mar 2026 18:57:23 +0000 (GMT)
Date: Fri, 27 Mar 2026 18:57:23 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Gregory CLEMENT <gregory.clement@bootlin.com>, 
    Thomas Huth <thuth@redhat.com>, 
    =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
    Keguang Zhang <keguang.zhang@gmail.com>, 
    Jiaxun Yang <jiaxun.yang@flygoat.com>
cc: Waldemar Brodkorb <wbx@openadk.org>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] MIPS: mm: Suppress TLB uniquification on EHINV
 hardware
In-Reply-To: <alpine.DEB.2.21.2603271406020.60268@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2603271742000.60268@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2603271406020.60268@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hardware that supports the EHINV feature, mandatory for R6 ISA and FTLB
implementation, lets software mark TLB entries invalid, which eliminates 
the need to ensure no duplicate matching entries are ever created.  This 
feature is already used by local_flush_tlb_all(), via the UNIQUE_ENTRYHI 
macro, making the preceding call to r4k_tlb_uniquify() superfluous.

The next change will also modify uniquification code such that it'll 
become incompatible with the FTLB and MMID features, as well as MIPSr6 
CPUs that do not implement 4KiB pages.

Therefore prevent r4k_tlb_uniquify() from being used on EHINV hardware, 
as denoted by `cpu_has_tlbinv'.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
 arch/mips/mm/tlb-r4k.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

linux-mips-tlb-r4k-uniquify-ehinv.diff
Index: linux-macro/arch/mips/mm/tlb-r4k.c
===================================================================
--- linux-macro.orig/arch/mips/mm/tlb-r4k.c
+++ linux-macro/arch/mips/mm/tlb-r4k.c
@@ -640,7 +640,8 @@ static void r4k_tlb_configure(void)
 	temp_tlb_entry = current_cpu_data.tlbsize - 1;
 
 	/* From this point on the ARC firmware is dead.	 */
-	r4k_tlb_uniquify();
+	if (!cpu_has_tlbinv)
+		r4k_tlb_uniquify();
 	local_flush_tlb_all();
 
 	/* Did I tell you that ARC SUCKS?  */
