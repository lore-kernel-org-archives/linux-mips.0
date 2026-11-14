Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794699761;
	b=v9EQ8WhSdkovrTJ1SUKVotUJZDeoLRc9Qhcmqjj6gmQD647c/T/19K9kxdMTFDgc6tGU
	 D0zFGAHtOY2UkNz/TPKZirvf8HfjSlAniPnoMl1Rf4HhYXXq+vqBZozWf/niPOeIGvTzX
	 a//Ya+1O/O/VOj7DlGd+4LttodIxNpOdMK/mX2Jb2U6FZcJ0g+T4O+rmIQQKdQmGLNB5s
	 UheIHLps0XXkyYztckpRjZrGRSg8Uj775hlmHgsqcTAQpaTiJJh5xf3Dh/DuvQmqmR5uZ
	 3SfmScmEQK6ZX+yIuwHipQxiGoKsBm69aS3NUajtvqvhZpzp6KovQxY7pTiDk4LbTMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794699761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XYsHkPjzQgIm8rz0/nzpRXGmbbQyC+wUFRqtQMI5oUs=;
	b=YulKzOhtkqwZvFLHz7mhVsuLyxn6KrsdaA2IgZHC3xcZr7bRtVdXGs2wuyqEOaeG7NcF
	 fRwUos6LVQCgi+1dBiRffTSJjTAkuNwYbrOXBpEzr782o94ccHUIBWI23Kfu35PBThurN
	 +sNfRgHp0pQ9OWWyLoLA+XkR8dErdf0N1TQeTm7HJKaIPoA0vlpQQ8KbHgQ3aFX/37jeY
	 jhjnaxE/CflGBs7wOfT0Csr6Fa0Y1PiTF3YS17tNniQ1Icos/KVoWOFt2FaMoXAxwPiHB
	 5huZW/ZjRh47w4DLsquqlqYOUN2HsS4AJ5yBzwGzaLSZfWUMs8hAQLW/ct4CO18erKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uciOJSd4;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04B4606A8B5
	for <linux-mips@vger.kernel.org>; Sat, 14 Nov 2026 23:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A04B4606A8B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uciOJSd4
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b37951a397so375266a91.0
        for <linux-mips@vger.kernel.org>; Sat, 14 Nov 2026 15:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794699760; x=1795304560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XYsHkPjzQgIm8rz0/nzpRXGmbbQyC+wUFRqtQMI5oUs=;
        b=uciOJSd4DLcxi5tp7UFydIx3C4EhdZs/GAMHtBiuSi9pmmcpWyswkIexI/S6kLR2N8
         2Le90ZgKylQHdTleR8Xv9Yd0HOEGCaGaHqfZhbtT5RcbpIfz+e6uxDSV4zn+VdBKsvyJ
         d5q7TTht46VFaKlDsBUY736imYOS3xY2du73MdusYM6SCH6Sm6Kjl5zyYFuwaJ/zUWO6
         Lr+yr2laygQVKQkL9Yl+9lv6KhyEjevj9HDc5vaeiZVKIl7u1R0/Fepb7MTpcJ/hP+bz
         Iba1z6IiUxKqXfUAO0OU5MibmUjXTcQF3R6YyK6jd/n4EIpxa49XxgKwGqSDZIOmsCkl
         M1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794699760; x=1795304560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XYsHkPjzQgIm8rz0/nzpRXGmbbQyC+wUFRqtQMI5oUs=;
        b=kE0SDFLeM4HpfD6f1/gSRAbvCTzN0TvcuhqtcHKoQ2YYU3ln2viiTaIGjaassKY1d1
         KW4LBs/4XDhHav4p4AxREhkV9AR9p3mrMrRfY3vpQEAbjel9ZLqcCgEhYaP3C32v5LJz
         p7mKzZ7HqWxXjidnxUPIi7lxy8Aa8X1w0R+K3rUG+V7bxUjYs76NR2IAKuSNGuHE85HG
         shtVmweACMXD6ORNlbKQY6QPRpoZHzca0fn+wdZRmPURSKmRLOf8VH+uuv6ks8gnhcP9
         sKutJe5BoecV7Id3pOT8AFzo+VUkBTv8WTxmROgb9b06Qel08a/1O+c9Aa5z3qQNLtp/
         doUw==
