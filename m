Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285098;
	b=OSDC2TkwtW4gChF8QtfDWC69qpNYFXBpG42LGJ8WoWOa4y1W+Eu5tgTF+nAJyy7qBLrt
	 z0YB57FqcOebFBunfYP9KRnqw5ZThNN0U6DdRxbmeU1LYFK8uAGGuitx2sUMj6vUiu7B4
	 y52F/wHXqN/GWG74eXRLjd4rlkoHJwnaefLH7rvFUFLgD+4+XOy6w4fbCTgb+JHGBZtPc
	 k+W/WNGLTIvAnZcpRNloTyXDjitxcOeYQjjYwwKUIW4D1ZVawzqTSl12RSapwbNs9zTz3
	 ZElop7MEVUr4/Ni4dJZXJr4hOtW4WoxPQIZerk0JjRrsIQ7WF7q5m7m6Nvf1Cg0ryNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZYqgKe2GJZW2UHebN2sjqXJOaRLIiL2bT7ytz8MwIYc=;
	b=yHHUlWuhcdl1LmcJEaras4MB0zmr5DvHpTXYzB82Otufih0LK+za5KicoTsu7dN+aA1k
	 SiGk1RG9YM/751uzlqoOWZFA4PTAo1kPuO9ZXVqGVszE//YPsf1idp78a/fS8PZiRiPef
	 3EwWh4tZTuZh0s/BLYGKUx4H2Ldfq7TyDiHMbNhmmcOyLBgWewygQ3/F12l3xhDYL3aDf
	 EUDdLXD3wCB7BeSLUlREQxkvbr2FI0psttjFZVB4xY7XOtVEx3s/R9d1CsOBxQVsFZacQ
	 INMa0yS1YmS0fuZlObhcJPY0M9ZJdx05I8M611ZItoNE9e7YQxFva4HcfnKCvxFsBOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0uPH12Hl;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB28E606A321
	for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2026 04:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB28E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0uPH12Hl
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-37000e7234bso2523507eec.1
        for <linux-mips@vger.kernel.org>; Mon, 09 Nov 2026 20:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794285097; x=1794889897; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZYqgKe2GJZW2UHebN2sjqXJOaRLIiL2bT7ytz8MwIYc=;
        b=0uPH12HlIIjxnOa4jUq2Xm2642IE6xugnu508/kJ+JR4O7djbtb9RAgMDgtbpC/fGN
         4ayZEeNFQ+Is9OiZ9QF1ExnDfhH893SUjQ6KY/6GeRVAWY4BE5k1CWBa4YGT8MtZ4VqZ
         nLILYR8B/hzmuZJRc2By31R9+FQV5LfFhg7qaNUxMGPbmAiJH1PgKgZyNtCta++HocuO
         MN9X6USKJ2fhH1D3g0bzKaAAkF0HYlg8mIXvuk422J2ELc9pB890iAZnViDDHm2xB/n8
         crh/bBGr95Mk8S81ToWVbXC9Wzs6kby2CTXNvHTAy+SKSJKdg9Tj48euTvBDAHjWrERb
         xDWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285097; x=1794889897;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZYqgKe2GJZW2UHebN2sjqXJOaRLIiL2bT7ytz8MwIYc=;
        b=RW2xqmgBRBm5dMFajywrmJhI8euqqh8IZXuzwy6812TYn+yQz0eHgp0axhnWBmxc3V
         Y0y0rdZjx0vhi4aCnBExJsHi9N5gN89bjsLm2ruvm7DsMCYl7mu98rBizA72Wxph/OiF
         2zGz9ANOYbJLKhcj//PRkwpKIsKvJk8toOttrelaakS7p4jVzZRtCFD8dt2HY8smZ8lB
         4aHbCD5VABMp+ncY+qvxYigHVo3Iju/5JPQYTICSBABNA7yzKInUCVMdTG2LSp95ZFA6
         HFb9xxEWg7e95ipPu1GPkUbosRwzhLCnhxKh+XqSuQoJTCw0juMDyMTCXP1fPKUASpul
         uprQ==
X-Gm-Message-State: APuU4Z+OU40FGVXsLRCvBjqH/xEkzD9Xcq98fAoIYyne9JKJwq8RHjuY
	prKDQYxNe597/8+P6tXsuWu5+VumgrZ5LOtZM3HyYaO5BJptCyxAIgv08W2tgg==
