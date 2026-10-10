Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5583C363C6C
	for <linux-mips@vger.kernel.org>; Sat, 10 Oct 2026 18:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791655726; cv=none; b=ZpfSivEUi1Lx73HaR/IL/5WJs8iSIO/Cbf4R7uM2nJgL7hU03tmPSqRTLGuVVAp9a030GLlHWiAL8FP+rMkx59r4ctoq/d7opWQZCztdS7ll7NmtI4zzD41HpVcaPE++N++lDCojWaqeukt0u5Z/RFkO26LoCp8aJ1ikEXO0Jyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791655726; c=relaxed/simple;
	bh=RGIcDyDx0BJX1dV79kkHkskveBYrqKzj8PwX8+l9R+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D8no06JX7YwRljUG5zVKSWK7mh7odb3GNymc20IljWzcKS+8XEUNcC5gEbPLWH0lHvT6L/ZrXrbp+IWFcTsWQLFhQ9jT3QGJvutqvvbwnudDo6iMcKdtZv0EYf/AT/tlBZz5E7rsW5Vr30Wo1SxaIDOmYyAm1GbDwMwjhdNICHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SpLEwBsP; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SpLEwBsP"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48c02782159so424751f8f.0
        for <linux-mips@vger.kernel.org>; Sat, 10 Oct 2026 11:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791655723; x=1792260523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nqJzHpBsOkwbCuifN5JxVshD70grUK+B6gcyk5nzdLY=;
        b=SpLEwBsPCi2ZTYmSlEtksFMJpHw+qRBo+vgA18TmX2fLppqG1cEz1lGZLMt+TYLfVD
         7FeMJcKODhuQwvIn+TcOD7cYCZCsgMllr1Rwdyq8txTj2gxeMq0JXZrqJ5KSzrxu09QY
         c2noiE02vfd0BvdwwEIWcU46692HWhWI7yGSyESWWfoPZKQVu3m+BtfgSXSnAjPvFh3H
         7ote5duLUdmisK7+63aahJ3YNRO73hQlMQHj2bjbaZGZ3DtxDuUBCmkuBaLQln98JncH
         r296qzMSEk9rVcD4akq7ACFFlfeTUdVEObbNjAHkjyZCC58CAAEBu7dy9bLPosoKccV0
         tdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791655723; x=1792260523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nqJzHpBsOkwbCuifN5JxVshD70grUK+B6gcyk5nzdLY=;
        b=M4bYKrOnA2q7qOHVaWrodKuRU1he4ZVrmWKLH4pv3kaGiGi6dvwI7EEB5PW7UchDJX
         UiN6B0C9oERb+OKdGs5ETOB/yg7WzcMfTOpie76ST7ZcQZib9KATsWH6rNiWSN+YIPUD
         5wqh/E9/gr22MGq75AQ6Ez/uTHowmAOm/KBDsFN7EJr14oFX4USYkMZizY45Cv/OuD46
         hca8vz7zpY/PHhI46BxYhOKfzpcMJZhb+ckUmAXqUF16tQA/i/2WOUs1ZH2T7WH5FblL
         rntc10Lzo9nOD65wzcc5CT7zRRAMH6DGvREbDzlqDB0n61dWfHQ7dAW4Gcdl10YhcvvX
         qQrg==
X-Forwarded-Encrypted: i=1; AKwUvByKU1kZ8Dqc6yKQgYtaZ7li/PkniM7CCHaLbCvH0rI0VgN7r65K1V+ihmK0oO93JBCB1ESsoYa85NxC@vger.kernel.org
X-Gm-Message-State: AFq9FYIKlXv1MCDGFDxEh7NTHOzvOBMF4B8if/6cgNN1WdggntiwyTZh
	W04YGKZgpCTZTOj1Mt+8WJAN/zt9JzBuAYbYvnI3jAAqOHrlvVJqZS/V
X-Gm-Gg: AYBFou19VeXhh2Siur2tXrENrL2wp24LTAGd1Hbj7hAX54tSHSlByscBPlP5Iv8GTsN
	ACh9R1B+XafNMDZqghFyzCnCWJuXe7idHI2MFBr9Xza35Nayz04k0q1UeEooXWRYnfsRk9Vcy9j
	7RBO6TrcN9pjWGeqMzkbw5IIpPpHHqdekNE0SRW5wHWR2Hb33MnH8X1O9w6CBC5VevdsWV1cIBv
	ssNNgQBMCdPVAfEpRPeF3eW+xO9JIJpj/NHLkXhT4iFqO18srs/hegvyIz9eywLC1w+8+mJHKT5
	0ofB7TaPdOR78ggEz4d4VpNP9J8H8haa5l6WCNhcWOhliL83qIU4AceBpyub9z2oEL5pNEVv9fz
	ySJ/X3e8cY2y273cAPjVH59OlruHczmEyo5FDmlhM0AH+cuutmP2K2wXlVFmOkSVmKsQjsu907J
	FTjIeNxADg4dL9s8YHlKfMyD2JUWY2ZuWHbvZH/7qWFDtOqLwk2jrrSK+w4bO1bFypRBIXgGHzc
	eiXsTh9hQOHWnxl5FWiZQwO2lo3ZuPYtiD7c29E3KlCYJZ7aTtsEamjAkVnf/VfO0sb+5Bx9KfW
	gI4wF8tf46mpg2xM
