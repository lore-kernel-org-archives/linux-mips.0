Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794175067;
	b=YpRmHzBMnmK3wVJNU8ajcLg5ETb8dHq4ltBneySEV7fKwM/l8nn+AkiigpVfwMjzl035
	 Xoxnij17dh88u1Zg9117m/IPkHDwOOAqVqAXGt21g4ULfQ+2GDLLouu8Qxi1as4yFDYWL
	 EVQaDvkrKkLi17noJ7V+4hp/U9idP3J3xhhQ3SJKZnYXVxUVyir5Rddi/IlR4Pf2BQXNX
	 aX8OGqaG56m1kWgpvLSJobejUPBPE0XD/Mse5RWdKBItIdjej8HlNng+fkiaqKYGVv6IK
	 kBLQ86sbSosaCgLjyuANZuMEFTLI8gpVwEmqhXQ94qicqWVVqFlnKensMNC875egtPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794175067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NEt1lF7lxMBZfEDAydvjStbcmv5IqrrXjrjqRLLY++8=;
	b=U04Oh+khCXl1DUBDXiuW3ygAC0No0DetUyOoLZVvSxUXUJCyeNqNM42fmfNRya9bjYKa
	 VbKlS9WwxYovTHDDvEYADyQuNdUdeH21i3U/bfU8V67w7NGpjI8a1z72Hiy1tiEUX/uiY
	 UtFHdI3yIkbNhWlY03sDzItJzxUB5esKddULuuaCypSGFEv6QpyC+gvh1/Iu0lY+Unn/p
	 hQiFc6OsduywrKoKHbLEpPdCYU0Fa+OyJligD6WG/r5GkTULQfVfbWzXtbLuFFtTz7Y5+
	 871sUODS6pbjBsyBXDcCDlIk/yBFpwne+kQlufZ8Y6tkMx4MhRPhWKP1YJMO3fyiqUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zIWUbUKR;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B0C606A336
	for <linux-mips@vger.kernel.org>; Sun,  8 Nov 2026 21:57:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35B0C606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zIWUbUKR
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso124919a12.0
        for <linux-mips@vger.kernel.org>; Sun, 08 Nov 2026 13:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794175066; x=1794779866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NEt1lF7lxMBZfEDAydvjStbcmv5IqrrXjrjqRLLY++8=;
        b=zIWUbUKR/SgteTooNkhndFRULR3qfUVIFJB39sHl4Bcp9kMrSa328FUtlTAFTWESfw
         vn7qL0obvVnpGHrGSnHYn9EwVVvu4sX/QD2favCLrxh3+ZzqzDYsuewcd2e7yimDk+IH
         2YT+Vir3pSmfGuMuxZVDN8/ueMYGuAiflE1AyY5saPVBplx2nzrRSNjEIuANTw20KNf0
         D7uQ4KkPEWd34Xu2PSyqHVQX1PB1MV8r2orhgsNjsGabSE9FG9tQLhW6EWw9CvSiJyNV
         t2PiIGrOgExvCyfjEAcqcxDol9pO/3ItFOuuCb27KyKNxx8dmd5XTPS7QSy22oqahk0d
         zvmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794175066; x=1794779866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NEt1lF7lxMBZfEDAydvjStbcmv5IqrrXjrjqRLLY++8=;
        b=uYt/Nl6Rz+ZReT3K9UQLOg9/dJR+jMUbd8Vdy6BuTij1PfyM1/lu0gf4mz8EZeVvn/
         qilzHPCcGsBIPp4Hra4UwyN/PiXFL6MEYSd3bhwwixXc1FepmevVG4RzXWq2iBbykxvM
         rIrmYDXHsreXenVV8yREqSK+F+tzUGDcBCMSsVF9cK5VWt/CCPw/pHKJkCFeLbOVB013
         pxxLNr64gO8CDoQKKeuXIgt8d5tlsxzcoDLHQ2GEi27TTUApKRqX/u58zRh0csxk2FqA
         /8bYkR3VjJGSYPk1M53ciVJMBqlke4+1iUEMzL/uTxH9NbRQ+AIQt3FErbnL87APu7zC
         CsRQ==
X-Forwarded-Encrypted: i=1; AL+hErGavhz1XngXz/hYinXro+bMfDc0jtLCOT/Eo1RE2YH2+4agKFcMeFLGhzHSSXoh/3Oo+cGFvOTLeboF@vger.kernel.org
X-Gm-Message-State: APuU4Z8uACLAuFd+69A6axJB+GXlrU5C80spAmpURT2+rodewC4b+MqI
	Is0Rt4KjgP3jkBSUp31RTt0wYHQoT7E6DezDUVXbrsYiLID1ddrMcN19
