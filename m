Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794010003;
	b=P1Y2ZRy8HwGmKzuIPA8KjNAU0vCRTxjC1B+YzEzgMdIuzqZK/ySCaG5EjVFs4EOzJ3y1
	 qeXQM/4bzb2jN8mKNrSqVeFNjftk1JBL9N4bnGppXv5Psruuw4QNEg/4agZ4ANTnBT0oi
	 rDp6z7zanZ1rCxExfDUIugKgLWt8nayZZ6fVbNJnTABswm4kCME2Nn8Jo0Vo1HVS0aoXx
	 lL7wDwQz3ky8juGLGpc6ePI0jaKs7JYNy0WBFQE8rZGQa1GAaQB2qw/5wAXe/b9mlqkIl
	 8zvWinUPba+yF3w/KAetjYbY2TvSxP/n9VbFfg9/CmFFQ7pvwARkoEmRv+gv+li87og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794010003;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ZgUlYm807ROoByleEtNqO6HkY1e2yjPbq5r68jDHbbY=;
	b=outd/zJtZq8MQoicMCo+6On/8Ig6lrNMYcaroL44qG+3ZoxL7US1xxTVuwn32SoKi9/B
	 EFmHECpsafMKLj+lIPka2FlwVBqxNByuFN67kJpsL7iVcYfCpXZcm+Tn4/+mARXaiQjyA
	 ca4YB4g/gR2x85chMzfnnywWiw2Am842CifksP/ie1LxCAbar7JHX5yxRkUOH8loIEJuf
	 1YFTWrcc4YHsS0c42XASWcSRNdBktf74VxgmAKgXOKKsUojExyD1TVtWHM4pHpLhaC+YU
	 qnc0j+b9KBXXwdlDG1VEq0Lk24pqlLFC173SMm5UrToFtBHdfSug9ymLyTMR6HIHnTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=blHW9Stq;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=g3DbI5C8;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FD0606A326
	for <linux-mips@vger.kernel.org>; Sat,  7 Nov 2026 00:06:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24FD0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=blHW9Stq;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=g3DbI5C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZgUlYm807ROoByleEtNqO6HkY1e2yjPbq5r68jDHbbY=;
	b=blHW9Stq16HlAMW+Vr+8IoDMnu52jDSd2rEOgXK9puAM4vY1kvrUpGmPiMIn87/ruDmznp
	hgQ/enWjtHj7lkF7QAUROy9j3ELAcwmrF9FAjQCRWwBaua7VFfoudEaeEWnyj50HkRMUxm
	poCuvRfRON9asuFtdnmNJxF0//2u+xE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-pZQVPW52NB2kXYSKEaKblQ-1; Fri, 06 Nov 2026 19:06:39 -0500
X-MC-Unique: pZQVPW52NB2kXYSKEaKblQ-1
X-Mimecast-MFC-AGG-ID: pZQVPW52NB2kXYSKEaKblQ_1794009999
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f568dee56so243396685a.0
        for <linux-mips@vger.kernel.org>; Fri, 06 Nov 2026 16:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794009999; x=1794614799; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZgUlYm807ROoByleEtNqO6HkY1e2yjPbq5r68jDHbbY=;
        b=g3DbI5C8Sh5jcyfqakITrZg6V+R8EqZ5c4PJgRcJUNWVtvvYNAPU+9F48wUwE0u/pl
         qxuEmJmn/PB1MiIyyMKLY3iEi/aJ+nQKn2OyRuTr/pjnAcJ5vbcTm9FQaGBghh4mmpUY
         TFXFRHJBN/yxLdRYbDfB4v99hummaGeIx09R9dMoMXTQL6WbrsmswpbWpd7vMb8Y+j7P
         xkP/DNt12faKBXW+LCzmkbmqThBH6yq8WzNOaiL/L+6EXG628GWS8A8bRGDcl7xvbSHC
         G47RTK8+FsWYD15x0kNRuXJoVZ1KwHRJQN3NUdlIDR7UpZ/o1hJIuAjtrbI8UT7I1ud5
         Th7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794009999; x=1794614799;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZgUlYm807ROoByleEtNqO6HkY1e2yjPbq5r68jDHbbY=;
        b=y2h4rW5Sp/mijW6L0HVWgzzQmj/GOFrpMhxm8WnnevbljfRDZccooZFcrgXBSNjFao
         Wx5kpn3+fGFk/uOk9ZBmoE++eGpRm4/AlmgxeyvoqTmu43f5lhpnrcomEbwk/SbsF6/x
         gy/qsyA/G+uQyjV4icPumPwePGPTOkZilP+WSQhas+WJDQ4ODwExnOSLKNMOk2JyQ2Pb
         WT4FrsyDv8MXbBq1TOh975cIGRfBs/CUG0RYujq+iy+OqtHwyFzcWhgxAyN1lkKTHQkS
         vPssX9Ae1Ifj9eNOEwE1zQmq8yLD7Y0ehasbmVFpPJNGaBDMRBY7p41URqcgEH0ANzIQ
         0ilQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6tLRM9wN6gP1HkqCAYxTiuNF/WF2z8jdWk7U4Tc4rv6pViuQElppk6yGioW+shkwKa9F3exu8MYDi@vger.kernel.org