X-Received: by 2002:a05:600c:548e:b0:4a0:1aa0:7cfa with SMTP id 5b1f17b1804b1-4a18e4aa724mr101228615e9.12.1791655723242;
        Sat, 10 Oct 2026 11:08:43 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db97ce3aasm10187163f8f.21.2026.10.10.11.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 11:08:41 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tsbogend@alpha.franken.de
Cc: linux-mtd@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linusw@kernel.org,
	kaloz@openwrt.org,
	ulli.kroll@googlemail.com,
	john@phrozen.org,
	nico@fluxnic.net,
	dwmw2@infradead.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 0/3] mtd: point() for cfi_cmdset_0002, on simple maps only
Date: Sat, 10 Oct 2026 18:08:37 +0000
Message-ID: <20261010180840.2152492-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261010172142.2138956-1-orgads@gmail.com>
References: <20261010172142.2138956-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

jffs2 scans a flash in place through mtd_point() when the chip driver
offers it, and copies every used eraseblock through mtd_read()
otherwise. cfi_cmdset_0002 never had point(), so every jffs2 mount on
an AMD-style NOR copies the whole used area. On an Octeon CN6635 board
with a 100 MB jffs2 partition on an 8-bit M29EW that takes 15-30 s at
every boot.

1/3 tightens the existing gate first. map_is_linear() only checks for
a physical address, so cfi_cmdset_0001 already points at maps whose
own accessors swap bytes (IXP4xx), switch pins (Gemini) or lock the
bus (lantiq). The new map_is_simple() also requires the simple
accessors.

2/3 adds point()/unpoint() to cfi_cmdset_0002 behind the same gate,
modeled on cfi_cmdset_0001, and lists it in the cramfs documentation.

3/3 lets the Octeon flash map use the simple accessors when no eMMC
host shares its boot bus. Without it, 2/3 changes nothing on Octeon.
It builds without 1/3 and 2/3 but only pays off once they are in, so
taking all three through mtd with an ack from Thomas seems simplest.

Tested on that board with 7.2.9: the mount drops to 0.6-0.8 s. The
md5s of the images on the jffs2 partition held across reboots and
across ten 8 MB write/delete rounds. The series applies to v7.3-rc4
and to mtd/next.

Separately, for the MTD maintainers to judge: the write-buffer count
truncation that cfc5ebc9540e ("mtd: cfi_cmdset_0002: cap the
write-buffer chunk at 256 bytes on an x8 device") fixed in
cfi_cmdset_0002 has two siblings. do_write_buffer() in cfi_cmdset_0001
writes CMD(words) and the one in cfi_cmdset_0020 writes
CMD(len / map_bankwidth(map) - 1). On an x8 device CMD() keeps only
the low 8 bits of the count in each device lane, so a write buffer
larger than 256 bytes per device would be programmed with a truncated
count. I have no x8 Intel or ST part to test on, so I have not touched
either; I do not know whether such a part exists.

Changes in v2, all from sashiko's review of v1:
- 2/3: a point no longer suspends an erase in progress. cramfs holds its
  point for the whole mount, so the erase - and the task waiting on it,
  and the reboot reset - would stay suspended until umount.
- 3/3: the bank width is checked before ioremap(), and the iounmap()
  calls v1 added are gone; flash_map is a single static instance, so
  on a second probe they could unmap what the first one registered.
- Not changed: sashiko also asked about writers sleeping
  uninterruptibly behind a long-held point. That is how
  cfi_cmdset_0001 has always behaved, and 2/3 describes the cramfs
  consequence: a cramfs mounted from /dev/mtdblockN on AMD flash
  today falls back to the block device, and after this series it
  takes the direct path, so writes to other partitions of the same
  chip wait until it is unmounted. If you would rather not change
  that, I can make point() in cfi_cmdset_0002 opt-in.

v1: https://lore.kernel.org/all/20261010172142.2138956-1-orgads@gmail.com/

Orgad Shaneh (3):
  mtd: maps: only point() maps read through the simple accessors
  mtd: cfi_cmdset_0002: implement point() for simple linear maps
  MIPS: Octeon: flash: use the simple map accessors without a shared
    eMMC

 Documentation/filesystems/cramfs.rst  |  11 +-
 arch/mips/cavium-octeon/flash_setup.c |  36 +++++-
 drivers/mtd/chips/cfi_cmdset_0001.c   |   2 +-
 drivers/mtd/chips/cfi_cmdset_0002.c   | 162 +++++++++++++++++++++++++-
 drivers/mtd/maps/map_funcs.c          |  12 ++
 include/linux/mtd/map.h               |   2 +
 6 files changed, 211 insertions(+), 14 deletions(-)

-- 
2.53.0

