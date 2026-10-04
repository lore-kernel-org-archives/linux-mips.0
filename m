Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C203E7145
	for <linux-mips@vger.kernel.org>; Sun,  4 Oct 2026 18:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791139713; cv=none; b=ST3ZX/5YHQZwwwoJUP2HIHS+db3bZ2dqJDBep8GmyH7L/yHuF0BOQhfAc2EUSSnCVCViKWnQGc0obwkCuplxRBIoKUZd/FIHvB1sM6CxemQQdM5WokmMP7DBUVP44cFGmkorvPlpc9MiIgDPc+Ud7d+R3G87x+u+8ZNHG1VzH/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791139713; c=relaxed/simple;
	bh=vZSS4ndJG2ibQe54acNwR+XWm8nuyKET+0i+mcCuznU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mGEI3NOCQMRTzQ8RPbk3afDf6nkIn451XnDMSx3eFSr3XjUGOisJvtA2SDlp8u5gG5naU/6JDkycnELC6U8RIYzMmySVC7MF13WB5c78dYz8+XKx2S6cc6qLxVLhZT4DBnDYFLRdgCp6iSljkLyzAA2nZsRQ3LlihjuRL/pPeec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wgm9j9Ga; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wgm9j9Ga"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33fb4680717so3181929eec.1
        for <linux-mips@vger.kernel.org>; Sun, 04 Oct 2026 11:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791139711; x=1791744511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P6evII+OYGy4KorzI0D9PG9Yw6wuZMZhhjBM6jWvrVQ=;
        b=Wgm9j9GaBNP3wHMwKHn5stL2Ckt8W/3DeGDGhLJYFAsnBMGLIF7CZYcBwoW/o/K+Ft
         3yXXvfeGFTjLj2rFEp08vfcSjx2ld5U2mta8WGDCydZ8+gCy5DMJySklSghMVr6eGp86
         /WMjI/f8KeEKjccYC12cqn8vl9jRqmMlvxSHwkTtcMJEQ8DBsmgJWsiqyKPK2WfPH0LU
         aades1wnrj2eB5pZ/MnsR0/ek3TxGcqHdq72E6vUTAWvpVedrc5WtWdZ28SyGYs6/m0G
         0Aa58DVLmNY4ofBXMSC3QfNoUJf/GrFqXBskRbvFbo3YxPLIexfufsHqVn1ChCW2c+NM
         3Cqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791139711; x=1791744511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6evII+OYGy4KorzI0D9PG9Yw6wuZMZhhjBM6jWvrVQ=;
        b=jqH+17B2cwigJAZXi3lo66s7wBe0ECMeq9BccJOEh2044UcDbroDWG3lGIq/s00m1E
         WdveCKjch9C8i4fOqQA6mvd2wXkIKp/QYHLl98XKDklZWmNiGtV9v61lbROSuytaslgq
         jySARWi/izThkHfvXy2AMQQgAmB3MYmEYQv5n6u2XPbJqTcDIizLIsianxoYEVsgPeyD
         5WnfMAFuh45E3YtlKlp/UuYTUqLCkYZrE94DiOlnZVSdD6tPskZJnvrh9DFrv1H1s9bb
         H9TdEfGf6Ia9HmA01jIWqQN2zIoO9o3b3cCHgwBhsLmDt0XuHwWhKlsvZfOvpBTmsxg1
         KN2w==
X-Gm-Message-State: AFuF++li5WfZWV/85BN+OAoEEODVKo0VbCRYyDdlKWMz6T8hxAvsynqn
	Vl2Q6wQR6uSBHsm6FQdGHlH6qbgVhXqgWpOSUkAI7aLAtQ3BamOg/3BJaDADrRvN
X-Gm-Gg: AYBFou2LHkwC4c/ejFp1rO2rv3oheX15cEqoj4a/uey6Z26wYlLvlUvJ1fJHGhRZ1KB
	jiEYkeI866KxztxO4JdJ8hI4ZkHyxkAUvGrJ5+a3blNdW2X9LNxf79BNm+8heqzTnqSw3jlm58T
	kDrQjJl6DNiCTn8oEt2ilFMEhpSytWMUcZjl/B3ra+vzcc9dTDyT5gNaDtHSNHxw0666/EdGKY/
	iXqaa5zkiaIqX9nyFnfOf9WfGhebqV08MA2mZm1sMxIXP0PTG9GNp9YBdAD80eJh/aQ61oTKf73
	bf/26MbW5nM0nIbAjfEuVYAlPC3stPDQEviBwEbBgkvjHSm3qXG3c6eASX7dLNFti/j8tubmAda
	bawnORlA3kBGJI+qfGsKbUhvOpByTNVuEDsc9wvHwUw6LM6mesQ7NZvKYAal3lZ6ezPaItd8SAp
	u6rYcjdcEY2mia8G46hFYgXnZaz9EklHDtiA3Jheo6u4FEZy/uoi1jgP61xu4vC4wmwncvKClru
	nQnrvfR17lsAoVk/3Hzqh6WCloYTeAJ+YxiMmqVQGBNDCQS5FUx1LpG0ns5KPabD8drkYNl+Gm9
	A2c3xLdXzANMttbg5C0LJPHiU5YoRRrboSzjTJeZxIe08zGb
X-Received: by 2002:a05:693c:41c7:10b0:351:13b4:9c59 with SMTP id 5a478bee46e88-35113b49cb0mr6822345eec.2.1791139710731;
        Sun, 04 Oct 2026 11:48:30 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351270204e0sm7754374eec.1.2026.10.04.11.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 11:48:30 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mips@vger.kernel.org
Cc: John Crispin <john@phrozen.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rosen Penev <rosenp@gmail.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] mips: ralink: mt7621: avoid casting away __iomem in wraparound test
Date: Sun,  4 Oct 2026 11:48:28 -0700
Message-ID: <20261004184828.31284-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CPHYSADDR() casts its argument to an integer, which strips the __iomem
annotation from dm and triggers a sparse warning. Compute the physical
address from detect_magic directly. The result is unchanged since the
sum never exceeds the 512MB KSEG mask.

Fixes: 4ddaf88aadd3 ("mips: ralink: mt7621: add missing __iomem")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610041411.uJXWXF8i-lkp@intel.com/
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/ralink/mt7621.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/ralink/mt7621.c b/arch/mips/ralink/mt7621.c
index ae7b8cfedd5f..2d10c74b13c1 100644
--- a/arch/mips/ralink/mt7621.c
+++ b/arch/mips/ralink/mt7621.c
@@ -65,7 +65,7 @@ static bool __init mt7621_addr_wraparound_test(phys_addr_t size)
 {
 	void __iomem *dm = (void __iomem *)KSEG1ADDR(&detect_magic);
 
-	if (CPHYSADDR(dm + size) >= MT7621_LOWMEM_MAX_SIZE)
+	if (CPHYSADDR(&detect_magic) + size >= MT7621_LOWMEM_MAX_SIZE)
 		return true;
 	__raw_writel(MT7621_MEM_TEST_PATTERN, dm);
 	if (__raw_readl(dm) != __raw_readl(dm + size))
-- 
2.56.0

