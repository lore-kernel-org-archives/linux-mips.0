Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595380;
	b=KY3lpLu0Vk58ELnkuinwbTEQsX+TeFPgoPrj3zqhT/D0vtrFxozfhTclX21tlUp/m/hX
	 gdgY5Ens6CO7ZRrUJNAIueMFl3Ss7ODjJl6NTXaauaQfy+OFI+UvnGmreBNk74MQBCkFc
	 gRsK1Ih+keshu4rA0tLy8l1qW/xbkFRA+HUYz9XGTI94mfRG+MYtJEh8qdD+8P2omlMDC
	 Rwx8/HXuece4XHggy4euPX054PZj97Ghqjn41/0Cf52omVjoIkEeSg+/IuZHE9koJMzdR
	 IYo/p+e9boDO7bjd76EwLgWu6RvWdm2Bw7/aiKSqxKZp3L40n2scUv6X1v2WPljomng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=18ub26cOjD0F2CxgTeL8whdA7ZyW82V6k9L7IoCUwXY=;
	b=PAmsCfraKIZOJ4pTgpqw9jeGumkdGmve8AOpGwOv6y0yVw7WWKfrTHXhfvwFPrzZ/aqk
	 a/DNLZKHPfpzmv8gM+227/u+17jTxVIvDExl63uowF6KUzp9SjHXSTKyUGPb1jFbV7ONm
	 zgaWka5nz1Nb/yX/1ci3lLRaVs50+aiaM8PCixaa9hFSdVVjdj3GE5ITzN2Sk5MFgb17k
	 OuK2p31Luua60nRi2JqhvcgdiCW42G+TG83V2+9sN9nWt6iIOp1NEKS4yXOQsxAsSXUgz
	 ze3S2gVT++tlxX4Z7fL/YDvf0NB2f8DHjRS3qBceRhs9Vss5TXu6XzURybP2pksrzJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DujpyMGO;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A82606B307
	for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 18:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4A82606B307
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DujpyMGO
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-14394530ec6so1638065c88.1
        for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 10:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794595378; x=1795200178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=18ub26cOjD0F2CxgTeL8whdA7ZyW82V6k9L7IoCUwXY=;
        b=DujpyMGOCXwBxNvFAHhXCzNwjDMLag7g/AGwePRGbvSeJuZ+/oWILTWgni9F3/IqTj
         0KnkDUv/wVZJp8mLg3DZS2jQXydz4Fg22cj42Nxck9LIWMsqflqnD0/ytfmwjyoGwn9f
         NDFEx96DKN/LIfxyTk118ydcAeMHEXNm81eVPLQW1yWSgy/u3Q5NviyZ7gTtFUTk8Re+
         oBJkzhSXsQ87/Ou8eFb47KlJEAwcQ0IpyBnydsmBo1inyUe8P9ZfxJMKZGrAHZKXYV7/
         /ATWRR9qwBJYCHbdHR+bHa2MkmXli5quY/ZxvPa7Xy6/8ykSRjyAp2NNF00PHGMfoLyC
         d4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595378; x=1795200178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=18ub26cOjD0F2CxgTeL8whdA7ZyW82V6k9L7IoCUwXY=;
        b=OsabdyRiruDF5Q6DhenHU7/xC0mg9kfQDdV5iRuNmBKLM+DLfDgaTPmEfUmYyzEKZ3
         nETpsW5/joy/dz2AQrpgfhDDF0XCCOQFuvu+WCsaIHvFakD7p/Bd1+Ep1k/d4WvJUs5o
         dls+Zn47gHd5FCPc9cQ1ewPqFHhCvWOHaDoHB/+dRcLEhrMAmSDFgW3lQDRoJsZB7Wf3
         7jG191qQvZAaJQ3p0V5WBEjT+YkUduqQtDc7YEFRLr9tA7SOHDtVZZ8GwtKGT9cp91f/
         6z935VDv0BJPhAzF/LcHR3kO/q8T5G7CmzXGHKErQp84ykcXr6oZXLM+RgJQVzsJSBft
         dB7w==
