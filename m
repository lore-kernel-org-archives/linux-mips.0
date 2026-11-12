Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509148;
	b=adc/frfZmqiUBP4neY9mmH4/cvhCzTQYTD7uMsTvP9+yahYpygI8tv32nIL9rXEUZP4b
	 gkk7chSYyE03R3mskpwnKBHns/9dGHYc/rbLCPMUGdEvsVPBvli9sAVmdKjN2W0lMttmq
	 jXeplNZOMN1JLl+dJkz4KwslHHPjAjDdxspjblIyiFuH2fSHA/9JeSNrJoSrjCnJhQGLE
	 lpm0ms9+ec4MMpnA1bAzKnlZhr8HezQhYCgjVEcJlUFFiUb4TC9mBy1JWwc4R4is1kyoO
	 28/lQSiTQwuOdZHnZHQVK45Maub+cQYO6JRMEjOYOTXJqrZb0h0wwJxAYT61Zr7h/EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=o2qMJEH+31qggb6YqbR5qReK9kZYkIie2xHFXPABy7M=;
	b=2xGyW8QmHvZ3cT8D+OO5MIYciIk0BfmJTnKdoIwcluC8aGhH/3zz3c5qfUIAfUXGUQEt
	 qA1D+eB5d8322pedSNdoBFAZ73mbNCmcDRTDuxuAX+i2/OFur8Ph6sk1SsUCiwQOk1gmD
	 0zRWhYbLB59709JKCSHr9BiY3DHrafsDGTemDGhAFAieQ/1BKHp4kRBe/xYfG9teM/0fe
	 8G0LoqOSOLn8iZgOdG715ooBNv+1MRWAJOm1ckaTOj3PsYQ7g300QJV4yQvHoM4pnH6TA
	 BtBcjBsh810qRrrN74xanDfR7CNYtqjf0/vX+qh9cfO+moWBAfEy7PNB+wwhsSerJ6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WYKEnETn;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED6B606A321
	for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 18:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ED6B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WYKEnETn
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3791619605cso386332eec.0
        for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 10:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509148; x=1795113948; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o2qMJEH+31qggb6YqbR5qReK9kZYkIie2xHFXPABy7M=;
        b=WYKEnETnICcshBd/3HhBmqwjrcKe+FbTbYG4mIGPe3Gt+6T8ttAbfauJHC3wbnYNI2
         N4W+1hX0tN1TiFkSUGF20Ufp7aOifT+NeDqD1SM3j0+/jmZrUNg3HlCMQPoRuAzmDApo
         /ytIuoeddMZnIW1FBATf89vHQ+Ns5KRLIQseTsjQEups6kRFzSABIhx0gEferU0R3qYO
         zYuwLHPmb/bdWeZsqHaIZ4W6fV0Zb9fJfF+8Sy08N2sKi9Faho3B3mgBRJzGIPa/43Fz
         k0eir7hJmXlvb9chFcFblFVb3VZLzcZJJ3u1/K5BulVvqDIWb6KDbSV6T/ndl10J7BJ3
         CqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509148; x=1795113948;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o2qMJEH+31qggb6YqbR5qReK9kZYkIie2xHFXPABy7M=;
        b=ISVWxbSFwtPQDy9sR/y8z5LuHmJJeEqXw5nUp0tnAwvAUClIZ9AmV7zJWYBcRJGiHc
         UcJoSvXeL1zMBYhbMbIlcVhGIu7ifwRJq83FL1R8srZ9Q+k87k/LRUfFxGGFEhEH2zpL
         65qxybqv7V1ZW9i/YIGAsjf4S78Od1+uidX/eFSc4Q+efmQzTaoL4qKORd6AfFg38QlW
         T2HaRRIkJF76TEsv6pQejptFEvh5vR02KkiLw58xEkkfcK2tgNECKFoMXB0H9GEP0TnQ
         GTKmDcg5NeMpTMvTzQVQ4VHcRa9DNJzHeeoUq5lKLrKY+tqrq11NMkaOUoRbohMFymLT
         J+LQ==
