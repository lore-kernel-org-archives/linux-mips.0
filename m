Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793163742;
	b=sE9/KHRtgmd87sNmClnJoykflf6wV6fLFTnPp6C+9gq7TgvcG7nNbzHMaho466ETOQ3Q
	 OWHz5i0qr18G7werO6kR2pbaJ4+4lZ0YI9FgZED01AgWO+m8Qaao1jW0butPqPzgC6oJX
	 o2RQpvVqYX3DydccWIOwp+R1gmoFBSGu2Pep3dMndvi8jR+r4fOvBwOYfjAEiR3Ec9uGL
	 xDYMhESOq8cvG2jCcc8wzvqssGeQ2an49SNgSJWiVMHYoHMqt3a5z4yywKO3qPcSkw4Nm
	 JulnAL1v003IA5WB+BZVwqtAH77/CdRw6xj8qsivoLp1JvAXz77Pa5uBsRRKFI882RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793163742;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=zLz0pazdOfTsdwtCAGyvlkZm5M8fg99B0g197ylxLwk=;
	b=U5k4CXGsEXID91yeXHBiFH6e7L7b2WXA/VMo6mn/37syU5ExIJkwUWknNF1s+QaWMujw
	 6+1RiQ45AqR4nQ6ixPJDrKxXOk6vFoh5T1/njSitrvNNeFA3DQixIlEdg1vDbRGJhYPDZ
	 sV59HLfnVsf55DXnMgltKO+IMWOh621qq1J2YttFh3dosxIgfe0E+ifnjSB42IXAS2AYp
	 q4sXZVKKs8+GLrJ9pZcv3Nhg+0xlWQ+fnjGdeRyfnRmRWiB6c20SuAaWl5OPEWmoVuMwp
	 ex6mwRRKEDQozh0sDlMbfhQRABebdfTaz4goqLUgx9XFyHgOngH/2EgXGbZ/cQGN2cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=cvOsB5qB;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D9F606A31F;
	Wed, 28 Oct 2026 05:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8D9F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=cvOsB5qB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=zL
	z0pazdOfTsdwtCAGyvlkZm5M8fg99B0g197ylxLwk=; b=cvOsB5qB2Wj0hI7UKh
	cXipRRM+LqlaGC7zY6lk5NhWTd/Fk4JoYV1WoHQFW2yGikSPLyrb+nbEMzsuHn3x
	KEKyXypvLKwXWCHdhELadpwFBJe8I8jQp97Pz56Nn87m11JYg8+A2XoxD6VfZaUy
	d1OwkiDViz6VKQ2r33g0xjJvM=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD31_V5geFquXTKDA--.16748S2;
	Wed, 28 Oct 2026 13:00:43 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Marc Zyngier <maz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Anup Patel <anup@brainfault.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Andrew Jones <andrew.jones@linux.dev>,
	Jonathan Cameron <jic23@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Tomasz Nowicki <tomasz.nowicki@linaro.org>,
	Grant Likely <grant.likely@linaro.org>,
	Jason Cooper <jason@lakedaemon.net>,
	Robert Richter <rrichter@cavium.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Liupu Wang <wangliupu@loongson.cn>,
	Tianyang Zhang <zhangtianyang@loongson.cn>,
	Jianmin Lv <lvjianmin@loongson.cn>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org
Subject: [PATCH 00/12] irqchip: validate remaining MADT records before use
Date: Wed, 28 Oct 2026 13:00:27 +0800
Message-Id: <20261028050039.121080-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
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
X-CM-TRANSID:_____wD31_V5geFquXTKDA--.16748S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr45CF4DXr17tryDKF1Utrb_yoW8Cr4kpF
	W5ua4Fyry5CFW7CwnxAw1UZFy5Jr1rKrW2qa93tw13ZrZ7K3WDXay7AFWrXF4xJw1xW3Wj
	9F4FgFW7CF98uaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07URCJQUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7xuRy2rhgXvKVwAA3C

Several ACPI interrupt-controller callbacks cast generic MADT subtable
headers to controller-specific records and access typed fields without
first checking that the firmware supplied the complete structure. A
truncated entry can therefore cause an out-of-bounds read during early
interrupt-controller and CPU discovery.

Add the missing minimum-size checks at the callback boundaries. Records
which are passed from a probe validator to an initialization callback are
validated once in the validator, before either callback accesses them.

The issues were found by code inspection and have not been tested on real
hardware.

Jiale Yao (12):
  riscv: acpi: validate RINTC entries before use
  irqchip/gic-v5-irs: validate MADT GICC entries
  irqchip/gic-v5-irs: validate MADT IRS entries
  irqchip/gic-v5: validate MADT IRS records
  irqchip/gic: validate MADT distributor records
  irqchip/loongarch-avec: validate MADT MSI-PIC entries
  irqchip/loongarch-ir: validate MADT MSI-PIC entries
  irqchip/loongson-htvec: validate MADT BIO-PIC entries
  irqchip/loongson-htvec: validate MADT MSI-PIC entries
  irqchip/loongson-liointc: validate MADT HT-PIC entries
  irqchip/loongson-pch-pic: validate MADT LPC-PIC entries
  irqchip/riscv-intc: validate MADT RINTC entries

 arch/riscv/kernel/acpi.c               | 3 +++
 drivers/irqchip/irq-gic-v5-irs.c       | 6 ++++++
 drivers/irqchip/irq-gic-v5.c           | 3 +++
 drivers/irqchip/irq-gic.c              | 3 +++
 drivers/irqchip/irq-loongarch-avec.c   | 3 +++
 drivers/irqchip/irq-loongarch-ir.c     | 3 +++
 drivers/irqchip/irq-loongson-htvec.c   | 6 ++++++
 drivers/irqchip/irq-loongson-liointc.c | 3 +++
 drivers/irqchip/irq-loongson-pch-pic.c | 3 +++
 drivers/irqchip/irq-riscv-intc.c       | 5 ++++-
 10 files changed, 37 insertions(+), 1 deletion(-)

-- 
2.34.1