X-Gm-Message-State: APuU4Z+cvTJTs67nEPmzalGDZ1zyYelzq8B3TtRo7MF+mbInXRWWH5qn
	aFgxJBYUUqOZ9v2WhAhN0K6IuJt2/WxURyMBRf3J0u3JQLqCpOqAmWW1XVvzDlm0iL3IMdOhmlZ
	sQwFRf3r5lSRPuOpRp1kzX9IGF1SWzCFXKekjoOsTCsC+9QsMDJUh3A1hrKsOH6Q=
X-Gm-Gg: AYBFou1iuqxdH6TmxQNT0a//cPKp019mezsuD4wkUYUE8Yd6rnsitAxuXSRz8H2n/tX
	+hA3xx1564LV4c+j7/4KmZ8jxM3kZg/M2mAqlwTUlVbsTnTdFQMx2UR1pG8meP87s43rqLPlTZ8
	emDaKdBkE3OjNrJflgcWVet16tRarNRTWEJh70TX64heRLxHWsfhmjg8gUAkm9fH/xq0zDX9T1A
	IOi9XB6VNMxBtSg1yFNjlj1FKSdb8tVVhVYb68lkkoPsB2Z6m4HmS+JRixPEbxAlZlH3ZT+JgBB
	/lW9Zl4WHJcyXjZRYVxxrQ2YpB6ay5lqmijSiC2mknLqiZsZyFInrFEUqiNalVhWlKA/N6gzR00
	VCBKvNYrqmGU2pVP1zf4GuiZLWB08p6GzQhXvARAZvFRBh3JmRp+yngYrS+uxZf4NBMM5jQCmCo
	70wzotMfUNX1fpeygn
X-Received: by 2002:a05:620a:4487:b0:93e:c12c:fbbf with SMTP id af79cd13be357-945f36131dfmr656684685a.76.1794009999336;
        Fri, 06 Nov 2026 16:06:39 -0800 (PST)
X-Received: by 2002:a05:620a:4487:b0:93e:c12c:fbbf with SMTP id af79cd13be357-945f36131dfmr656679385a.76.1794009998935;
        Fri, 06 Nov 2026 16:06:38 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6acc4a7sm31624376d6.44.2026.11.06.16.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:06:38 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/3] dmaengine: convert to subsys_platform_driver() and
 subsys_platform_driver_probe()
Date: Fri, 06 Nov 2026 19:06:07 -0500
Message-Id: <20261106-dmaengine-subsys-v1-0-780eeddbf3ef@redhat.com>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBCF4auEWRvItDaCVxEXMZnEEYySaYsl5
 O5Gu/zgvb+CUGESOKsKhVYWfuUOPCjwd5cTaQ7dMJjBIppJh6ejnDiTluUmm2gM/oQWRxPxCP3
 2LhT5809errv78kF+/nWgtS91cMYmdAAAAA==
X-Change-ID: 20261105-dmaengine-subsys-1dc716130f14
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Paul Cercueil <paul@crapouillou.net>, Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, 
 Zhang Wei <zw@zh-kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 imx@lists.linux.dev, linux-actions@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=1433; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=oVVsVvvwfxfCApVHL620mY2qW7PKDgCvH3JDOSlJNIU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeZdcF1fMUmH+rXipql15WdnT/1AeSXHt/1r/5ue1r9
 M+H33PedJSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCR/hkM/8zit2odZXRSqNV5
 sVO+W9Z/z9Uvm+4UuU33k+g7uHdzqgojQ8N5ObsWa4OmxOCDrNu7b3qnL/RZuSGFoz3q0Oawy6H
 sjAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in these drivers and convert them over to use
the macros subsys_platform_driver() and subsys_platform_driver_probe().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (3):
      dmaengine: convert to subsys_platform_driver()
      dmaengine: convert to subsys_platform_driver_probe()
      dmaengine: fsldma: convert to subsys_platform_driver()

 drivers/dma/at_xdmac.c          | 12 +-----------
 drivers/dma/bestcomm/bestcomm.c | 18 +-----------------
 drivers/dma/dma-jz4780.c        | 12 +-----------
 drivers/dma/dw/platform.c       | 12 +-----------
 drivers/dma/fsl-edma-main.c     | 12 +-----------
 drivers/dma/fsldma.c            | 14 +-------------
 drivers/dma/imx-dma.c           |  6 +-----
 drivers/dma/mcf-edma-main.c     | 12 +-----------
 drivers/dma/moxart-dma.c        | 12 +-----------
 drivers/dma/owl-dma.c           | 12 +-----------
 drivers/dma/sa11x0-dma.c        | 12 +-----------
 drivers/dma/sf-pdma/sf-pdma.c   | 14 +-------------
 drivers/dma/ste_dma40.c         |  6 +-----
 drivers/dma/ti/omap-dma.c       | 12 +-----------
 14 files changed, 14 insertions(+), 152 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261105-dmaengine-subsys-1dc716130f14

Best regards,
--  
Brian Masney <bmasney@redhat.com>

