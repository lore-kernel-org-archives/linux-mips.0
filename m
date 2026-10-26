Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793022418;
	b=P5z9/RwJym7ff5tB1Qi+BGso5Hm09Dhr9pKFEp8NFovLRrZ1Nn4kREQwloTPR+YmHfqW
	 pypp2nowbAkCQ5ejh6kPumCNO4euJFYQ3wm/W5JJpRIxZlFv+TPHdVKg0/CwJoRScP3Yy
	 lbYM/vKN5C0UxJwlL2egR2QSqldLLjBQyZpez0lOR3xr9cvGXhlzRdBhUjTlXXbt7N0bz
	 rEj3D9bHCPWb2DBK8lLsfU4gOLcGriFZxeYNp6li+nW7IGo4rp9CMUf5BSfl9eZlM/Ncr
	 H3/dTW8n9hPow82HfBBfg13VO6hcmPKticdnY37jNrOXJUZrj2TKVI6MWAklwfOApbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793022418;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=XAQesoN4INxI95pV89i5nL2OkEzTPFK57+fNoMpVjaM=;
	b=E2ljdtReM/6snVtf8evrfkQrLP/JWV2XpPPCHyHwGpvqfcmXBl4GW+Ye/rDUTPaJLJnh
	 dHfvmDgbqLOHEHVZhX/bFO2z3Z7rwo1PlgdJGWL0PoEJB5SJwhzmDBta8eXDWA7h9CsP7
	 cfGatkL1shwa2CKie6mZv88cOZPTgWyV+BOmBcET2UdY60TbAXv1XdtbzwuqpjD3sDJrt
	 rAb9SZ7Ljvz2Z8KMismRz5lPKMYVe/1IDJf8pj1HhDEyhumEsMl8eZZbYLlPkR+PwUMm3
	 87O1tV45jCaa0XIOvKvFZS7kGLVcajCRP4WnNz4L9atnMK6Se0XfDriv1aaJqOQ37+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JupDmn0O;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB9C60A2601;
	Mon, 26 Oct 2026 13:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JupDmn0O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 498591F01825;
	Mon, 26 Oct 2026 13:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793022417;
	bh=XAQesoN4INxI95pV89i5nL2OkEzTPFK57+fNoMpVjaM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JupDmn0OPG+eCQNMx/JvKZaDnFKkC2MySeoTmc1YptnR8pBmmSzE77MPjLW977x7h
	 UL9RI6AeSC8EkyBrPGE8QHzK7ggKejEcRD3EzIYudHQAeXvwUs5W0TmQ4/bv5l8wv5
	 nqhlbjHwWqM69lPzVoLPNbH7SXG/GnlnxvPlrFhK5qzajfSUsT57kNQOlggwHmEFFB
	 d5H1evMdyj689DohX8NurOnxWmGtr2JB40qpMgAPlfphSs9qvpMzKNxDhKOqfsdf66
	 jI5B67jEZHgwdeFpk53xLV6NA7vfHV2F6JkD7PTLHn12ooV5WNRinyXZ1141KsVJCN
	 rdK91Fv3lIxbg==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] MIPS: sgi-ip22: Add prototype for ip22_eisa_init() to header
Date: Mon, 26 Oct 2026 14:45:40 +0100
Message-ID: <20261026134543.27207-3-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026134543.27207-1-kaloz@kernel.org>
References: <20261026134543.27207-1-kaloz@kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fixes the following build warning with CONFIG_EISA=y:

arch/mips/sgi-ip22/ip22-eisa.c:95:12: warning: no previous prototype for 'ip22_eisa_init' [-Wmissing-prototypes]

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/include/asm/sgi/ip22.h | 1 +
 arch/mips/sgi-ip22/ip22-int.c    | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/sgi/ip22.h b/arch/mips/include/asm/sgi/ip22.h
index 57942afb5c86..4bb2e2d38927 100644
--- a/arch/mips/include/asm/sgi/ip22.h
+++ b/arch/mips/include/asm/sgi/ip22.h
@@ -79,5 +79,6 @@ extern unsigned short ip22_nvram_read(int reg);
 extern void ip22_be_interrupt(int irq);
 extern void ip22_be_init(void) __init;
 extern void indy_8254timer_irq(void);
+extern int ip22_eisa_init(void);
 
 #endif
diff --git a/arch/mips/sgi-ip22/ip22-int.c b/arch/mips/sgi-ip22/ip22-int.c
index 11f8adc98cb5..89a3e8e8f0fd 100644
--- a/arch/mips/sgi-ip22/ip22-int.c
+++ b/arch/mips/sgi-ip22/ip22-int.c
@@ -30,8 +30,6 @@ static char lc1msk_to_irqnr[256];
 static char lc2msk_to_irqnr[256];
 static char lc3msk_to_irqnr[256];
 
-extern int ip22_eisa_init(void);
-
 static void enable_local0_irq(struct irq_data *d)
 {
 	/* don't allow mappable interrupt to be enabled from setup_irq,
-- 
2.47.3

