Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EEE449B34
	for <linux-mips@vger.kernel.org>; Tue, 15 Sep 2026 07:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456400; cv=none; b=Jd76QheMxqLshUjKHLTL4eo+6C6pm2sh1Ddoyu5fa40zUbVkTHp51KvmuxmpKIHj9+t7KqYxmEv/vcBCHZ67uh/YmYlkj/uTV8yC9zNvZcqBEhuR4Sc+rwo38BOEGvYU5KjSjOtPwRNexhP8lNWueIskeIPkazlIdGNCNsl7v1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456400; c=relaxed/simple;
	bh=89LQ3OLiDjTNU+MZYXlXqV/1LuBsmRvCi0ws7ieqTV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YN3SfQlxqXScMNnKhDIlreuvmTx2vnQfb9wq9j4TI4LjOmUYZAoeRQE/kg3uKzIT5i4oqHn5j34IqAxZvZiGK0GTRqLFZxY9FmuuqEu2RPw7f3LH0O9y4BjtrViaHheiKUOygTi0zZqIbV7auF+YKrn8Xg/zdWVOghDjIJJ5Jxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IAcZY2PM; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IAcZY2PM"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so9760495e9.0
        for <linux-mips@vger.kernel.org>; Tue, 15 Sep 2026 00:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789456398; x=1790061198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTSKjTBTgH4aUE3tUTnvy6VKo0F+1AwP6oO4bSFumRs=;
        b=IAcZY2PMGRiQmc1dwh2bM4ftaS/rs/zMeTY5wW7EtMJaiUAIFvy+AHAByyNZvxDjhI
         UNJ/yjRauC8S4rFPuwyjfBF/W5UQYAYvV7H0FNKzb/knNFMAyWp9TrBSG00r0ZWlIQF+
         8kKIti42UdhPPv7im0cQXibkQeFEnyRwbP0W4AVj9ROMpjFFD3r9rUV3MqLmulO/7M+/
         xl2CMti7QEkHpKFCb4+HxujMyULA/OBBOCZ94ftbPSEr9TVAUfy3va/BqE6Hz0A32QHs
         Ti0++/YuXc1100wORaI6JopYm2089o6tJsHDHtH8Q17amSI9XO0Pkg7BnE73M7dZeAAd
         Yb/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456398; x=1790061198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OTSKjTBTgH4aUE3tUTnvy6VKo0F+1AwP6oO4bSFumRs=;
        b=C+GqOzbGJmOe4pvkINL94t5oXlYpFZ7U2d0hy97uPIJS/cidSH5akm+awZZam3LT2V
         yXWSvmRro+0Ix7eVdhuviw5MdgL0a438CPCHy3tIV8qaXf6S+LMUZyHRjVMenAtFwC4l
         g+hK0t5MZqc1+Thg+T+1C8pMV6QEGUhb2bab8p8U/GPzX8B6vd7BvqhbrHrn5t8/vy2g
         /FyW7k6DleaETwB+mHrdBkeOz0qYxWeIjpcsCjQQyx//82+hUL+exO3NlrPz3NRO+TQh
         iSnEWQqcojovc2bP8Ei56WGIFtFyteAlBJx4oyEN8BjpFwJ1LfOognlx5X99PtqWoHx+
         yD4w==
X-Gm-Message-State: AFuF++ltG5Damd6AzZq/wBmK3KEzyhdeLbGVx4zZbPMZTMh6DqmJqIUp
	vaeqRHO2+CI4R6eB2CQCHSkf+6FbxXc7JWNUE7/ebVIDZ8egq+JGR6U92johFB2W
