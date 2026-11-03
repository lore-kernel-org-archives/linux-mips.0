Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695614;
	b=rDPTO5QdtqPUota5Y7iDaqlz1sejPpsO/k6ywG4Li2C34tr+8dfvs/WnU7DOpHemh7w9
	 ks3H3zBBU03rU1onut8UPmLe35lsMcDkw7LiDyLGvN+p8YFAeUEOaQVP/j7/JQHfgc0MM
	 aLBiZ/G2vv0JHItWVEBeEzKb8S3fVa05J7tgWm6FNjnRcDhUHsvuhur4L43GO0BAP9mJh
	 tZdGvDPIfBKXC93E8j0l+cv4yKTqv6PlH8bV9lweAYopv/yOcNP6N416+AI/EBE60xsYn
	 F03BYgZbzu+onqA+dhFzjLryOsJpDhKwM5nd8efT12y7mEP0xsCLW3fEfM1I3EdKCFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DaAMQAoNt4SFPNSlC3xspfW3NQhhhksEw3M9tWuIsZo=;
	b=A+9jpVSdODncD4bO/BODMNB5mXTZaN+RJ3dHYqFxZfMzRJ6LUx8bLATN8o74Wn9jKsmr
	 ksnJQ4fsIeQIK71ZOxPyFptRZCAYYZoaXB4XQZoA11oc49UUNrb0oobDKl8JIA09AZvoK
	 7wxtqF0gfafyDCdR2z++ID033XxBPz9B7/1+knj6po2pDBCM13FUV8S6dmTTi752pAN41
	 XM/OYtzT8F/hLj0uS76Dk9onET8G07pHlZRQv/CWhkzrHD0qC3mjtlJJPl41rC7V+0pPk
	 V4p/7rUGFqT67iS2A8qObpyAI51cLCJ0GofhmLftcfo5wR32NY8UU9sbmaaz30aQpRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iIYhkLiO;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAE2606A945
	for <linux-mips@vger.kernel.org>; Tue,  3 Nov 2026 08:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFAE2606A945
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iIYhkLiO
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a05b210703so1468393b3a.0
        for <linux-mips@vger.kernel.org>; Tue, 03 Nov 2026 00:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793695613; x=1794300413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DaAMQAoNt4SFPNSlC3xspfW3NQhhhksEw3M9tWuIsZo=;
        b=iIYhkLiOG5EZseInBiin8/zJXscRN0ns3L1Na+C6KoKr3hs/UfUk0CkUcHnCfRgbJV
         lxQJQHgRVh93SX7RXRZmj/kusDGfaOT5nFdK+dRuPP6U/xv+1uIcm1+XC1znmWZEDtZO
         mdEDIIN2g7GazojQxcm/vHklqgMzSmGchY32GZ5EtIpDetKb4s74EWbkBRh34FFGqDbU
         BDcVK7zHRlv4GZycaD6aNxPwkB2rdB7ywldssYLRJVncN3fx8aqLR262aT0FsLmZMBxF
         P6faGDTRrnmz2annGvcYlsfHfVPffGoNus8PVII0/Kvcp/w28tKqEuJTtbAM36rQ8uQ+
         y0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695613; x=1794300413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DaAMQAoNt4SFPNSlC3xspfW3NQhhhksEw3M9tWuIsZo=;
        b=Ku+kwfbN+56nLaWxioKWH5VQxDu7rVVom7AyDhYFGHchP5aKsYtN8U1QSwuilMoH0z
         V6GO2zz7nhYzVtgcGZ7wFiGay8d0rnLlopUKZfgdbBGLN9R9y7qtFV5zAFWBjv8Sj3UL
         EGC2p1XWgkyi08dAeQZBTeKrxtUb9HaTUGq6Curw3aQ2MWfWOtTPdDu2r1Mds6nL5ZcU
         +xhPIkZYr49Q/98vxW9JHASQED56pubghICZ+jjw3PyL143oo6q8Ck4210S/hBYvs2E8
         mnq1lamcD5+SzFYeOLq9V/xisgCbnA8F/6dkN3hW5MbvoEdn0lks+OHKVK3BrhbNz5Fo
         E6WA==
X-Forwarded-Encrypted: i=1; AKwUvByM5m+Tt4Vzg4sx4AwD8Ysp09hH9AH7UYbXGjBMH09ryvIzUukCSAFKN5S6WdfPr8YYFlDCmVBFfufr@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZTmmnRi7zeYfrATu63itxxOvQhHuEO/lJ9Pd2T+SWdtgcnqAx
	4G3gd7kawTuEJxGSuJsq7Iq8YhG+2z166aYFMmZ1GSlw/oZCaiAzS8wD
