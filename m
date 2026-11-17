Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794951706;
	b=AocakEuhUndkEg6ovn8nu+LDcWzKJ/aS8ULkWaf8V0DnPrRkdBq9aeztdtf41AianTV/
	 HUQfqUCZ3VhbcZdXfszEJx/aItUTDdMd7+6+b/vjoFWDRFE9HykWluSclkgZlKf2EDTlx
	 VU1ogVYksXFP/aqE5R/Bx3oTpeVBiJrVUGuA9dUeUFqMiQRdfilAUX+DYTXG5YFZmNkPw
	 1t3rxeIhLe1dx0kkNFzRZcWA1fvdJF5YkacwBPiP1D9PpvQAXZ8viFpWNe8YKNrMt0FtZ
	 zqSBrRd+XhTlRfq9I35ORzSLb8SnTz1ldbdUMTxJtdQp8w5NrTGWW+6vpmivPTR4jGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794951706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cM8zYdFhYY7QMWD01wtMfnMSvgeVrmpAogUxeL6zgEY=;
	b=ssdqScC6yc2o0kmLA9LAvG47Cbj9RBaltYNOfkozaAdxNqaBMefwdBjpx5XpdZO3NCTV
	 VzT3zRN2nKfJaaHlpneRtgQerPN94EXihUqid+nkoyMKB+MHD0LlSRtiO9U0w/DGDrknV
	 A7gxLSWRBxNcKzdh3+fc/amhz+v+reQF07M/ELIrUX4e3MejcbgfUgkO1+/7NsvFo0Dr4
	 RsO9JRxk6d16m1OeJnNRPezhI3SYOF73Wn9jS3MZvvrsatkjJk3N7RnvqByI9FZDf6Ifh
	 G56DwVffKJybf8iBL6v8DX7mUlpf32ZvhNKWwZmpgIhnTN9unOg2kHi3WvEdCI4mnXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UCczWXoE;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D62A606A31C
	for <linux-mips@vger.kernel.org>; Tue, 17 Nov 2026 21:41:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D62A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UCczWXoE
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e46e449e8so147541f8f.3
        for <linux-mips@vger.kernel.org>; Tue, 17 Nov 2026 13:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794951704; x=1795556504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cM8zYdFhYY7QMWD01wtMfnMSvgeVrmpAogUxeL6zgEY=;
        b=UCczWXoEHF8KuF/aQ0hYm3w8jn3hiG90ZxdiLdSK8ze14XYx6sBcQmMd5Jm0qIveIz
         U4XFFxLOiEJGN1CwBBkvGenQWxhDj4YUk1oOkUHV4wHpZT+AMnumb1+mtCWB/qlUJqbJ
         hjQDQBOQN2Nwrco0ESz84VDuipfAdIbqQ+Yk9KMbGRHJNlwkJK3g0Umre961Xx2l29NS
         i+obFc80Roui6tK5buwYTtnL/SwO+6UVzIQ8qgCQSqxW87QI+PhM+ahr3uRBl5LoPMBB
         uaGNREfEZq/eSpypYk/RxKc9CPf1QneNvwRwN0/Kh6pZyoHckwfecChLnLsUL17x/0y2
         zEmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794951704; x=1795556504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cM8zYdFhYY7QMWD01wtMfnMSvgeVrmpAogUxeL6zgEY=;
        b=UVCGTMd/2IXWyeQrMgK/9prdmSSzGiGnrhzgYxRYJ/FGrqrf9uwOZnNkoH1rRWmlgN
         0yRFM2Ng7w4beBnr0N2wqQqSjVjtuNYztTR/cmwhilcZr8ScKLIak6Al1dHXXByzcwD8
         oU48auwPU9wrgzzyraUdy28qLt/gwn7WJFsotpWeZlC1J8jHkrbUs3LUUtzaj9xc8qdm
         H+qOtCh2GxQVkZXR6+honTEhF+jvYndU7Tqwpq8xkUt1RUbYAt3t6GNaige2c09a2Akq
         jP5RL4cnHLLihxe1MFLxWrLlDt/u+qj3dIztSffUeNxSJDbaAKmZDmgE8c/osf9cBSm9
         0QaA==
X-Forwarded-Encrypted: i=1; AL+hErFHIkAqY81Wt3jai5+edqCVuGDg/aco68yd/mj90EMtIcsBfX0w5ddJvx5ePKGhaKWZM3imFDRX9s2Y@vger.kernel.org
X-Gm-Message-State: APuU4Z9lyTEWOzrQKBwndvDPQ8yI63WiwMe/0lg77DHs+/JXgEK7WThp
	PL4CmJsarSesTjufwl9grSVDCWCVOt8w7oeqzHQcvmhi5cN4qcR758kW
