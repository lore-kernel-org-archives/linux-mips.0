Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792610727;
	b=bzYFH2YCqsb5FbK2bKLxV7lerhNSgPewdtZMYaBgRdVPfTsGp8nU3mkPzZW1cRMtOCVe
	 sDSkdG3E96J15GUb3tdRxzB2wbweLJ20nSO5KAwPbXkgx2Bbqeefa5FbLaEK/dpz4cD4d
	 XpwoPktwdENstVdxlOSqSvLpzZI1MiyXNHFNqZQ8SNxFPrSx+OgvcAWOWyihJ2JQUlYLv
	 HKeq9KR3JP9O3qkMTDCqz7s1QOypQ/2upqQF6X1xbcKGV2pUOlvMK1LK9qf8LoRrUXz4S
	 hstYcckGo7q7PPRxQ4gGPGLM/5fT7MG+OLtiwNGW/+lFWHrdFs6fnAUPdA1fy+VBncg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792610727;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sjCpdyShRVnpbbjsucvC1+bwhlDf66MnFYOscuaJnwA=;
	b=srS4gZj8lXTBcPCPW5xA3sp4FPg/6pEGktt76Oqr5sQ8ornSCxO7so1dE8tGtp+8W+/c
	 z/RkguK9N6Bh72h8sn0uissdbZ351HJ+/B8gdgK2B7DMfQqvjw9HPEfe7w6j2U6DCwf0z
	 7qAMRcATUy1B+ubpzw0mFe6aqohKHjGCx6LcjU6ynX78NLd33BHY6o3Zl4tMTIJzr/dhM
	 II4Dl6HA6v6KslRmfTnADkp6AnuknuSMG1aRGsy5zjBLNSzp0L9w5mRKc/Wqh/RCkRtlJ
	 Up6g9kGwU7twzbWOA0VneCXqCTz7MDhMqYEaN7eFLhfJFBmSaq9gRzo4OMmhiYz4mIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ee13T8jx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A15606A319;
	Wed, 21 Oct 2026 19:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ee13T8jx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C393D1F000C1;
	Wed, 21 Oct 2026 19:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792610726;
	bh=sjCpdyShRVnpbbjsucvC1+bwhlDf66MnFYOscuaJnwA=;
	h=From:To:Cc:Subject:Date;
	b=Ee13T8jxwM4nqTd1hnjNcmqfhN4urnClOV6Golnug9uNr9af0+GcMsGsrXnOWmNhL
	 RK5rNkzbRYFcHOzo529rCYDd+XbRRdQFlcg+pXwIVqw3iS5umj5t8ereN5ip62tlNQ
	 WveS3rfug/z3vc/MmWcRyCmSK+O78zCl/JPGiuWrTI3sX4fZhfjVCqpKTnR6eU80PB
	 /PkAUqfQY2sPNqqKgzSROPK27sx9eeQnkbiUFrPmc45jUc7WC01c5bpFbvtFzqopao
	 8rhEwTLjJVJ8Vdl1w8bRUApvogUYuJUArI7b6j005+xnqdJBrdn9RQ7zk3gooRVua7
	 00/H1sJiLLiXg==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] MIPS: sgi-ip32: CRIME 1.1 and MACE PCI fixes
Date: Wed, 21 Oct 2026 21:24:14 +0200
Message-ID: <20261021192418.7246-1-kaloz@kernel.org>
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

This series fixes hangs and stale PIO reads on SGI O2 machines with a
CRIME 1.1 memory controller.

Patches 1-2 stop the MACE PCI code from issuing a bridge register
sequence that hangs the machine under DMA load: slot interrupts are
masked in CRIME and the bridge control register is left alone at run
time, as IRIX, OpenBSD and NetBSD do.

Patch 3 reports the real CRIME revision, which the current code
reads as 1 on both 1.1 and 1.4. Patch 4 fences PIO reads on CRIME
1.1, where a read that follows an aic7880 status register read within
a few microseconds returns stale data; the fence stays off on 1.4.

Patches 1-2 are independent of 3-4 and are marked for stable.

Tested on O2 systems with CRIME 1.1 and 1.4.

Imre Kaloz (4):
  MIPS: sgi-ip32: Mask MACE PCI interrupts in CRIME only
  MIPS: sgi-ip32: Leave MACE PCI control alone in config accesses
  MIPS: sgi-ip32: Report the real CRIME revision
  MIPS: sgi-ip32: Fence PIO reads on CRIME 1.1

 arch/mips/include/asm/io.h                    | 11 +++++
 arch/mips/include/asm/ip32/crime.h            |  2 +-
 .../include/asm/mach-generic/read-fence.h     | 20 +++++++++
 arch/mips/include/asm/mach-ip32/read-fence.h  | 29 ++++++++++++
 arch/mips/pci/ops-mace.c                      | 26 ++++++++---
 arch/mips/pci/pci-ip32.c                      |  9 +++-
 arch/mips/sgi-ip32/crime.c                    | 38 +++++++++++++---
 arch/mips/sgi-ip32/ip32-irq.c                 | 45 ++-----------------
 8 files changed, 123 insertions(+), 57 deletions(-)
 create mode 100644 arch/mips/include/asm/mach-generic/read-fence.h
 create mode 100644 arch/mips/include/asm/mach-ip32/read-fence.h


base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.47.3

