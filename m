Received: from out203-205-221-221.mail.qq.com (out203-205-221-221.mail.qq.com [203.205.221.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406D34756D7;
	Tue, 18 Aug 2026 12:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787056900; cv=none; b=Xx2UcJxvi7gORFlPjQFzD9Dsx3HVxzvDN33fwTsnAk1LpKW/lm1SOh6z/BVXVrclBdqxXTWPEA2viNAyvDl2MieVNwuM02Bz/74o21xIHlFyfCHV9wGfp94LRgUYfj5qhPvjAenJABJZ3lm2njLuQuheTtGJRei2z0LV/uq+oUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787056900; c=relaxed/simple;
	bh=K72c90pN7/By0X7h4ct4vCn51FFYOARRU3WPD8WzNFc=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=H3CVBhQqle19MhqrM11cc72+LAvGl3jxZu/q6gzr+BGeawCnb/sU9XpdUjKcvM1o6t22GKtFHL8O6l4q5CMiO6uGI6waCOFzOJvxwG5i1aEY6yuc3v6JUqVYiLJXqBCO9M6ueIFoay6gs2Q4RIZ/cy1vOuhMDVeUVnyS8RoY9iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=k3xoBKCj; arc=none smtp.client-ip=203.205.221.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="k3xoBKCj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787056895; bh=KDheSNGdrOpJRRl/5TKzJCcwqMBTUzRBmu6g0kUgW9E=;
	h=From:To:Cc:Subject:Date;
	b=k3xoBKCjfvl982hYGFWwwYMobEnGEGKEt5oz5K/GKcHIrOPFCM2ZdEOqQwoHMspEo
	 AUmd7Mk9wi4o7xMik/083vzMoyCzATowwFnMZQAFAExSYXmUTg2NS9DSTn+9p/5zI1
	 XfR/gOO7VApI3Q6PKJqr4NjNrfrPym5Rl71Zv2Js=
Received: from ws006419.mbzu.ae ([5.195.0.150])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id A60396D7; Tue, 18 Aug 2026 20:41:32 +0800
X-QQ-mid: xmsmtpt1787056892tu7hznmus
Message-ID: <tencent_BE00B17EBF2A95EADD8B80203B745B9C7609@qq.com>
X-QQ-XMAILINFO: MTEKjEyAppcs5kHBZsuQVkpQmp0kvd+zO15Ue5hERsjlr+kTSyLqejk0Co8CPZ
	 EeVUv6pcSZWErp7S2hrw5Kx7Bs6LsLeM8cUA78eXe8qIFMPojl6Pfi7AMwzGnRLQWaw18DkLF8Wd
	 Tzd7VwibTpO59hM57Pf6q2Gbyj2BSQisom7Uww0yGzy8DbXsYp/ZWXhsI+m1beu/4ikDmmG26p+0
	 X84Ltsa5IOyY7dMSsW4iRupWDYTR97Ehh/j9fVSJhrdeM04MJKWQsMs//g/vdk0dNVemeOlyXAqj
	 /evFHWUME7CMu2uapaYTxgcRI9nmIkwv+hXIxWbySpn5f8GxqE4PPpPiIsqxMaIhNcwy/Wk2XAzM
	 4xVmRajpHBTPZMZG8Cu2E57voZh9ypb9EQLM82DQYcQsJjZgeUHBHvY7QQix8iqSF5pHP0jVFqmh
	 SblUAB0e8E0KIeRRvssqWVfI8+4EqS1wRzDo+eMEkfFGGpDjOS6Fo86CNyKRHe0v9cPsjrNyQBXD
	 oXJz4iH4hQsQ5SH/gyfc3DEn2DsldPKv2FNpLKs2yTkT2nPOZc3dxOYwe7Qvl6AH46duOWPpZTgD
	 9XzOFMPJJNBlm7Q3yQYGWXELoWoouctWXbjstoRj6YRTuVleIql2PKPvAVtNSD0SnteXRKU178BM
	 wuERnrc51Eay6tJ62WGmG3B0u8OjZhvDpU8/jAm5OcJHBYGI5H0ouAKbFG10a2E0k0LPWmRlh2Sc
	 pECiWjhVUmDnIZZQhx5S4icn5Wt4mRt1t0UCdsde0X53BfuGdwIQ+OZj1Hv6trm7s94sUgm6untV
	 DICyj6kMc+tNTgDMbxepZSYkCCMoZroOnSf8rEI97g3M5WqtzKU2bmS6pvsvLVU2AhSsfW+gkilw
	 iQtAPQN0iPLPT53PaRbeEBjkl8fGQuUq15fCrZ/XqBlEp7sUQjs4YtDRK7bsQ+9hOAVuJ2yVFIg5
	 bBBORsCPTrLvQ0Hm4CSf0i9cDWVah2blaX5WuDGTFOVs6CLaILw9gWIqEgr8m/PQofQf9M+1Ug4q
	 vA21U55e3v1awdx+ymDVhtFEeegvWQlt/MvA1W5N6VQxzLNNaR8C53UyTOiqoETFcxnOM+SSrF72
	 nJvgkI0bq4it6Rl+fBMrTCKYXImHd9yVvMDBGG
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Jiawen Liu <1298662399@qq.com>
To: Paul Cercueil <paul@crapouillou.net>,
	Vinod Koul <vkoul@kernel.org>,
	linux-mips@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@kernel.org>,
	jiawen <1298662399@qq.com>
Subject: [PATCH] dma: jz4780: handle clk_prepare_enable() failure in probe
Date: Tue, 18 Aug 2026 16:41:31 +0400
X-OQ-MSGID: <20260818124131.247058-1-1298662399@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: jiawen <1298662399@qq.com>

jz4780_dma_probe() ignores the return value of clk_prepare_enable(). If
the clock fails to enable, the driver continues and may later attempt to
disable an unprepared clock on error paths, leading to unbalanced clock
operations.

Check the return value and propagate the error immediately, avoiding the
erroneous cleanup.

Signed-off-by: jiawen <1298662399@qq.com>
---
diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
--- a/drivers/dma/dma-jz4780.c
+++ b/drivers/dma/dma-jz4780.c
@@ -903,7 +903,9 @@
 		return ret;
 	}
 
-	clk_prepare_enable(jzdma->clk);
+	ret = clk_prepare_enable(jzdma->clk);
+	if (ret)
+		return ret;
 
 	/* Property is optional, if it doesn't exist the value will remain 0. */
 	of_property_read_u32_index(dev->of_node, "ingenic,reserved-channels",

