Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892686;
	b=3VEdYPKM5RR4JNjWfjIA37R7Mcoeoql6y7Q7vssd5Y3qozZD495jo52bt2ZwhOu4uKWM
	 lhKkv2gXa1p/QTkGRKrMiGzhOf3w2o+uWSDcsYLDhK+hY/lmMKPBC5l09m2yfZDZCLPgP
	 ABc8ix8aKrkhZqbBuqdXXNl6MmbUQ9TD1f7MZSKYtKrUZkxDF9Aq1VZx7A37IjON1O1pP
	 /kCFj13JMvkZiPh8Btyi963ZpKFgipWbWRmQsyzpadLkwDRuxfgju3fMpIojc13SqtBg2
	 5R/bM17jHui0Y5iXc/Ep3rkJTJaPVK2HZ3KHwPtx0u2xIhX03uGydv1hcnn3ga0SgRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892686;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=/RuyPDJSOQkSvtGZQ699xnBIKRw+fZZ9SK+IyRUFhM0=;
	b=odcsljlZVYfOpA4rFH82oF2+vuJD1i2G5+I/g6WL7kPgSNL0jv6M4KXbwh6gaCS6Fuhf
	 1ORGSPRKNmeD35egpKEJck2drBAOUi0pkRNMnVf7dAh1EHaLg5t2YQwDcin1drnkIHsaH
	 xEZuMm/dBZ0z/pfc/Rcx8eO06RtEijhw6LJ36eXNN1ezC0HT1xzwI6Hx7OYlFhcWjlOHA
	 YGtkvI53aT9WZNxmfWZ5gAkD32/dIrqrIeFTYLLRmJy2Nn9ecHs1EEFpDvxrs3gbBidJY
	 YJRBy03LxXRz80eZabkpXPDokr/5P06HG8Jd5NeXPPRyoSSRCZMBZQ+ZpLp9UhH9u0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UqiPpiJB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F0F606A32E
	for <linux-mips@vger.kernel.org>; Thu,  5 Nov 2026 15:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UqiPpiJB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3F681F000C1;
	Thu,  5 Nov 2026 15:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793892686;
	bh=/RuyPDJSOQkSvtGZQ699xnBIKRw+fZZ9SK+IyRUFhM0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UqiPpiJB3QyYkOa5ZFfohwKdWzS/k7C93mYTOj0zbyJVpSFD+tlIn//xp1wdr+u/7
	 z8Eu3e5SfgOBOjL61Nr5bg0L1kw6QWB6FxqNidtwvLmsCmmIF+5cHo3XhECWzleY4y
	 qttntWxU7+RQbQRSFcmikIEnQji1VePvwt/Qrlyblx9EPVkeetYTztv6flLJYy8LDy
	 OMYnFRKlmiNkR11xTUmOmkK3e0dMTvAJKseTvbRsYH/ZgXOEZ4D8QztfIDR4cd0Iu3
	 FyJHb+liJzRxF/mCQJ97bSFyDXqeDYKkQofoI81GWSpXcPIUIDlK6l3RjEAF2H+Tee
	 JG1Asownbpeaw==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Nov 2026 16:29:29 +0100
Subject: [PATCH RESEND 20/83] drm/ingenic: Switch to
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
Message-Id: <20261105-drm-no-more-config-reset-v1-20-1f58d1e33380@kernel.org>
References: <20261105-drm-no-more-config-reset-v1-0-1f58d1e33380@kernel.org>
In-Reply-To: <20261105-drm-no-more-config-reset-v1-0-1f58d1e33380@kernel.org>
To: David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org, 
 Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1219; i=mripard@kernel.org;
 h=from:subject:message-id; bh=9SWtkslaqOuBdZr7dXYA3MFs+LezwP69O0+5JcuvqD4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlvFjyzkFFfw58s4LswKMQkfAmXoa6JSt0m0bObr06Y6
 TvfVci0YyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEzkbytjrRD7vG1T4lgWlp71
 myvY6LZu5nQPRuPABVUKYtvdOdUjsqUVz9Q7vF2avGSN21WhgKp2xvqotLUHjnpITlF/dXPjtK1
 hi48oVfIL5AkqCH/r0XoZGLXcYhPLi2nOkbtOpCmxvP/L3QsA
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