X-Gm-Gg: AYBFou2Z0j3G+p/8hV3UF9FevVTWlj+YseNLB6/9T/kzmzrFBi17YmTiDOUvTX8FJru
	9OiKK8PTpV6C1+pmbZRUBTAEUcFBBp3VZdXkBbixQhHnBVXnJZkX+WZC2rmYyDDoIqG4FbU7jUw
	ue/co0ByyD/vW14brswIrg3Mbs1AclyKyFP6R4JfbTxO5mX931A+z9khh5H0JAZUkEg34EZDFtP
	GPahuBm6yw0xNvkM5hST61Q6p+kyNkFwtsx9S8KJvVNVsvrQamzPIeDUEEg7wFntPnjtS2YyUU3
	McgzD0ROfVXXpUfmtvEreylx90/ylMA75bZWbDSKvK4E4XpCy1es+4Jy8CuZ3nOdxdxz+hC4N3X
	uh0EkJAxJ8SMoVre0S5hA6hsQfgl1+79e/x70UxZys5Kfl4CglSsxFoAuZ93dYij8z+6tr/gXtF
	lREBq2GDQx0DnV7gpmxA/cenUOoU0994LPOK02yPGSrJ7mkOhiEz415ZBxyJsfEWnfBEwnSTO2n
	SzfcxXi19iVqZQShG9wlx/lifxSrBI14hvxYrfIiDP4xK53ZIIGMBVfY8E6xNxZMIHr5q6EVBWk
	+zMuE7Cl
X-Received: by 2002:a05:7301:e22:b0:372:b76a:6fba with SMTP id 5a478bee46e88-3751f077fc1mr2683844eec.14.1794285096489;
        Mon, 09 Nov 2026 20:31:36 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9d78sm3340996eec.25.2026.11.09.20.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:31:35 -0800 (PST)
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
Subject: [PATCH v2 0/3] MIPS: CI20: Enable SMP with two CPUs
Date: Mon,  9 Nov 2026 20:31:28 -0800
Message-ID: <20261110043131.1985993-1-f.fainelli@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series resurrects SMP support for the CI20 board. This was
submitted back in 2020 by Zhou Yanjie.

Changes in v2:

• Moved SMP sources to arch/mips/ingenic/ and the header to arch/mips/include/asm/
• Removed CONFIG_MIPS_INGENIC_SMP, using CONFIG_MACH_JZ4780 and CONFIG_SMP directly
• Renamed JZ4780-specific SMP symbols to XBurst names
• Changed CPU enumeration to assign consecutive logical IDs and removed the explicit two-core limit
• Changed mailbox IRQ allocation failure from panic to logging and returning
• Shortened commit descriptions, removed Codex attribution, and adjusted source credits and sign-offs
• Kept the clock polling patch and CI20 defconfig changes unchanged,
  added Paul's R-b for patch #1
• Updated the kernel baseline to include additional upstream fixes

Florian Fainelli (1):
  clk: ingenic: Poll JZ4780 CPU1 power status atomically

周琰杰 (Zhou Yanjie) (2):
  MIPS: Ingenic: Add XBurst SMP support
  MIPS: CI20: Enable SMP with two CPUs

 MAINTAINERS                           |   3 +-
 arch/mips/Kbuild                      |   1 +
 arch/mips/configs/ci20_defconfig      |   2 +
 arch/mips/generic/init.c              |   3 +
 arch/mips/include/asm/ingenic-smp.h   |  20 +++
 arch/mips/ingenic/Kconfig             |   2 +
 arch/mips/ingenic/Makefile            |   5 +
 arch/mips/ingenic/ingenic-smp-entry.S |  54 ++++++
 arch/mips/ingenic/ingenic-smp.c       | 247 ++++++++++++++++++++++++++
 arch/mips/kernel/idle.c               |  26 ++-
 drivers/clk/ingenic/jz4780-cgu.c      |   2 +-
 11 files changed, 362 insertions(+), 3 deletions(-)
 create mode 100644 arch/mips/include/asm/ingenic-smp.h
 create mode 100644 arch/mips/ingenic/Makefile
 create mode 100644 arch/mips/ingenic/ingenic-smp-entry.S
 create mode 100644 arch/mips/ingenic/ingenic-smp.c

-- 
2.53.0

