Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596928;
	b=DlS+/9DA3ycz3r9XRRqVvgQ3kI4pydn9etczKZ+Qzlc9O5nAwBlk2L3Lnhsv2KwZ5CAo
	 K2pY5Rc+ZQHyP/AKLzsB2wsdO2b77k05AeDIyiNNU1fDQH3kGRjzF5KjTfu8Pn12BCd1L
	 /02yEkbl/Y4lOgDg+17LRB58hdUj3eDwsYwJ5nha2+oX09YMrRlr2iXoN5XdrYNKzopRO
	 LKInq7icUYzk2SPxnE2HbQo1xh4bZs8Yc0F0kCCoXvsoKBJ5AlPL5lEqRsvE9fWawexQZ
	 HIitpsCuDbvecuOOyDN5QczZWrkAX0T1dbytNHrtBjE9rrqlYiBu5/Ocj51yYNbd82Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=w9+uS//+4af4PzBkDEhgycJpPiPnu+xIQt8Ostr/eb8=;
	b=V3um2VaQTkBvo/p5yenVKqap3vW8bRRf27//AbdkR6RnNY1SZdc/IXBNM44MBU++nEII
	 +vyAB20IJbehXQT/M1fdfFN1ECk+0sBvX+J4bFV5XGjWqo5EdN8ezF0D0akTkQi7eNwOn
	 Rs9tJLIk+eUIlfTAZuYewmx7Eu8HPih+CI1UtsCbtXMU0ZtGyUBQbxmtlA7caCshz1Fz9
	 jt9LcEH6ZvSXZTvO6Q3JEo3ZsrCKKaDXsMn4AUBO8kUPWtL5gye9lHug+pUGW9ui/gAv8
	 H9k0Ta46VlX6wK0YbMwUkFkx9lWALWl7B7gZK2Jr8RrqER/TQtmCBgJCn0npPKSinUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MDooZqaB;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C785F60A6F63
	for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 19:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C785F60A6F63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MDooZqaB
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3712b6d9843so1264099eec.1
        for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 11:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596927; x=1795201727; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w9+uS//+4af4PzBkDEhgycJpPiPnu+xIQt8Ostr/eb8=;
        b=MDooZqaBODVtmrAEROIhZ+YR/IZ2G7Dej7dChwE5k7mdUoSo73eh84tWWl3tlb3wZP
         XOhFph/aNh8LZ/qM1y8R9CJapK4naTGGNmSKML51tgeDwvNvYSXUsoaiMBx4Wo2eQ5Pt
         J41+8XP+rka+5f88vrNiIG4mp5/vmwS5Qo9eMgJ2jrocKgufYauwDC79Mt1J61WgfRXL
         KAkVdNIwP0OJAvoFFFHqMU4JOjEOEOFIwTKOlpycSTlhIxfIC+GOIArlK73I+caDlE/R
         k728aO6xXpyFmqdJQG19lJxd5E+RjB/EvOCJVQOoSzwngLVNIbb8Ki16Ul7RtKxPpqXC
         4MqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596927; x=1795201727;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w9+uS//+4af4PzBkDEhgycJpPiPnu+xIQt8Ostr/eb8=;
        b=uDKQZw+vLoR1Qk8W7OlB8ox4zhH1g7pVWRKnxUF0IKbQACidzL3N1gBtuSyu/Yxf6r
         p7bvjfngjZEVNv2fR0UMGH2MpwWkQhzdu941X0g0rbIzGpklYcu4hsYVQDUCsNPCR1DE
         Fw4Tm/iIL9POydUOXZ0YTRbX4OBNZD8VE49vco/DQHDkR2YjWzi8IcVbBPv1yJOl3ZS8
         MoOR9AsGbUemwOP/h04cstUzsXk0KcIj2U68f/myGf3126duXdnijHm4ionVdRTdl8Xd
         jlGDNnWDEKKHAyAZebv0aSkf3MROJwBbse29EeaaGWeQvIT3kHKkq3uA7sBCR7JlBRYg
         yiyQ==
X-Gm-Message-State: APuU4Z/h+DYvsvV7JLq6+f5tI/0FWD5vUFPRQvEUgqxlqRl6honOQnmk
	vZtJAPnTUXPye0HXQV7p9BDlx82V7JAAoL/MGZmi5fddyijQJaoQbtnhODQJpg==
X-Gm-Gg: AYBFou0CA4r5tFfhrCojCR6R6XUhsjTl5r02xVmP7b9nwq1+wmUd32Z8uEQgxNe9QwN
	dAthkXT1ET5xWd7K5Sn930ycc15POR6a2fNa6vrfVGIxkfxBZxjmG9FMwzI7c371Uwou4jt2A1B
	dghIn400G8xpc1jVhhWVeYv1CY3fqvn5hiBqmDhaG8g1p+CSJc/xOE0u3wTYn55gEHntUUq/uEc
	fNuEBFfN6x5Wu+dijAMKIVgma248+hBsCDK6RsygzUXzZOPtF0/i58wyfcrhhU8rujSCJc4iFCA
	g7fLKDq4+3cSUQmN8m4Q2XMg059uFTEDjPon1wVUYoTHJBZV+CUWdY5B+xMw0h012Bm8qMa3LlK
	5eWrFrHHgE/wGNeE0v8RzBOqrydOlAROkcz0DfyqMAqv/08ERNsB7LsCIgrbEcGcfHtDDkH7gHa
	oGMPqse7HBfhguhW8J2z8Q052SflWfBArVmkDF7wL7GPmLKT13vmiyhwPtUZaA+2kUV7eU4eEnf
	4qe2TvVzFO4FJdOQrgi4RRC/mPalGoKG8zoGTrXpz5P/bJFJD35LMlm8yMHYWaapoc6h3CaY0tG
	/3zgW44N
X-Received: by 2002:a05:7300:6148:b0:36a:270:ce76 with SMTP id 5a478bee46e88-379681c69afmr4380882eec.33.1794596927130;
        Fri, 13 Nov 2026 11:08:47 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm15714037eec.25.2026.11.13.11.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:08:46 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= <zhouyanjie@wanyeetech.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Burton <paulburton@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	hns@goldelico.com,
	paul@boddie.org.uk
Subject: [PATCH v6 4/4] MIPS: CI20: Enable SMP with two CPUs
Date: Fri, 13 Nov 2026 11:08:36 -0800
Message-ID: <20261113190836.470937-5-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113190836.470937-1-f.fainelli@gmail.com>
References: <20261113190836.470937-1-f.fainelli@gmail.com>
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

From: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>

Enable both JZ4780 cores now that the generic Ingenic platform provides
secondary CPU reset and mailbox support. The existing device tree
already reserves TCU channels for both per-CPU clock events.

Link: https://lists.openwall.net/linux-kernel/2020/05/19/739
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
No changes in v6

Changes since previous posting:
- No changes to this patch; renumbered after the IPI prerequisite split.

 arch/mips/configs/ci20_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index 90536cab417e..09d65094b1bd 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -22,6 +22,8 @@ CONFIG_EXPERT=y
 CONFIG_MACH_INGENIC_SOC=y
 CONFIG_JZ4780_CI20=y
 CONFIG_HIGHMEM=y
+CONFIG_SMP=y
+CONFIG_NR_CPUS=2
 CONFIG_HZ_100=y
 # CONFIG_SUSPEND is not set
 # CONFIG_SECCOMP is not set
