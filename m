Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792877130;
	b=G57yPCON0zzFouY9EGDVfjft1QUQL0Dc1G1v4chBuDHdCSO5jF5CdOConNLmvoLyfUD4
	 g20ZR1i/+JyAIXTl4cGoQlESuMRTX300R5jj7rPxqVNE+dDCfl7FEKz9ze+JKpmUyb3qw
	 RtcUMwWf0xXIkDbH4wnhGCXUCu7w/C0TWf6V3AZLhM0DCnQx114MnZmsKtj5UyvCQicFs
	 CpikRCMJF8db4wwWx8RVkLflRe59TAsBlDWvPvqUG6EY3Tr4bo3oFQfFOSRORSeARejXV
	 sX30d1T1XohqzbSvP0t50eQ98FAkOMuRJvo8h/rwnMbeb44MdgWBNyzKTRHDxM4ee+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792877130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RB/QFiAwZFPgogQWGkL0l25DXALwqoy/QmskzaMu3fY=;
	b=Of8MNZ1WiGA4cwh5ep4gNhroINoOiuvZAv39E7YIkAZKBqZwx3Dh6xf6LVKHouOKlOID
	 xjPLFi3YJQAGBGkdXVaBBG/Or4ZxR8DzdKswMSKSoBRXG6SmNFWLBlrBz8GppPYFjHAvl
	 nWinkDq+KbjwEam/LIxAhI20tRJ+suaaZSpFLVvzgs/hlRZQM6hPk5bcvG6Baf2ySfYgO
	 uvIVJbDzc3oXMIHCXXuR7c7fnzz4Ycv8s1MhNaJFSOHC6t9naHL6AsEHkfCxNRcj0oCjy
	 BLhGoDWztfuD/bqDXzRXnaIESKIeRj8uU/2600LUT1C3YNcT+e9yvGjdISeWBTFF4Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Zvgo6i15;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279C2606A31A
	for <linux-mips@vger.kernel.org>; Sat, 24 Oct 2026 21:25:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 279C2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Zvgo6i15
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a214af2076so12101145e9.0
        for <linux-mips@vger.kernel.org>; Sat, 24 Oct 2026 14:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792877122; x=1793481922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RB/QFiAwZFPgogQWGkL0l25DXALwqoy/QmskzaMu3fY=;
        b=Zvgo6i1589cIQqIk1mSPjEk9cn89c4NbZ3U8EmUe7UMtPnDkn/IB4x3IlE//XsR47q
         A4Hp6Q9geaXji2lWuUS9eTVjtUaIk3AhPl3Glx0wam7vcVdRlXHKtxXN0XBbN9n626ei
         4BMSKivumEOIVuu6PP/FPuIiRnIdNkTICg/UUDy/VfBbO3PcBoU9EYnl0SstdOvb7G+a
         2HXT/DHEIdOXMBS2IGxrXwDEQSUFnyu01doDpIiKZprnEr/DlR38bfGr7s/ymjXs8oo0
         L4ofMdhONoeyLzNJps+vsNDHggxQp7T1TGQdgB3TdfHgMNe8g0okSwHbjlehL4KmGEpz
         RhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792877122; x=1793481922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RB/QFiAwZFPgogQWGkL0l25DXALwqoy/QmskzaMu3fY=;
        b=NB/EbMUX8nyrvZo34ggMyj1HK5CBGciTRo4X8sB7y9djG74vVvmh3+L5qCK2yD1711
         BFXfICokseneeFUIMyiKqP2aIX1CSD4Sa5CJtmYZKX5a/USgZwF4fDjOiGzmOxhXcwsI
         q7BO/swqek9DF/NC9bADh1w+/d+ENebDjXf0czlOcpCOW+pueqls1ShHwMMJGzc7NPyN
         g6/vTJ2Ti7+2l4o8qVhUiCNlbpSRpssPIFf5AulYNdJ8d6nGRhi9YX2nLAe11xadUL9k
         yyv97HP3PdcleXD3YSO1CKXoWovbnxwaG0pWcbBxrUgaLDI1bCGOLAbaIWj8NFcZTFXv
         TaeQ==
