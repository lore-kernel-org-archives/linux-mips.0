Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695608;
	b=gRRBZ/u9e6iGqU2N2WKEX6q9IdQ/FtY/dwZY+3Vu0nm7ylHFO7P0cU0+/AhmElrEctfv
	 +y4MYBNhiXjusaM7vcchDMUPWBo7n2dsi0sE/GmsInRTJCBgRs6+cGC+JYQZdNcRpioVY
	 ZzOuz8RHF7zSrGtoGpcV26W/29Vws8pIxyaz316QcFHAPFnu8S/yHAm2Bn85QglhlFgj4
	 KH3yPkSCcigi7rQK+dZjdRGxrBg2l1+JQG77h6pYBLwMjYKb4yX75jvoX4Z9yfehIIcRD
	 dfn9VJaG9KDxmAnc+k3B9X808QSRAZ5+zxjzwExD5wGIitrLESIui8GkhDot2SOTnjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZwpN3MWkuJgEw/5lVf5YS3s9N6pKk0wMcXzClzDmDeU=;
	b=Q5YZitzaYm0TfqPcA2a7UJGes2I+2PwBwTo3y3ZjNxmVaNyPipUwBsXubvJlO7VeVEq+
	 wuBCiJoV1cFWd6CCAXIrUMJ0SiwSFdo1c5K7xW2+qOMBjPGPtaFWB4aePZeQtnPHNTuj7
	 b0Gjlz2bBOw7MmQjMOzdfD2fckIYxfSf3c9ygcSBiSuDuX8Qq+R0vt2HR5Ape+a/48fx/
	 i5OGts6AcpzeJy6f7fx4qaXIU56+rBfHe0b6bI+SWJIfF5kE205mWPLWXBkOGhMbNxkkF
	 GfO+cdWVBxhLDluvoJ0shxvf+LfYoGnfAgZnPZVwOnwUaJ18rw6IFEymzTZwA3CmZRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tmrLDn5D;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFBD606A329
	for <linux-mips@vger.kernel.org>; Tue,  3 Nov 2026 08:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBFBD606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tmrLDn5D
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd69954c755so2842794a12.3
        for <linux-mips@vger.kernel.org>; Tue, 03 Nov 2026 00:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793695607; x=1794300407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZwpN3MWkuJgEw/5lVf5YS3s9N6pKk0wMcXzClzDmDeU=;
        b=tmrLDn5DgdsgbIctBbIJsfK7Y2GKRlv04AVwZzWIVHmW5P1vliiZbYj/pkdJrN9YIc
         FU/twe4HI1RPmiFs78bzbQvbHNGn4JP883Uin26ttA7z/MK9FrCJtnMHZoxCXCZ9JX5E
         RNG+2684vScWrtFCOyVwj1z2d+Oa/Id82LBP/Pt0j2ljK5xQvFgbHb400AdmWWD4Z9rp
         N0PKe2T7nuxxynUiNBu43cDnwf6QSKRZttd9S8yAWslmyq8teVJpoEBZDTmFWYzFmmLw
         Whkr/0rTzrgEJkVBjWrvJn1lNvef03prOlIqd0tE5CwkMAgKIuPjbHcVKduRu78M/rJQ
         fLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695607; x=1794300407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZwpN3MWkuJgEw/5lVf5YS3s9N6pKk0wMcXzClzDmDeU=;
        b=pYOerfx/7SNCf16E+xdkEB7WDIZtJ7VtI4GtTVLMIDWRTuSSFlemWZEM9oS0WQqn2o
         U9OHI5boIOzWOKqWd+iMAvoGx7+k3eqyYpa0d438OOgcfVdyq/WIbuIIWfGvHuOFlUh9
         fb8IgtUcyxhFHJKTHDXVXyFvqEy7CNxAGwwEg8/+57JoBG6i5hqYtmWkqiI097kAjmQa
         0PBma6PsctVr6HuF9Acm9vKdYC5xR97QVrPECMO1RgO/DOJdEHRl845tzhG7Ny70Qq85
         4iF3qzrVZEtKOmoXZAB3n9Zm2jEtXskxrZ8CpPRFH1iU9Wes7ITUB4D3jCIgRzKSYEQ4
         uePQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnqm++feHJSihoTya5yb2KdAaS9fxHGhCv3LcE8OeaI59jZZsjGsDgwGiUD9vtOcYnEOR0Ysu0aiow@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZXzeebGpyTzsj/KiibmOqYJGSIrbGYD51fnlVEvvuiYalLi60
	OXyvmpSHd8/Lre50VCR1aDgleUI81SWUtKx2CKYzCRn5pWIr8UzzleLW
