Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595376;
	b=RerVx10xYtE8n5CHtq3eCepLADsqEABg4TV+Pl2HDQVNMtf5+VHIKEa4arYgmFYoFSZS
	 0QKhT6apP93bewni6ByLXwQBEz4USFtNmyaBFcVHHwHx5ZN+ceUpZh7wfIKs3Fm4ojLXW
	 rutfil7qBw9QOboxdAaZRMs0yvRvJfTICSMFnVfy6JooPbVKVWkMkZsaIO1uGpxZ4mw7y
	 6fKb2XwdK01gPU4M1aZQwH4N1vYv0tyZ+xBkqS9ipHYrXUZZmeZVimLNoJasZkRV/8cO7
	 JL1o7IAe8jkQnc5oOfOY5qOkRkWhesYYXkYQBMJ+rKMiEBR+SUu97sUKYhQAbXssWMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=yEw5KadHQTak+G++8OlzH9m+1ubEWMXtFGCjx2W1Qrg=;
	b=VEfSv+uytjiruDPpj+cLhAPM8wqxh3p1QQyRUrXwGKumsfT3WDZCYr+XzlS8C9l6k1ws
	 YPCfNcUgcQE9SPDiA7Bkq8wxeY+jv6R2v5QOAeKiv4r0tZAhx9g7gMFYWfy1dVU/3ERx0
	 itF+RTMlka7AVKFA/AkBW+B8w37Lx3ikowtfyoGKDS1w1YC58qGxFB2KjGOFwUbwF9tcM
	 MlmYQ2FTvWb9/Csidy5JqR1HiM1swn6tBe8Q2z3JZGkvGY7o+egR3NO0p/2SHP9vqcgzj
	 4Y3gsZP3ZCf5xhsBrTPbE6YDJw7VnJ77SDtkN/FbfZZEMuGwyw/FBbK9/pvpTBm7sDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u9Eg0Qeu;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F03606A890
	for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 18:42:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47F03606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u9Eg0Qeu
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15ea896ddc8so1776229c88.0
        for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 10:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794595375; x=1795200175; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yEw5KadHQTak+G++8OlzH9m+1ubEWMXtFGCjx2W1Qrg=;
        b=u9Eg0Qeu706qjT2IhCsz4+EKc2sO/nmiljfYEXHHufIWj8XYW9yaWltbHfroO+nRs0
         4gdWcsMQoFSyT8YLi0gRRsryAw+3QXIWxWhsEUjuaDNFalx/VTGkgnrsyjl5E7ctZbED
         LT0gSvcoNSjTXDxJXTHdW8EFzO0x0RB8TN29xhZ42euzZ1lij68JgmV1oS6N8z5Khbxs
         EpyLoib0NMAjwfbP803j5/GeZo4jLP7Zn0GSdSNKtRIJKzA6DkNeMNbIYGESB//k2Tj4
         nf3cUDSVetEIRqtLgNwyftNHQKGiBtYj/Sf+vQOTKOWRhOIl1w82dt2dQOGeQeayJdiR
         kYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595375; x=1795200175;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yEw5KadHQTak+G++8OlzH9m+1ubEWMXtFGCjx2W1Qrg=;
        b=ywZxeni7umIQuNRpLNMbEXEh5T0niakKd376cTdhM4d9XNW1F3+lRbZFOhHB/xcaGE
         6H3U4tGiS8xqQz4vHote3UoHfHhfm2RdfbLiyba/wsw5UOP1CBzsBZVweXFgiEgbyZ3R
         ckJ2c+vb9b+qDnA7GSQyuQe4+hJGq8Httd8mWAviMKoTAWU/IlAydmDmLKQyX13ea90p
         fq9u9fXr4pw3oe6+B31vmmRF12q5WIPw9VQT9Y2Tg5A3FVoW87DxrHLydzk++YSYVJAA
         zKLzhDemQZUvFU9Eehh8ibUpkIYnzMtuuXVjvIMVlwU3pxyUfRw0aZZAmyPNJDcknvpl
         yw1g==
X-Gm-Message-State: APuU4Z/MZhxBlZUugmIhqntsvR/fIOSAGG7U4U4Gwpp489kOw8AibjSx
	gh85GXKL3m5Vj//qgrtrsgbHcBAMyTriLf2gg+iBoWBMB4VhJkmeJKQglYi4hA==
X-Gm-Gg: AYBFou0A+Vqs0znn10D8SMmwajsdvT5f7z+UFibxY+tH2mGL67U8C69JNTNnxx/ggwL
	L0HesmCSHVfcMhpIp+IPb75mjyDj3Ku8mxFaWCJWMQUALz5wMBEYQXJM8TPKx7BAf57s3P7NGIY
	pAJQA7wL/U9A1/2syZHkVnLDL3PVtigCPHe+X1eskwh9ZSdPkvSEOOE4znKPhUHuO9wkxg+7XiF
	spfFT1TjbDMU2QTZf/VAJZMHaIR9zzprIEPeFWuobgQ/xTUgTKQh8TyTRur5u4FngFCGdNawTLk
	n0ukr84ne7i+kIZ/xjwj4id1NhzC/4wVGjtChkKfU+e4d9YOct5kmjN85Hwtat+UJQF9QVwcUQR
	6N+01wVZLFnx3p69FsKgBQ6Mw80+LxiouIihnFsZy1MSiGJookjPKvMVIJvM6RL2CciEeP+a+Ex
	aY/fiKBpyqqfKuFOMpOPkNRkdlT2+8ihfVmPI6YKxXSbJpJwSdafOfVWoqypNMf9+E0VBwv7Kb/
	mfjJEXk5rxkIADqfbDhYwMxN4nZEehsJ5YLhTqcsp4MZ2bK1XsNOFwnrxgl7gRjhvOwutrUvaxi
	ckRwRgf4
X-Received: by 2002:a05:7022:3a87:b0:19a:9a93:c9b2 with SMTP id a92af1059eb24-1b5030980f2mr3402806c88.13.1794595375329;
        Fri, 13 Nov 2026 10:42:55 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e195sm10526177c88.8.2026.11.13.10.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:42:54 -0800 (PST)
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
Subject: [PATCH v5 0/4] MIPS: CI20: Enable SMP with two CPUs
Date: Fri, 13 Nov 2026 10:42:06 -0800
Message-ID: <20261113184210.470320-1-f.fainelli@gmail.com>
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

Changes in v5:

• Added changelog per-patch
• Split the generic IPI setup check
• Added comments explaining both need_resched()
• Removed void Reviewed/Tested-by tags

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

Florian Fainelli (2):
  clk: ingenic: Poll JZ4780 CPU1 power status atomically
  MIPS: Skip generic IPI setup for platform-specific callbacks

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
 arch/mips/ingenic/ingenic-smp.c       | 260 ++++++++++++++++++++++++++
 arch/mips/kernel/idle.c               |  31 ++-
 arch/mips/kernel/smp.c                |   6 +-
 drivers/clk/ingenic/jz4780-cgu.c      |   4 +-
 12 files changed, 386 insertions(+), 5 deletions(-)
 create mode 100644 arch/mips/include/asm/ingenic-smp.h
 create mode 100644 arch/mips/ingenic/Makefile
 create mode 100644 arch/mips/ingenic/ingenic-smp-entry.S
 create mode 100644 arch/mips/ingenic/ingenic-smp.c

