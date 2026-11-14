Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794699762;
	b=gGuYxF926AtqB3nJia3sMEwajbYHfJIFacRu+ehwzXr5ZYYPKQWiqNKne3CYxIJj4uWM
	 FlGqDjH0hTiB5lFMAXZ8sMT+1TQzgwiX/3fw5ltXFLqpEHOIu15WJ7tfukzmyyXfkkoVf
	 SxQkT5wnIktk7piLjRfMZImB1bWDYCN4wjLRBoOpMYyoCSSKlcJThmnJrVsh6GVLNivHA
	 aPdKyXOFVIsPzxQFuoaVqE12po1/KgyrAqQm2F0vy6zIAuT+28ej3W7RdVaSbLS0CsY6D
	 dW805vabsQ5gFKJthY0SrVfItuVhbBWHnx8zRHsB6pnT26SH0s0g2oLQI7zgJ7205PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794699762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sS8xPUczV4+FMDxOy+FHgx4wadDCkbOB4fdq2ZplWK4=;
	b=PS4qi7i0pDa5hYlOrSzopD3A+ausc4RfvrJwkgemqxjlSPnp0PSrNJ/yVxl3VxBINWwj
	 Ebdzshn9zHzBqimRENx2yxpVLqevcKfyTaFD/ew1kRvu0DO81VVmnSDmrRODpSgmIVswC
	 mviln/QJ2SQUO7xkf5EJzoli6CCY890pSe1yrKbj+Mi3wdQg57P9FYT5hbl0d2qy3rRw8
	 x5V/WIBwpMYwarzR8DpMUzqpLN+tyU2KpSFHunUXtdMsDz+hEUd1lD9hU8GXcJO7nMu+6
	 4va6A4C3V4dov/6Ul3ZZo0+j+XdFGY7Z9xKQ9iksjzjgEHGdma6XBYcu5AHUDV2VsvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h3uvQOmR;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C0F60A2605
	for <linux-mips@vger.kernel.org>; Sat, 14 Nov 2026 23:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9C0F60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h3uvQOmR
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b12cb3c37bso1091997a91.2
        for <linux-mips@vger.kernel.org>; Sat, 14 Nov 2026 15:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794699761; x=1795304561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sS8xPUczV4+FMDxOy+FHgx4wadDCkbOB4fdq2ZplWK4=;
        b=h3uvQOmR0rWs341RwE/hWRujb+w/Acj48NC++U3xqw2uL8vEXibItmD4r/OnQqYlZs
         VfFM5nG7f0KeXDc8YqrX/nt8czV7aJw/bcr9d+RkZeT2kIRtBMRd3meIkWy5DHA0jBs6
         FHly/uqx7ZkK/sQwS4sdACutwS5rKamhGYtUc8QoiDWh9fReO3IkvBRnJEFZHgsDFBoN
         0FKLlJZkLKjehyc/AjjhDjTEfrbe2R21s9COVjlZ0+OKZ3CnE5Nm9vlS1ujHNsb7Ktyk
         gZcWSSqdYPtzzA3/yLLa08saFC9A5/y2sIKju00aLxprlEHL1J754FB43+vgCOCo3jIX
         WeDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794699761; x=1795304561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sS8xPUczV4+FMDxOy+FHgx4wadDCkbOB4fdq2ZplWK4=;
        b=AkdU0nlvfweSrzQ3IsV++n6LjjZY8ezBYc6NIDxCCdvWf4lIW1m2iq2XoK18vzvQ2o
         sq/1XzeZnDjoyFcvxLqn128djI4j30paERzlHXJAcygVdFh73pVvO0Ua4MlMQ7SxzeeE
         90a7iMxyn8TPnfljP7urhd2rRjbrSVpV0z2ROZfgt5xBfPLYMujOWJeUU0wLp184sxfa
         d7p0bRJYSx2EQVCFZ5CjH4ccBJj0nkEBNU1AthC1IiorKI3JYLK5TDLHbqq9TBVrzTP3
         EgwgpFTprz5cMbOna+kfUp039mhsaH1XU4mz9ToXE3sf6bU9Sg2OwawgSFEN4yUBSTT0
         K+1Q==
