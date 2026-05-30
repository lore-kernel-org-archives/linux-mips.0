Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F421D435F
	for <linux-mips@vger.kernel.org>; Sat, 30 May 2026 14:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780149720; cv=none; b=FxVrFAWWuGl3igdjIDkUTeYzX7x4UTZp+GshWUKwiq2b2iUi5Wbfu1hMho3q9IB+K7e9SomsxfdisX1GDNFzvwKNXTWRbXnceB70CsUtG5v0itkUTKwhDxdEjxUXwQ1df4ueb6LYwUDbYOmj7Ga2AkrMdOAPT8jb+4SGlJUUMPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780149720; c=relaxed/simple;
	bh=I20Q//RFK7ao359GomgqHXMDHn8VA8hI476OwudF+zM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gnIenYSY2bUADrvbllZPTBZ7U0gyJ8pya5eJOk211RUwlVFIEvCUUwoqXyzY0sLTt92Q69f782S3DvNXdO609kDRnJIJd1ui+vts8bccrCMbZlNbtlQ1Oufy6VcCyZqSy4WkO8C3520Wq1V3RAK18MBDLYsv07frGq+jWZ9SmwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eMuGFhgE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eMuGFhgE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 636541F00893;
	Sat, 30 May 2026 14:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780149718;
	bh=86RQseK1x3RYpcqAxhfX0PcWRDq0d0elpvrh0WS+2CQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=eMuGFhgEhHn+uJz393LklEZg8Fbpbaesaox8eGpCPFva4RB6U7/x3WKrIehKSc4mL
	 3otSip6BL2t7Eq+ASRw2tGcqYE/aqZro5/3RukuMaDtzHu0Za5SHRVjpWSIBpMcNvs
	 9GtpM2km4KLSi+/RhFUuES/suyFuDNz2/25EkMKnY+3t88QNdG/QDKI50VZT5MZPCz
	 IDKn5+AVfs24p/StnVFS8aq+23UtRF+iGhsfSUvPvKhbSiOgZXb2C7GSkUYJjo5qD7
	 83qAAIVY67S5jM//CovKtdV51y0EpGpGpLGhWpXk6mzqmXElo4mB++3HGZDoWQc1WZ
	 5p/81GKwy2c0A==
From: Maxime Ripard <mripard@kernel.org>
Date: Sat, 30 May 2026 15:59:51 +0200
Subject: [PATCH 46/76] drm/ingenic: Switch to atomic_create_state
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-drm-no-more-bridge-reset-v1-46-875d828d31bc@kernel.org>
References: <20260530-drm-no-more-bridge-reset-v1-0-875d828d31bc@kernel.org>
In-Reply-To: <20260530-drm-no-more-bridge-reset-v1-0-875d828d31bc@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1433; i=mripard@kernel.org;
 h=from:subject:message-id; bh=I20Q//RFK7ao359GomgqHXMDHn8VA8hI476OwudF+zM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlSbz0ZF9wNvjZR8/NzrdZIngcRwjM8jnTmhAtxls84r
 3uJ6eDtjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRaV8Zq1l7BfYnS+x7rauW
 8O3BqevHq0os3/ozvPz4IF5jzbbm9OTl7BtUKtXYGectt/sXtMvpF2PD+mXTK3ocFv74+Jrljli
 38r3eWh6nZ0yWUW9X236eXWy78GLhn/+euk18Erc7cj4pLrcDAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The drm_bridge_funcs.atomic_reset callback and its
drm_atomic_helper_bridge_reset() helper are deprecated.

Switch to the atomic_create_state callback and its
drm_atomic_helper_bridge_create_state() counterpart.

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

