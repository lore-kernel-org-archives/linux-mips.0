Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887757;
	b=KF+rJ/PLIYFUomnIjtSwXC/Irex3BHGKsTogk7AQ34oCwuGtEFa+JNti+Qk2SAyxpPhw
	 V2mnkJTZw2slKmTPkDLeF2YHXiOvVV2lGUqqMJu/nUjz3ezrM7zZAMsqsoam6vp1sDafu
	 D370+A/vEYXcTiNMNdcjQkmS6cRJZmlczQXI/Qn5P02oSoC2Sxki6T2i1lzTnlFUTvO6J
	 1quO4BsSKPHsroPGUP4EhZwXWz7iB8yjnTE6IYMYVbh7yB83af7H3DIJmUXJjqL9iL5vz
	 mgsmqqcICbkg0AZi56RttPHCdQj7QqBeUu/BuxIYxJwo+WxwuZTZ/bQM7lXr4wOSB8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887757;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=/RuyPDJSOQkSvtGZQ699xnBIKRw+fZZ9SK+IyRUFhM0=;
	b=ZeUYil2vl6OM4+lOXD9PYVBS4dtj4psq3MEHkFaEAJNgBSnodnXkl6i4ATJQ3RlqQoMo
	 0u5Lr2DTP5am1GUOQ70mBFAAslyOhveOyeBlI25IxtqPZlirnjuZVfVdxucn+wxIQcLx/
	 pNW/AKD9RByDSrOyadTVqFcAhlN2v5gc6Fg78zR9493bkOFB4oNQm54yOWBWRcNQPGCzd
	 +ejd/viu/JoIIlmj0yvyLH+9Wic2UznUY106Om1FiB6XQ/InWbHnWcD8p0TEY8qdXvk+9
	 Bqpgv/q33ErBLxrPFSHHAroLlmyFE46CdXBDQ238W4PCRuPdzk+nohiI2+FS4utL8gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="hZmhZ/2/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F74606A31B
	for <linux-mips@vger.kernel.org>; Thu,  5 Nov 2026 14:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hZmhZ/2/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 893061F00A18;
	Thu,  5 Nov 2026 14:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793887757;
	bh=/RuyPDJSOQkSvtGZQ699xnBIKRw+fZZ9SK+IyRUFhM0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hZmhZ/2/szfewsamcJfMZ86kqEsICe2KyctZ7ARHd+zafsXO6O5bItREVxpUC30Ok
	 a1stXR+cLTJ/5ieN06ngR2ToAUsqw+MIt918VQS0CB37YULeDURMVg3hAkkonaaXGf
	 L4Mf5ls1JTBJl6yG7R0hEeXmtknIa+BepwvGl9rfvHsSRRLUnZm9HGAjU/ahnO+s3/
	 j9qVtJGkzzxIfnwaGAwwQxa/epM8/SQ6D3etf4nGechdStjqK9+vHqOGLhB34+D39n
	 uMw5BUTcx8vcUHsGnEn1uLf4oGvdnAbo22n9zIu7yJ+raMe3Remfq24xB9OdDpPdoK
	 p3SuJws+Uv4lQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Nov 2026 15:07:37 +0100
Subject: [PATCH 20/83] drm/ingenic: Switch to
 drm_mode_config_create_initial_state
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-drm-no-more-config-reset-v1-20-763560c2cc3f@kernel.org>
References: <20261105-drm-no-more-config-reset-v1-0-763560c2cc3f@kernel.org>
In-Reply-To: <20261105-drm-no-more-config-reset-v1-0-763560c2cc3f@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1219; i=mripard@kernel.org;
 h=from:subject:message-id; bh=9SWtkslaqOuBdZr7dXYA3MFs+LezwP69O0+5JcuvqD4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlvepfcZfT2O5q5ci/3Ng/H4CVijhdvt+Uwf+Vz2nF3o
 nq81171jqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRsguMDYvqdHf9czvmuGeS
 YYFRSvyTmv8/RaKaTtikPtV8d9H9mfOqHqWG855ti5Z616bv/eujz1hf+HuL3dc7636ceavN/Eb
 opWR+/L3e0udbTEsTymfM5Hk25b7WR0uljTXBRYkKV+TOJIsAAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_mode_config_reset() has a dual role: it creates the initial KMS
state at probe time, and resets hardware and software state during
suspend/resume cycles.

Since the two roles need different behaviors (notably for objects like
drm_private_obj that must persist across suspend/resume),
drm_mode_config_create_initial_state() was introduced to handle only
the initial state creation at probe time.

Switch to drm_mode_config_create_initial_state().

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: linux-mips@vger.kernel.org
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 625ec76cf04d..63198fd59498 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1355,5 +1355,7 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 	}
 
-	drm_mode_config_reset(drm);
+	ret = drm_mode_config_create_initial_state(drm);
+	if (ret)
+		goto err_drvdata;
 
 	ret = clk_prepare_enable(priv->pix_clk);

-- 
2.55.0

