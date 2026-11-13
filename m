Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595384;
	b=uHCUwpCql1bKD+aSEYs0v/0tks77ePUzdTuUy4TD3OrNiGmn8ewz3kqM6dBmji4rO1Ku
	 4zMUZj0gnqIVP8BpatlzRTIjmMmcEBdxHtBNnyRAyJRmSf5rVlVqx0JXKsURfx889GNVz
	 wXHm5E90yYKhi1lcc26F6BG/izCjarHZ0KfEVeo4q2zSrHpKIxHyDt1XOf0fPTgKSueVQ
	 tS6bjCAqBoEjdOBrWCX1U2DoI6RoqNHVg1cs0bnnVTD9xnaSK77trOEHv2E01tLfMzMTQ
	 JHuzxZxewzhH47pn/g2ayayrhmsCjlQ23+IMb66x3MD7wypIeAm6Ngr8N4hNAB7XvHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=267Ce6TPLjhjXt9nIJiYEX+xCBRfyCLiCL00Lm5mPmk=;
	b=UU51msbTE5XQus50EkGqR91XH5Z8AghF2slE25a8sjg0Qigu6gzryUsD5Pf9CxA3KX9g
	 lWC3k5kxdHEKk5g/cTcCLbVB74pz6iS6ovRSJcevrsJ7KsOysd97QRuJIwZgCbJkXLRSK
	 ZWE8y8/aJRXoislq2a00Tq5TdVfWVoTLF212ECvz+vCb0eE+KFco27zU4ojIhEmvbUrDW
	 2/v8nmuyrOcp8KbMNEKsnM2bhk7vfBm58pg9YuEF9OsZ1NJdKLBJxMedFK1x6bdJxrUZy
	 RrJCfyinQhPe+OC9/qpP7nDuYOJhTpXc9gCZowuHVeoBR3of4UrlSkpngno5jelHlgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ot77l8kA;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5993F606BDC5
	for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 18:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5993F606BDC5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ot77l8kA
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b244fb7fffso1388505c88.1
        for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 10:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794595382; x=1795200182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=267Ce6TPLjhjXt9nIJiYEX+xCBRfyCLiCL00Lm5mPmk=;
        b=Ot77l8kAzs1agEIFRF9lh1uIxqzyKXCn2BmjsOS5z8ttZwv2+CJkqw86jCtMgZj8Jx
         aUeA14jTTw0Bnz3FrgsWAYcbiW9HXmwFdXDbx0hpAzydvoXuymp7/xcq6r6tNJzaNjU4
         IjlGZumVQbUs6YQ2MhG7blszRqA28K1Rh2WiyKrf2oO2vXIsUe5ocxV7jpE5WKlobLGA
         X6Izt+RDiA5UFflTJ/9AN4mq/tHEXNoWK1Jpi0QKyWUFna/X4s6l5OePaO8wnp021Y4C
         8Yf/Hzxb18PLcvW6D9t7yCYIjVAzUaAVIgJOdYFeu53SaqY9BoZHGVlFtMJlw+C3qDkB
         n4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595382; x=1795200182;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=267Ce6TPLjhjXt9nIJiYEX+xCBRfyCLiCL00Lm5mPmk=;
        b=ndvdsNHjW9AkrlkL7NwklShXuilxbRcn0k7XWyWlxF+VgO5d/ASXpTs/WCtxsVKF7m
         Y93pXMb1o1GfB8tfj0Vtw3knkZoq7EQiOojvU9NcSxlEFjb39ol/Gnu6RZ6qR5t8ahbr
         MqiL62KM+vGUpKmjfK7YhgZ/luw0dkE7yG2q5PIvr3Z6X1IC/tMow1uuFvMbT77uFk+k
         8Q6fFEibrwOS0gAh4w8yhnve+0qN9RgBcMKPd2jobF1r892izkS4Vmr8P7Jt2BewWeql
         Y+mnqrl1UjnK07k77USO06xi8dtWdlg7oxvoiJ2Kbi/oAnRtza+4RH9lw8HYA+nltiOO
         X/UA==
X-Gm-Message-State: APuU4Z+YqQKEqB7UG8NJtp3buEgzJhNpyV1Fao3F/xV5XNVj02VbJDmN
	PGmC+F/D7/i5tCTuukl/d7+aGdlZpWKY+uvEmvbj6t3+RFOxGbTJTpMqG/u7Fg==
X-Gm-Gg: AYBFou0FZpLmgvrffk6CwM3pru+UTADX1hyHpMFHak/7LkrajeEEix84QNINsIJ0Cd0
	fltAgt3xl8e3FvcRvJ1hTzqmFYT8Kn1Ltx4y3dxo8HNaezl0jbpahfiELDlf0JnTX6eLdho8TmZ
	+Affw6Kv5W3jJ29T9Br37yM0fLk0bAsbNjvzv24xu5SB+Khg3gqwQODIfYSY0U0rL1A0Qu24bf6
	kzOW8RZBMz8p5MKA76jtOI9ktB84cnH0ol5ikxVXAmqImmPDmPjbkM4gfCrYEtHGxBzCP4y4Cpv
	suKKw8y4R8exJweXhVKczdzYfs+xCBRGOIZ9hQ4j1oICiPq1v23bCHp6MrLRJvIjslx5QsbAY6p
	SLQHCjx/ukDxYn8CkuDiroMmKpwtROOhZXXcBDTnNta4+hHjnYyBxC7wliKcYXWvADSbwZ0PqLv
	SUNdqK0sxylLRbXVBFOBA38MWt4BSEPW9RYq8PJiWUULodGnG8ElRYw8C5z3TMws5gDVijauqq9
	jI3DAiUfLLT6Vdyx9eVjLf2fBH+gCvLImT3Kt1fwIiQYy96qkSq4NWfUf29Tsk1WEYlIspFCU0z
	SW+WVx8O
X-Received: by 2002:a05:7022:7f0f:b0:176:a225:e364 with SMTP id a92af1059eb24-1b50312eb89mr2494066c88.35.1794595382432;
        Fri, 13 Nov 2026 10:43:02 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e195sm10526177c88.8.2026.11.13.10.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:43:00 -0800 (PST)
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
Subject: [PATCH v5 4/4] MIPS: CI20: Enable SMP with two CPUs
Date: Fri, 13 Nov 2026 10:42:10 -0800
Message-ID: <20261113184210.470320-5-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113184210.470320-1-f.fainelli@gmail.com>
References: <20261113184210.470320-1-f.fainelli@gmail.com>
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