X-Gm-Gg: AYBFou1+KtNNjakllCjMtnE5ly6NGp8iMRW3aa0qqwnNCNcDPOg3ECpbCSvwkXf289D
	SVhKSLp+Wkz+L5Uwi2rLevfGrAkdxSml1lHpo9L1TJJqpAi+1yF12abpKS4pFV2xYS1xSBoeFhn
	hR3aBgJVfOLgxZFT4Hi5rT1uhRhfJIYuSX7BAw7ktHbKPS1poHRbUC7iGf3rNDQyqJPyA9iOf5+
	O+tiT4CNbBeE0/x62JwMPUArg+lz3hg34YLJni+vcrYN0yhkY90FrnBnEVg811gkIj53qyqVKSc
	NyV55D1O4p3PzESJQ2Q7Q1rzESCfLY/5rrgUcetcYTTrLOD1DhW+zjRwTRWcFYGM5ttj/YR9/J8
	zYy9AuvJ0mUUhCDbZ0CZA433Y+iCpGrXqcDmbbwEMp5Jb1jE39DQqsLYZ40t5P5eORhe3p2zvwL
	ZS5pN7ackgtL+YrMJ2t6a64w6uN5nXBclDWvgH7t/eQ4oFtMmw4pNrLHg1XkUh9EneXTPD6dBzM
	mUtoGGk9UHxOlNv5eRzRt15efEPZfs66hTrHyfQikJBoqRoYzNG/GFMlM1k9XvRCRIFTdKypeGq
	Ai9XAXYq0kI8YZn8Aj6c0bE/UIj2xtkvFTdhzPEd5BZiY/mFgqP0NQyGeo/08640SK5uPA==
X-Received: by 2002:a05:6a21:1bc1:b0:3e1:8a96:7bbb with SMTP id adf61e73a8af0-3e928a24501mr11343003637.51.1793695607116;
        Tue, 03 Nov 2026 00:46:47 -0800 (PST)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb364a8910sm901853a12.23.2026.11.03.00.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:46:46 -0800 (PST)
From: Li Ximo <lixicaicai@gmail.com>
To: Keguang Zhang <keguang.zhang@gmail.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	linux-mips@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH v2 1/2] dmaengine: loongson1: reject zero-length sg requests in prep_slave_sg
Date: Tue,  3 Nov 2026 16:46:37 +0800
Message-Id: <20261103084638.1190232-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
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

From: Wang Haoran <haoranwangsec@gmail.com>

dmaengine_prep_slave_sg() forwards an sg_len of 0 to the driver
unmodified. ls1x_dma_prep_slave_sg() does not reject it, and
ls1x_dma_prep_lli() then builds no LLIs (the for_each_sg() loop body
never executes) yet still returns success, producing a descriptor with
an empty lli_list that is queued as a valid transfer.

Reject sg_len == 0 requests early; a zero-length transfer is meaningless
anyway.

This issue was found by static analysis.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
v1: https://lore.kernel.org/r/20261026115113.3359939-1-lixicaicai@gmail.com
v2: split the two independent fixes into separate patches as requested
by Frank Li; no code change.

 drivers/dma/loongson/loongson1-apb-dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/loongson/loongson1-apb-dma.c b/drivers/dma/loongson/loongson1-apb-dma.c
index 89786cbd2..e7eb40584 100644
--- a/drivers/dma/loongson/loongson1-apb-dma.c
+++ b/drivers/dma/loongson/loongson1-apb-dma.c
@@ -302,6 +302,9 @@ ls1x_dma_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
 	dev_dbg(chan2dev(dchan), "sg_len=%u flags=0x%lx dir=%s\n",
 		sg_len, flags, dmaengine_get_direction_text(dir));
 
+	if (!sg_len)
+		return NULL;
+
 	desc = ls1x_dma_alloc_desc();
 	if (!desc)
 		return NULL;
-- 
2.30.2