X-Gm-Gg: AYBFou0vGwAb/bg3yZZHNiQnvyfiji42K2lbqCYJx1xfN7VFget4DJ0H29FwyOs+XJb
	nsnWFIAQVCUnWW/a4pTxQjx7MpYEWmJXOf+G6rvaJ3qOdN2TFWg1XoDHkOgt0pfLAHYchvVzkds
	6iDZ+FDMMcxbBZe/zSViQZ6BLL+/2vb7uVENn5m2znPSl7fNie3M454IkTS4t8MB/UJqmiFWR43
	/k7Ht2ZPPRtm/8smNNl2dvjnf8/iNyoSrNdCARlbSCagRNqlRkZOpn+fjhIMV8zApVgkbqmri5U
	l8YqB875TF4tjXiXq8RZCIKJuFNJ0HuHUG/AgRQ6ngdQVjQjj0RvGN3Tz5/LIQCZ/iSq5U3YBGi
	7UWNtaVkVToI782Yf86qH4eGMaSpWWHSXn/gm6uAeBc2pFxz8JQj+2xP4z1VYQJA0OWEIwWMXOM
	tWJzbNGMHuQtdtp7IiT5hnqpck/hqzn9F7EH+2Yp5i9s0PXjqQSZVi1m75E1YIaG8FmVR101/Fs
	WybraXK51as+BzDljz+imlfb2/umZf7/zkledx6uefRVP/sTe7uuzoSUCpcYj4qk0Yv2rq+KlB4
	NZW+x9NTpk8XEt0b8VWnM0UcaVH2ZJZMz5xzR3F0X6JLkK87MtRQiUlVIKOQo6ZLH9JB+CnBdch
	GmZ+6gh/QmjOmt6rKAeBJ3jG2l4rje+x6RyJcfwgzZyU3ACS1hiprbu/1gTA1ZCDssyiQqpplRF
	BXvg==
X-Received: by 2002:a17:90b:1a82:b0:3ac:9176:e83c with SMTP id 98e67ed59e1d1-3b12d31a3f0mr2278470a91.12.1794175066527;
        Sun, 08 Nov 2026 13:57:46 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1152fa888sm5692976a91.9.2026.11.08.13.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:57:45 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Alban Bedel <albeu@free.fr>
Cc: Radu Rendec <radu@rendec.net>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH v2 0/3] ath79: flush every write buffer of a shared CPU interrupt
Date: Sun,  8 Nov 2026 13:57:35 -0800
Message-ID: <20261108215738.113582-1-rosenp@gmail.com>
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

On AR934x and QCA953x, the WMAC and the PCIe root complex share CPU
interrupt 2, but each writes to DDR through its own write buffer in the
DDR controller. The ath79 CPU interrupt controller flushes one write
buffer per interrupt before running its handlers, so only the buffer
listed last in the device tree gets flushed, and the other device can
read stale descriptors.

Patch 1 documents in the binding that a CPU interrupt may be listed
once per write buffer. Patch 2 keeps a mask of write buffers per CPU
interrupt and flushes all of them, and documents how the interrupt
lines, the write buffers and the flush fit together. Patch 3, suggested
by Thomas, starts the flushes of all the buffers of an interrupt before
waiting for any of them, so they drain in parallel, and replaces the
"It must be run twice" comment with what the AR7100 datasheet says
about it.

Patch 3 changes the signature of ath79_ddr_wb_flush() and its call site
in the irqchip driver, so patches 2 and 3 should go through the same
tree.

Changes since v1:
- Add dt-binding change.
- Add a comment describing the interrupt wiring and the write buffers
  (Thomas)
- New patch 3: flush the write buffers of an interrupt in parallel, and
  document the double flush from the AR7100 datasheet (Thomas)

Build tested with ath79_defconfig (LLVM, W=1).

Claude Code (Claude Opus 5.5) helped write the comments, patch 3 and
the commit messages, and searched the Atheros datasheets for the
double-flush requirement. I reviewed all the changes.

Rosen Penev (3):
  dt-bindings: interrupt-controller: qca,ar7100-cpu-intc: allow shared
    write buffer interrupts
  irqchip/ath79-cpu: flush every write buffer of a shared interrupt
  MIPS: ath79: flush the DDR write buffers of an interrupt in parallel

 .../qca,ar7100-cpu-intc.yaml                  |  5 +-
 arch/mips/ath79/common.c                      | 51 ++++++++++++++-----
 arch/mips/include/asm/mach-ath79/ath79.h      |  2 +-
 drivers/irqchip/irq-ath79-cpu.c               | 44 ++++++++++------
 4 files changed, 73 insertions(+), 29 deletions(-)

-- 
2.56.0

