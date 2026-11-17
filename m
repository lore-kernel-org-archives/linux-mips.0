Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933497;
	b=IjZF14+8zT0swQZe0eALJ9wsU5USTjtBplSOeVHxjNvmWdrm7ImsHRB5k4GSdQqtZ1Ez
	 Gm8u8wmCJG28Vo7ilLx4sARNiS4ItDogVQnGQ1eKzP++Ui29MjjShnQ3yKxFRlRWpRb7f
	 K5RcPx9/bEdcAov+zyK3fAzmCd3laSuCn/SLjtj6j+XqpO/7vMVMc9+Ch96zjYVq4ZaD1
	 Ehvk7AiMBiFKy9DgNZS9tv03y+xsAkqgFKBeayqH1HNknW2uja6riUeUp4AOcy93h5xtD
	 ZLZ0m/CJIZJUZcsu/QIVnUafYDOaXwso7/DYvSxa5G15fdgm68RDuRXeCc44IYkSxyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933497;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JVdWED9lCpstMBkqd4TNKoEbfRhRrtDeXaw+rnQt51c=;
	b=2d+bym0lPN5njjMYNtHwPSsW55es/eQqp+CtZzvNo+XS+SRC2faAhQX+6cwk3LLTDnAD
	 nJs4rXE5zl6KAJ5IayqAQB6yLFcscUMDHWWzZ9Oo1UFVsBO+WbrGVPqJK93Kr4LtnUTjR
	 INPit9Wz5wvn+JjgkUvnoujqPVoi7btr+20FwGmGnOEGgb+iEzr3RadhJT8qx/0tRUGq7
	 G+qQ4BMswVXPv0MsX+oU+WQYQHy22QChKGUHfa/4mY3YvzRYyZQdrsGX89bWUoQnVHnFK
	 c8wZGGbfyhFQyx6zRs0zFPXMM0DC2V9rHAGb2+4qUg5OyxHU12IF9+dkNpyCCnDOf2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kMp4DzAV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07601606A32A;
	Tue, 17 Nov 2026 16:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kMp4DzAV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8085E1F000C4;
	Tue, 17 Nov 2026 16:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794933496;
	bh=JVdWED9lCpstMBkqd4TNKoEbfRhRrtDeXaw+rnQt51c=;
	h=From:To:Cc:Subject:Date;
	b=kMp4DzAVffwgAnDTqUfw8+P9hqV0NQe8PzTtfA2/wqZlwRPMnkQnLArhA6Py3xoj/
	 /5kD+fhlfN6WpBGm6iqeMDr4gBIfTMB73WA4O1d89PVGcCwrKT7Wt4te+zNR0qzkXZ
	 Re+AfeUaiWnlC5JtjXCAZyK9SJU5dxmtWm9DPL++QEwuwNU7LkUogj4Q/hrHZHCRhE
	 PfzbffnZYetn85u19f3q/yqLzQMtndhklIKGGns9tDQ5vuhxVhrvrpao9Zv14DS94Y
	 1cGaEvsVFrMbASdlRKlj1NLVexObltN4HiL/FzbcUiGmhck/sN6jCUNUfEK99hBNK1
	 SG6I+cJ4pI7iQ==
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
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: [PATCH v2 00/11] dmaengine: Fix teardown races, resource leaks, and error handling
Date: Tue, 17 Nov 2026 16:37:01 +0000
Message-ID: <20261117163809.622249-1-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
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

v1 => v2:
 - ae4dma: Make the completion work terminable, so that cancelling it can
   no longer hang, and stop it before destroying the descriptor cache
   (Basavaraj)
 - jz4780: Correct the Fixes: tag

v1: https://lore.kernel.org/all/20261111215349.1983909-1-lee@kernel.org/

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

Lee Jones (11):
  dmaengine: pl08x: Defer OF DMA controller registration until slave
    setup
  dmaengine: ae4dma: Let the pending work exit before cancelling it
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
 drivers/dma/amd/ae4dma/ae4dma-dev.c     |  8 +++
 drivers/dma/amd/ae4dma/ae4dma-pci.c     |  6 +++
 drivers/dma/amd/ae4dma/ae4dma.h         |  1 +
 drivers/dma/amd/ptdma/ptdma-dmaengine.c |  3 +-
 drivers/dma/amlogic-dma.c               |  3 +-
 drivers/dma/arm-dma350.c                |  3 +-
 drivers/dma/bestcomm/bestcomm.c         | 69 +++++++++++++------------
 drivers/dma/bestcomm/sram.c             |  6 +++
 drivers/dma/dma-jz4780.c                |  5 +-
 drivers/dma/dmatest.c                   |  6 +++
 11 files changed, 93 insertions(+), 40 deletions(-)

-- 
2.56.0.679.gc527c65306-goog

