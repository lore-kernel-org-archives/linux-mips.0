Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793022415;
	b=eV5NHt3M/1QaeymloaERHXq3ggLg/NifTg5eBxQveVt0YPPBLV7XWLCxCtKERD365SHz
	 bii9d9yUgWsw3xZsLIZaEeo6kPla9b4XnksnW54kODUrLsccGS8ASwtq41tOLpxtiPfX9
	 vzKRzx+hfh7BofQUv4Umlz8+1UNwxCMZyTzy3tKQQMR3q+J0CKpQ53DwtfcYylOEASvhs
	 Y4Gmyp/a8OkpsTqEEzp6yg0Sl8VEXBNfDFD8yp/wd7Qj3SKg0P1Psa7jvBxtCx2rsoUV5
	 4NffL51VLvi4UD5YBZ+DkEGgibNWznlWqPk3vwlRpcqbtamUMfzb6vtpX9BtKBRnOCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793022415;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GScuJt2ZF2Qt/7El7LqTygBhAAaRi9MPcqNYoaNSDFI=;
	b=tjY1reMSIO6JrSF8JjUP9oS39uhY6e7iSoENfyrcGfDn0rV1V3Lzy8ZhHwx1qSQbHiQo
	 2QlkyExG62CkA7TT3uQDChlxD/q2YeTY3Jy0LxxUUqrW5XFzMb03mwOLfJngK5r+QsbqV
	 B/DpucZEgjGvPjVSIGukfWYV8SvnBzJ/4rwXl2xf5ceBeUIFgvxwf+cXdroPY80UJxmT+
	 HI6bor3oiSH67zxcuiaeV+/mk2n5gcuBWemk7W/Ja4EkYMNHx07dKfytEQiIpQYuYmyw0
	 tPXGcjj5z7zfUtzL/oX4LxNSmjMqvEEND/4Pg63gF52Oemo8Rjqkyd/jTPPWLTZoSFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ClMZhMTf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1877606A329;
	Mon, 26 Oct 2026 13:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ClMZhMTf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 671C01F01825;
	Mon, 26 Oct 2026 13:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793022414;
	bh=GScuJt2ZF2Qt/7El7LqTygBhAAaRi9MPcqNYoaNSDFI=;
	h=From:To:Cc:Subject:Date;
	b=ClMZhMTfOpOcdEjulKJXZSQoEv7ad8ZW5BkIcgouAfl7OAW4w2jDjGZBUDHkItqvl
	 YAmkJpUUYJDwvHGj2ILat9wa1SjCtaYt2QrTIJ7Zo9F5Z/8XWeyDQ8qaP0OYBNZBFW
	 6y/VVHNNBVY1UNEaMnMBL8GY55kKX1+KBY6A6g3eoYKMisGjHAgXK2JyzAFsXDeb6S
	 YOwIJxA8gqEcuJy4HXLBgyMmhTlB06F+GcMewSG6xA0gSdj07L5bzBJvw7zd8ln8kq
	 bbxrQgDnX4TSFN1L0a8cbetzY3JZiPCbmfZ5s+zpUYrXN8RLSmEp5f7AhZiG9O4Od3
	 eEmfgMBixJltQ==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] MIPS: SGI updates
Date: Mon, 26 Oct 2026 14:45:38 +0100
Message-ID: <20261026134543.27207-1-kaloz@kernel.org>
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

A stack fix for run_uncached(), a missing prototype and defconfig
updates for the SGI machines. Applies on top of "MIPS: SGI fixes"
(<20261013094554.16804-1-kaloz@kernel.org>).

Patch 1 keeps the stack that run_uncached() gives its callee clear of
the registers it saves in its own frame.

Patch 2 declares ip22_eisa_init() in asm/sgi/ip22.h, so that enabling
EISA on IP22 does not add a -Wmissing-prototypes warning.

Patches 3 to 5 clean up ip22_defconfig, ip30_defconfig and
ip32_defconfig. They enable EISA, HAL2 audio and the Zilog serial
console on IP22, the front panel LEDs on IP30 and the audio driver on
IP32. Patch 3 also switches ip22_defconfig to the R4x00 CPU type,
which most of these machines shipped with.

Imre Kaloz (5):
  MIPS: lib/uncached: fix run_uncached()'s stack switch
  MIPS: sgi-ip22: Add prototype for ip22_eisa_init() to header
  MIPS: ip22_defconfig: correct CPU type, add EISA and refresh config
  MIPS: ip30_defconfig: drop add-in drivers, enable the LED driver
  MIPS: ip32_defconfig: drop dead options and add-in drivers, add audio

 arch/mips/configs/ip22_defconfig | 79 ++++++--------------------------
 arch/mips/configs/ip30_defconfig | 13 ++----
 arch/mips/configs/ip32_defconfig | 36 ++++-----------
 arch/mips/include/asm/sgi/ip22.h |  1 +
 arch/mips/lib/uncached.c         |  7 +++
 arch/mips/sgi-ip22/ip22-int.c    |  2 -
 6 files changed, 34 insertions(+), 104 deletions(-)


base-commit: f2633ae2cb94428d310ad359a8d4016712133e90
-- 
2.47.3

