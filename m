Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794456985;
	b=YsPwzWIs3f5DNLJFmQB+diqwNuWnNDxJp3mq3N5F97N4BZ0s4esFvEvpYlDl3EJKaahT
	 udKtQyYLJTbjXJTi3ErWwhnAzCz9cPu1TwDjA6kpLj+NtkU5Z3Cb8rVmpwxtfcxLrhk4v
	 WAz2t2WBik3CghrgnHZq+2lVwZv/XL8TR/snO50V/rbDiHRpmssKnc74dyTcSTKcnqCD7
	 cUtqshUdmIrwbLCE9CMfqP4JVdb2v4mR0VkVd7E8cNgOkRBxRhLkBAwdXshRkXH5uxnmb
	 iFzy59Hz08cSxMl9hPOo7J9mfIPBEWKVTgBt+tnXb1uL0I/ssJPkKi/12CftUEmM1Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794456985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=A5kGUYlL1s6wl8StQOQ7ah5ktYL6JARyi0H/D6FL9bs=;
	b=uF7uLBnAjoBGcWxyvKae+zjxEwqmNG6C14bXYuDTDmJDOFgk6LBMRTvYcU/2PbipAUdM
	 RjHccizvdT2wk1P+hFRkLuiJBnMDxK5jeVLctjc4jaTuquPm1IzpwyPmu/duE3vG+aZUf
	 XMI5huDM5mLQANXLkEKkQ7Woi4gg0lm7qqfrwbvJARYyPLQkwk3yXWmTVikkXdK09aSRj
	 +7rLrWD1BMOTMZj6B4eM7+4pdeeneGUyi4BQo14lwyCnn44abCNwuYgNBdHPvICC7KbKh
	 gim6aZF3QAdH/sjfrHgFglLqjoOrvWz/s5fGGiH9kW7w23an/aG5YciHmi5W0eo2UTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DsRLzKHA;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2A7606A88D
	for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 04:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D2A7606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DsRLzKHA
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a2761c69fbso6713770c88.0
        for <linux-mips@vger.kernel.org>; Wed, 11 Nov 2026 20:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794456985; x=1795061785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A5kGUYlL1s6wl8StQOQ7ah5ktYL6JARyi0H/D6FL9bs=;
        b=DsRLzKHAwiCRqiKX8u5aP4CaTd39d9ywi0CRFk4wiv9LG3fx87WtfWVgpEif6uFyl6
         tEn5pH0xujfK9oKD0gc31SJiU7moP+QUlV0NweGe7+e7puW/kt0KV0+G2uUvEOmnPqiC
         47pvKaCDRHnYJ/mfmv8ra5eu6RyS656R+zkdrfkc79FoOgS2nYNWyBjW321i49jEY+j+
         paBe0p0Fvkep04H4ACT1ZQwyo7NLKsIDxQni2yvXwDq2yj64D2IWN/LRRRELtawjHika
         GBxFno3Tf71hWH/OzogTZbY5TdX3DBrLAazM5gJOuWOvfQsfEj2kMnLzwC0RQnheO+oZ
         7CCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794456985; x=1795061785;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A5kGUYlL1s6wl8StQOQ7ah5ktYL6JARyi0H/D6FL9bs=;
        b=R72SDq8AeGQFzv1Ms+e+JAoFxntQkk67c2R68Rj63T7tQgdbrobALCcybDNso+zX/N
         RgsNGm4YZ0uAAobRPn4iv9rkCP0XweU4Fbt9EkdQPHq8K8W2ay/QxGnbA69Yve8ALvQj
         znqxGk8VwV2O9lpVmv0RHm5TmFi29jbQ8X5IoxOhxUWfWfMSKwe1wVxjJsIATaLaHPJQ
         obNeiOR6egb8TlZlmGmjM+Lzd1bz6v7FriopJ++stV34SzchAYWd2yrc9VMnRUUcyMus
         jD5pJ1RF/s/Jfd+jgnt3VGdgPPH6nAP7SQNc70J1Qk7g/aaIioz3nYdfh060lzWuTO/c
         74ow==
X-Gm-Message-State: APuU4Z9bAgVWpDythfd2ahXF5g8gk8fs8WPJzmzDWV7UJZ7o00Nt09B3
	7J3ysUx8X1WWkpu4H3/JVCbusa6iyff5VPMy33FWywdWB0jPAD5pRsBs75WtJQ==
X-Gm-Gg: AYBFou3wuKkXjxwu08SusHPs1P+A1pbgUSl1b4Cydq937/0qmlyfOzEkHw/ihVKejJd
	xv6dBKri8lGI8cS9xAgVxs7djS14EqHwQZ1ss8P7DbrgfXrXME/KHvfXi4o6Kwt6zkoyuTbuEcX
	HpT59Q805fmgqiiWb1AD4O4SLA6u2Vol7crY8sGuSxpCO6COdvmZRY0oVEj9d/h2M4DOAZYXGPQ
	ohMqWmdkLLW6FRM00c4s0rLp5ZZHsGPMf2i5Ldn4LZPfHdqMt2LdKghueni7BEv5ZdGhCESk+As
	orIunrt2kp4LGUBl/1WKyA8Sulcqb1+k1llM+YqiPlT4GlwalDKHMBUlwyhjmnd8uG3KBbkuPo3
	E4InlEZ3bfU/bT7b/83od2JhAGhCaVvjz6Rjj2bekGeZLpPtV2imcJvjn2xDVzs9r5jRTCRn1C7
	hjAOLq37Iz3GrGq2S8uH+WGhmjk1bHKc6OJD91XykR28JyEd324oSTKhL6dGDYiGYjD4RL8mW/a
	Ny4yNBxayGffo0WVTeWTqjDnlWwsheV+y+N1vP4JPKpKTFddbntZUbNoqXgMHGOmSs9h5Q3RGmQ
	wcIjmqoj
X-Received: by 2002:a05:7023:d0d:b0:1ae:e0f5:2cdd with SMTP id a92af1059eb24-1b3c0324aa4mr4176471c88.28.1794456984463;
        Wed, 11 Nov 2026 20:16:24 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm21300801c88.1.2026.11.11.20.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:16:23 -0800 (PST)
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
Subject: [PATCH v3 3/3] MIPS: CI20: Enable SMP with two CPUs
Date: Wed, 11 Nov 2026 20:14:22 -0800
Message-ID: <20261112041422.2997275-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112041422.2997275-1-f.fainelli@gmail.com>
References: <20261112041422.2997275-1-f.fainelli@gmail.com>
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
-- 
2.53.0