X-Gm-Gg: AYBFou3BknhIbOWDpKGj2xfdlj2Pt4Mpjnksj8LzczFBwnbsFO59ApopqG+aQn9f/YE
	VGF9bk+PIWzGDkSGTcooq3vMbVKRC43p1JcNPDRVVz42rbO6sHci+1c7WVJnkC+66GbvyQIgbvU
	6bfPYZEgAP4xhyvt7PrA/OSoKYQByEMGEXbV+KVL4FPY4oAO0e+45W/q48vHENZk/kog4OHupkh
	uIJwRsrt+/aZam3SqbizoBHhIW3jE8Y5XuHGg+8kt28ilFkhv1hpYeG/feeaz4o7hih7jlhspBo
	wD+WO+7KKLwH85Opt0j26C8Jw0m454yEUWnmTvyz7GUhLCzUxMJgTj/AgPquoXAS/iOuXSLD4qf
	yec8578yaCx//uhd5cBMgXSbDX6M4SeBXOA43itg/sYZ2agzDw0P9wnq5mj9k3RXj1qU3EdfVrq
	3Vkxyx/iHL42Qgby1bxLKozC4tkRkykO+2W/wS4dg4tBUJas27kFfYkso+ybaCoqJgUug0uUp06
	MwiEEXPABYwi5Qdobi8VGPXd422nSKn6neB5wmdXrHkpNTfbcDbLE9GNphxLtKndEiRic8+93eS
	euqe8m55QLFSK/7CEo9YOdhUOSB0+3rlOxnA+ayjjclwYgW+
X-Received: by 2002:a05:6a21:1f87:b0:3e2:86b6:9bf4 with SMTP id adf61e73a8af0-3e928d4ca2fmr9806912637.14.1793695612777;
        Tue, 03 Nov 2026 00:46:52 -0800 (PST)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb364a8910sm901853a12.23.2026.11.03.00.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:46:52 -0800 (PST)
From: Li Ximo <lixicaicai@gmail.com>
To: Keguang Zhang <keguang.zhang@gmail.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	linux-mips@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH v2 2/2] dmaengine: loongson1: guard issue_pending against empty lli_list
Date: Tue,  3 Nov 2026 16:46:38 +0800
Message-Id: <20261103084638.1190232-2-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261103084638.1190232-1-lixicaicai@gmail.com>
References: <20261103084638.1190232-1-lixicaicai@gmail.com>
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

ls1x_dma_issue_pending() calls list_first_entry(&desc->lli_list, ...)
without checking whether the list is empty. list_first_entry() does not
return NULL for an empty list; it returns the container_of() of the list
head pointer, i.e. a wild pointer into the enclosing
struct ls1x_dma_desc/virt_dma_desc area. The bogus &lli->phys is then
passed to ls1x_dma_start(), which dereferences it (out-of-bounds read)
and programs the DMA controller with the garbage address.

Switch to list_first_entry_or_null() with a NULL check so an empty
lli_list can never reach the hardware programming path. The companion
patch rejects the known producer of such descriptors (sg_len == 0 in
ls1x_dma_prep_slave_sg()); this guard covers any remaining path.

This issue was found by static analysis.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
v1: https://lore.kernel.org/r/20261026115113.3359939-1-lixicaicai@gmail.com
v2: split the two independent fixes into separate patches as requested
by Frank Li; no code change.

 drivers/dma/loongson/loongson1-apb-dma.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/loongson/loongson1-apb-dma.c b/drivers/dma/loongson/loongson1-apb-dma.c
index 89786cbd2..e7eb40584 100644
--- a/drivers/dma/loongson/loongson1-apb-dma.c
+++ b/drivers/dma/loongson/loongson1-apb-dma.c
@@ -478,8 +481,11 @@ static void ls1x_dma_issue_pending(struct dma_chan *dchan)
 			struct ls1x_dma_desc *desc = to_ls1x_dma_desc(vd);
 			struct ls1x_dma_lli *lli;
 
-			lli = list_first_entry(&desc->lli_list,
-					       struct ls1x_dma_lli, node);
+			lli = list_first_entry_or_null(&desc->lli_list,
+						       struct ls1x_dma_lli, node);
+			if (!lli)
+				return;
+
 			ls1x_dma_start(chan, &lli->phys);
 		}
 	}
-- 
2.30.2
