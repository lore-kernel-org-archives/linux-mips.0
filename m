Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8F25383C6;
	Thu,  1 Oct 2026 16:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871270; cv=none; b=o/Wg2aE5cU4zuVfk39YDuu5sC2aTTZFXnCp+E7mUY5GkNgOsy2R+sFwKXsgNnmG+6bhod9E6dxekFDARh1mv94LbMyIxF9NZ6BCDbvS4IG4oH31SCFtcL6iS1HpniTVZQGGmpECna4Wf1t0yOCZJEZdDia2YQQyN6zDVQtYSeVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871270; c=relaxed/simple;
	bh=X8QD59jgFs9z/XcuwapVUFEIKoBzmbvXnF4hMM2zff8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qPSFRXaNQZbj5K9N4Xv2NZjv0eFujYEJyubI6i+8vJwaFf1vX0BbkmKhYMQrz/WNCh7wpKs66d/kJRbWdr+cSyF28v+LZo86vr3sfElWYNcnCQ+E3n71hG05dSB64C0PMzpoMjYidjfD5a1Y8oZ46HCvdEtMf3hfzfdEO8zeTyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Il6w1wlr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Il6w1wlr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA1E1F00898;
	Thu,  1 Oct 2026 16:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790871267;
	bh=x06R1VONYwFuZZyqpZFDbKhu+kIOY50B4uQJP8aJJzg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Il6w1wlrbn6CB36WhOhmVmflDEbDqng7CFCY7A0wfdU4XVbpqm6NRFof+OWQ4PSZ4
	 IfV8Vxj2xPZAPV2RITYYhYdTgf2HhlQjNkmqcH1cY0+0PQEp/Tg9aQA1uzobM958ny
	 bJMqyPCCTMBHoqAsOoG/e8rvOqI8IPiYsIxk+TR/c96udR/k7QnXq1dGkloo58gy3J
	 cT8uqXmxCP666E7BP/jjrBAxfOqEIuJazBqWvnA9B0qqeb0zAO+6CguPk6fr2DQ5Il
	 YEoN1FAvNDGtuJ+iS+nzZt5IXoBlwV6BAv7iUYDwHqlVowEMSib4cghKuinXsCOJqL
	 aMlw/x0Gf/yow==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 34/38] MIPS: SGI-IP27: report a Bedrock machine as SGI IP35
Date: Thu,  1 Oct 2026 18:12:09 +0200
Message-ID: <bef86180e9a134c437b34190eeb2a463d5294507.1790857966.git.kaloz@kernel.org>
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

get_system_type() answers "SGI Origin" on either hub generation, but a
Fuel or Tezro is no Origin. Return "SGI IP35" on a Bedrock hub and in
the node banner.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/sgi-ip27/ip27-init.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/mips/sgi-ip27/ip27-init.c b/arch/mips/sgi-ip27/ip27-init.c
index 15811fb3cdee..c92f1bef692e 100644
--- a/arch/mips/sgi-ip27/ip27-init.c
+++ b/arch/mips/sgi-ip27/ip27-init.c
@@ -111,7 +111,8 @@ void __init plat_mem_setup(void)
 	 * hub_rtc init and cpu clock intr enabled for later calibrate_delay.
 	 */
 	nid = get_nasid();
-	printk("IP27: Running on node %d.\n", nid);
+	pr_info("%s: Running on node %d.\n",
+		system_is_ip35 ? "IP35" : "IP27", nid);
 
 	p = LOCAL_HUB_L(PI_CPU_PRESENT_A) & 1;
 	e = LOCAL_HUB_L(PI_CPU_ENABLE_A) & 1;
@@ -150,7 +151,7 @@ void __init plat_mem_setup(void)
 
 const char *get_system_type(void)
 {
-	return "SGI Origin";
+	return system_is_ip35 ? "SGI IP35" : "SGI Origin";
 }
 
 static inline bool hub_is_bedrock(void)
-- 
2.47.3

