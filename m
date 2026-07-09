Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521583DEACC;
	Thu,  9 Jul 2026 07:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783582134; cv=none; b=KZjO+uUvFbfDEompzE3ZJw3a0ACWOsK8aaaCKe7EB82MINdj1s5eHSP4DeX/iyBk8Fu0yvqMrM8cICuCgoJUU5QoxbqY0iOqCEOfmYndD1Fke+MuY6Qr3TiqFqYr6z66bJY1F/OHfegIAznxVS7jwSrkEYWHaSYsOldxOEsESh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783582134; c=relaxed/simple;
	bh=LKwEKkMB6xX6PC6Mjh0trz9XBQ0aR/ph1h4s25/mDQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b2CjhB+UOw5twszEzR2JP6B7gg6yN2p47e2313E+XoEUJt3IMfwmZ93uEh9S5b0mqXRmLNi44f6EBs00N//BIVbXDGrp2eQ0TVLkgZkGFfEMr9x4oK4FW/Z634vQ0y/vE7M/1iR6my88rLnqfdk019UzfE/Fz4q3X/Y1rBhqHgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VfS29yz6; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=7mM43u1T; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VfS29yz6";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7mM43u1T"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783582131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jlOqR3yyH40CpACwhkdedbqPc/0F4mUc+rLYiUeIYaU=;
	b=VfS29yz6v6QKBCboabdEljzssfLuA2Yoi2GwifrYUYQukJChAC6JXynNZWW5YWIXGJ2DdI
	weo7N1RNqzRyT5pHSFOMKhvxEBSfcpK4iu6jBGf/PZ2I03GRzAb3rS5t8HqkMn9XC7i1Cj
	mXhA6+C1K52JB4KS5DbjOVDdXQYobBZ+1OJK76ANUMwF722cJxjLu6sjQNTsf1Kao42A6A
	TtX9LYTgk6hW6Hb4QimaD3EVNeujj9U4KvptCVXeExWmMMQtwksbckSPA4k28VoXdGCEUj
	/UgACdn/g4NV0R6SpgB4/7R9/vPMnsefDj66Rmj0uHrW94HCE91PhQcwUFAJTQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783582131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jlOqR3yyH40CpACwhkdedbqPc/0F4mUc+rLYiUeIYaU=;
	b=7mM43u1TEXb292xFClANL5DRI9egCIwyLTbtd9bFi0gG5vlmBvQyC0UJFIGNs/ADteZOQ+
	D6ni/kD94adkKNAA==
Date: Thu, 09 Jul 2026 09:28:38 +0200
Subject: [PATCH 2/6] vDSO: Remove the dependency on HAVE_GENERIC_VDSO from
 ARCH_HAS_VDSO_ARCH_DATA
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260709-vdso-have_generic_vdso-v1-2-d2e1061f268b@linutronix.de>
References: <20260709-vdso-have_generic_vdso-v1-0-d2e1061f268b@linutronix.de>
In-Reply-To: <20260709-vdso-have_generic_vdso-v1-0-d2e1061f268b@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783582129; l=1325;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=LKwEKkMB6xX6PC6Mjh0trz9XBQ0aR/ph1h4s25/mDQA=;
 b=pO+Yo3hQWGzSMIidPLo/GnAKxOcTxMAekRM/DPJXniTCmCH/swPPMmlgnj24ksorTH2IaH8fP
 xQhAgUTwYrZDD7qI2zlYYUSLfkMxXeKHz6gJx2pKoai3uuj/fI++ks4
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Align ARCH_HAS_VDSO_ARCH_DATA with ARCH_HAS_VDSO_TIME_DATA, making it
selectable even without HAVE_GENERIC_VDSO.

It will only have an effect when HAVE_GENERIC_VDSO is enabled anyways,
but this make the architecture Kconfig files a bit simpler.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/Kconfig       | 1 -
 arch/riscv/Kconfig | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index fa7507ac8e13..8a8d1ab39757 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1682,7 +1682,6 @@ config HAVE_SPARSE_SYSCALL_NR
 	  related optimizations for a given architecture.
 
 config ARCH_HAS_VDSO_ARCH_DATA
-	depends on HAVE_GENERIC_VDSO
 	bool
 
 config ARCH_HAS_VDSO_TIME_DATA
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 3f0a647218e4..353cbfcff783 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -54,7 +54,7 @@ config RISCV
 	select ARCH_HAS_SYSCALL_WRAPPER
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UBSAN
-	select ARCH_HAS_VDSO_ARCH_DATA if HAVE_GENERIC_VDSO
+	select ARCH_HAS_VDSO_ARCH_DATA
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select ARCH_KEEP_MEMBLOCK if ACPI || KEXEC
 	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if 64BIT && MMU

-- 
2.55.0