X-Forwarded-Encrypted: i=1; AL+hErF0OESaIObd4bfrAsCM1Qz/2Vx9hZ3BrkuQZe/6vBbxdpswdTUcraB4TNLtBosRPC34OUwgBjW9AJ7d@vger.kernel.org
X-Gm-Message-State: APuU4Z/bCvAlw59SoTRJlysaMcHpWKSi2gT0op7AmzyuFRF7en3bLPek
	ywNHqXbDpVOYW2rKySd3uYx+BUzZsomGFEzJ5l02aLr5M4FdqvPb0LKF
X-Gm-Gg: AYBFou3zVtZUdheIbUqOBP16NdY7E0litOOwJx5iNUbav3G6qGsr5jdOlDPvocL4++b
	YwoXKHj08Gi2kKzR9qpWkt5uopRrsr1DjBNbkmwumLmMoqJYs7EbS4uP7mQkZjT4IPPvtnroM8X
	y5WUSR82I8rF2Vknj80Y7QiX5W94iwyTIQuafHLWyQdUnVhAbriI0ahsOyHUK1Expqln70Ugd0R
	45yvCZzJ9W2NTjw5r5UUehoJNYeco+3RCld+A7PnpBj8iV7D7qua5eBe+XK0Ko0HrtHiHr/W4gD
	GV2CrXsoKMk65/xnKQEgbc2G6hYCzf/4HG6Ga6Ka9pIP0xIL8eEmDaq5GFnFThOGxY6rOjnEIyX
	7MrMZ+e2YIJW7Nd/OmFaYioErMc8dT1N1hbxKsFEpH6PhHJ87JgQ4k/yNAZOJKgtlNHT99E49yn
	Qh9/2msI5ClPL9pUkzGVp6xFmErqJ5s6h0c95gMxKZWSNV+kKyqrXfJTYW36/pnL19BE/mKkZ8q
	/bgxa9aWdD6Lyl24M+H8JjeC+t0EtVcTjoLtYxecZe9ZKzdPy/EKjgGqxih8lLxVKBfCzYnkJjZ
	a95TId6613/V8hUBbl8xnD6wmz9q635B864F9DtP1J7PM1wCU3E2Zo39m8SZuEspHFds0X/0Bo0
	3QPAnjyEVvB8AgAmFp7txB5EW4tOxkBwJKjKBP+jOD+M0rsGZfwZrU7nbEHFbKCG3xdefBpYrIl
	6lGQ==
X-Received: by 2002:a17:90b:4b92:b0:3ac:97bc:4c7b with SMTP id 98e67ed59e1d1-3b1b0b57de5mr6751003a91.14.1794699759981;
        Sat, 14 Nov 2026 15:42:39 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d04336sm15755574a91.7.2026.11.14.15.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:42:38 -0800 (PST)
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
Subject: [PATCH v4 4/7] dt-bindings: clock: ath79: drop ATH79_CLK_END
Date: Sat, 14 Nov 2026 15:42:19 -0800
Message-ID: <20261114234222.88337-5-rosenp@gmail.com>
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

ATH79_CLK_END only counts the clocks for the driver. No device tree uses
it and it is not part of the ABI, and it would have to change whenever
a clock is added. Drop it.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 include/dt-bindings/clock/ath79-clk.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/dt-bindings/clock/ath79-clk.h b/include/dt-bindings/clock/ath79-clk.h
index eec8f399b9e6..27e31452544d 100644
--- a/include/dt-bindings/clock/ath79-clk.h
+++ b/include/dt-bindings/clock/ath79-clk.h
@@ -12,6 +12,4 @@
 #define ATH79_CLK_REF		3
 #define ATH79_CLK_MDIO		4
 
-#define ATH79_CLK_END		5
-
 #endif /* __DT_BINDINGS_ATH79_CLK_H */
-- 
2.56.1

