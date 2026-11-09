Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248802;
	b=ARhs4OwGDTfthMGLVIRPRmGdN4JFrsf9YWA4ObOGf5YYb76U4NKH554JHKMRxgwtK0ul
	 MxdH9xi9b+AgR1nqohVgLVci1DOMQLYVAGfSXaDn5vSifi09uVswPCyY1rMejHGcAFtBr
	 GzEVdNwblrp3gQ4FU9wKPneS1DSoAS51H+tro4xnKo9okbZZO0Ot0tpW7VD14N5sJ7/vF
	 EUViiNKISxOGTZpc4avxr3c9oCON94VYMha65GbvkNkQzsxT2PUfWCo399DawWeAocI2W
	 udVASoRwXluaMEAF63hlg7BEsxIrhstWde6paVxDsm14KV0vH7WZZhql4P6pM80NmIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=KuWXOr8bdBpcuJfvomt+cRvy3pPxw4DWlc9TpuLSuDc=;
	b=s7b8Hc7VcX4OxVK4B3WjUtfuOKwyjT8ypLw3PL1pW28SFqkL1WuG8Jiaq7fBYwlMqkjt
	 8aQAZiQOXQbxDBb568DQoSrasRT4OPr1cH0WZNdZcFto4FeoySdlkDDsLjijZiNCUA9y7
	 v5hzvMYf4d23C0EPTZgWQDb0KeYshZ39IhQu02Ez/f/oM39PGKF0mk1gQ1WWju7Dlo1ix
	 5N4nXikkvxaYdeJDFD1DmcvY+KdxQk+xQrShesEWVp+Ktvou6oVvv4tVUjCRpCFhzvX8C
	 UFKt5QllvfUROpAzENmHEi/ertA/Le0zHMYG8lNSocS7dDvMxT8qrLL3cj/Ck6uzh7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c2Pfn4F9;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2ACC606AFC1
	for <linux-mips@vger.kernel.org>; Mon,  9 Nov 2026 18:26:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2ACC606AFC1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c2Pfn4F9
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so1972006eec.0
        for <linux-mips@vger.kernel.org>; Mon, 09 Nov 2026 10:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794248801; x=1794853601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KuWXOr8bdBpcuJfvomt+cRvy3pPxw4DWlc9TpuLSuDc=;
        b=c2Pfn4F9VQW6nJV5+c+VrOUx9i1qZY0ugouUvigZsKq+kfHnKh2XLNThNmFo48myfw
         bI2J/EIrAkBxP0+1c9ltDkON2PXfOybEthW/dfOR5ISTUUCdYANR9T3AA+sqBvmWX2XP
         GUmZcx2fKuVu7/aKDFBr7tWvK7WVnTZ5yTb0WfGYuXIZ5lSsRWWzJMC9lbO7LPzrKclY
         Wx0tH9xy2bjNxNsO1cUh/78M3HaARwTXqFN1kYzndOjK3BhSJepH8yP2vT8eTyYMaOr9
         kzL9jI6JFX4Jbj/H0/VEMI0uVVImc0xaPZErH0R7uafkldR/zBvJhmjBPv6rrRl7DqK/
         RgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794248801; x=1794853601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KuWXOr8bdBpcuJfvomt+cRvy3pPxw4DWlc9TpuLSuDc=;
        b=ANCFrMYxfdsyRjqYEWeMhjpBHUp3oXak6Ci9FBrSMwrP92gbFPY14vLT08+I9Yk1tE
         Qpt/c9ascI704My1EIU4jWfHQ5FfI47Jr3sUl/iBPUAllk6a3nUuDkJP+zInMNZD8aNy
         26qqj+t+NUsRhoi/Ivio00LmEQHd8HnKHJ/dYjHMHPkjqY4H5eUIwsMQ1XlcqfdXrtlq
         5V/EuoIMP3rJinlh9h4p0FcuT+lnKV+vwz3R4fYnjIK7x2D3xw/dGa6XbtP6De29er+p
         lwQcXKSuUKGzUkgxrBpkG5zNv5f5IeA5Qrmn5huq27K0s/hwj6NkmqbqnQQxT/tzHsy2
         Mb7Q==
X-Gm-Message-State: APuU4Z/Eh3eNk3U8DkRGiDUrAIXkQtd90Lr2bhCtr+AWy6423LzBu9CB
	3FStTc5/4+pdwla3uvl6pegfRyTRJsZhyhju8frZSBxGv4+XKxDp8uACI0CWPg==