X-Gm-Message-State: APuU4Z/OY0NKtwS9wXiAENMkctwJM9KgZ++HFNdxw6+B0KopI+6fgccH
	ihBtu0kjOeQQ3FtvdHMf1AepXneF6RU8BPmvUnyayPX6VikGhPlew2OE0C6ZSQ==
X-Gm-Gg: AYBFou0o/gGk46YH3gqrtK7Gs3tcG/DSjvRB9JCHdyQzXa20CH2uY4O1+eGwX4ztgOb
	3mjtg+5E9bkTilbgxBB86KZ8ihM+VnkiPOLRz3qIA70Ua1HG7pWvaXW4H+n6dOB1zY8mEjXrSU7
	m0anB+LfBZWYOLPnbxNmMEFIHlexJ26EZkpd3phk4ly2d1BtPQLgVuDLvJHdL82tAgInm+iQa9T
	joN1eTjXZA0nrwIUeTl8NBLqEXme15D2ZOZPPLB7zLHFxN4s/8vTtX0DFZ1kUKZqOEe4RR8HfKA
	rf/qFB4FRjbao36una29CrejTJSqPzjOC/ODiovIzdxQASgVvikiE50kP8ex9gZdu8R6UeCaxOr
	a9Glo6FXNmiJhddfwPbsQq6SqC4LDaAMzz1FMToQv5jmoZBsFMcHZ1+Oo1UrCSJ/2LkOkuGqz4Z
	Ch5EIkF9yR3MU6p0oV95aIHDzJHsdzJG2UEukQZFkBnAP4zgtdrYXC1eWqpnUs7C+7+/Zrq5AuZ
	UoHSayG3zXS4Kwz4uB02jX9B+6Wad/NjyHKakxnXSCedaxNWcTY0oxluBN2vHdDi4Pdi5szxYOg
	doqFhQLt
X-Received: by 2002:a05:7301:b06:b0:36a:1089:9836 with SMTP id 5a478bee46e88-3796628ce32mr27774eec.15.1794509147532;
        Thu, 12 Nov 2026 10:45:47 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad134sm369524eec.27.2026.11.12.10.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:45:46 -0800 (PST)
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
Subject: [PATCH v4 0/3] MIPS: CI20: Enable SMP with two CPUs
Date: Thu, 12 Nov 2026 10:44:38 -0800
Message-ID: <20261112184441.3724150-1-f.fainelli@gmail.com>
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

Changes in v4:

• Enable the secondary CPU clock outside the raw spinlock
• Mark enumerated CPUs present and assign hardware core IDs
• Skip generic IPI allocation when the platform supplies both IPI callbacks
• Fix generic 64-bit builds using CKSEG aliases and pointer-sized assembly macros
• Reject unsupported CPU offlining with -EOPNOTSUPP
• Restrict the XBurst SMP idle handler to multicore systems and recheck
  pending interrupts after flushing the cache

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
 arch/mips/include/asm/ingenic-smp.h   |  20 ++
 arch/mips/ingenic/Kconfig             |   2 +
 arch/mips/ingenic/Makefile            |   5 +
 arch/mips/ingenic/ingenic-smp-entry.S |  54 ++++++
 arch/mips/ingenic/ingenic-smp.c       | 262 ++++++++++++++++++++++++++
 arch/mips/kernel/idle.c               |  30 ++-
 arch/mips/kernel/smp.c                |   5 +-
 drivers/clk/ingenic/jz4780-cgu.c      |   4 +-
 12 files changed, 386 insertions(+), 5 deletions(-)
 create mode 100644 arch/mips/include/asm/ingenic-smp.h
 create mode 100644 arch/mips/ingenic/Makefile
 create mode 100644 arch/mips/ingenic/ingenic-smp-entry.S
 create mode 100644 arch/mips/ingenic/ingenic-smp.c

-- 
2.53.0

