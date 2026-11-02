Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612542;
	b=Rfc5sww+qSys48eLolcUInJgajc1oyYMOMtps1iG06jDwAjsfP2TLO+Ln0EeEFsWUf01
	 cWeG/phoDgJai+0UIv7BWW8Mvv7pjm5pDO/guRV9gcNXCIs5qegeX2yHgsvEw1+2kZzJK
	 kFbv4GkI6CNLkN5bm8zqYSqLo44KikVkzS16qUCMYtCbvRC55nnAWttyl1asTu6R7DsxM
	 fRtRN1gnHQF2pMvzsrGS5UxSKkeF9vkN6Yz2BQxl54QjoWGles7uIU5V/ShE7VmJp7NJV
	 8vhCVTOEfOg0ysy6VDmH8iuvna6EnST/gBJllFKryhg7YCqCHFcDVr/4PUCaTwLqj+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612542;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PYlyse4le/dgjm/MY/0rBhG+Z5H7yxQFmMu0lC/crqY=;
	b=F1vbAh1OF94AeNcsHPpYyfIUs+88aQ2sEythWMegu6Mi6QvcE61G20dD3YzA8Dmeo8VT
	 hDJvokpFMxjgCI48lbLShCC3aeMf+JkiZr533sopMnd480ZIa18Gl9ZBKSvs3JHBO1tTL
	 3LieFiUJ/bZt14MwZC4zjb/OLm20El82CKptyNvzqUDmhC+VEkwMbJZPextTerE56vrl9
	 6v+mib/xrwOrZqpwwMzugHtVmJIBChIZOxF62F70KWNtyM9SnnBSX5eCCww7zVMPLo7ND
	 8fzGDeq//gHRzcjswf8XV4h+QuW0Ec7JHh6Q3W67Ly04/kc+tuGobNIUZDozBOs5nmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iYJOBYCY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C3C606A324;
	Mon,  2 Nov 2026 09:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iYJOBYCY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C24841F000C1;
	Mon,  2 Nov 2026 09:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793612542;
	bh=PYlyse4le/dgjm/MY/0rBhG+Z5H7yxQFmMu0lC/crqY=;
	h=From:To:Cc:Subject:Date;
	b=iYJOBYCYoEtMmCDIu07v+IC7rSwgeciMbF2PsEcsvYUHzzl9DXuhaWnxjKA2HM7I6
	 t/X5OxcVKejJpcGEw3sHZQ0Iob9T+Ez5ms+hKJJ4I5UlEYGy3HDT6RtIRa/wCAJPHS
	 vGgDy8Tas4OW7yWgl4eCkRvq1hRK/SUaHhOFGl+dce+uW/joDnQHi0raWrgD++x/Vx
	 0zwTxJ2lbafDdWDkr6euVUiz1wQKcd3ul7x8DdXyrakgbsnzhNGmnqYP1weDxAGY+T
	 MMJoo+CHJV8RMh9unylVkqCjPyx4FvapFNiaZ7VrLZajfHH6L7GbcoIGvqMqgTUb9Y
	 EXZqRPm9T+uyQ==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev
Subject: [PATCH v2 0/2] MIPS: SGI-IP30: power off through the RTC
Date: Mon,  2 Nov 2026 10:41:03 +0100
Message-ID: <20261102094106.21300-1-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Octane's power supply is switched by its DS1687 RTC. Patch 1 uses
it for power-off and halt. Patch 2 turns a power button press into an
orderly power-off, and adds the hook to the IOC3 RTC platform data in
drivers/mfd/ioc3.c.

Both take effect only with CONFIG_RTC_DRV_DS1685_FAMILY=y, which
ip30_defconfig sets with "MIPS: SGI-IP30: fix the defconfig defaults
for the Bridge PROM and RTC" from the "MIPS: SGI fixes" series. They
build without it. Patch 2 drives the RTC with interrupts disabled, so
at run time it needs "rtc: ds1685: do not sleep in the power-off
handler" from the rtc-ds1685 v2 series sent to the RTC tree.

v1 was tested on an Octane with poweroff, one and two power button
presses, and a stalled shutdown.

Changes in v2:
- Patch 1: drop the device reference when the RTC has no driver data.
- Patch 2: only the first power-off drives the RTC and later callers
  wait for the power to drop; the 120 second timeout holds the device
  lock against an unbind of rtc-ds1685. The RTC's power-off message
  is printed from the power-off context, as the console thread cannot
  run once interrupts are off.

v1: https://lore.kernel.org/all/20261013115820.13293-1-kaloz@kernel.org/

Imre Kaloz (2):
  MIPS: SGI-IP30: power off through the DS1687 RTC
  MIPS: SGI-IP30: shut down cleanly on a power button press

 arch/mips/include/asm/sgi/heart.h |  2 +
 arch/mips/sgi-ip30/ip30-power.c   | 94 +++++++++++++++++++++++++++++++
 drivers/mfd/ioc3.c                |  6 ++
 3 files changed, 102 insertions(+)


base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.47.3