X-Gm-Gg: AYBFou1DbMT0DnRmUi3JA/rLw1+P5ZTymDXPRY57OdqKTncoXh2tabyo9d7P0usow4A
	47zr0c98jbg4gbyLZWx1Y8AlxBKyXK3aUQ3jMRHgtxwdrNmVNqUqIgCDV7tlYOGMu8xaPUPSFIn
	WGwCUdDXBr4p63nrf/s8O1dwFDD/F1d/FbfVja63uVGrywA7BV4wo9ecbrHEbv6XU25LTnf0x1k
	PBqwjYHdYCRoOP7lkXPhi4F72bYuKPEUYRCuKWBGafzgXLrJa+A+9LwHZeXDb4/u11dF/pdNfMb
	3S3GRv7rEFFmXWvOKzn8qm8oMsgOlBRb9+Px2yYYw1BCqCf3r7/DfJudXdy7TNXj0zJulhE/KyP
	Aj+7D+Qq+3RnYjT5SiHnba8C63PT3PH2Rl9X0HwQm+2GS65lE3QxZ/rGe7PRvOScnu4bBmaU6i/
	zN3Gz6z/sqX9w+6HAy0Vl/yra5j/+cFc/BKs/6V93XgZfAGqtyb0/hZPXeFEaZ2cNqgnbTxeOX8
	p+/mVlRZFAKLQpcddLc+EaDnI2xzmxCOsJ9Dmjyxz5NF9zhalxt1SxZvLLRw91I2dyxCU+AEvTl
	WwzNk1IG
X-Received: by 2002:a05:7301:fc81:b0:36a:1e50:e45 with SMTP id 5a478bee46e88-3751ee7be82mr85465eec.9.1794248799721;
        Mon, 09 Nov 2026 10:26:39 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306e3sm123652eec.7.2026.11.09.10.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 10:26:39 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: macro@orcam.me.uk,
	Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] MIPS: SiByte: Update effective IRQ affinity
Date: Mon,  9 Nov 2026 10:26:22 -0800
Message-ID: <20261109182627.3517986-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Booting an SB1250 kernel with CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK
enabled reports:

  genirq: irq_chip SB1250-IMR did not update eff. affinity mask of irq 2

The interrupt mapper selects the first online CPU in the requested mask,
but sb1250_set_affinity() does not update the effective affinity mask.
Returning IRQ_SET_MASK_OK makes the IRQ core copy the requested mask to
irq_common_data.affinity, but leaves the separate effective affinity mask
empty, triggering irq_validate_effective_affinity().

Update the effective affinity with the single logical CPU selected as
the hardware target. Apply the same update to the analogous BCM1480
callback, and use IRQ_SET_MASK_OK explicitly in both callbacks.

The IRQ core already rejects masks without an online CPU for normal
affinity changes, so no additional mask validation is needed here.

Fixes: 421d1563c662 ("mips: Validate online cpus in irq_set_affinity() callbacks")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
Changes in v2:

- update commit message
- cover bcm1480, remove the check on nr_cpu_ids

 arch/mips/sibyte/bcm1480/irq.c | 3 ++-
 arch/mips/sibyte/sb1250/irq.c  | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/mips/sibyte/bcm1480/irq.c b/arch/mips/sibyte/bcm1480/irq.c
index 7929bee911eb..4c18a2c755d2 100644
--- a/arch/mips/sibyte/bcm1480/irq.c
+++ b/arch/mips/sibyte/bcm1480/irq.c
@@ -113,9 +113,10 @@ static int bcm1480_set_affinity(struct irq_data *d, const struct cpumask *mask,
 			____raw_writeq(cur_ints, IOADDR(A_BCM1480_IMR_MAPPER(cpu) + R_BCM1480_IMR_INTERRUPT_MASK_H + (k*BCM1480_IMR_HL_SPACING)));
 		}
 	}
+	irq_data_update_effective_affinity(d, cpumask_of(i));
 	raw_spin_unlock_irqrestore(&bcm1480_imr_lock, flags);
 
-	return 0;
+	return IRQ_SET_MASK_OK;
 }
 #endif
 
diff --git a/arch/mips/sibyte/sb1250/irq.c b/arch/mips/sibyte/sb1250/irq.c
index d7a656cd7ec0..a971bdfac356 100644
--- a/arch/mips/sibyte/sb1250/irq.c
+++ b/arch/mips/sibyte/sb1250/irq.c
@@ -108,7 +108,7 @@ static int sb1250_set_affinity(struct irq_data *d, const struct cpumask *mask,
 	irq_data_update_effective_affinity(d, cpumask_of(i));
 	raw_spin_unlock_irqrestore(&sb1250_imr_lock, flags);
 
-	return 0;
+	return IRQ_SET_MASK_OK;
 }
 #endif
 
-- 
2.53.0

