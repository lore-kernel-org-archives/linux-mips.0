Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CED73793B6;
	Fri, 27 Mar 2026 18:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774637841; cv=none; b=PRJiIdwNsLEFufZSuT7sdVTMFJnp5iF9VLNPgh2JCJ0TczUtCF0VnC6IshMAbmDgp157bunaS0OyEZq7TX8MUVAXujErZF7GDB6iLz0kz+lKlKb9k+eQExRs8Zn5EvptAmhIvzWEpjywWOvc8MXC4TCArdwBIJgJsdLM339UKgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774637841; c=relaxed/simple;
	bh=b9XGof0G71Plb8QpxKIEeaVhxPDlOcHX5Y5+wvK/uz4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OB2FDeVe2x2O/V+wIFdn39auaSjcmQL6oZXwPBAwOVvPaVibuu9lcvdbUShdcSo6LHpNNpzCs67AzvrhcQumWO0iwWDtSI20LgKkZ39tqVqjNM5HM6Fn45BsJ9M/FwkMVunWnENPtXRKo2l0uQBp62JlsTXO3jh+RzADFK4+uwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 1DFEF9200B3; Fri, 27 Mar 2026 19:57:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 1ACF392009B;
	Fri, 27 Mar 2026 18:57:18 +0000 (GMT)
Date: Fri, 27 Mar 2026 18:57:18 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Gregory CLEMENT <gregory.clement@bootlin.com>, 
    Thomas Huth <thuth@redhat.com>, 
    =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
    Keguang Zhang <keguang.zhang@gmail.com>, 
    Jiaxun Yang <jiaxun.yang@flygoat.com>
cc: Waldemar Brodkorb <wbx@openadk.org>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] MIPS: Always record SEGBITS in cpu_data.vmbits
In-Reply-To: <alpine.DEB.2.21.2603271406020.60268@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2603271722150.60268@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2603271406020.60268@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

With a 32-bit kernel running on 64-bit MIPS hardware the hardcoded value 
of `cpu_vmbits' only records the size of compatibility useg and does not 
reflect the size of native xuseg or the complete range of values allowed
in the VPN2 field of TLB entries.

An upcoming change will need the actual VPN2 value range permitted even 
in 32-bit kernel configurations, so always include the `vmbits' member 
in `struct cpuinfo_mips' and probe for SEGBITS when running on 64-bit 
hardware and resorting to the currently hardcoded value of 31 on 32-bit
processors.  No functional change for users of `cpu_vmbits'.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
 arch/mips/include/asm/cpu-features.h |    1 -
 arch/mips/include/asm/cpu-info.h     |    2 --
 arch/mips/include/asm/mipsregs.h     |    2 ++
 arch/mips/kernel/cpu-probe.c         |   13 ++++++++-----
 arch/mips/kernel/cpu-r3k-probe.c     |    2 ++
 5 files changed, 12 insertions(+), 8 deletions(-)

linux-mips-vmbits.diff
Index: linux-macro/arch/mips/include/asm/cpu-features.h
===================================================================
--- linux-macro.orig/arch/mips/include/asm/cpu-features.h
+++ linux-macro/arch/mips/include/asm/cpu-features.h
@@ -484,7 +484,6 @@
 # endif
 # ifndef cpu_vmbits
 # define cpu_vmbits cpu_data[0].vmbits
-# define __NEED_VMBITS_PROBE
 # endif
 #endif
 
Index: linux-macro/arch/mips/include/asm/cpu-info.h
===================================================================
--- linux-macro.orig/arch/mips/include/asm/cpu-info.h
+++ linux-macro/arch/mips/include/asm/cpu-info.h
@@ -80,9 +80,7 @@ struct cpuinfo_mips {
 	int			srsets; /* Shadow register sets */
 	int			package;/* physical package number */
 	unsigned int		globalnumber;
-#ifdef CONFIG_64BIT
 	int			vmbits; /* Virtual memory size in bits */
-#endif
 	void			*data;	/* Additional data */
 	unsigned int		watch_reg_count;   /* Number that exist */
 	unsigned int		watch_reg_use_cnt; /* Usable by ptrace */
Index: linux-macro/arch/mips/include/asm/mipsregs.h
===================================================================
--- linux-macro.orig/arch/mips/include/asm/mipsregs.h
+++ linux-macro/arch/mips/include/asm/mipsregs.h
@@ -1871,6 +1871,8 @@ do {									\
 
 #define read_c0_entryhi()	__read_ulong_c0_register($10, 0)
 #define write_c0_entryhi(val)	__write_ulong_c0_register($10, 0, val)
+#define read_c0_entryhi_64()	__read_64bit_c0_register($10, 0)
+#define write_c0_entryhi_64(val) __write_64bit_c0_register($10, 0, val)
 
 #define read_c0_guestctl1()	__read_32bit_c0_register($10, 4)
 #define write_c0_guestctl1(val)	__write_32bit_c0_register($10, 4, val)
Index: linux-macro/arch/mips/kernel/cpu-probe.c
===================================================================
--- linux-macro.orig/arch/mips/kernel/cpu-probe.c
+++ linux-macro/arch/mips/kernel/cpu-probe.c
@@ -210,11 +210,14 @@ static inline void set_elf_base_platform
 
 static inline void cpu_probe_vmbits(struct cpuinfo_mips *c)
 {
-#ifdef __NEED_VMBITS_PROBE
-	write_c0_entryhi(0x3fffffffffffe000ULL);
-	back_to_back_c0_hazard();
-	c->vmbits = fls64(read_c0_entryhi() & 0x3fffffffffffe000ULL);
-#endif
+	int vmbits = 31;
+
+	if (cpu_has_64bits) {
+		write_c0_entryhi_64(0x3fffffffffffe000ULL);
+		back_to_back_c0_hazard();
+		vmbits = fls64(read_c0_entryhi_64() & 0x3fffffffffffe000ULL);
+	}
+	c->vmbits = vmbits;
 }
 
 static void set_isa(struct cpuinfo_mips *c, unsigned int isa)
Index: linux-macro/arch/mips/kernel/cpu-r3k-probe.c
===================================================================
--- linux-macro.orig/arch/mips/kernel/cpu-r3k-probe.c
+++ linux-macro/arch/mips/kernel/cpu-r3k-probe.c
@@ -137,6 +137,8 @@ void cpu_probe(void)
 	else
 		cpu_set_nofpu_opts(c);
 
+	c->vmbits = 31;
+
 	reserve_exception_space(0, 0x400);
 }
 
