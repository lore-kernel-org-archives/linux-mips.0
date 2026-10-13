Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E094DE73C;
	Tue, 13 Oct 2026 09:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884821; cv=none; b=J0Rybm9eBcn1Bf5A244O64xk7KFDpq30MpHwtb0yyeWSbzab2bO+MpXJPIISCICSoaaY/sHx7PlQ8ZJqVtRfASP4cgsxKncEJNZU5MVkpQR3uq8kkfkZEQqNW4fgDdhu2GdKeGxOLZJY+OtPfW84aiIrq0hac1GfCzaSwwKtce8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884821; c=relaxed/simple;
	bh=+BzDxtJWnAmvPBEC8Q4lqt+PXHXopg5tDOIOKtbqkTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BAPL+Rri9CyJQIWXuN6fgF4eWM7YA+6fJggFAllxu1aN6ocpLV5UhutyNLDq+QDSykRhuUcAE1N9cgIG8W/YiApvSR13TyKzn36ZweACllQJsdQpUKBNQN243CW56zUc84jl21RKBPQG9lY/sdfAecCM0C9wCIeqNoSnrPBZFYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cr94hyRa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cr94hyRa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BCC41F000FF;
	Tue, 13 Oct 2026 09:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791884820;
	bh=8vTM4a7i2dgU+t03/5CBP7EtU0aFmL1RY7T+MGG0S64=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Cr94hyRaqRSZVSX+XgOPWY1t/tx62Spqtu62cdujnAjD26rVEpOSY7h/vWGzZ237Q
	 CKhdnnI+2aAts5pVMTy2zen/n+wgbKV8uopcD6X8dD4l1nxuBnNTOejHpYnA8dOHFC
	 Esql+BJzOHimvEZeUqwXE5sW9S4rQIx2pBX07XleCIVl/ZeAtMIDgyLXJOyUvs9ubI
	 OiVzYMFZqtqDhIpVw5g9VaeB5v5FHokjR1db8JLMkJabItXMWrIz7GLvqI4uN/WaZz
	 7kxbR9SnaiUMYdTnJ8NDVWWBG2CYtxmXczjlwoiiG2HCeI7+ojO6OO9Ih98Ln5x/E6
	 iuGQVLjnCBmbw==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] MIPS: sgi-ip32: Reserve the firmware memory
Date: Tue, 13 Oct 2026 11:45:53 +0200
Message-ID: <20261013094554.16804-3-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013094554.16804-1-kaloz@kernel.org>
References: <20261013094554.16804-1-kaloz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ARC memory descriptors are ignored on IP32, so firmware data in low
memory ends up in the page allocator and CMA. Reserve it using the
generic ARC walk; RAM comes from CRIME, as ARC lists only the first
256 MiB.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/fw/arc/memory.c        | 11 +++++++++--
 arch/mips/include/asm/sgialib.h  |  3 +++
 arch/mips/sgi-ip32/ip32-memory.c |  3 +++
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/mips/fw/arc/memory.c b/arch/mips/fw/arc/memory.c
index fb78e6fd5de4..97eb7ba02cd4 100644
--- a/arch/mips/fw/arc/memory.c
+++ b/arch/mips/fw/arc/memory.c
@@ -120,7 +120,8 @@ static int __init prom_memtype_classify(union linux_memtypes type)
 	return memtype_classify_arc(type);
 }
 
-void __weak __init prom_meminit(void)
+/* Platforms that detect RAM themselves pass add_ram = false. */
+void __init prom_mdesc_init(bool add_ram)
 {
 	struct linux_mdesc *p;
 
@@ -151,7 +152,8 @@ void __weak __init prom_meminit(void)
 		if (base < PHYS_OFFSET)
 			continue;
 
-		memblock_add(base, size);
+		if (add_ram)
+			memblock_add(base, size);
 
 		if (type == mem_reserved)
 			memblock_reserve(base, size);
@@ -169,6 +171,11 @@ void __weak __init prom_meminit(void)
 	}
 }
 
+void __weak __init prom_meminit(void)
+{
+	prom_mdesc_init(true);
+}
+
 void __weak __init prom_cleanup(void)
 {
 }
diff --git a/arch/mips/include/asm/sgialib.h b/arch/mips/include/asm/sgialib.h
index 80f900417f7e..28fd9f6fbad2 100644
--- a/arch/mips/include/asm/sgialib.h
+++ b/arch/mips/include/asm/sgialib.h
@@ -36,6 +36,9 @@ extern struct linux_mdesc *prom_getmdesc(struct linux_mdesc *curr);
  */
 extern void prom_meminit(void);
 
+/* Reserve the firmware's memory; add_ram also registers all ranges as RAM. */
+void prom_mdesc_init(bool add_ram);
+
 /* PROM device tree library routines. */
 #define PROM_NULL_COMPONENT ((pcomponent *) 0)
 
diff --git a/arch/mips/sgi-ip32/ip32-memory.c b/arch/mips/sgi-ip32/ip32-memory.c
index 5fee33744f67..eadafb98422e 100644
--- a/arch/mips/sgi-ip32/ip32-memory.c
+++ b/arch/mips/sgi-ip32/ip32-memory.c
@@ -40,4 +40,7 @@ void __init prom_meminit(void)
 			bank, base, size >> 20);
 		memblock_add(base, size);
 	}
+
+	/* ARC describes only the first 256 MiB, so RAM comes from CRIME. */
+	prom_mdesc_init(false);
 }
-- 
2.47.3