X-Gm-Message-State: APuU4Z/deLSP4tBMk/6Lq8rIkzy9RErYA7lZ6JGYv6N1pvUPL44gJsjH
	gcLa7J1AxCsGWg65iKJxu7E1Gvhuzjupn1+SzypyHBcogjwHcA1K3PtaL7dqYA==
X-Gm-Gg: AYBFou1lcStcnYV4xXyAGYJhnSEgBQJ+RMj9NbxlVzwiUdzwaVRncr6ac2XwHcpEO9G
	at1iOM/8DI6usjwv05yRmaTwBy60BxtG/wbtmJBYF6XNHlS3BqGaOEkMBiEiLztCafLTrz/Gro0
	X5+CQqsCMF6j0rJkUhfI30odMWSUxe4m5a5cP69WRC1lSV96KDv/1FPpc2paXMSk9QAD9gXI213
	DHbEPONncUlNMNbGTRV+Vqw6hUsBqlg0TeoMPvEvNz4JXmwVTRe3CbC0HdjsIRwG/0VWHPvXwd6
	HRb+6cHFI7kHkEH/P/lINiQuldxq1f3bHTU+FsNz4g2q77ZqrP4RHjgvCuhYbdRvQKFHYWCdtg6
	1mksVxI+homEFlqjuhEqqh8Uak2z+OQnUBpqIZazuYXiX9zbpNV6Knz7OhxCHMIJf0FViKBAgwU
	mMSwU20Jv1Ld+KVh3lqdpLFOsobjFn3aOarWypdSSptebk4fHv+EzNZ15YutGadxrvGmv17i6Xv
	f6bM5eFr5WQXvPS29jEuvvNdi4WhAccVGLASqq41TbSABHX9U8DYUOpN19rIEb87rdcml0s53Bw
	/lwUHstQle7+2amJGjbkDflpJ0PjXA==
X-Received: by 2002:a05:701b:4642:b0:1b2:42e3:e5f0 with SMTP id a92af1059eb24-1b5030eb063mr2749528c88.12.1794595377978;
        Fri, 13 Nov 2026 10:42:57 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e195sm10526177c88.8.2026.11.13.10.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:42:56 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Burton <paulburton@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	=?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= <zhouyanjie@wanyeetech.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	hns@goldelico.com,
	paul@boddie.org.uk
Subject: [PATCH v5 2/4] MIPS: Skip generic IPI setup for platform-specific callbacks
Date: Fri, 13 Nov 2026 10:42:08 -0800
Message-ID: <20261113184210.470320-3-f.fainelli@gmail.com>
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
Content-Transfer-Encoding: 8bit

A generic MIPS kernel can select a platform SMP backend with direct IPI
callbacks instead of an IPI IRQ domain. The XBurst backend uses CP0
mailboxes, so generic IPI allocation would find no domain and BUG when
more than one CPU is present.

Skip generic IPI initialization when neither selected send callback uses
the generic implementation. Keep initialization when either callback
uses generic IRQ IPIs, and retain the existing single-CPU shortcut.

Sashiko AI reported the XBurst integration issue; Codex assisted with
the change and extracted-function/build checks.
---
Changes since previous posting:
- Split the generic IPI initialization guard out of the XBurst SMP patch
  as a prerequisite, as requested by Paul Cercueil.
- Add braces around the multi-line condition.

 arch/mips/kernel/smp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index 0f28b4a62e72..086298146dd8 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -338,8 +338,12 @@ int mips_smp_ipi_free(const struct cpumask *mask)
 
 static int __init mips_smp_ipi_init(void)
 {
-	if (num_possible_cpus() == 1)
+	/* Platforms with their own IPI callbacks do not need an IRQ domain. */
+	if ((mp_ops->send_ipi_single != mips_smp_send_ipi_single &&
+	     mp_ops->send_ipi_mask != mips_smp_send_ipi_mask) ||
+	    num_possible_cpus() == 1) {
 		return 0;
+	}
 
 	mips_smp_ipi_allocate(cpu_possible_mask);
 