X-Gm-Gg: AYBFou3o2HWfDwq57Twthq3TCeLI09ci0XDz4fjSs9j2I/mwIZbiuRmVSA9Ur6LMrTC
	Rtj4Ltke/ZT23NiYETmkVo+CapPthEnhWQzQbJ4Fi8r8k/mnKOPfPwwDi9SO55jq1jy78PBUsZl
	t6N++8UC5AE9KJk/ImEVqPzZm61NT3OMxzfA16lyX/+26BvQtlDcM3BHszbZ7asZecn308EjNvj
	xXelPqykFLW1z+SamOjhU+5vp6EyQtgEtio/yJ8YToOi1n3A348VxbpqsID5O4bSK1Qt0ZLAIkp
	41C0Duno/0aBFPCBgytiHLTbfc9RmR8QbgQ7kFTAXZYl/QOQSFAb/ONrPDtoDqJL8iEMyW8oJlu
	SwcvyTtyMxUgwvgifCWzgBGvBk50w42jBN9Fy2PzcdNQuEh2S8mhmyDMgxuR7qoAp96HMrdQ5ib
	qTIvTTrieubV7pvlt4ljlAIcHOsEHIwA4IZJ4mnsJy2v2dS9jDToJjBLwvdiqHtFuQ+87WbDEQ4
	Twn9RelonV6VHcbvMvpcB+GhpV78CH20pY7nZfGAZcIPFlo9bHOrZMAiUU0V/pcCe5wZeDJmahx
	00OCHatAp5C0n92g
X-Received: by 2002:a05:600c:5352:b0:49e:715d:95ca with SMTP id 5b1f17b1804b1-49e7d750bebmr24496945e9.13.1789456397710;
        Tue, 15 Sep 2026 00:13:17 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d284a7bsm117889265e9.3.2026.09.15.00.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:13:17 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] MIPS: OCTEON: read the L2 crippled fuses from MIO_FUS_DAT3 on OCTEON II
Date: Tue, 15 Sep 2026 07:12:46 +0000
Message-ID: <20260915071306.15006-3-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915071306.15006-1-orgads@gmail.com>
References: <20260915071306.15006-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

prom_init() decides whether to lock lines into the L2 by reading
L2D_FUS3, a CN3XXX/CN5XXX register. On OCTEON II the fuses that cripple
the L2 are MIO_FUS_DAT3[l2c_crip] - which is what cvmx_l2c_get_num_assoc()
already reads for those parts - so the test looks at an address that is
not a register on the chip and gets a meaningless answer: it can skip
L2 locking on a healthy cache, or lock into a reduced one.

Pick the register by family in a small helper.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
--- a/arch/mips/cavium-octeon/setup.c
+++ b/arch/mips/cavium-octeon/setup.c
@@ -653,6 +653,24 @@ void octeon_user_io_init(void)
 	write_c0_derraddr1(0);
 }
 
+#ifdef CONFIG_CAVIUM_OCTEON_LOCK_L2
+static bool __init octeon_l2_is_crippled(void)
+{
+	/*
+	 * L2D_FUS3 exists on CN3XXX/CN5XXX only. On OCTEON II the
+	 * crippled-L2 fuses live in MIO_FUS_DAT3[l2c_crip].
+	 */
+	if (OCTEON_IS_MODEL(OCTEON_CN6XXX)) {
+		union cvmx_mio_fus_dat3 fus_dat3;
+
+		fus_dat3.u64 = cvmx_read_csr(CVMX_MIO_FUS_DAT3);
+		return fus_dat3.s.l2c_crip != 0;
+	}
+
+	return cvmx_read_csr(CVMX_L2D_FUS3) & (3ull << 34);
+}
+#endif
+
 /**
  * prom_init - Early entry point for arch setup
  */
@@ -801,7 +819,7 @@ void __init prom_init(void)
 	}
 
 #ifdef CONFIG_CAVIUM_OCTEON_LOCK_L2
-	if (cvmx_read_csr(CVMX_L2D_FUS3) & (3ull << 34)) {
+	if (octeon_l2_is_crippled()) {
 		pr_info("Skipping L2 locking due to reduced L2 cache size\n");
 	} else {
 		uint32_t __maybe_unused ebase = read_c0_ebase() & 0x3ffff000;
-- 
2.47.0