X-Forwarded-Encrypted: i=1; AL+hErE9OPtQNWHyzwzAy8Y0Dmpb0EAUVwifBuV2pugJ30Sj34Z/V18cNq3EqA9lR1NtUJ33EodvfnrsnB8N@vger.kernel.org
X-Gm-Message-State: APuU4Z/aEXxA5tcpRRmZNRk4VWY0hoWD6uHG0ORIapioTvtjd+eKdBYW
	kDg4fXu5jvWrB5y1jSfF467e3y4jAjXFihUDAPdpJgOeO2vlMPiJEIjz
X-Gm-Gg: AYBFou23M9ZdMuMHIhv3I28trUxUuo6Lgatq+gQ2TCrxGoiEQ3rXIl+GGIVbQmYs0al
	hNXwWQ1B5JZZZntCtekCCP6E0W5d4boPwlHHaiwOluzgSsNSgNl3kzRYQSg+PD3AIJrdDNJc8XH
	O13WPh3cv/osa0Q7STUQfDTJdVxelUxhPoJE/EBd+oBimTUJSnFM390yODEeqekAzA65SLIB+Ut
	/cyOMOu39ZdTELhi/F59yMMRgzCnRd5yzz4WMlmNCpBJHuaiAd0OY9xrR7J+wufSHnncuJe96/+
	vOmwaEdO8vvJvNz3eW+ljUpUsupBP3nxj7pjbYJLHGVEG1mgRGrI1pCiPEWPc2gNVrUCtfBz/vi
	5tjeKk2k5jHgP2cka+T98h+dBEBHuev7rBys/zt9c8BF3Xd/BIgaaPcnz+68lMSlN9AbMfQvix4
	iz10zZtQYTH09/eUCaEXNGXPKyf6Rgtv9q6x8cGTeandlt813V2OEp32YeYhkMX8LJYeu0otYSU
	ffh5hFK4XIh8AX66Y3mX5LmRthW6p7gI/Bu/+nRBqTXH9kVpypJ1fqv5u3nDwSOSDYcNo1CsmEV
	aI2vaJeQQxppqyGH+YMfjKAy4kd29LkhNUjft+I8B5UalHF43vZEQLK5bu6DLFc8DV6Wk8Pyx+4
	4nNVSd9ub3giUsYNuNTUdh9HcSCS7ycXq7kMNDSZkPo2lUJ+cnGRoDxYe+xF5zlJvy/RJAJAnBB
	Ea9DdBxCFfa+KWDZIesiDGP7o=
X-Received: by 2002:a17:90b:4a84:b0:3b0:ad42:dcb3 with SMTP id 98e67ed59e1d1-3b1b09fa377mr5893906a91.14.1794699761489;
        Sat, 14 Nov 2026 15:42:41 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d04336sm15755574a91.7.2026.11.14.15.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:42:40 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 5/7] dt-bindings: clock: ath79: add the UART1 and PCIe PLL clocks
Date: Sat, 14 Nov 2026 15:42:20 -0800
Message-ID: <20261114234222.88337-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114234222.88337-1-rosenp@gmail.com>
References: <20261114234222.88337-1-rosenp@gmail.com>
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

Add IDs for two more clocks:

The second, high speed UART of AR934x, which is compatible with the
qca,ar9330-uart one, can run from a 100 MHz clock instead of the
reference clock.

AR724x, AR934x, QCA953x, QCA955x and QCA956x have a PCIe PLL, which the
PCIe host controller nodes need to reference.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 include/dt-bindings/clock/ath79-clk.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/ath79-clk.h b/include/dt-bindings/clock/ath79-clk.h
index 27e31452544d..57d966ae9722 100644
--- a/include/dt-bindings/clock/ath79-clk.h
+++ b/include/dt-bindings/clock/ath79-clk.h
@@ -11,5 +11,7 @@
 #define ATH79_CLK_AHB		2
 #define ATH79_CLK_REF		3
 #define ATH79_CLK_MDIO		4
+#define ATH79_CLK_UART1		5
+#define ATH79_CLK_PCIE		6
 
 #endif /* __DT_BINDINGS_ATH79_CLK_H */
-- 
2.56.1

