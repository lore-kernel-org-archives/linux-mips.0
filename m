Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434036;
	b=rSEQcY03Hl1nDuOp1HlekDMNhUh7tE7DyOdomvWgfWq6PXPH1+QLR6dWFDo3rJeKpbTi
	 WevKloAZSV6jQIqgakHKEXuV+JuO/kJsplc/arHcvBGQMmICFyv2NOk7Zn5PTFkkIEhQ5
	 Tp5LE7AZR2R/Ae4nBKnc1opv2+I5stP4tiZ57NmGCIkDAPQqIRAZEd6CT+QxXnkGkTsT2
	 xTEGHvS17nYiHGuB2BaPLnTZ03+bMLNAQLJLt3p/BQB5QjnWqKzIx6mvVVCp5xm1KMHIa
	 tZ4rn5diiykh1bF9kg77TXUXZAVW4V5PpVm4BaVUOFSjTselNrBUYx+Zr1ldwFvclHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434036;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=vo+Xid6UcgteTwGX3R58YBsHWjRppW5tyw1bkBxSt4I=;
	b=E6+iVvcNDBCqFfp/dgbXjW/sEf8U0ULLNC0HB/9u+ETpOITWS2ZhISubGiKyu1Ta62SA
	 UKGV4JyPp4ZoMLPdSP38ZDs2Q02/0h642epvkzXrQvxG0KF16uDnC09mCedqXHtmu4E3u
	 zzr8X1/b3kJfUQ9sFQyE9LE76O2n6Ap5j2FYaxa3xhN/Jxh1d4obnpYwrtuZmIxAyOOX9
	 Sn6kq086w7Ds40gMFxObO1TVdayixHQul8NGHuOd3SxfDajAS7YuhOjHJvtcFQwvIdNsW
	 vwMO2Z2ZNe2DlGhGztIgAIdKTxe3qLpqtGfCQDErrMJ+2UJ7G/pTT9BrM3S5B1G5/EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="iPI/oWpC";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308CE606A883;
	Wed, 11 Nov 2026 21:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iPI/oWpC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C9C61F00A07;
	Wed, 11 Nov 2026 21:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794434036;
	bh=vo+Xid6UcgteTwGX3R58YBsHWjRppW5tyw1bkBxSt4I=;
	h=From:To:Cc:Subject:Date;
	b=iPI/oWpCeHnCEMErtUbB2VDRAaWW9J2fj7z9qM9xNObLw+vhYbiTeAAwKI1GUFzpB
	 8J6tK9NjXMawtWmXJ7EtuvUVZzv8i3Jpo8wL8PB1fsAMjH0l4TLB9N0tWy/8P5qAs1
	 NTb4kOWKJ9UHTsJy7quNX5jyg9qB1PzdgIaBm78Mui3Pk/VxmwHT9TUjJTvesjDWmH
	 F1rZ6wO/8t6MTYTfWN4BNEmcCIYAHoqq4cZVBcz5j41IjehzfuTZ8B9YHn4DWdlYn1
	 oIGezAmdft8/q/HoSW91hLiKYlQpj3zSQDRMHUe/bqnI+HxDaqih3NGGAF6AB5swkP
	 NchItdGVZuArA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Akinobu Mita <akinobu.mita@gmail.com>,
	Alex Smith <alex@alex-smith.me.uk>,
	Andrey Volkov <avolkov@varma-el.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Dale Farnsworth <dfarnsworth@mvista.com>,
	dmaengine@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	Gary R Hook <gary.hook@amd.com>,
	Grant Likely <grant.likely@secretlab.ca>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Joachim Eastwood <manabian@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	Paul Cercueil <paul@crapouillou.net>,
	Peter Pearse <peter.pearse@arm.com>,
	Philipp Stanner <pstanner@redhat.com>,
	Raju Rangoju <Raju.Rangoju@amd.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sanjay R Mehta <sanju.mehta@amd.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Sylvain Munaut <tnt@246tNt.com>,
	Vinod Koul <vkoul@kernel.org>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [PATCH 00/10] dmaengine: Fix teardown races, resource leaks, and error handling
Date: Wed, 11 Nov 2026 21:52:38 +0000
Message-ID: <20261111215349.1983909-1-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These issues were reported by Sashiko.

Cc: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Alex Smith <alex@alex-smith.me.uk>
Cc: Andrey Volkov <avolkov@varma-el.com>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: Colin Ian King <colin.i.king@gmail.com>
Cc: Dale Farnsworth <dfarnsworth@mvista.com>
Cc: dmaengine@vger.kernel.org
Cc: Frank Li <Frank.Li@kernel.org>
Cc: Gary R Hook <gary.hook@amd.com>
Cc: Grant Likely <grant.likely@secretlab.ca>
Cc: Jacky Huang <ychuang3@nuvoton.com>
Cc: Joachim Eastwood <manabian@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mips@vger.kernel.org
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Peter Pearse <peter.pearse@arm.com>
Cc: Philipp Stanner <pstanner@redhat.com>
Cc: Raju Rangoju <Raju.Rangoju@amd.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Sanjay R Mehta <sanju.mehta@amd.com>
Cc: Shan-Chun Hung <schung@nuvoton.com>
Cc: Sylvain Munaut <tnt@246tNt.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>

Lee Jones (10):
  dmaengine: pl08x: Defer OF DMA controller registration until slave
    setup
  dmaengine: ae4dma: Unregister DMA engine in ae4_pci_remove()
  dmaengine: ptdma: Unmap descriptor in pt_do_cleanup()
  dmaengine: ptdma: Remove completed descriptor under vc.lock in
    pt_cmd_callback_work()
  dmaengine: amlogic: Destroy free_wq after devres DMA device
    unregistration
  dmaengine: arm-dma350: Query dma_cookie_status() under vc.lock in
    d350_tx_status()
  dmaengine: bestcomm: Defer publishing bcom_eng until initialisation
    completes
  dmaengine: bestcomm: Check rh_create() return value in
    bcom_sram_init()
  dmaengine: jz4780: Fix descriptor cleanup on hwdesc setup failure
  dmaengine: dmatest: Avoid unsigned underflow in min_odd()

 drivers/dma/amba-pl08x.c                | 23 +++++++++
 drivers/dma/amd/ae4dma/ae4dma-pci.c     |  1 +
 drivers/dma/amd/ptdma/ptdma-dmaengine.c |  4 +-
 drivers/dma/amlogic-dma.c               |  3 +-
 drivers/dma/arm-dma350.c                |  3 +-
 drivers/dma/bestcomm/bestcomm.c         | 69 +++++++++++++------------
 drivers/dma/bestcomm/sram.c             |  6 +++
 drivers/dma/dma-jz4780.c                |  5 +-
 drivers/dma/dmatest.c                   |  6 +++
 9 files changed, 80 insertions(+), 40 deletions(-)

-- 
2.56.0.567.gdb80ae8cd5-goog

