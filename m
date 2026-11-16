Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825102;
	b=LZSQKKra8qe1/k3mKIBiccTNJvgtrodPD1lSH/QwegmBytRwu7QCGU0BPaCkG5utaN7N
	 KWUwWImdYXeyxSZNymw8ZdKuS2l7ixO2jl8uBJo3oibwMNye2Kn7Psl9+J46Osn4+j1kK
	 +nDydceD6+vhBfmPy4skSnJwA2V4fIArlUD1eQxbpxhIcgz+046ydlov3SL1KyajluDxz
	 k7OiF+H+HTwxt2Lhp5hK28DeJD3nHxlend2QPcQO/5KYbF0lXTpqw5bXqF7dbB+XH5a23
	 v0opkx9Wbxx89BZcwbR3W46az2yDoJzWVPA5vK46GOLgdcAAtubDNepq6XZMPsPNqfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825102;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ZRNPs/LT+6XmOTreFUizMBTt0H389mHgExrykkUO7W8=;
	b=OQNx7zAHZj+Ttl6BpTNDsHt0EliUjaWhOYDL7F7H4cwQPae0aTDLFvF4DNpsn3zaOc2Z
	 Hz5C/KFjpAhYxxnIWJTNkjPmQ/RZ6gujp0IIBbwmEOsh/fazC7/Ws2xNbMh5z/swmQTK2
	 XY/5EDJZkLuomLx9EpC79zpfso5pdmpOqByqVXsY2E9tJViyHxBWO28FSqvBwM1VGGTcO
	 JzhnZtW9A86bz66Amm+y7aC9xrCUeLcgq4kjgDISSWZb91RX8erBo1j1KybpAwQ97HoNS
	 lXksMeV4cycvhKW72npoBlreyHlctSmazzku+PhJaymLDu+B0sbSqpiRW4wNQwzvamw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LTmTvPl4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477F3606A89E
	for <linux-mips@vger.kernel.org>; Mon, 16 Nov 2026 10:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LTmTvPl4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C2A1F000C6;
	Mon, 16 Nov 2026 10:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794825101;
	bh=ZRNPs/LT+6XmOTreFUizMBTt0H389mHgExrykkUO7W8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LTmTvPl4bksGyQVLtSqXowkTwzMs57YFqqNQ+5s03Ivjsm79iHfDMaygWQ+rlU4jb
	 Mb9STu9yTQA/3j8zkLqOyW6ixNZVpILpdaTRpWgrc3QlJema77ex0GxyHoe0505BQo
	 v0y0t0UyahUTgB+vIe3w3deWF2romEidwMTk2h+7/wPYrtJr1WyaqraK0gREc61Uec
	 Ebzx4pZscgr39DoTt3WGy3hQGKE19bDs8ll8MK2OfQmfqBeqeImpuGMAZRFaH5kvVl
	 izZjJIRjwzjxECxPRw6AUHZKMXOPPNGrLghSPRITE9K5l1946NNBk3pT8E7LefH6B7
	 rLIeiZeFYofCQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 16 Nov 2026 11:30:30 +0100
Subject: [PATCH v2 14/64] drm/ingenic: Switch to
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
Message-Id: <20261116-drm-no-more-config-reset-v2-14-0bb471f4d1e0@kernel.org>
References: <20261116-drm-no-more-config-reset-v2-0-0bb471f4d1e0@kernel.org>
In-Reply-To: <20261116-drm-no-more-config-reset-v2-0-0bb471f4d1e0@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1495; i=mripard@kernel.org;
 h=from:subject:message-id; bh=ASvQzTlOpZn+fBlvgsv7zBnyTcy5fielArqHW3YjGJ8=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm/brvFy/H7Pzd2PFgYtmhngsJFThaTCm4h8dtZ7YE9B
 xU05jt0TGVhEOZkkBVTZHkiE3Z6efviKgf7lT9g5rAygQxh4OIUgIl0X2Js+PE2Xfv4W072C+n/
 Pd6c8td+PPVDh4hsn3TVrB6/jIN+0x+c3bZv4drSLtnDS9daqr3OYWzYz7V1/uzJbBaWzy8XK63
 YbLzSSkt5ksTW6GP8j60TnuukF57/uvjTmkMqDr8mLStXv3gaAA==
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

Acked-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: linux-mips@vger.kernel.org
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 6acb7d2f25b9..c73eeb95dd3d 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1362,11 +1362,13 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 	ret = drmm_add_action_or_reset(drm, ingenic_drm_atomic_private_obj_fini,
 				       &priv->private_obj);
 	if (ret)
 		goto err_drvdata;
 
-	drm_mode_config_reset(drm);
+	ret = drm_mode_config_create_initial_state(drm);
+	if (ret)
+		goto err_drvdata;
 
 	ret = clk_prepare_enable(priv->pix_clk);
 	if (ret) {
 		dev_err(dev, "Unable to start pixel clock\n");
 		goto err_drvdata;

-- 
2.56.1

