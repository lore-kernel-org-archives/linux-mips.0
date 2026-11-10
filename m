Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794274611;
	b=WG+Tk3elTdy0ZWLemcp53IjIYrikxNT+79/hNRu0rgUAoPXqiXNEPoGpCFZ6O+kcjGxA
	 VKep5nxE1Z4emA3Z/aLxm+aYk0gIGPjaa6NBRKqCv6KKndLg2TZme7cX6zlpCmt5kqwai
	 kQnhH3GbGJ8sGXP6UC4oOf092XVmXUev02qLXvrdV9+wEYUihSyTTXFnfh/sQDBwqjoUP
	 9xN4llv6cy6zMtSQQB1fz/3aEmayaixWVHSAvJ0wp6Lsmr6oOf4dwWQuW3KfH81qruqif
	 BPN1wASiw9C3BAvrUGfz9m0pb1pu55B6ME2EmW4QaiMXoJ7VcbiT5nkb4sY21wwpugw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794274611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yq8OaymsGv1Izlycs1HhxHCWmqIk//CwjtwmB2avx0E=;
	b=qDeMh6XA05BtqdlN1jVnZxE2MADJHc5ZiuIaojWTkK52qXE1w3Vr/ppAQFTydU9fb+kJ
	 jaubQ7iV1CoyRSkBtaZN0fhwzRWPCUp7nUZNgA1KAICEHuMLz7CAqMQNuvVa+V7lA/0hN
	 0qnWC9EwATRH7O8DPABhzX/lsOgPJz1xub0YlB0Bq2bmy1+MzBR+q7iHsBXO2kwQKCLtu
	 Pya4GeHqgRUQEdwqKLjO6sJ8BPtcAUD0BERxTklwfNzj57PjLoaeV/2XSOwK1pR7i8e32
	 MLrh/idgkA3C+SgQGKqFWFy2b5bz/LkAytumd+qDXGUM/HpbezarAovARdsopoUJnuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BJKgaiqT;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D4D606A321
	for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2026 01:36:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05D4D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BJKgaiqT
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ed1e9ae5a8so4868375ad.1
        for <linux-mips@vger.kernel.org>; Mon, 09 Nov 2026 17:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794274610; x=1794879410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yq8OaymsGv1Izlycs1HhxHCWmqIk//CwjtwmB2avx0E=;
        b=BJKgaiqTeyCgUTyCHLDl7Njgh/uAeAtOPZc2yyrjiThR3rdAJFgq7SjjpL4cBWvwSv
         PrMgVY3RgOZNtSkdVKKgwyJEvW17ai6wl4TDkudDp6PZYW2GEaotiWuGmJjhSEFeH6Ro
         BTby7IPCiuj4e6Aje6s0YZZEu8YSWGv3bDotCxKUG+tMlEtKTs2jR50wA6UboYeH4feF
         /w3/eYcRislA1YfJ5pCzeLNyRDydqL91LAQdNau2smpJXgcB39PQDJ14Hooj0/Sq8uun
         g568MqExacIKAQh3jdt8bsiRCcdRUyeg2OZTj/TQrSnBgQGFxQgE7PtNzrujBhAFG58z
         m6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794274610; x=1794879410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yq8OaymsGv1Izlycs1HhxHCWmqIk//CwjtwmB2avx0E=;
        b=YfCl9JRMU6GfcjCuXIWk/JE4FJ40oezjPw1Cwmet2dImL7osDy61CSSofDKNN6teGK
         LZCe3rNZo38AACvRnuJD7Ve/ZegNsF1GvP0G1Bno41kHsUha4RWfSCiDgvKg92/LtgPM
         cEkP9l5FUjcROBTVHuE9iJQvqyl26S570rNPSQunzKkW6sJJm+JgBXwh27X/QLIjkm7V
         QmTSuNPbMqad2Ek90XgFl+KAHtgCfGons0joloZ88isRcJC6fqd2NUh8OrBNxphWQli7
         Uyp6Zm0LEUGHFSIcm1ESyGcqLzrVnCt/ycb8xPmc+wTWz5jv3oueumyJaEyUjN3d9xGc
         fDKA==
X-Forwarded-Encrypted: i=1; AL+hErHgl+ntXLm0jVFDzQaWdYsBF+4r2cJcIJU0TmiSmGX2Avc7epVzO3SXbwdhRmk22kEbhxjEPiJH+qnE@vger.kernel.org
X-Gm-Message-State: APuU4Z9NW9igZL+K1GfK5uXbw/0z/kPwD2jDBUVRskfpZDuiomrB203o
	aEy0+3EqXcAm66SngoYxtrNbPRfatEfgdkwuIUZhTpeTXfvTWvJe1V+0n/tG5g==
