Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C833DEACE;
	Thu,  9 Jul 2026 07:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783582134; cv=none; b=LVpjVUZyw9NJKrDSmlOXiuxwFr9GOI9dBJeFucj9NOZbWZsv+3Vu1fnyBI+EWpsjJSfefc7JzwwSOhZ/p+MGI2wyMcX3voILYQ+mPekuryyC55J5xJ0CO2IMk/mn1HIbj+ND6RmZv7pkwWiP5/gEoAt6hQoiK4vLSZQxZWfNyQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783582134; c=relaxed/simple;
	bh=8qE0oMbynwSOROhKuM7iHfRRGxHwkJk4NgKjfLWz29M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nqPwQJYcuTqrln+PfKR0i4DbwJXkuZ+EAu/HAKkjKT9kAq0MpV8pcdfDTTgYKWEfe69jRp6B5w6jjFIVPpxufwnUh7IlDv22DV8rK0v/G+yEA9vokXU4LVC5oT6DhnMDBEMqmsL44BNscz9Uq4nFg+UeFMKhmwZZW+HdHomZuV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mueP3uDT; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TxRhWqDn; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mueP3uDT";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TxRhWqDn"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783582132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vhw5vt9hJ8kZ5fxkfrEHHf51RQ8XGRe4qi0Gll2jKhY=;
	b=mueP3uDTtHTAwQWdl6aZEl1wK8rwUusxbQGmcQFigWMvJUajk6tfvIhW8ydksHVmwjHSN3
	m0lMinTZ9RHqGTX//MNyZjQeQU2LTK83cGE0cuG0ucwyK6ZL4JjnehahTzej/VsCMOiuns
	wrH9DWKuuAzhVTtQjhWFz3Q7Y1UlnDAwefHkVo8gjstviR0/coVWpblhPbtiV7eQQZsYtW
	OAbs/VhE+GeeIOniXeuye9BeIxoJ9sR2YVNvtEPrGWFUMvrFvcyZs2VYLJUsbvi1l544GN
	U5dptSyrcPB1qG9ssQItMiP67GdaJvowvlFZFqDZHUfi1oyyJU/9WL9t5wzL6w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783582132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vhw5vt9hJ8kZ5fxkfrEHHf51RQ8XGRe4qi0Gll2jKhY=;
	b=TxRhWqDnq02JxgJGXLwxtwcgq12TwcootOcrrjOG12VCSlC70WkuswpAmn7m6+iQVSo+zx
	XGiBfA7qr4rnxYAg==
Date: Thu, 09 Jul 2026 09:28:39 +0200
Subject: [PATCH 3/6] MIPS: vdso: Stop using CONFIG_HAVE_GENERIC_VDSO
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260709-vdso-have_generic_vdso-v1-3-d2e1061f268b@linutronix.de>
References: <20260709-vdso-have_generic_vdso-v1-0-d2e1061f268b@linutronix.de>
In-Reply-To: <20260709-vdso-have_generic_vdso-v1-0-d2e1061f268b@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783582129; l=1369;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=8qE0oMbynwSOROhKuM7iHfRRGxHwkJk4NgKjfLWz29M=;
 b=HDDok6k//jeiKj2mN0v1LMbFCvSHCaP3isQLB8wYixy2cKxRzat1TObLLq6PwohS+QO9TCPoN
 3oSh3Q+23kNA8qfzhEGNfIr35swsTnv8kcMuFqs9nzJhwkgaKz8euD0
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

HAVE_GENERIC_VDSO is about to become an implementation detail.

Use the MIPS-specific symbol instead. It is equivalent here.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/mips/kernel/vdso.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/vdso.c b/arch/mips/kernel/vdso.c
index bd1fc17d3975..29a10045f2b6 100644
--- a/arch/mips/kernel/vdso.c
+++ b/arch/mips/kernel/vdso.c
@@ -129,7 +129,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 	 * This ensures that when the kernel updates the VDSO data userland
 	 * will observe it without requiring cache invalidations.
 	 */
-	if (cpu_has_dc_aliases && IS_ENABLED(CONFIG_HAVE_GENERIC_VDSO)) {
+	if (cpu_has_dc_aliases && IS_ENABLED(CONFIG_MIPS_GENERIC_GETTIMEOFDAY)) {
 		base = __ALIGN_MASK(base, shm_align_mask);
 		base += ((unsigned long)vdso_k_time_data - gic_size) & shm_align_mask;
 	}
@@ -137,7 +137,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 	data_addr = base + gic_size;
 	vdso_addr = data_addr + VDSO_NR_PAGES * PAGE_SIZE;
 
-	if (IS_ENABLED(CONFIG_HAVE_GENERIC_VDSO)) {
+	if (IS_ENABLED(CONFIG_MIPS_GENERIC_GETTIMEOFDAY)) {
 		vma = vdso_install_vvar_mapping(mm, data_addr);
 		if (IS_ERR(vma)) {
 			ret = PTR_ERR(vma);

-- 
2.55.0

