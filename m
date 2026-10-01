Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156B341A554;
	Thu,  1 Oct 2026 16:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871236; cv=none; b=hWMVAGa1VKLnoYHPQujqlEdpN7gDE9LgHrUKwKc1KVBODqe/bSC56vcI3L2EGJlOUR0oAkyC98ywlSm+ao7W4lkglq4s1cLKWh5hHTtNk2LwXPoaROAH9wZyqgCTnpdvqUhk246CZofTnQb89qy8LxlL7Uee7cjku30PJ+Rgta4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871236; c=relaxed/simple;
	bh=GCPE44EIJgQTt+9YZiFhAUObC+Q06Gef6UQXFVc/4xA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uq7IbR/9ODUdBVA2Teq5MpkrlmlFU+mMrz3qtPZrkMQyPL8q7Y2Mm/JFObFCwZAcjQ68RUx9XQcFq229qurxxsHfKVVv7NKY/MK7bFp4h7DnrVuXpjaSlyNCZT05Fu41Gy/IhgjwOBn/yDibz5axliHnm7PHyLMGrb6Wjl9NtyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GMWUIeJA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GMWUIeJA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEBC11F00898;
	Thu,  1 Oct 2026 16:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790871235;
	bh=BpCFtZoKTHp4MPfg5OGXtFlHMY/a9jfgFmzxIFEokDA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GMWUIeJA9+eMR9mtUGWLhQRxslbDyLNK/xnR0c1IVw6QVehcczrM+CRda2UMLCshn
	 Q80P6pTIefeHBi3luzhs+o2lmD3hFiQPnp/T9bebqgCsp4iU0xmvMV/v2RrOxkzx97
	 OiEj+iROsC3nUVu1elzQVh+D/egYd05jAdxmpx8YwoU7AfWU5OtXR2IEzhzqexdb4/
	 1cDbHNG2CTK2+PfzdaKyMTDAGrFT5jWUypWp+xEwmHOYDADVvN98MZWJd1bbcUkMya
	 8Jcm5kpSH6/GOQlwmnk5J57NLDA4k0c80jQH7OUqLDqMtMczZYcdfJ015xzpwuo4Q/
	 Q5btHpH4aJBHA==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 18/38] MIPS: SGI-IP27: xbow_probe(): recognize KLTYPE_PBRICK_XBOW
Date: Thu,  1 Oct 2026 18:11:53 +0200
Message-ID: <ffd72498aac1c0da37e569952ccfb219880d0860.1790857966.git.kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790857966.git.kaloz@kernel.org>
References: <cover.1790857966.git.kaloz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An IP35-family chassis records its crossbar board as KLTYPE_PBRICK_XBOW
rather than the KLTYPE_MIDPLANE8 an Origin 200/2000 midplane carries, so
xbow_probe() found no board record and never set up the crossbar. Fall
back to the brick type when the midplane lookup misses, and warn when
neither matches.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/sgi-ip27/ip27-xtalk.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/mips/sgi-ip27/ip27-xtalk.c b/arch/mips/sgi-ip27/ip27-xtalk.c
index 10834880c261..baa937b474a8 100644
--- a/arch/mips/sgi-ip27/ip27-xtalk.c
+++ b/arch/mips/sgi-ip27/ip27-xtalk.c
@@ -159,8 +159,19 @@ static int xbow_probe(nasid_t nasid)
 	 * need to probe xbow
 	 */
 	brd = find_lboard((lboard_t *)KL_CONFIG_INFO(nasid), KLTYPE_MIDPLANE8);
-	if (!brd)
-		return -ENODEV;
+	if (!brd) {
+		/*
+		 * An IP35-family chassis records its crossbar as
+		 * KLTYPE_PBRICK_XBOW instead.
+		 */
+		brd = find_lboard((lboard_t *)KL_CONFIG_INFO(nasid),
+				  KLTYPE_PBRICK_XBOW);
+		if (!brd) {
+			pr_warn("xtalk:n%d no midplane/xbow board found\n",
+				nasid);
+			return -ENODEV;
+		}
+	}
 
 	xbow_p = (klxbow_t *)find_component(brd, NULL, KLSTRUCT_XBOW);
 	if (!xbow_p)
-- 
2.47.3