X-Gm-Gg: AYBFou0sgYSLekuRJAGVv7Iz2aBnEVNnKLs8GIvbh7/fg51S3o6PdQHVHMz5xyAmcZ/
	LaTGqohgyJF1FcofN6RdVCykh3lNtwFOaU4I19C8EY7f7yRG54yBeK+1pfc+wI/vktmWT1GX9Pu
	XPALNx5mB/QExI6rf+irLQZMAYmUlq3892eUwV62B4SKl7d07u7yaGBl0Wi4IyuZTnPmW9NG/S5
	DLJ3YQQ7QLwysmknO53BtRvTTksXKlB8Jliw09ryfnpthKsgUwQiOrt2V18Q0GJD4pbb7NoKfuh
	CdkG9ZiV5VuD6TSXAfInLKFYL2oe3DbNszXLTAiYxOwzSY7C/Q/CctMqS6qA1uVO9MRBZHWTDH0
	+TSlkWtB0sTP/y0U1+JqmlaYknFpGjncufeO+saNPVq/xlKTg8dpA4daZ4caVbxGIigtNMNFceY
	t0npi3bNahAQjoEMDU3S1TI8vaAFkOfJwEdslQP7LAfOHYdh3L5Hg68un9j7hsRruDDTBy0rw97
	V0o+t+AEufqOlScwXcM16DuML8B5d+1QlTJpKx81vbYTZ5+LLYUQuPfI5PdFq8tYfEwPw2v0jIz
	Hapw+nOiHC+Qvls3c9x0kz270vRt3i9hK9rb7MxaDPacB4FDTSo/zBYoEKdA8DYxARCak9CMvRJ
	kDRXJBD2RcYVkCcmBDfth00KvH2c3uUgKBkjNKFrPkwI/yZzH6mfEWqGdMX02/zrgYtGLkyAkUv
	xZ1A==
X-Received: by 2002:a17:903:26c4:b0:2ed:5548:298d with SMTP id d9443c01a7336-2edb928164bmr9145275ad.54.1794274610253;
        Mon, 09 Nov 2026 17:36:50 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d9efd6sm3399055ad.50.2026.11.09.17.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:36:49 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/6] clk: add a driver for the ath79 PLL controller
Date: Mon,  9 Nov 2026 17:36:40 -0800
Message-ID: <20261110013646.1582970-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The clocks of the Atheros/Qualcomm ath79 MIPS SoCs are set up by
arch/mips/ath79/clock.c, a CLK_OF_DECLARE driver that registers every
clock before the driver core is up. This series replaces it with a new
driver in drivers/clk.

Only the reference and CPU clocks are registered early, with
CLK_OF_DECLARE_DRIVER(), because the MIPS timer needs the CPU rate from
plat_time_init(). A platform driver bound to the same node registers the
DDR, AHB, MDIO, UART1 and PCIe clocks. Until it does, the early provider
returns -EPROBE_DEFER for them. clk-mt7621 uses the same scheme.

Patches 1 and 2 move the two remaining non-clock duties out of the arch
clock code, so that it only uses its own registers and the clk API: the
QCA956x timer interrupt workaround, and the reference clock that is
read from the bootstrap pins when the device tree has no rate. Patches 3
and 4 add the UART1 and PCIe PLL clock IDs. Patch 5 adds the new driver,
and patch 6 removes the old code.

Tested on a TP-Link Archer C7 v2 (QCA9558) with an LLVM build. The CPU,
DDR, AHB and reference rates (960, 800, 266.67 and 40 MHz) match those
of the old code. The serial console, both GMACs, the PCIe PLL with a
QCA9880 behind it, and the WMAC all work, and no devices are left
deferred. The other SoCs are not tested on hardware. For each SoC the
rate calculation was compiled in userspace together with the old code
and fed 2 million random register sets. The results are identical,
except where the old code overflowed 32 bits with register values that
no real setup uses.

Changes in v2:
- Post the new driver as one patch, instead of moving
  arch/mips/ath79/clock.c to drivers/clk and cleaning it up over six
  patches (review feedback).
- Register only the reference and CPU clocks with CLK_OF_DECLARE, and
  the others from a platform driver (review feedback).
- Describe the SoCs with match data, and read the CPU, DDR and AHB
  selection of AR934x and later with one function.
- Keep mapping the AR934x SRIF block from its fixed address. It lies
  inside the wireless MAC registers, which ath9k claims, so it can't be
  a reg entry of the PLL node.
- Drop the clkdev registrations, which have no users.

Claude Code (Claude Opus 5.5) was used while preparing this series. It
wrote most of the new driver from the old one, together with the
userspace test of the rate calculation. I reviewed and tested every
change and take responsibility for it.


Rosen Penev (6):
  MIPS: ath79: apply the QCA956x timer workaround in setup
  MIPS: ath79: move the bootstrap reference clock to setup
  dt-bindings: clock: ath79: add the UART1 clock
  dt-bindings: clock: ath79: add the PCIe PLL clock
  clk: add a driver for the Atheros/Qualcomm ath79 PLL controller
  MIPS: ath79: remove the old clock code

 MAINTAINERS                           |   8 +
 arch/mips/ath79/Makefile              |   2 +-
 arch/mips/ath79/clock.c               | 673 ----------------------
 arch/mips/ath79/setup.c               | 100 ++++
 drivers/clk/Kconfig                   |  12 +
 drivers/clk/Makefile                  |   1 +
 drivers/clk/clk-ath79.c               | 778 ++++++++++++++++++++++++++
 include/dt-bindings/clock/ath79-clk.h |   4 +-
 8 files changed, 903 insertions(+), 675 deletions(-)
 delete mode 100644 arch/mips/ath79/clock.c
 create mode 100644 drivers/clk/clk-ath79.c


base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.56.0

