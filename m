Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3917F476054
	for <linux-mips@vger.kernel.org>; Fri, 21 Aug 2026 14:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787323198; cv=none; b=P4IYmSVizW5T891re4HH9iTp0trXe6DWLDG2xfgVpHQm5fRq/6xTQbi1+CVgUDr92gzc50eZGWSo22+lvaDh/9i9myeri2zUD2N2jRoLR31wLeSmCCLjHRUkTLsMfIeyYwjOHHvPz4UeXALD07nVrkRnu16zli1omsj1jSd4rcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787323198; c=relaxed/simple;
	bh=9s0b2WoVTn/Tu5Xko3JwjBbS4nM3EquEKacg7YZMpNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VMlUtLdDfkhJQgSaGe+7iVXBx7WSfoWTmGwBcp/9lUdqXr/caIfgG3TaPLolBNfWFO7elimfbQiRbr1UwEVAexVUIKcpeTBwuQ5OS2X5MkAncl71GrOFEcAzMU/mgeglLF/eX225lKCg+9WTPPLDWXzlHO0bRouxjPIv2t8yQ9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MCx1wzr4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MCx1wzr4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B3281F000E9;
	Fri, 21 Aug 2026 14:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787323194;
	bh=x1mgI2fZT54f9HrvSa16vHpwerZizUlIS6tfngSfVXw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MCx1wzr4VFgci9nqr5vT0RN0+4KbYZRQ0tk1c5lXrv2CTMyNZgks3D30bwqc7ZcbK
	 xAsvMNVd1qOmCQ485UA0NmR4qDzlXp7qcr1D56s8jJKhX9xvXy+r51veOOCyXT8xY4
	 VGoLhcFgRDc761FFP78HFktqSEbNINaZ9yV9RbvLXnUFhBqO8qNBp/lpZHXTzdZi3e
	 pcSZ/N9AoQFs/ltMOqKsjoEAf9I4k7YnNWA1s4yACxyvlmRItxRAUzN7E/w/WCCbMF
	 M/HqXE0OYGOMkVGtcypi2bhjQf0KlBJKsQxSZGrkMp4KR9nO2FWqufrX48InZRGd82
	 35aP+oj6Ail6w==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 21 Aug 2026 16:38:49 +0200
Subject: [PATCH 13/70] drm/ingenic: Switch to
 drm_atomic_helper_crtc_create_state
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-drm-no-more-crtc-reset-v1-13-fb793475c05a@kernel.org>
References: <20260821-drm-no-more-crtc-reset-v1-0-fb793475c05a@kernel.org>
In-Reply-To: <20260821-drm-no-more-crtc-reset-v1-0-fb793475c05a@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1197; i=mripard@kernel.org;
 h=from:subject:message-id; bh=9s0b2WoVTn/Tu5Xko3JwjBbS4nM3EquEKacg7YZMpNE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFkdSX+lt26U7z64aWk4743vK9/HZjFsMeHO/RmnXpn67
 0nFy/CAjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRf5mMDS0mV/8dvVz4udG+
 I0180o0dJ6JkrP7wa77bIMX7iGdSTKHrzenanA+LQ8w+bZ2ewCOjwtjw5N7jfUujemeF878xFA7
 fcURK9IZbpFnW3JIjSZVvDU62LFz2v0O+4PbpZbJmta8n9gUDAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The ingenic crtc implementation uses the deprecated
drm_atomic_helper_crtc_reset() as its reset hook.

Switch to drm_atomic_helper_crtc_create_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: linux-mips@vger.kernel.org
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 738a80b2550f..67374c611583 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -995,11 +995,11 @@ static const struct drm_plane_funcs ingenic_drm_primary_plane_funcs = {
 };
 
 static const struct drm_crtc_funcs ingenic_drm_crtc_funcs = {
 	.set_config		= drm_atomic_helper_set_config,
 	.page_flip		= drm_atomic_helper_page_flip,
-	.reset			= drm_atomic_helper_crtc_reset,
+	.atomic_create_state = drm_atomic_helper_crtc_create_state,
 	.destroy		= drm_crtc_cleanup,
 
 	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
 

-- 
2.55.0

