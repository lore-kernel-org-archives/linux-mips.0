Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022D323B638
	for <linux-mips@vger.kernel.org>; Mon,  8 Jun 2026 14:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929517; cv=none; b=WHRivTpEwaxcquERbDtrTV7yWruBlKwaeMQ+I9kKvqpTSyGLhzK4m9c/b8NAFXTC+hqsiE8YpLEWtDyXSeIX9L/yLgmVCp3DpyiXR6NJgpis+Q3o/oRn6LYchaB34yV8LtGqzJpx+tNGXUGZLFzuA4Xoj/wAeJwmzAQKfMjR84Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929517; c=relaxed/simple;
	bh=5IDQC0N9hLwKhzfVctSnD5d3tcGRpXZXrMdmybD+IeU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qAhxJVd0TP8POvcAbn7/Nc1i8FFg9oK74kEuO/weoTQ6lO+Bjt7Uk4a36Ff47K+82KWtJKy81920VBOGGcrussIvjHdWQVBwyDt80gxpHhZsHddoVACPm48g9dTFgFpertN+sKom1m1/4ye7GwiGqQ43BAE/zP+Vi2qWe5ggTH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c89AWtlL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c89AWtlL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23AA01F00893;
	Mon,  8 Jun 2026 14:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780929515;
	bh=LDq+IZOdd0UHKtkjABkpSRlTlhPmfnpQIoaMXhvm7EM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=c89AWtlLwDYJe2spQ0FjraE4eERzvvBbjvTOzPgSnI28UPWIDJvfE2Xoauzf+r5Sw
	 SMiMtREJcElxd0+eMnZ1zswe7cjppJurDxGN5ckE3G1Vmf9C/RQotknieu9rddEaxD
	 lBNsYhm+YwuYCLE+VO1hVxBAAg/xWDKV3/37GdQ6E1LvY0c3uLBT9n0VCHDhYjQVPq
	 ElliafXAcNfy67DPgpXxCoQH9Oy2jJolEL2caaiZQ5X3qmAhEdmF55Y/WHqFpunMiK
	 XWo2RX3QKttTM8r1sP5merYtbvQrZprLLsEnefX+2fv5ShPrrOF7KWiS9kUCSadhyL
	 n1EcrJH/+xKQg==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 08 Jun 2026 16:36:30 +0200
Subject: [PATCH v2 48/78] drm/ingenic: Switch to atomic_create_state
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-drm-no-more-bridge-reset-v2-48-0a91018bf886@kernel.org>
References: <20260608-drm-no-more-bridge-reset-v2-0-0a91018bf886@kernel.org>
In-Reply-To: <20260608-drm-no-more-bridge-reset-v2-0-0a91018bf886@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
 Maxime Ripard <mripard@kernel.org>, Paul Cercueil <paul@crapouillou.net>, 
 linux-mips@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1485; i=mripard@kernel.org;
 h=from:subject:message-id; bh=5IDQC0N9hLwKhzfVctSnD5d3tcGRpXZXrMdmybD+IeU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlql6PSm6Z2zl0+K9Bgy6bCUo8FTZFRp0J0Nib+YTW3+
 SqgnGvXMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACaSsYSx4Uz9mTmy/jbx0uIV
 O+ZN1M3ZoFBz/vyJaRaGac6fp/z2lQwLEeNb7iz77cA1e+59k1cqMNZZfuYruqmVpWL6TfqCw3M
 WIdZrxyf0njMJWvbn+9s08zbZjXsjzs+7xHP3cHbcMx697VEA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The drm_bridge_funcs.atomic_reset callback and its
drm_atomic_helper_bridge_reset() helper are deprecated.

Switch to the atomic_create_state callback and its
drm_atomic_helper_bridge_create_state() counterpart.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Paul Cercueil <paul@crapouillou.net>
Cc: linux-mips@vger.kernel.org
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 42c86f195c66..7e569af22391 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1029,11 +1029,11 @@ static const struct drm_encoder_helper_funcs ingenic_drm_encoder_helper_funcs =
 static const struct drm_bridge_funcs ingenic_drm_bridge_funcs = {
 	.attach			= ingenic_drm_bridge_attach,
 	.atomic_enable		= ingenic_drm_bridge_atomic_enable,
 	.atomic_disable		= ingenic_drm_bridge_atomic_disable,
 	.atomic_check		= ingenic_drm_bridge_atomic_check,
-	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.atomic_create_state		= drm_atomic_helper_bridge_create_state,
 	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
 	.atomic_get_input_bus_fmts = ingenic_drm_bridge_atomic_get_input_bus_fmts,
 };
 

-- 
2.54.0

