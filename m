Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792877125;
	b=iupGF5odbjnL6PP1vNs8weAzs9eiF9QWn/4pusZTiatmhiSZ3PvFYi3ftKUTvM9G//1o
	 YFE3lRZftEgNtPCGEGYdT/6beqJd9uovf0CpKGVbuO0v5UxDoF+7HMXZKU8Rn6Hvc3onj
	 zX83LubJU6C78CPgpEhoBeqzeIcj07HPU0IJV+2Z1R8RG3i/cVM8z/sUlyErQko9dqclH
	 uORXZVzKzTcm31iemLgM5IHV2QM9qNg+b9izmnorM7hn76M7l03jb3aMCP8tehalcuWvI
	 MhZBVMq1qo+EudjzYvMjKkWDV8wL5zlmPrU586FcCmSlFHtg1w83pFxOQNM6Zm/Qrbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792877125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nGZIgux4dcF0wxVmKrgwbkWNzR5F3QBaO3xEg5nVzkA=;
	b=ZtKgk0UQzt+HeqpUv2+L522y+7rdEpsM90di436HKRxtmxypqqfrHfdMr6kCmUYJ8KYH
	 LYZ0w6TIh9clls5R5PBsoqV2/bC7BCCfK7VC1Myd0ERKoQ1KBsVaQitht29Q9BJ2m1VyK
	 x4anqCZQxEuVzLxUOUlrXa+j9XjLYGh+cG/WxhxTC0zPFeBdP+Zys4A96qkk9/tWZktuE
	 G0zF4C1BvQ6y7ggfanohVh9N/QtuiDdg8A3z0F0D6WboUTXA5rKLaEEhhE3DCeha6eP+2
	 gJgSGgupx3Vh5NCbwJl9arrwFnebIpcEwVhW+ClV40a3rPYonRrVvuWYMtu+fJAjGgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Ywz6jNWt;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F20D606A323
	for <linux-mips@vger.kernel.org>; Sat, 24 Oct 2026 21:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F20D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Ywz6jNWt
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so1161685e9.2
        for <linux-mips@vger.kernel.org>; Sat, 24 Oct 2026 14:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792877123; x=1793481923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nGZIgux4dcF0wxVmKrgwbkWNzR5F3QBaO3xEg5nVzkA=;
        b=Ywz6jNWtzsxRtkyFVBhZshPwrQunRMgUPILFsH9evTboAM4skABoL/yKaEo5E0o+tb
         xAOll3XcJQ0vKhHihRUGQ9EE+WJRcspfcTS16eR2rf9W2Xq7bRyS8PGHjbDfaeNwfgH4
         j+GS4ApmTH2N3Y5F7Z8RtqhXrJ6aQMOj6fMBu2PZXsetcmZTcl49d3WO1AuJcxueokHr
         AdCWEGD22+1xV1Q2b44q5EYWs91G/CnZVa+ZKJukfEt/Jw8bIdQtl4VjT1XGuH5oPa4c
         FI8JypqIIwpUQ1LORLO3eE8dMNrthJdc5qJjS8sffwuMx0YrrTGDPF3ZfWfEkz8gVL8r
         dmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792877123; x=1793481923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nGZIgux4dcF0wxVmKrgwbkWNzR5F3QBaO3xEg5nVzkA=;
        b=FOavwMSbyezU20w8ku4l+jS/eKZ6Tav6T/qgfRJrc5Vv7KRmtJF0rOQZewju1VTt/d
         LE9Z1ZGpG6GtrIBLTIPbn5157q2dgBwnnReOT3pCgUmoZVWX7JD5wsGc1AN63rNpxxmc
         raVECB0J5BkwScMi5BnoGbsRRCnANMhnHqgOO11ia5F0i0xFJLDZQV150LddFKQg3fK6
         jYQFclVLkI7OZaI5JF8+yapHWHFkeDdM5mCVvKxmBpGwmN2UN0GEKx6ft6ckN5Q/ktDT
         0W/i4dmZ/CNFvRu3XOeR2rV+oXrA9JSxBs9XUnWy1Ihff5I3mRsBu/v4GaPeNVBbNcwe
         qtAg==
X-Forwarded-Encrypted: i=1; AKwUvBzX9Zv/MW1VJeHj3uCJ1xvmf33nqObJ/eVBtfLS33y3vo1Qe+UMBZvUyluI/zR7H4SOz4P/cwdSOkH1@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3d4rXRIG5TlAPSiQsS2pMdeQj6vsEUuxWC97kkyUNmQX5gbwf
	/e3xVuyowTB4/kS/cY4kr0ROVN18TyHU1ylN1dRZOyZwobhb7Elrk9vV+FmeSny4llU=
