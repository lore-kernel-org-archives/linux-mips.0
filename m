Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794456976;
	b=UX6dGxZe+hBv0iR2N5PeyWQ6l3ay6s3x3hHkM6NjDE1/+N3ul9aBy//pk/vJbJhoUUhq
	 fOujoCZLN4sXiVtZNJl9az6j8MbOiXksGm+tsKLbeT8Ogoh1DDOIAfodjyK73ZTvwe0JF
	 +9Z8Igqqq/e2deSEeZfF9SeuFBxIsJMQuqNol/i0DEkC6vo6drNLi0zwVzy/UIFDlu0CX
	 sn2Qje4T5E7fkWpdwnSNF+d6Zsu2iZpKpMiXntlHRuRyk4XBcIe+wJr72cg28ASlqO1BR
	 RZRf0/Lp+tz63LmhyxUN030FpKCbHTx6myrhOiVNdGphTI9bSIiGo3XF2tx7kOA5G4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794456976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ta4OcVdC52VTSti63ovhxU0ir4j7mfUIFix2+gqdIQU=;
	b=Hh8Z3722/GOmvsa8Jl0exRzZyZTl57ZDnX+jAcN7XjiHimpTBJ5ZaAytfg1K8Qqz4Uf1
	 UHuaN0fWKl/XMOybnK0wmyl7+izj17/FzaoAQ932QSkhMvmstAMWM771mUulETyMMeNi9
	 mC9dzUA4kjQOlJ1O6qf0MeqfOksy2jHNU57Ay7jCxvS5GvOxv6aIj9VRnXk3GgttYnLmM
	 9Xg6PeKSc+a3qudTkHdHkcesfcirzf/l9Zlr4ogbZ+FYmOgKOfRKQL1GissX/yyrk+U3z
	 pfTjSxmK5Tx7nQ7OqiH6b/GyLcP0ByU4CCGdG4oDjtnGhL8rjeUO8hktVEQ+9qsc0jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qXuyiUa8;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27912606A321
	for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 04:16:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27912606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qXuyiUa8
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b3b4bcbfc9so1625596c88.1
        for <linux-mips@vger.kernel.org>; Wed, 11 Nov 2026 20:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794456975; x=1795061775; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ta4OcVdC52VTSti63ovhxU0ir4j7mfUIFix2+gqdIQU=;
        b=qXuyiUa8TtGAE2ahyCjJ/Qgbrr2DmNEju5YPemZneiCeG/lmpricA0v5dkOskpD2vB
         2gq/8Uq+4dKO1q7bwSYzxpZb77nCyk2Org5mZ8JXStG/Zl+Qa1nMlCBaQBo+7DsqS+7I
         xXoY9KMSIqsYGLOZkdyiDzXPbhgXCiTOoSEBqobpiXYceIVcBx98Tu3oS/8pZ/BY2w3R
         G8ptGoNwoe0yUIQvjG2gVbvOGnloeVTnpafhYg5C/pCYQj7uzzaLPTSv3J00Hl5g5//i
         CHygp3VDDw+tQ/u/Exhtyfxo4dw8KcANVGf8P+KqQoIskqwvejBLap4JStPca3rkAQvk
         puJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794456975; x=1795061775;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ta4OcVdC52VTSti63ovhxU0ir4j7mfUIFix2+gqdIQU=;
        b=B6BM8gwExSw5R6ZI5rTstr3tXFFk5laaEnTJ8zMGx4nX3WifgWhrGw4g4yM43diYxI
         grsfHtOySbwRugQvGL0bUcdveIwG6SsnwQ7Uih6fMUgaXag8ovko5279E2dUjbLSZkmB
         +DHZfoBTkeYsunVMfsQqD145ize0GhA/2E+iANfgeR9JXVN+Z8IGUYd7C3w6sSJ790kT
         rgDNGRLbhHrNZ/8dUT5DbwUuofLxMMNTyE8HDMi78Kr+8OVGfySEptdIgI3hCQWHZmlk
         fHd6bwZFUUK1ABrhPpoiMk9WLYSuQCItIjt8QpBBiZt9yZTCFXlak81JniUJrmLmx9Jc
         V7Vw==
X-Gm-Message-State: APuU4Z+FRvLQvYcYrgsHyvfq3B5Qm4l++8TJO+LhGRUOsT4b+wOiNaBS
	Vm5t96QSc9UBYgP93fNRKNnJ+CokoOLL8p1tvHqUSPWZx2Ql8jFjB2OyFYoBZw==
X-Gm-Gg: AYBFou3mRiIB6kaQ1qB7hthPENH/MWHslBdc3ZdzHIsKkBbh0qbmJ/4rK/o4x7qwdmB
	g+KUMHzUfBUnxi7c5CZBwWZM7qG2FCjbXcFtSQ0dDW8R2LFOCmTtaPeM2kKpdSFME+a8abzuvbb
	QanYkor3eWtMgt78Ra3lVIzu60NR55Yo8M5/XrfZD7/ev2j8jpE5WkS4clsZrf7hIJX0SjPsayD
	832vzXJotpjnQOyIw1Lg89SqBovLIU8djTDuVmYvd8hsxTazKfyVDwVJoMSqFy0nr887T5Luunz
	kSpMlryD9JWcRkBdaG1hZ2XyggDNQCwq+78fR8MqPsAgYt5fbW87DLd912uttQPGJJ+NBwa8xmq
	LYngqekp8sC2ulriMvJl6bdIyafFnQPMurN2S1DFDNjL/nKQlqUF0WNFkDjSZnI6QM+nu3GVB/h
	gbUIQy3dt2RhBZ+uo8IWpvsDg5vwlmBIlU1O7RqsmUp5gIgtRmZxJSyG+zTM2HRWHIlja3YrKFN
	n4OyVqm8P2/KyX1soA9rtULy04/SIuw4007RXYGzAp4qdrNASLAX89F8tNxu96lB1XoKeWkVle9
	N6WzWo6U
X-Received: by 2002:a05:701b:4349:b0:1b3:af3a:e784 with SMTP id a92af1059eb24-1b3c03340f3mr3645269c88.32.1794456975057;
        Wed, 11 Nov 2026 20:16:15 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm21300801c88.1.2026.11.11.20.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:16:13 -0800 (PST)
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
Subject: [PATCH v3 0/3] MIPS: CI20: Enable SMP with two CPUs
Date: Wed, 11 Nov 2026 20:14:19 -0800
Message-ID: <20261112041422.2997275-1-f.fainelli@gmail.com>
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

Changes in v3:

• Align the second line of the readl_poll_timeout_atomic() per Brian's
  feedback
• Collected Paul's R-b and T-b tags

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
 drivers/clk/ingenic/jz4780-cgu.c      |   4 +-
 11 files changed, 363 insertions(+), 4 deletions(-)
 create mode 100644 arch/mips/include/asm/ingenic-smp.h
 create mode 100644 arch/mips/ingenic/Makefile
 create mode 100644 arch/mips/ingenic/ingenic-smp-entry.S
 create mode 100644 arch/mips/ingenic/ingenic-smp.c

-- 
2.53.0

