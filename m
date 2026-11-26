Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683550;
	b=jqjSLD3DnFv2Cg2juDGI6lagzXgG9CnVzpMjmR1G/fo+b3tUmnHT7MczcvboUzG77o+o
	 RAULUXSeqONo2jw9Epyy1If2NrvEnYW6gt/oN49f1vvyz8yw1VZ8jM2Xa41tBzlslre4n
	 SpnjQAGxH5mbKvR++Ml6W2gpmqVpFANpXOpcP98ku1/vEfRryED1j5ASkCeMApWwZqgcI
	 dFKJT8Ls4fHCEE7lEQrrQv6Kue3s6MfKHYPDFbJAsEzejo2sIiIg+0Tq9tm39KJjfqG/s
	 AEq0DzoSF7JACgQIpVNDeR8IypsaVVgUxYURsuPM37lj3yOfS/rpH4ViMhNe++dNocQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jQc/CTIKgLFqNg7/EqVB3eWhheGznFwlbWTqinE5lFo=;
	b=ytJ098dpR3Ig5PnTfc50QkTvtY+aWFydu0DsDs7jG2oTfYpQmvHUI9L37AVS/Im0Zi3C
	 OfWV5k3KtQ716AkMqzJv9O9plK/TU8p95/FzarEuSrbMt4tM5s64e6yWVCtZDAJDn0RsV
	 5KdpHD6r0Y0eVgECm5EFkT+qP2FdZu6d1hDcgr5+Itcf9ZhQCnQEJi1gFL2oGSZ4/cpKu
	 tIcWJFkbETPEthlkaRl2V9nq6NOgFVdFRfyKLvAul9Vq9cfUTiMECMIhiLZv1Zl3V1NR2
	 hMiji1YXburiILMoJxoAQ9gtC/egho54cshcjAY0c+D+J8rmAjgOSJZ63iay5VDS5zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dFxc3MO3;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2A1606A31C
	for <linux-mips@vger.kernel.org>; Thu, 26 Nov 2026 08:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A2A1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dFxc3MO3
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so5999968f8f.0
        for <linux-mips@vger.kernel.org>; Thu, 26 Nov 2026 00:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795683549; x=1796288349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jQc/CTIKgLFqNg7/EqVB3eWhheGznFwlbWTqinE5lFo=;
        b=dFxc3MO30YtmMEUfQjjqkHJLr+EbHSnZNHH8tZKjIJN3dcUHmp0qnA3QpfmW2JLafl
         +QU3HmBAu6tKqTEffZiuFGb5MfpKeybOpmS3t1LtXNbM75purZ9Zrdvmp9Sbfw9Qv5ua
         ETBCK5gDnnitPh81ui4WT1Y5QcYujGmDt/yq8oZzRRPn+4wV53mld5Ss0vgTOA5cR3K5
         Chehx+uMB454+2gT8AVVIlvDLGL+COIMB8QcPvwtcbKdPXcHmUPbj9kxRyt9nqV4NMGU
         DC4vYhEONf43QVbm0k+Pb3cnNLbtbrqbhDpyNKZOgSCTJAezKc7h6iD/aaeZZqbM8ZL1
         oxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683549; x=1796288349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jQc/CTIKgLFqNg7/EqVB3eWhheGznFwlbWTqinE5lFo=;
        b=jkrejmdHkF2dc1pdKWKvA2nW9osnDyRHjllOVWRrTzD5+K11nfsPH0AoEc4WquAZKT
         20jWRf7n01nysEqaPVThbqpzw1m+116k+Qx0wq1d2a23RyCjqqN9VLFLw4DcPxbMJBc4
         FZZ7S7hnfoQrXXvtvMo4cgXImjD5dpg3hl/zu+pHBKIM8xKzdKRrRJ3CoZltIoOlkl59
         PX+OBWyLdAXlJbw2XKXol3R7rEnWiyJsvIQ0HF7YyDrolimC8aZMT2SIZ7Vh32wg5VbC
         /HVt3j4nYfpTRDcwEie8SxIuw2a85jm5eeqiy0LM57/BRejSH14waAJ73ATX+0FFsFmn
         6ZWQ==
X-Forwarded-Encrypted: i=1; AL+hErHutmFYye6qepKMnenJwBTViL8WOoqUyDq1iM3mwwE3eblolHzdwjM32i4/1vLfJH9J7I3llK06UNpp@vger.kernel.org
X-Gm-Message-State: APuU4Z8HWnImc8agp8S5WLJMdEI81wnSY8vqoC369vWzN1lwmAnM3YBO
	hkrtOf37J+eJt2aoj0ud5hHM7QRgggTb1iupT6w5bPIFwOO10lLnq2bZ
X-Gm-Gg: AZFdTZcqYMBDisbzcRKi4bszHCgywH+iGwKVPWi6+cvk+ai0Su2LWg/IfPI/Z3jsv72
	S3m/JLLYMAux9dOMc1Bs6gAOU1br/c5g275izO8mzTO2H6CuBBuXPi7zVZ7MkR0eFroykHyD0m1
	cxRuCKdeEkwqzg7QMrumntpwGu5Xm/IKpTveEywwFm0AWPcD5IoUFKmrJQ3Arx0sKv5pdRg0HMu
	0EbaMZ8RIdGzzI/LWPm5W8v8FHsAerpdAt6wIHyeeciyGr/OrSUev/NBxNGtaMjIwTaH7yVPlrF
	HuEnTEZBbkTEi7ZpvEeL7/vzzq0TOKYNMMlonxXktvX2AM6LQe2eF/j/1MMIJHE3UHuSr9hHchU
	qQDiokztY680KvIL7V79Lhm/vKK90dDVlzpHHBm6bCW4ZByl5zo9GPWMH0kk9scFZ1b9L7x1NBJ
	Xj/1NF1rdVv4TGedi9llSUnGlg2CIyctP1niiqJdiv9U+cdxVWfBAvssQFgN6WGDyPj2pFOtS4q
	y9GyOJ/1Tul7WMRt5gbmctnrNoRRSsDJq+qXfsO3LYfFN0eMDdPvkzZtxxNlDpUqqIFX1hI1aLb
	QKdHJAzQ8EI199V5jTXSPQL6Z+42kk4oQ6KZHhcK6mcT14FOF2eXYA==