X-Forwarded-Encrypted: i=1; AKwUvByUaErwI4i+hVyt7pa9T60Xoh1GShDzdx3fEfBUMnQsJjAaSrAZtV62gAVJO1dIjQ9XvNeyHS17tXKX@vger.kernel.org
X-Gm-Message-State: AFq9FYIfjmGLF1yjAWYjzKIFYN57qNZQVI9VaHwwrFLUuj6dRQsSA9BN
	HpA1Te72FzTXugTzcba0kSECDAAITw/wWfJxsKWtk32vrd8K8m+upRYd4UzdOE+LuoE=
X-Gm-Gg: AYBFou0zQr8wlHz5TvnN/Ra9aOVZNr2u5kLGOluP2xpiGQb9dxTG3X7CFokKo5fuIO9
	N/Y9THA6+x+u6VRSLf9vDAos/X57uChKP9cVGJs/S/11T6OmFNgJG4lIyTGhCxKhpRdwvQVti3K
	qfag+M4gtfPwlMGQF3iTWankadGP+Rc13USJFunktaLkDMDeK1vtCt8SBMJ9WL2QBlES1vrk0LC
	UCxWzD5DxBnLAOjiRPdZNhn9t4ExtH3WqR+gK9ol2nq1yTTK1Fedaoo9rpB/5VgyfGXG4t/gBIj
	snIhc9v32qidvnJOiv4bA/yY1AaAz9Pfrq9NWWzEF0HWbMG8h+TFzMGLfVh0scJY2LwMiIY/FyR
	hwUMj5hQ7Fd5rFIobjyT8+codOjeX3Zp4pGKFO8JusLD+aJVezaojOQ4NNF/sp8dfzAszaNsqGl
	ciivoRYawX2pQgxjyNe2BcRmEUiyTUYNbxAmaxMdPynIB7yNvP7hgql18hoUEp1qmy+1xWml+8K
	UfDCF+Z8apyCCl2+hxOydimrsccxSrmDGUBsFJccHwasxfM33LmiY8XbZgfj6WMCgaYsdEQ5zdv
	Ghgh8ecbwKi8JSUVXQkr/kciQdStpI7P6Dui1YnfGO1BmMe4nsAsQfGdUYFxgHC2ds0VsMvKNA=
	=
X-Received: by 2002:a05:600c:6289:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4a35ac9f52cmr43172355e9.22.1792877122133;
        Sat, 24 Oct 2026 14:25:22 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2ed5a2sm79597135e9.15.2026.10.24.14.25.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 14:25:21 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2 0/2] i2c: jz4780: Program the spike filter, add the X1600
Date: Sat, 24 Oct 2026 23:25:18 +0200
Message-ID: <20261024212520.91401-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

v1 said the X1600 moved the SDA set-up register from 0x94 to 0xa0. It
didn't: as Nikolaus pointed out from the programming manuals, SDASU is
at 0x94 on the X1000, X1830 and X1600 alike, and 0xa0 is the spike
suppression length. v1 worked by accident, by writing the set-up value
into the spike filter.

What was wrong on the HiBy R1: started from the vendor kernel, the
filter held 116 APB cycles, longer than SCL's high period at 400 kHz
(102 cycles at 140 MHz), and every transfer lost arbitration. Setting
the filter by hand before single reads, transfers work from 1 to 100
cycles and fail from 110 up, whatever SDASU holds (1 to 100 tried). A
cold boot leaves it at its reset value of 1 and works.

So patch 1 programs the filter for every X1000-class SoC, to the 50 ns
of the I2C specification, and the X1600 needs no driver change: patch 2
adds its compatible with a fallback to ingenic,x1000-i2c.

Changes since v1:
- Replace "Add support for the X1600" (wrong register) with a fix to
  the spike filter for all X1000-class SoCs.
- The binding now falls back to ingenic,x1000-i2c.
- Rebased on i2c/i2c-next.

v1: https://lore.kernel.org/all/20261023081452.44118-1-olivier@mgcrea.io/

Olivier Louvignes (2):
  i2c: jz4780: Program the spike suppression length
  dt-bindings: i2c: ingenic,i2c: Add the X1600

 .../devicetree/bindings/i2c/ingenic,i2c.yaml         |  3 +++
 drivers/i2c/busses/i2c-jz4780.c                      | 12 ++++++++++++
 2 files changed, 15 insertions(+)


base-commit: 03a5cffc818695157414456dec695f7c30b9ffff
--
2.39.5

