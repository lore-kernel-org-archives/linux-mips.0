Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EE83BB119
	for <linux-mips@vger.kernel.org>; Tue, 15 Sep 2026 08:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789460316; cv=none; b=b0H6Rz+spyBdHNKkKn3B9w2xkAXfahGfG49yV9lGL+DUqJRefr/x+yiSoBirTOjlEiqkaL6Lz1yBxSs6ta6LljOQcPPYYWwWGiFxMscGbDqgtoxYOIk7ms8Iq3wdLA5PoKPf3hqH6QH+UCdoj5p/dMDbAOjgf+PQ4u9SUPtPqns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789460316; c=relaxed/simple;
	bh=lOQbPcQynRlGZ/Q50Tqj4rGQvSO+qbh5AVXbmj13gLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mhV9Jn3sc8j6k1A8QmgTVNlIg7Xfv09oFwkRNRgu8D37HBpVTHFdmhpUyXab0kvMbzmFmd+gknvJc4G2God1LZoOZU64TwARWLidordaW675GCAmeGSsoUaOAsH01pDT9BwjlBDv6K8brhNSP+ZUTWQUVlIr6DLyPFgEvTP2LF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=skGaUNWT; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="skGaUNWT"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f89so1477879f8f.3
        for <linux-mips@vger.kernel.org>; Tue, 15 Sep 2026 01:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789460311; x=1790065111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iFhutd9pqTGsF04ISvLBlwYD4248S5jglxybwKHrW2o=;
        b=skGaUNWTuobbCP3QnOI3cBGSw/YY5EpSkDvxnA+EHjdsprm25qDEVKJRVJSH8zNQ5x
         fXJvydBTQx0lsgemO0KJPOBhYufqCqtnzobbdowQgGLmfFDzrazZCp65rRx8EhgapCHS
         yOpFSpTiu9vVcDOV0GHfzbumAgTrhdJ87P2DA9XP6j6/WVo6nP9eU7FN7cHmx6G5MYew
         ZI+P1IUEf7viypoWUAQvBUvjKBj+inOJ/2aHRZzHq825rK2twQ1uxdZEVMmQ+SznXuMw
         MIQypgB1NPvvSH5Cs24WbCT3RyYzmPRimhLh6MuqwqfgBfoc7iS6FChLkAHWGevJ93VT
         KFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789460311; x=1790065111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iFhutd9pqTGsF04ISvLBlwYD4248S5jglxybwKHrW2o=;
        b=UpBLoe202YGnb0O2Cdings+x2pkDpbEEey8k/XM8uSJlZhGVBF/FtuYGqFkBGgUN7o
         TbDIuZe22hSwDAD+08RDDEREtUDp4tHcSHE9GaKKq8wbGaQpOmhjO8GbXy9RpWWwXOxe
         cgaP8IuxWNql4cNXGzSu89jGojGja9cCsC98m+CoAnpsH2HW9WaDQI0gAtDCjFTh6uFq
         V1D8njOQuNs2cgGH6dyiOAbuKZuNPeintrv+jOwfuSd8AwlQYa0g2JDoMJiP5YDPkbmx
         DmMrQaPyddEATIUGbWgeQA7yN58DHhOz1hv5zURrleXKESSFD6bdwAyDyk8PuFJ75J6Q
         JdbQ==
X-Gm-Message-State: AFuF++nPdQsjURtW3Px72JUO0PxPOagWRXLONGagwCVBVcSmC/2XJfe9
	8zQ+kG8nCBSEnJgySk3VubEW2h21cac+UZgXEeGlAjphQ3RMwMRbTMhx
X-Gm-Gg: AYBFou37XslJeENSUqUDznP1j1Ke8XTcZ95sKee/nzHoY5+VA9JGUGvgi80Z6CbANs2
	qiUfw1gJ/PccWaFGAQjYCAH76cIZKxTPwifk7+FUo9PF5uMtvZuGo7HJGZB4ah0nSR4Pf6MVS5u
	dYtWDFp/CkOKsq4sikY5SE5u0CFkYTFfCL/S4Pt6E96n6+RLQ7BuKD3/WPILmacbE07cdJUQUgs
	I++Z8QaQKGyJGK16EYZ5XPfYQGRFh4CzElWsDqUQigd6R/s/0pyCFZVQoQkzcyUwGtfQUHbmzLM
	XhkYSDKvTgF2rcv7bKmU/WwRxy/wORBkDpGGEDTY5lfi2k2t+4MAPBJd4uqpUfD98XOGYDklDhX
	YrQMccTmiQgkJstgLbUZAVGjUGa1KV9Kw2UdPM8jZRIbhNzVo02u97xaPC3UnfJ22jAoYYEa+0t
	DReY4+atvFkLkuKlFjWCDS1eTbzYISzjl6yoHhte8GumkXFbugX6iTvv3Rb85/R3JUJkMvfW2H6
	+FY599vPz64NLBqoSDUfD6Q3ry/Q8GtcJ0DHZv9OMzFasD2DdiAEQ0QA9TLAmEioiKYBZMq0ycB
	axCAocIoHYY5o1w+YEJ/Fqeq2l4=
X-Received: by 2002:a05:6000:2c05:b0:487:7fe:e96e with SMTP id ffacd0b85a97d-48707ff1dbdmr1656878f8f.21.1789460311322;
        Tue, 15 Sep 2026 01:18:31 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecfc3sm31341974f8f.4.2026.09.15.01.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:18:30 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] MIPS: Octeon: size the swiotlb for a modular OHCI platform driver
Date: Tue, 15 Sep 2026 08:18:24 +0000
Message-ID: <20260915081828.25800-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

plat_swiotlb_setup() raises the swiotlb to 64 MB on OCTEON II with
memory above 4 GB, because that OHCI can only DMA to 32 bits. The test
is "#ifdef CONFIG_USB_OHCI_HCD_PLATFORM", which is false when the driver
is a module - the usual way to build it - so the bump is silently
skipped.

What is left depends on the rest of the function: with PCI enabled the
"memory past the BAR1 hole" branch happens to ask for the same 64 MB,
but with CONFIG_PCI off - which is normal on these SoCs when no PCI
devices are wired - swiotlbsize stays at the PAGE_SIZE it was
initialised to. A full- or low-speed device on an OCTEON II board with
more than 4 GB of RAM then has no bounce buffer to speak of.

Use IS_ENABLED() so a modular OHCI gets the same sizing as a built-in
one. Seen on a CN6635 board with 8 GB of RAM and
CONFIG_USB_OHCI_HCD_PLATFORM=m.

Fixes: a8667d706dfa ("MIPS: OCTEON: dma-octeon: fix OHCI USB config check")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
diff --git a/arch/mips/cavium-octeon/dma-octeon.c b/arch/mips/cavium-octeon/dma-octeon.c
--- a/arch/mips/cavium-octeon/dma-octeon.c
+++ b/arch/mips/cavium-octeon/dma-octeon.c
@@ -228,7 +228,7 @@ void __init plat_swiotlb_setup(void)
 		swiotlbsize = 64 * (1<<20);
 	}
 #endif
-#ifdef CONFIG_USB_OHCI_HCD_PLATFORM
+#if IS_ENABLED(CONFIG_USB_OHCI_HCD_PLATFORM)
 	/* OCTEON II ohci is only 32-bit. */
 	if (OCTEON_IS_OCTEON2() && max_addr >= 0x100000000ul)
 		swiotlbsize = 64 * (1<<20);
-- 
2.47.0
