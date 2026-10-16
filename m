Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C504735AC10
	for <linux-mips@vger.kernel.org>; Fri, 16 Oct 2026 22:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792188982; cv=none; b=BCAlVm7YFp/KNPHHzNM2swaibvCfeJFNGSnlylERcN2A48i2RF8R1kzxgvLOupGWE8MA5IR8bgpBgDW3hjDBjKxvVX4iSqfGHV3rT9YX7vN/RjWGNlhCwT59j1Vu7MCUrlACpPtQ/4QJbZUWBCzJX5Wt3MWGK2Q5vT2xe5Iq+z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792188982; c=relaxed/simple;
	bh=XJsty+XVq3BgRuwoN2PV39ABqsBfB0LokyWIO3aDiLA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lBpEiwe1FfoGIqAXO0ssDMmFTH7pjHQ529Q8ihalbEBwcxKOYNrxovaPA3ibRtd7YC4G9S1XgqzGC9N+i8alXeGspuK/tbyPou9Dj4cv7++w6uUvwdmqI2mqMz0mW+uNXxmhHEqgoeE+zyLMwssASgrOYW/ztBkcNyOdslaPA7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZbG634vI; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbG634vI"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-16ad92569b5so375459c88.1
        for <linux-mips@vger.kernel.org>; Fri, 16 Oct 2026 15:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792188981; x=1792793781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bsRKo08wZU2d222RmzKutSRcq0g6gJCTiEkblWEA6+U=;
        b=ZbG634vIPC+kuAzhAbUYFxgmlxlQ6ybF9uI/bvrzn+X3X5YMCdOfRk5Cz2fKwr36Ov
         25odjBoN4/m4wZFwKHPGG7fWShsJ8OcaQoI25HsBXBasmhgy3KoGIqFmUf0V+Xzlsbcz
         5kgz80MkzRjF73+xLKPQL2O9OmINQziqn2XNykKrDK0OYRwkSFE52541+zHDoDeLRdT+
         mTpIO8phRt6dez3RgwoqqEaJh5xnj+r9YEfynDg1UEOK1B5rfF0qdBVjYDKYPHBD5MIE
         QJYZYVElbkaR3K/pxC7h5fpl01+9Rt9agD8H06zyVG5Eo3IK9vyar0kORxRt/nvti8nv
         WB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792188981; x=1792793781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bsRKo08wZU2d222RmzKutSRcq0g6gJCTiEkblWEA6+U=;
        b=xuoZKRc1gR7IBYmvg0YVm9pAkU57sWIZnRb7NBKdV6DZHERy2WDad4GEsmkZNTwevI
         mUniQ74RPZucsFR0FvH2KrFPDgbJbyizc0VuHxdGioxdghA2biKqda8oRAsuMvMePiyN
         uVU0BmVZppkk8SKgJjdIkN/RgUwhG0aJGg3cULZDTyfZ//s9xvvD7GmWc0X7UN5gb9U6
         Dg/11Sp3DWywZoRqs/6kzPUiM3K38wdSKFfccRDQgez1nO8NTsbLqAxZzhqjpaZgK6kW
         48YQTiY9NgFrbfdRkdJm2NBS75uYYJPUAfkrv9x7OZe2ecIQ4bgnFpMJ61ygsvJh0zM5
         qzMg==
X-Gm-Message-State: AFq9FYLGc/JTHeufhC50XLKLv2rlC6+54LiK9CQO7N0tOAFtzlgN+ypH
	yy3hbQYWsuNXPmwD2ybhaUEXFNx/3mZLkRjnkpoEDYHea6biaXRqiS9AkgWj8w==
X-Gm-Gg: AYBFou2Dhayspxy3oQfq6RO4yQtLL23BjUyAHbxFmrvcKMNwVPTGU2YJvq9SokgMaNi
	QiSFY1Yeg+au6FffA2ckpN0oIhhezuRaT0v+qyOGUbiMDRycK73GYPhV5EkTd81m2IrSgun35FZ
	KLH654OyygukORhLugKnfigIcloeuZufOis5vsZhLpnFxDZUxzVFroDS1o2vuP3T2K4JkI5qrA/
	5HqxpSOcl6Lv8JbpoAaPMgKfEA6h0JRQ25LqjWVYVuhdl28uO4SDpjo67xMkRezUG7HqMz4dLsR
	iJGa8Y+nOgd4ODBZSivo8p1gO0GiJTRv/ELA+Z/+p3+o1Z33Cg/RyxUioW0CteZc2lnLGLTo0kp
	Ws9vRsrHQyU4WfGZ9JVB/81n/KyMPS+AfMbBuSM+LRDQYQl+NMTrW/CTBBSYq2vmi/tOtN357qO
	qmPGvFQy00AercxFaPQ4gPcV6PkyvWG8HU85plT7/F6U1zw8LkcAJc4jEFVx+dVh0RWvx9KQ==
X-Received: by 2002:a05:701b:208a:b0:168:fe32:35a with SMTP id a92af1059eb24-18512296a20mr1365274c88.20.1792188980748;
        Fri, 16 Oct 2026 15:16:20 -0700 (PDT)
Received: from eldorado ([2600:8802:b00:1f84:d294:66ff:fe95:a98e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831919fc14sm10480863c88.6.2026.10.16.15.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:16:20 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mingyu Wang <25181214217@stu.xidian.edu.cn>,
	Robert Marko <robert.marko@sartura.hr>,
	linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	manuel.lauss@gmail.com
Subject: [PATCH 0/5] MTX-1 watchdog driver removal
Date: Fri, 16 Oct 2026 15:16:12 -0700
Message-ID: <20261016221617.2223004-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series removes the bespoke mtx-1_wdt driver and migrates it
to the generic gpio_wdt driver which it should have done ever since
gpio_wdt existed.

Assuming the patches are satisfactory, I suppose it would be easier to
merge those via the watchdog tree than the MIPS tree?

Florian Fainelli (5):
  watchdog: gpio: Allow devices described by software nodes
  dt-bindings: watchdog: gpio: Describe minimum heartbeat intervals
  watchdog: gpio: Support watchdogs with a minimum heartbeat interval
  MIPS: Alchemy: Use the GPIO watchdog driver on MTX-1
  watchdog: Remove the MTX-1 watchdog driver

 .../bindings/watchdog/linux,wdt-gpio.yaml     |  11 +-
 arch/mips/alchemy/board-mtx1.c                |   8 +-
 arch/mips/configs/mtx1_defconfig              |   2 +-
 drivers/watchdog/Kconfig                      |   9 +-
 drivers/watchdog/Makefile                     |   1 -
 drivers/watchdog/gpio_wdt.c                   |  15 +-
 drivers/watchdog/mtx-1_wdt.c                  | 245 ------------------
 7 files changed, 31 insertions(+), 260 deletions(-)
 delete mode 100644 drivers/watchdog/mtx-1_wdt.c

-- 
2.53.0

