Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9671522680;
	Tue, 13 Oct 2026 13:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897556; cv=none; b=QyQjb4cUjyHLBCAquyWXyDPUpbXY5JmnnC4gegErT66Pw+hFQfBerfQdRWgDGqsZSi/Na/+TbXL59dXkeYaSf/oTwvEQSvq2af509ZYh+gMWvYucZCvVtmE7+JQakBHhaLmJA58Odv1tI2Fh2lfVkyX0OqvuBZOhq4EmijuUg74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897556; c=relaxed/simple;
	bh=GCPE44EIJgQTt+9YZiFhAUObC+Q06Gef6UQXFVc/4xA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q4U5M2YfPVmi8t9rWLrcOqYpiwHbhQpaMIETz/DCvnP+iZFvAL8mENksMOPVc2yHHUfz2g2xiWPNaHRat+PB0+bp8uEwUQcwbD06XyHTalGgZR1EvWBLKXMnt8pbh2gnjuXYYczeXaEtoB1DMAzUT4GZUmes6P1jiHFm5ZcMofg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n6LsSa9s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n6LsSa9s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C0DA1F000FF;
	Tue, 13 Oct 2026 13:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897555;
	bh=BpCFtZoKTHp4MPfg5OGXtFlHMY/a9jfgFmzxIFEokDA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=n6LsSa9s7TFZhaAyqdIMgkY6r1g4OqV0x3vJmZIU+FzyIBCKR0/xr8rwyl1gryhKb
	 cs9ifrbobEK4Bp3Wpv2fsRhrQdNfFoPXr9uTRSTBRYl6rprf0D/TUGYrcyyCxdTEzY
	 /3XSmVd/ZhIHd6w0JrB1Wy0S5YDmP46jmCHBDeTzGBNYSIVDk/AaYlzI0f7oo0Yg2Z
	 gQUytgUXcIz4yUNYY1Dt6HT1hKosty445hDNkdwDvHCWzfxIcH36PNETMoO7fSPyUK
	 ouKrXz2v7c4jsfUgaUktTOCurEggoabytkMvZ+xCeSDJCeeGSsQzAba+ws/X55bOWp
	 LmXb3OpeUxahg==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 23/53] MIPS: SGI-IP27: xbow_probe(): recognize KLTYPE_PBRICK_XBOW
Date: Tue, 13 Oct 2026 15:16:43 +0200
Message-ID: <052c08ad27b1b882b27b3ced51f56194ed670637.1791890466.git.kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791890466.git.kaloz@kernel.org>
References: <cover.1791890466.git.kaloz@kernel.org>
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

