Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795151325;
	b=xAHdueY/Saf1XrGQMD6d3K4Qu++JD0ezHM0nd7EB0Y9N3FYvslYNOZ2YrKzGkpt8srxP
	 K6ozAtxMJ8QlkpMTMhdrGd3AG2BQ1tq9j6LRZN+YR9a1Bt3YZ4vn18jnz5JUdOu9Ailje
	 rom1L1QfM4mjg9fhpteh/uRgIjLkS+HATCaeKAK0eszVeFEeg8TOpatUhCvH8KRcS6Qzc
	 E4yUof2IrgS45X9SFGudOLhFseCJAiOkbiAU7xtUL0LlYRunAMc7vZvUXmQG7z+3SeC0C
	 /x0v9h7TLphfikJAT9NUOwCk6P3eB99HnU6UHO+nNLZZZp3pvJPU+fphzh2TsEuv2AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795151325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=dJ3qLBYattYfDuWuotFyeF89FeAbvQLDg4xUYhMHPLk=;
	b=NjT3YcATFC67gbEgM4T4IvKFQMBZROgqvgW2+PaXfeWcIOZpkJ7HObowf7Cr3kiodOtf
	 NZ5Xm7gwc2FeJOoL0dDpOvWpsn7g0YZ1kketilC+mArbD62lspkPrMHJ/uF3mtTh00RgB
	 xhhRI6m4AhB+exAiAvWOm8P/WM+otK5RvIgvoz2sDId3za+69AhZT5NUPGZPyQS2IKlZA
	 mPgN+SDy15LGzr5GjvZTZoMTX4PKsn36kEwoJcMH+WBvm4Lxa1j8Lam4OMT/iB+csifDS
	 +ZedJgTA7YGnZ9OjuIMF3GmY4bNbZTZRHT65uDmmK+DkL7EVUz2NRwLhLeU2JAhYYKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ySOdvT6L;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6948606A32A
	for <linux-mips@vger.kernel.org>; Fri, 20 Nov 2026 05:08:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6948606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ySOdvT6L
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33fb4680717so1233172eec.1
        for <linux-mips@vger.kernel.org>; Thu, 19 Nov 2026 21:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795151324; x=1795756124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dJ3qLBYattYfDuWuotFyeF89FeAbvQLDg4xUYhMHPLk=;
        b=ySOdvT6LJJsEWiqKG9X8EKRQElyfVvtGtzpk5tmXh3sKlmIeUom+b6c/lV9tW95ZHy
         nnQ/45q6Co/MS87UrDtMt8U904T1p8jA7FCo0rYtkgYsIu8g0d7TOesI0n4lKXgFjnkB
         9zMDmoNhyz3AQ0M/o9pplT87wTWHlcF3YNwD8nJRywAOqFzawGiL8LgsVw/y9cM6fZPQ
         ciK2TdNtd7w+RGSAyIFhOKUZhpc/PyYBokUSmRMUrOGFoBGPp7LsX3zRYSc7ogVpD2cJ
         dcbTT4P9n59wwDoYir9k1J4jAEDYoKsqAyV0C+J+5iCAfN0VIeQ+IRGk8/rZMV2YHB8F
         EbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795151324; x=1795756124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dJ3qLBYattYfDuWuotFyeF89FeAbvQLDg4xUYhMHPLk=;
        b=ZQLeAN7GWVgl04sp5m5Q7fPqgRBsx5aFiP06p7mqTek9CadjBX1ukB3qpgu0kqTErF
         Mpg0lreigcOQ7ZB5Ywff6eQHZDGHIl34mV+fzWixjg/LMfDL4jisfGr62/ydoHGsj3A6
         FHk22h2ahEaZk3afTMDkmhp8mg+h8lpGGCMbtNKt82oRmUvIZGk/Qo3hUq39P5U0G5Yy
         5CywH6m9+PDdijmnwFHamiSR4VXi+t/KczHwQvogUqpE9RruPoKNUytX2zTTpwE9FI2N
         Lk/IcDHOO9s+q6dEeXBkNkJld+GevvFXW4J/ouaxubizc1X1nj4o6iuwKdn9LG4AiQYO
         y9UQ==
