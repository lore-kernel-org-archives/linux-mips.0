Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E802175A68
	for <linux-mips@vger.kernel.org>; Sat, 10 Oct 2026 01:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791594782; cv=none; b=gfiWyePdhhoBdhUD3gjgTM9lfZu5K6mFjOQH9f2NbaDy4Mp3qNjZOGWXeTmKTftFRuG09ZEnf3/9gANpLbm/TRPyedpTWxie2x4ibPObsdq0i6BApo+QHi8ib79Prpk3g3tjmtros4db7YXszAn6jnKKWvtoZc2B/SPLr4iC1L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791594782; c=relaxed/simple;
	bh=9XEP69e9AS1aJwPfVE0uTrVJO7fAgLNTiuKcJbwcmXU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GjJey61/72aOLyka6+g2ExlfQ4WjtjpHtXdaeFQrv+pvkfMyhiGMPE295Mv9NcHkPqEiPaCeCOz0Imlacs9bxzi/X+sim8bAByufJC+OBA/4Bq3J1GONq88iwSL10gDY5J2lTWeg3JwHoN5li7+YwpFfGRxsLBBOMUCVVpReNcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WOqQyVcr; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WOqQyVcr"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-88aea027391so119367b3a.0
        for <linux-mips@vger.kernel.org>; Fri, 09 Oct 2026 18:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791594780; x=1792199580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IO1BNe26oBM4Wu77xirUP/cAXWt8h3ep4ZfstecuGpI=;
        b=WOqQyVcrzLiC1vZlsYAMwZNMjfDPoqAqG0/Y7u+r/eCATOhhnsECAGJ7TNPbuKqnes
         pJ6aa2UgL18CQswryfM9EDwW73Z4b4uze/ZKjH7tb1tk7BPzpW3B/2XB2JT/d443XQ0M
         BalK54gatxhh18lgxFOV2BOLXmj8d2X4rEueXd5WBiBh88+Ux2/w6nreAt2T1JFewj4N
         HGfvMlr84OhNlP26f16zByoeuiOM6l46mowJ9NI65I3fMVNlVnfIEfy11dU+iDmHmfAm
         7yn6gdnDeSyidZH56eAm7wra7fLk2xwjpSVgIRWP6yjB0gT4+7/oWj3irpvCub4rqVzz
         34dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791594780; x=1792199580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IO1BNe26oBM4Wu77xirUP/cAXWt8h3ep4ZfstecuGpI=;
        b=HFWj3Igk6fNWYofPBaTgf3o360Wzdk/rTByiWTFmgAn/BF65ur1MhqeyBfogqEiovG
         tujUodQovK8OrM+FzLTa25ubMG6goCeEmHT7Xz1aAP0sVq7eJJnsx3ZSYarflmlGDiQB
         fN98oodMktTbi48FTSp2/iXx8OXOhYeHzZPUTH15u8pPsAWGk8eH7w3vEs+ak3uYVxK3
         F8tLRhle3po4rpwo5FXPF5rpelCDofEFm+w7P/oPVja+TAB3488VhLZt2NqgLuHt8136
         zrvS1TuIxfLnY9krrzaEJjwPq7rHkyG5GR9LBHSxA4OzplMNMKhMzg6yvha/q7nnpCuX
         mMng==
X-Gm-Message-State: AFq9FYI0ioDjh6VqJzSSKe8Dr9sGnrax7OcCF1l1pHwOT1qscujEl7vV
	6kaIK8/wosmYV9y+mOiOyhWPZPfGeDb7EqyvD0Awk2X9I+ixDBWeeM0phr310DBM
X-Gm-Gg: AYBFou1lZaRU22LmiVohINIG9Qu53cHTU76YeE8hZJ5BiqMKRCjqNT2vr5kREROsiND
	0HRFwWqURmS597a503rhl6/hSvgRuLvec5C+OsxANQZXjF5voTO7bMVvKd6fUaoTLVjCVJaIbTT
	3O4vvuDbe0R5fvBf4TfgpYtqyOjrxu/SB/DUYjKl9IJbAmc/ey0/BcglsyujDYPEPc/Id0qGLKa
	YX0PZDQ1qE+E2RzrWG2qTwsW4bVtCgXDLbTdJ772mn1zu90gzXfdSpifL05GkuPBG+swT76iD8M
	AUtSUU7QsKOIb68lAPL7H1Lg1pN6KGdcBN4JvxERC4XuDhsCquGoNFXJhWF8Ro6ZpmmJCqlMcXb
	nejtvlSkEU5Ebqb8lIsC2rcu1xTotqJqIvU13B5qWI3jklDp17oaB1ev+32OEgCK8/WAtJNi1lf
	vUdNZNNsG2adKAy6Icfk2Ni9EQUn4Nr4ESaniZFfA6EdCvW8zHfyz7WQ4pb56zEdFll2eHdnkLm
	0WTxxG+KoYtWWboY6ZSJCO+6130JlX0Dtq5xZwad9DBkbxrnI1ew/3IpQQrG1JymCAdnmgcbKSa
	2nYPvaO9H2IunsURlSzvUrc6Uw+gqb7tE807hrxwD6OqtBYJ
X-Received: by 2002:a05:6a00:3306:b0:882:2195:5a72 with SMTP id d2e1a72fcca58-897c82b00b0mr3173996b3a.46.1791594780355;
        Fri, 09 Oct 2026 18:13:00 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8985a414614sm1139749b3a.51.2026.10.09.18.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 18:12:59 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mips@vger.kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] firmware: bcm47xx_nvram: don't warn when NVRAM is already copied
Date: Fri,  9 Oct 2026 18:12:58 -0700
Message-ID: <20261010011258.1059235-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On MIPS BCM47xx the arch code copies NVRAM very early, because the
board detection and several drivers need it before platform drivers
probe. With a device tree, the brcm_nvram nvmem driver then passes the
same NVRAM to bcm47xx_nvram_init_from_iomem(), which warns on every
boot:

  nvram already initialized

The same can happen on ARM when the MTD fallback reads NVRAM before
brcm_nvram probes. In both cases the existing copy is the right one,
so log this at debug level. bcm47xx_nvram_find_and_copy(), used by the
early init, keeps its warning.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/firmware/broadcom/bcm47xx_nvram.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/broadcom/bcm47xx_nvram.c b/drivers/firmware/broadcom/bcm47xx_nvram.c
index 0ea5206be4c9..3609e1356065 100644
--- a/drivers/firmware/broadcom/bcm47xx_nvram.c
+++ b/drivers/firmware/broadcom/bcm47xx_nvram.c
@@ -112,8 +112,12 @@ static int bcm47xx_nvram_find_and_copy(void __iomem *flash_start, size_t res_siz
 
 int bcm47xx_nvram_init_from_iomem(void __iomem *nvram_start, size_t res_size)
 {
+	/*
+	 * The arch code on MIPS (and the MTD fallback) may have copied the
+	 * NVRAM before the nvmem driver probes. That copy is used.
+	 */
 	if (nvram_len) {
-		pr_warn("nvram already initialized\n");
+		pr_debug("nvram already initialized\n");
 		return -EEXIST;
 	}
 
-- 
2.56.0