X-Received: by 2002:a05:600c:154c:b0:4a2:729:f7ce with SMTP id 5b1f17b1804b1-4bb8881c378mr415302325e9.8.1795683548507;
        Thu, 26 Nov 2026 00:59:08 -0800 (PST)
Received: from center.. ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm40313744f8f.58.2026.11.26.00.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:59:07 -0800 (PST)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tsbogend@alpha.franken.de
Cc: linux-mtd@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linusw@kernel.org,
	kaloz@kernel.org,
	ulli.kroll@googlemail.com,
	john@phrozen.org,
	nico@fluxnic.net,
	dwmw2@infradead.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	Orgad Shaneh <orgads@gmail.com>
Subject: [PATCH v5 0/4] mtd: point() for cfi_cmdset_0002, on simple maps only
Date: Thu, 26 Nov 2026 08:59:02 +0000
Message-ID: <20261126085906.814373-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
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

jffs2 scans a flash in place through mtd_point() when the chip driver
offers it, and copies every used eraseblock otherwise. cfi_cmdset_0002
has no point(), so an Octeon CN6635 board with a 100 MB jffs2
partition on an 8-bit M29EW spends 15-30 s mounting it at every boot.

1/4 lets point() through only for maps read through the simple
accessors; cfi_cmdset_0001, lpddr, map_ram and map_rom point today at
maps whose own accessors swap bytes, switch pins or lock the bus.
2/4 adds point() to cfi_cmdset_0002 behind that gate.
3/4 gives each Octeon flash device its own map.
4/4 lets that map use the simple accessors when no eMMC shares the
boot bus. 3/4 and 4/4 build alone, but 4/4 only pays off with 1/4 and
2/4, so taking all four through mtd with an ack from Thomas seems
simplest.

Tested on that board with 7.3.4: the mount drops to 0.55-0.6 s, and an
8 MB file written to the jffs2 partition keeps its md5 across a
reboot. v5 was booted on another Octeon board with 7.3.4; its code
changes since v4 touch only a failed point() and little-endian
kernels. v3 held its md5s across ten 8 MB write/delete rounds on
7.2.9. The series applies to v7.4-rc1.

One question: a cramfs on AMD flash falls back to the block device
today. After 2/4 it keeps its image pointed while mounted, as it does
on Intel flash, so jffs2 writes to the same chip wait until cramfs is
unmounted. Is that acceptable, or should point() in cfi_cmdset_0002
be opt-in?

Changes in v5:
- 2/4: no pointer is returned when nothing could be pointed (sashiko);
  the changelog now also states the slower first CRC check of jffs2
  data and that lock and OTP operations wait for an unpoint.
- 3/4: Fixes tag (sashiko).
- 4/4: little-endian kernels keep the semaphore accessors; their boot
  bus needs the address swizzle of the I/O accessors (sashiko).

Changes in v4:
- 1/4 also gates lpddr, map_ram and map_rom (compile-tested only).
- New 3/4: the per-device map sashiko asked for on v2 and v3.
- Rebased onto v7.4-rc1; Assisted-by dropped (an LLM helped write
  this series).

Earlier changes, in v4 numbering:
- v3: in 2/4, an XIP erase no longer lets a point through either.
- v2: in 2/4, a point no longer suspends an erase in progress; 4/4
  checks the bank width before ioremap().

v4: https://lore.kernel.org/all/20261117214141.3826637-1-orgads@gmail.com/
v3: https://lore.kernel.org/all/20261011062908.2365879-1-orgads@gmail.com/
v2: https://lore.kernel.org/all/20261010180840.2152492-1-orgads@gmail.com/
v1: https://lore.kernel.org/all/20261010172142.2138956-1-orgads@gmail.com/

Orgad Shaneh (4):
  mtd: maps: only point() maps read through the simple accessors
  mtd: cfi_cmdset_0002: implement point() for simple linear maps
  MIPS: Octeon: flash: allocate the map per device
  MIPS: Octeon: flash: use the simple map accessors without a shared
    eMMC

 Documentation/filesystems/cramfs.rst  |  11 +-
 arch/mips/cavium-octeon/flash_setup.c |  78 +++++++++---
 drivers/mtd/chips/cfi_cmdset_0001.c   |   2 +-
 drivers/mtd/chips/cfi_cmdset_0002.c   | 174 +++++++++++++++++++++++++-
 drivers/mtd/chips/map_ram.c           |   4 +-
 drivers/mtd/chips/map_rom.c           |   6 +-
 drivers/mtd/lpddr/lpddr_cmds.c        |   2 +-
 drivers/mtd/maps/map_funcs.c          |  12 ++
 include/linux/mtd/map.h               |   2 +
 9 files changed, 256 insertions(+), 35 deletions(-)

-- 
2.53.0