X-Gm-Gg: AYBFou0nOAMY+i6mQD1PWrKcCq0ctFHSF41hQGUXxrT2bcm9GLJwQxErv3JriX7oTPV
	W86J8UJpmdWniNkDVHUQ01rSSR/4WE3s4HP4p6ftNcmc3mC4+xFshm2imuyzv0De72FT4/Y76or
	QB8SQWwwQx3PFARbQ7qgBm65PsRNAG7Pr3T/EOf6zr6Tcj8Z4Q/LWpYEuWn84wbvfjT4fyaE51F
	OG5BQ2CN2F9lhiE+PVI+VXG6z7Z95eTJr0ctCHQFzBciFTIy0GYb/17EgBCAbjrmbVYEy8AX68D
	RI1CVn8nm77TurxxQ5h0VKOQfx8kce0AWFit5StFI+b0m3riE75L5WGH30W4DKfTVTwiZOjVC7y
	HP8TWjONfgU16ZV4K/s8IVyHbU1AUFQIaUYrxNFTNG2kfYpXy8aGimTjm8GN3cJmZ2XND6tdrKb
	ma+wdal8oST1VLkRVGud2ZfBqDpq3ETedawR/D4c5YTlzfeDqgYyg4CmQStTbQrRqOxQxeAmfxx
	dh7Vc9xd96Rkv2MMAE9tCAZ09pcuwg6Og+wcsMipO/FWx4NIPgiz/48yYQcckS+Bk+Wm2zA+uk9
	q/Emoe/noYRxcKZoQvhi2ZXml1gNINp4ccPWFZLeBkGktaus8CPr51ub9cU/nLAF7y6YnVR/jPL
	flLTykJbFNR2U7//HFUU=
X-Received: by 2002:a05:600c:a00c:b0:4a1:fe55:88ef with SMTP id 5b1f17b1804b1-4a35aca4b9emr44250765e9.20.1792877122809;
        Sat, 24 Oct 2026 14:25:22 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2ed5a2sm79597135e9.15.2026.10.24.14.25.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 14:25:22 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2 1/2] i2c: jz4780: Program the spike suppression length
Date: Sat, 24 Oct 2026 23:25:19 +0200
Message-ID: <20261024212520.91401-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261024212520.91401-1-olivier@mgcrea.io>
References: <20261024212520.91401-1-olivier@mgcrea.io>
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

The X1000 and the SoCs after it (X1830, X1600) have a spike suppression
register at 0xa0: I2C_FLT in the X1000 programming manual, SMB_FLT in
the X1830's, FS_SPKLEN in the X1600's. It holds the longest pulse on SCL
or SDA, in APB clock cycles, that the controller filters out. It resets
to 1, and the driver never writes it, so it keeps whatever ran before.

On a HiBy R1 (X1600) started from the vendor kernel, the register held
116. At 400 kHz with a 140 MHz APB clock, SCL is high for 102 cycles,
so the filter hides the controller's own clock and every transfer ends
in a lost arbitration (TXABRT 0x1000). Driving reads by hand on the R1
with the filter set to each value: they work from 1 to 100 cycles and
fail at 110 and above.

Program the 50 ns the I2C specification sets as the longest spike to
suppress in Fast-mode, rounded up to whole APB cycles (7 at 140 MHz).
With it, the R1 reads back 7 on both controllers; after setting the
filter to 116 by hand, the next transfer puts 7 back and 50 reads out of
50 succeed.

Suggested-by: H. Nikolaus Schaller <hns@goldelico.com>
Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 drivers/i2c/busses/i2c-jz4780.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/i2c/busses/i2c-jz4780.c b/drivers/i2c/busses/i2c-jz4780.c
index 695be3b21460..d1bb75d9a102 100644
--- a/drivers/i2c/busses/i2c-jz4780.c
+++ b/drivers/i2c/busses/i2c-jz4780.c
@@ -58,6 +58,7 @@
 #define JZ4780_I2C_ENSTA	0x9C
 #define JZ4780_I2C_SDAHD	0xD0
 #define X1000_I2C_SDAHD		0x7C
+#define X1000_I2C_FLT		0xA0
 
 #define JZ4780_I2C_CTRL_STPHLD		BIT(7)
 #define JZ4780_I2C_CTRL_SLVDIS		BIT(6)
@@ -253,6 +254,7 @@ static int jz4780_i2c_set_speed(struct jz4780_i2c *i2c)
 	int cnt_period = 0;	/* period count of the SCL clock */
 	int setup_time = 0;
 	int hold_time = 0;
+	int spike_len;
 	unsigned short tmp = 0;
 	int i2c_clk = i2c->speed;
 
@@ -356,6 +358,16 @@ static int jz4780_i2c_set_speed(struct jz4780_i2c *i2c)
 			jz4780_i2c_writew(i2c, JZ4780_I2C_SDAHD, 0);
 	}
 
+	/*
+	 * The spike filter keeps whatever ran before left in it, and one longer
+	 * than the SCL high period makes every transfer lose arbitration. Use
+	 * the 50 ns the I2C specification sets for Fast-mode spikes.
+	 */
+	if (i2c->cdata->version >= ID_X1000) {
+		spike_len = DIV_ROUND_UP(50 * dev_clk_khz, 1000000);
+		jz4780_i2c_writew(i2c, X1000_I2C_FLT, clamp(spike_len, 1, 255));
+	}
+
 	return 0;
 }
 

base-commit: 03a5cffc818695157414456dec695f7c30b9ffff
-- 
2.39.5