X-Gm-Message-State: APuU4Z9OJi9jM+a8DrhojxLIr2gxFR+noMLUDQEgxqnJyYaUPkSrvm8y
	RCdGmNwWFu3CnlbOaxx+kNpK5QmKOn/QundJvCd2YcS9SZwIXerfNfech0GbZA==
X-Gm-Gg: AZFdTZegI7DRHggTiBtNE0U/EJlpaPlVDRvZLIL9x0VjArcjH3IsEsrdZ0NlAVb5E4s
	1nZ7r5bloNWFSJ1JHuv2rma7E0wW/5QiIiQrqlyKpDhQJrhRwuiszPdJTJl0U2qEp44YFQUbBGE
	mE6qWmywvzBMdJYRvkpHJV/gTbeklQs9MFOwA62PO4ypFoceP6f38uMHk85L7JNSY1crBeE77Zf
	GtwwVgIpuZ0XHIz1oXxqCKmodVBAm0tCZgIchWCqM7JJxYfQQhInVPiRYLLolFacdZI4ccqsztg
	Fbab2SXNODCoowy0E1tGSPcKFU6PYdHR3D3gmK8Fr2iRB3/22rLnDhpL30xBnz4lypSMuorBEmg
	MGgv1jbWJbSlVEaxdidP667gcNr8CAF9l4XJgCIGAgDsh75vspCtrr4iT6R1a4pMge+cO0qMrKw
	6UOseVIYzIj4823Jua+nxrxcY1Q9NCntrmd4DFpr9n97wyqnRv3US2TVfRpks9SodQArIsq/TGN
	9rrt6AatgXcX+OeGHXWld3fcX8RtTcVEaWrPJ2BIC/9BadtwtufmpBfEHzJ0hIo1PIsmF9ynQXH
	VUgIoGB3
X-Received: by 2002:a05:7301:4209:b0:369:fc93:eda5 with SMTP id 5a478bee46e88-3857054b988mr1696587eec.39.1795151323663;
        Thu, 19 Nov 2026 21:08:43 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm4652750eec.5.2026.11.19.21.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 21:08:42 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Paul Cercueil <paul@crapouillou.net>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] MIPS: Ingenic: Allow assembler reordering in the XBurst secondary entry
Date: Thu, 19 Nov 2026 21:08:26 -0800
Message-ID: <20261120050827.804767-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Remove .set noreorder and the two explicit delay-slot nops from the
XBurst secondary CPU reset entry. GNU as emits identical reset-entry
instructions with reordering enabled in both the CI20 and generic
MIPS64r2 Ingenic SMP builds.

On CI20, two baseline and three updated cold boots brought both CPUs
online. Each boot passed the CPU affinity check and 100 cross-core
idle-wakeup round trips in each direction. Codex assisted with the
assembly comparison and hardware test campaign.

Suggested-by: Maciej W. Rozycki <macro@orcam.me.uk>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
Thomas, feel free to fixup into "MIPS: Ingenic: Add XBurst SMP support"
if that is simpler. Thanks!

 arch/mips/ingenic/ingenic-smp-entry.S | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/mips/ingenic/ingenic-smp-entry.S b/arch/mips/ingenic/ingenic-smp-entry.S
index 290e23c65707..d6aa4b4b1a17 100644
--- a/arch/mips/ingenic/ingenic-smp-entry.S
+++ b/arch/mips/ingenic/ingenic-smp-entry.S
@@ -16,7 +16,6 @@
 	/* The CP0 REIM register only stores the upper 16 address bits. */
 	.section .text.smp-entry, "ax"
 	.balign 0x10000
-	.set noreorder
 LEAF(xburst_secondary_cpu_entry)
 	mtc0	zero, CP0_CAUSE
 	li	t0, ST0_CU0
@@ -32,7 +31,6 @@ LEAF(xburst_secondary_cpu_entry)
 	cache	Index_Store_Tag_D, 0(t0)
 	addiu	t0, t0, CACHE_LINESIZE
 	bne	t0, t1, 1b
-	 nop
 
 	mfc0	t0, CP0_CONFIG
 	li	t1, ~CONF_CM_CMASK
@@ -50,5 +48,4 @@ LEAF(xburst_secondary_cpu_entry)
 
 	PTR_LA	t0, smp_bootstrap
 	jr	t0
-	 nop
 END(xburst_secondary_cpu_entry)
-- 
2.53.0

