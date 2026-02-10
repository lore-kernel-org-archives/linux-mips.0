Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1C333D6D4
	for <linux-mips@vger.kernel.org>; Tue, 10 Feb 2026 09:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770714715; cv=none; b=VEX6+JOKv3jCdTIu8pgC5WrgZ4apxaauJhThO2q4hG8Mo0zE24lvaUawCTio0zDoEJtWKGBUW4sAK9kc44bUTLrtNIZ2nBK5aUPj6zeEF8OGQ/QDI7tNaQ1/3K23+2n4noM+zRcZfucsN8jPtJRSajuxlzrXFWybO5whkJ2ZCOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770714715; c=relaxed/simple;
	bh=3cc14LQq6s8l6cJQEbYbcyIgeKXO7CQ2aFt03lzrcJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ecvbtxAIdwlMTLzGchDryzA0R1FiE7mXJjSp7kPDPrxj8fMbFtdoJocyn3TimHwghkX4JsAHHiNJVU0VJ9fhyzP0064Cl261WgL8RCbTi7AO5obsri6oiRwUtpSL/pH2ut4+biSYgPRt0D92BaSAdXkJxmJdbH1LXCi1cVhp+UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RxOiS5i9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RxOiS5i9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A0FEC19424;
	Tue, 10 Feb 2026 09:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770714714;
	bh=3cc14LQq6s8l6cJQEbYbcyIgeKXO7CQ2aFt03lzrcJg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RxOiS5i9W9pzZilmXJDpuE0qwvX4wCogbbI7HY2vdBDRmGMagAU1swn3cm7RNENNL
	 2MHjtmNYQxEWKpgdPWPiI1QuCwdzlwx9m77haH8kQUcxWdT2l+D0TEEJ3n7t3oUtqf
	 JsykcGxinFrudMfjWxh4xnK8NET/hXf/3h6dKA/5aSr9PgDz1/2pXStQxgSMqZp+Sv
	 F3SSUDDFnmIp8vf2K83l6T5rTwCOh9jzYZnbD/YOibJlI7TRxixu9qZw9NPCLOv1K0
	 +ucpxe96rDBHtosdsYfXZSSmdsCu2Z02vw94DaP8PUdDQhglUOcctMlPUl9EmLsWY7
	 RPpeDxX/aRn/A==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	Paul Cercueil <paul@crapouillou.net>,
	linux-mips@vger.kernel.org
Subject: Re: (subset) [PATCH v4 09/15] drm/ingenic: Switch private_obj initialization to atomic_create_state
Date: Tue, 10 Feb 2026 10:11:23 +0100
Message-ID: <177071465918.1461206.16066343662695065118.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128-drm-private-obj-reset-v4-9-90891fa3d3b0@redhat.com>
References: <20260128-drm-private-obj-reset-v4-0-90891fa3d3b0@redhat.com> <20260128-drm-private-obj-reset-v4-9-90891fa3d3b0@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 28 Jan 2026 13:43:53 +0100, Maxime Ripard wrote:
> The ingenic driver relies on two drm_private_objs, that are initialized
> by allocating and initializing a state, and then passing it to
> drm_private_obj_init.
> 
> Since we're gradually moving away from that pattern to the more
> established one relying on a atomic_create_state implementation, let's
> migrate this instance to the new pattern.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