X-Gm-Gg: AZFdTZe8ohQMtW2nvuGoHDlcWM8JuqRZRzPtVtWD2fizJzf+6xLVSGJNcgP+CMLVyua
	zdGp4jBrWqoBGC2+1Rcc85IGNBzvrNxBx65pQ/cQpcCinbAYot20H9Z6vdTGI32AjVQ+ilo6avD
	LZVqqNxg4kG2LWHi4T25JAaOR5rznImmhZKl+0fIF4D8+pMQrPZQJK2VvW8/Qh/CbljX1BAoENf
	EBRL/ggJQElm5MBzJp5p1KAZOXaLNaHJ9AMCfu1fN0etd5FM+Fayb+ivb/T3OjkX2v58Y5TYryn
	y1UM+2MaU3DcWa2QqTXFZIXm9AHuRIDaHGVx4T+2KmjIJIef46Tj8eLApKUYC4AXx5v05Wd6iLW
	AZ9bEwpNfzI9j9bq5nwi9/O5tBMNxAOoG0Ym7sS6crAjfG1OQIoVzw7kY2rNkILmc/fX+W+y9t/
	JbY1kVOL4gFpU1YXWEpzBb1wfGLSJpwigw+Rq/KYALwEcSzwcdgWZpNJv2mY6nOZU3LU0VDsPXG
	Qd679kG1PwFRR30ezi4VDfNQ/DYsw8uOBDzvKEH70G2lkebqU2uh1bO+//SCNNz0QIhNYzVR3F6
	KLATfoZpgT1UGk09v8aCOxkc0FlzaOi2E+xT/+6lGz8Es9QY+TAfzv00KfXrhzbNlpSkuhelies
	1EqQGPFOoevikm3ssFMWtas4KUxtvZz4jbISBbZ6VQ4scoe8E
X-Received: by 2002:a05:6000:2798:b0:48d:f99d:a0d3 with SMTP id ffacd0b85a97d-4a63b137aa8mr951124f8f.46.1794951703521;
        Tue, 17 Nov 2026 13:41:43 -0800 (PST)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560b5f1sm978391f8f.21.2026.11.17.13.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:41:42 -0800 (PST)
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
	linux-doc@vger.kernel.org
Subject: [PATCH v4 0/4] mtd: point() for cfi_cmdset_0002, on simple maps only
Date: Tue, 17 Nov 2026 21:41:37 +0000
Message-ID: <20261117214141.3826637-1-orgads@gmail.com>
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

Tested on that board with 7.3.4: the mount drops to 0.55-0.6 s, and
an 8 MB file written to the jffs2 partition keeps its md5 across a
reboot. v3 held its md5s across ten 8 MB write/delete rounds on 7.2.9.
The series applies to v7.4-rc1.

One question: a cramfs on AMD flash falls back to the block device
today. After 2/4 it keeps its image pointed while mounted, as it does
on Intel flash, so jffs2 writes to the same chip wait until cramfs is
unmounted. Is that acceptable, or should point() in cfi_cmdset_0002
be opt-in?

Changes in v4:
- 1/4 also gates lpddr, map_ram and map_rom (compile-tested only).
- New 3/4: the per-device map sashiko asked for on v2 and v3.
- Rebased onto v7.4-rc1; Assisted-by dropped (an LLM helped write
  this series).

Earlier changes, in v4 numbering:
- v3: in 2/4, an XIP erase no longer lets a point through either.
- v2: in 2/4, a point no longer suspends an erase in progress; 4/4
  checks the bank width before ioremap().

v3: https://lore.kernel.org/all/20261011062908.2365879-1-orgads@gmail.com/
v2: https://lore.kernel.org/all/20261010180840.2152492-1-orgads@gmail.com/
v1: https://lore.kernel.org/all/20261010172142.2138956-1-orgads@gmail.com/

Orgad Shaneh (4):
  mtd: maps: only point() maps read through the simple accessors
  mtd: cfi_cmdset_0002: implement point() for simple linear maps
  MIPS: Octeon: flash: allocate the map per device
  MIPS: Octeon: flash: use the simple map accessors without a shared eMMC

  Documentation/filesystems/cramfs.rst  |  11 ++-
  arch/mips/cavium-octeon/flash_setup.c |  73 +++++++++++----
  drivers/mtd/chips/cfi_cmdset_0001.c   |   2 +-
  drivers/mtd/chips/cfi_cmdset_0002.c   | 167 +++++++++++++++++++++++++++++++++-
  drivers/mtd/chips/map_ram.c           |   4 +-
  drivers/mtd/chips/map_rom.c           |   6 +-
  drivers/mtd/lpddr/lpddr_cmds.c        |   2 +-
  drivers/mtd/maps/map_funcs.c          |  12 +++
  include/linux/mtd/map.h               |   2 +
  9 files changed, 245 insertions(+), 34 deletions(-)

-- 
2.53.0

