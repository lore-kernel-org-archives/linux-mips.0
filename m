Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.38.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794650773;
	b=HfqJnSJG+WpuRjoBW16nbBj/icw7MgxREJqMza3PFa51EI5PfXi3dtVoW1l8+r6LB6MR
	 +J3nlSH3GJAG6wePljcfDtfyKm0iFbDWTHuU43XMhMKtgURRmVlfLOVsSg02Y8pIEuhzi
	 fRShrr9K2/0JZC1AvgAF+Kck/0f7uU0ECqzQXEJ6FiyvzXgqKvPXAiKWQtwJX1+iBcFu/
	 HWEC+JoICgI3j5A2rhA/eWmSZ3rArLccFieBwH+KeP6NwbrXkcUUYutms4c8/gGfvsCSP
	 wekRCLop/yl0ZbqXhlCeWDLVbx94/MdUrP6XmNonNMBb7WLxH4Ah/jH0zqDJYrv3OxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794650773;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=SJpaviNw/oXnCM78tuQ2OquVgPKd3gStpG/K/sFxuOo=;
	b=12GO/iTAH9WY5v84cjtWz2E3PRBV/BD0urjj3yDuDwwjZZ9QBMAgXah0fQaAcGmQ3/xT
	 FUdgqNuqv8enYgaBLzG41L5Gd4xYEvRGO7+Pqtb7c8zakM5StwCXorliStguQytem+GF+
	 bh8BMQznMxM5fGqDPUNco8fhyvR07gAiUyFVITxOXtMKXZYm6tE3f9vWoHhcL/gBn+HEj
	 85q3bQHYOF6vXnongP8gAWbGEi0ISxhMuypMqn+KPTDKVFK3Cd+j3BWNNQ0ASNI+GcWIe
	 e02iImgvIr2r6FUVKAbJ2RbaJr2dji0pjKnDIBN3qrAwcVQ/3lf0/hvTphTpDtljkCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=simonwunderlich.de;
	spf=pass smtp.mailfrom=simonwunderlich.de;
	dkim=pass header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=gMQ9PjG5;
	arc=none smtp.remote-ip=23.88.38.48
Received: from mail.simonwunderlich.de (mail.simonwunderlich.de [23.88.38.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id E1599606A33D;
	Sat, 14 Nov 2026 10:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1599606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=gMQ9PjG5
Received: from kero.packetmixer.de (unknown [IPv6:2a02:3037:6ed:dd6c:838:344b:3152:2d5e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with UTF8SMTPSA id 69788FA039;
	Sat, 14 Nov 2026 11:06:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonwunderlich.de;
	s=09092022; t=1794650770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SJpaviNw/oXnCM78tuQ2OquVgPKd3gStpG/K/sFxuOo=;
	b=gMQ9PjG5YLBw9JzmBz9vCetBM6wqm/jF1yruFXOiX4AP6NdSNTzFJKaN7kuxP1/HG/OJQi
	XWDfVoJVAogNAm/NUFgAOVb/VivEdjL+f8YZsc+r9OMyFRToUjfHp6t1wqnFq5But2z7OT
	kHScP8nXm96hZ2pQczEP+zPhLI4UmqIdJlPOhkAzh4/2+Wb8SGHlG3sNeCN/sr7sbaeiPg
	uECt1ZDKyKJ1+LW2bGw39oyDOT4Y6iIkPYMdcYw2qRnYiwNGORGbBY1uTq0sCreS2oP+8u
	OuxuGEJizYwm5NVt3nTJO1XlVJAjkl+Mk2QlkY2ypMQaaztQucFdgEIvie0Hyw==
From: Simon Wunderlich <sw@simonwunderlich.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Aleksander Jan Bajkowski <olek2@wp.pl>,
	John Crispin <john@phrozen.org>,
	Sebastien Decourriere <sebtx452@gmail.com>,
	Yangtao Li <frank.li@vivo.com>,
	linux-kernel@vger.kernel.org,
	Simon Wunderlich <sw@simonwunderlich.de>
Subject: [PATCH 0/5] mtd: maps: lantiq-flash: support boot loaders using the EBU endianness swap
Date: Sat, 14 Nov 2026 11:06:02 +0100
Message-ID: <20261114100608.3432120-1-sw@simonwunderlich.de>
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

Some Lantiq boards, like the bintec elmeg RS123 and RS353, have a boot
loader that enables the EBU's own endianness swapping for the NOR flash
chip select. lantiq-flash then fails to probe the flash. Patch 4 lets
such boards opt in to honouring that bit with a new
"lantiq,ebu-swap-check" property. The bit only works on VR9 from
revision 1.2 and on AR10, so the driver cannot rely on it on every SoC.
The property follows Hauke's review of an earlier attempt at this fix
in 2017 [1].

While porting the change from OpenWrt to mainline I noticed that
lantiq-flash dereferences a NULL pointer on probe since v6.6. Patch 1
fixes that and can go to mtd/fixes on its own. OpenWrt never ran into
it because it carries a downstream rework of the probe function.

Patch 2 documents the "lantiq,nor" binding, which was never documented,
together with the new property. Patch 3 exports ltq_ebu_membase so that
lantiq-flash still builds as a module. It would need an Acked-by from
Thomas to go through the MTD tree together with patch 4. Patch 5
renames the NOR node of the only in-tree user, danube_easy50712.dts, so
that it validates against the new binding. It is meant for the MIPS
tree and does not depend on the other patches.

The EBU swap change is used in OpenWrt on the RS123 with a 6.18 kernel,
on top of OpenWrt's reworked probe function. The series itself is
build-tested on mtd/next for XWAY (built-in and as a module) and Falcon
with W=1, the binding passes dt_binding_check and dt-check-style, and
danube_easy50712.dtb passes dtbs_check against it.

[1] https://lists.infradead.org/pipermail/linux-mtd/2017-January/071818.html

Simon Wunderlich (5):
  mtd: maps: lantiq-flash: fix NULL pointer dereference on probe
  dt-bindings: mtd: Add lantiq,nor
  mips: lantiq: xway: sysctrl: export ltq_ebu_membase
  mtd: maps: lantiq-flash: honour the EBU's own endianness swap
  mips: lantiq: danube: rename NOR node on EASY50712 reference board

 .../devicetree/bindings/mtd/lantiq,nor.yaml   | 79 +++++++++++++++++++
 .../mips/boot/dts/lantiq/danube_easy50712.dts |  2 +-
 arch/mips/lantiq/xway/sysctrl.c               |  1 +
 drivers/mtd/maps/lantiq-flash.c               | 39 +++++++--
 4 files changed, 112 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/lantiq,nor.yaml


base-commit: 0ef71adafaa9b36a06dd5b823aebcd2fa9b9b9c2
-- 
2.47.3

