Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142AF48F822
	for <linux-mips@vger.kernel.org>; Fri,  4 Sep 2026 12:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788526171; cv=none; b=cxV6YpxwS/45uVBFFxP/8ewggFUnmmHLpTMCUnMkwStWXqz3jjLBmJnFSwMizTaSAEaxB8C+g4maxFYcJXoooP9TY+LkZC2VtuYl2E+tnbOu13neJfG8NVz83321T/D4VMswk4Gfi2NN/2GImXChPSPKmz5WzuiRh/dzNXsdCYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788526171; c=relaxed/simple;
	bh=xMjw9BhExwYqDYeIkaOl/TPJ4YYBM962+ei6WlmFjNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J8RUxwi12dk7RQKNTsVFPVnYaBAQaAfX2PPXlEmiwJF7eoGaH7Rk3G2A7POreO9Lj1bPdj6m58/0egp3XD27USp2txxKKA46zciokigA/xyvNZhNOctf7PORbs55JsHBkbJy4Q2c0Kj7k0wcxVmSmHAyrTjlQoImduw4DwyJbLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mPlc3VMk; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mPlc3VMk"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d9db539a54so8403285ad.0
        for <linux-mips@vger.kernel.org>; Fri, 04 Sep 2026 05:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788526169; x=1789130969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kdc2eyHvO2C+AVSkBspXm1DrZERrlD721EvxKBzLlTk=;
        b=mPlc3VMkpYHSSRCc34m5bwb/2+eEvaksZ5YGbVas43N/Q1J3mr87VUp/RvdARwXgl6
         tATUrkrc2gODeN7f1GvyHpXPviTYWlIKXdDiyBWon6WaR3H+0o6uE+o8lkMl8cCGCpfJ
         UUwr80bNiq66PFBMYUmJn5YudPcetDtqv9IEY2grwSLZs4I2Phd4IrNg1On9IjGzJN7N
         bsvm2YrWXiA4bsiERMFoQ9ZWPAMs+4a811Q1tEZ6P/5H6t0rXylvqAd5yX9u0LLOV3hZ
         s8QTwB5kYs8IhRgTkwacWy3FvidHURmcq+DWBP6PY/GsB1XEjp3vr2Ih/jyhMQ13nDml
         gGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788526169; x=1789130969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kdc2eyHvO2C+AVSkBspXm1DrZERrlD721EvxKBzLlTk=;
        b=bo7C25R3fzod/SXzfEU6oh2wdrWFLQfYFcinasEbHYv/iP4WI51FIsTkr4NPNx2gHQ
         JOGmSEpvJAza7FU3l7OZjQBg1br3slbT9U89plRD2h9V7yDaLyhugfC5dfThV7Ivl/El
         MA7iaNsmNry6dUjZKvoU3IWpxTGpGuZmd3yHGo7L6jz0sJS54pOLLxTgpg8rW+QjiFUX
         pkCHXDN0tir321zayKMgVAg97iFGdbm62SJlU95YuPAiHlsmnYIISNOFpGngw3jQj85m
         h4VsbVUX6QDTlcJ2G9CZZqXCUUpcG659c96/rtJ8Y8OfQDufDq/sj6Ff8s/IvfX9Garq
         OimA==
X-Forwarded-Encrypted: i=1; AKwUvBz+BWsxSZY3ckxZLhnuAgayLiBKYOmN7Z8oXRfK2fRNSNWA+lZoX4u1qyCoabW9em6ei9uCBzIkK/Te@vger.kernel.org
X-Gm-Message-State: AFuF++mATa5N+n446zo0qDbFgy1u6pnrkxZMaxKJmPxs+P3wvVdHVKvG
	/mfa+7Lj0/UreoM3RFkVYGZ5NnV0hvfjaTLYgpv1Ju+kGSI1T4RoyTnh
X-Gm-Gg: AYBFou1dVUuWyxTUD6kwOHYu0rAuU3nhWp0KI1YBsRwXpoiTj8IwdLmET00oVi0tapw
	ncpU03NqQZiMa2Y5bVWgT9MSDBe4OEQBAC6diEz1HkUhejaZJjNnjYdmlUvrhLM64t3MTwI36rU
	pK3yQJLY7sm8SA0PxhpemDu07HpORm1c2MtBoqdvSbWXbPiuIfAFxid+tyoFM1+rUk1L1QOHQsz
	69iF5Vi4RYlYl6jl41EjzBgJYQXn1o3Bvol4LUESyX5P5K3rCFsS0fV6VjX9sb6N4+r2wBp4jVs
	MZhXPh8mnXGr4nd0xtVNjWcPTdvco53D9e2/jpT6N5C0NShQoSXFe7XzYM2/sIkuAMxxt1fXR2a
	b66WXsTiENjUWO/hWGUqb3TFQBgmvTrYjnJdL94fWlD2g/IDGy34v948jiu4pvMO7o6NR5VEVsa
	j8ZamRxqY5SNN/RKdPST4qj5eGqlGP53wURHseJFPfmKprSd/mdhduND8NeS8Sv6NcpmCAwHSCB
	179KoRzQvJpWvg=
X-Received: by 2002:a17:90b:2784:b0:395:4de5:1054 with SMTP id 98e67ed59e1d1-39b26272bdcmr10176213a91.16.1788526169321;
        Fri, 04 Sep 2026 05:49:29 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm7328079eec.30.2026.09.04.05.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:49:28 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH 1/2] MIPS: fix typos in comments
Date: Fri,  4 Sep 2026 18:19:19 +0530
Message-ID: <20260904124922.10256-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904124922.10256-1-hemanth.selam@gmail.com>
References: <20260904124922.10256-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/mips/include/asm/mach-loongson64/boot_param.h | 2 +-
 arch/mips/n64/init.c                               | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/include/asm/mach-loongson64/boot_param.h
index 3a11ce85762b..3e5c2b3a7f9b 100644
--- a/arch/mips/include/asm/mach-loongson64/boot_param.h
+++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
@@ -24,7 +24,7 @@
 struct efi_memory_map_loongson {
 	u16 vers;	/* version of efi_memory_map */
 	u32 nr_map;	/* number of memory_maps */
-	u32 mem_freq;	/* memory frequence */
+	u32 mem_freq;	/* memory frequency */
 	struct mem_map {
 		u32 node_id;	/* node_id which memory attached to */
 		u32 mem_type;	/* system memory, pci memory, pci io, etc. */
diff --git a/arch/mips/n64/init.c b/arch/mips/n64/init.c
index 66ec28ab41f3..ddbd7d1224d3 100644
--- a/arch/mips/n64/init.c
+++ b/arch/mips/n64/init.c
@@ -20,7 +20,7 @@
 #define IO_MEM_RESOURCE_END	0x1fffffffUL
 
 /*
- * System-specifc irq names for clarity
+ * System-specific irq names for clarity
  */
 #define MIPS_CPU_IRQ(x)		(MIPS_CPU_IRQ_BASE + (x))
 #define MIPS_SOFTINT0_IRQ	MIPS_CPU_IRQ(0)
-- 
2.48.1

