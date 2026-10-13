Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69834F93D5;
	Tue, 13 Oct 2026 11:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892766; cv=none; b=EEJLYndk7ubgtJ3aJdO81XWdEOzTyVUjzi5Au6W4JqkbXopS2NSS12h7onFk42FrVocNbpakTiePh2Nu5OLQL2wbalK5iv0qDg5LsxKriRNSg3+3wvw61uhCpIh5sOfAu3z65P3h9Xu1gpBBTTnMzmi60hHWmtR5BsANgPRSj/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892766; c=relaxed/simple;
	bh=F+lWdQb/wrJ1l0sDaRUdfNapY0SZM0YDbvX34jXJThs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VQa+OrMuB/x6pB5eoPzmVltUiNArBXDEBPB7YxIISoouxW0nzn9UQdlkyrIOc/QU+Wi+ThrX+7o/MSx8l/kQAvVgRlUSxLwoZ6hueWixPV396eAd/akwBpsaiHCdRUTw8abphG+DBYxX+znnJYdIv8B6NzpP4X32Hpx1TNL4Jzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c4djefDO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c4djefDO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C21C1F00893;
	Tue, 13 Oct 2026 11:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791892764;
	bh=ApL/Q3DGF4sCq1teX8cHGXfsgxtk2bVhtNlq3tIVoQk=;
	h=From:To:Cc:Subject:Date;
	b=c4djefDOgh1rCd5LJP7HL/pBlbT/JHGtyIn1JFxuo7N9WhAipS7q84vQOkk/dR6Fh
	 /rZR30jVdzJDB0HNiXwk5s2Q1HKzBjkH90dA0wk50amSsw15XeUymZTmGienHl6joo
	 3+uPXhp6HrMUUEn8DEVe7al8OdKpiVB6cyPgfSrNAlK8eZen/OMSQObCqLbJxoKoe9
	 PArqGH4E9VEFDzDOgjcTYAS99sHnXV5dFgzImXVz5KgU1wUaNUlAaU9FVTf2FhYcMl
	 g0QfYBHO3gBkqqKBf75ciMQWqwVHsHUpXhLn8HXDKNxEM45Nd/k770Fo9OiGK59TOe
	 ZmpvsXe0ffMyg==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev
Subject: [PATCH 0/2] MIPS: SGI-IP30: power off through the RTC
Date: Tue, 13 Oct 2026 13:58:18 +0200
Message-ID: <20261013115820.13293-1-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Octane's power supply is switched by its DS1687 RTC. Patch 1 uses
it for power-off and halt. Patch 2 turns a power button press into an
orderly power-off, and adds the hook to the IOC3 RTC platform data in
drivers/mfd/ioc3.c.

Both take effect only with CONFIG_RTC_DRV_DS1685_FAMILY=y, which
ip30_defconfig sets with "MIPS: SGI-IP30: fix the defconfig defaults
for the Bridge PROM and RTC" from the "MIPS: SGI fixes" series. They
build without it, and without the rtc-ds1685 power-off fixes sent to
the RTC tree.

Tested on an Octane with poweroff, one and two power button presses,
and a stalled shutdown.

Imre Kaloz (2):
  MIPS: SGI-IP30: power off through the DS1687 RTC
  MIPS: SGI-IP30: shut down cleanly on a power button press

 arch/mips/include/asm/sgi/heart.h |  2 ++
 arch/mips/sgi-ip30/ip30-power.c   | 56 +++++++++++++++++++++++++++++++
 drivers/mfd/ioc3.c                |  6 ++++
 3 files changed, 64 insertions(+)


base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.47.3

