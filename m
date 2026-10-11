Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16F63D3D00
	for <linux-mips@vger.kernel.org>; Sun, 11 Oct 2026 06:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791700154; cv=none; b=FhZx7oZlCCpbHU52LCow0cEoGt2EusHOyvG36ygAo563nK06M3W0chzRGVHs+dSYx9isZyZIC7I7hfjGpXBruJCZ+Rt9jrFG+ntOLydnYA+aKNixoqHu55dAh5WYfIc9uRHNYx9IHV65Z5T7kSt/rpOiZFimEkfyRhuk4deqbCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791700154; c=relaxed/simple;
	bh=o4gGH5tyhBW0yVZv3CFpWcbdWHQRb+igsQyior7IF+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c5S97XnSPzLZz/gmQbjzXORHOpF+0/aYT5v5QIme51WiGHXEYIIHAw/LXIJ5+zJ/kXsvk2oMT6lYX5lzdvK+F58DLZiDX3/kBQnsMzCG5Z8AUaCuOGVA88hSeetpXVG/bxBs/yaFSiBnX/L/6OWSoB+1N5nUfQWkwEd6lSPbeNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZtcEtsBI; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZtcEtsBI"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a01933b584so8504945e9.0
        for <linux-mips@vger.kernel.org>; Sat, 10 Oct 2026 23:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791700150; x=1792304950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kBtQan1uSc108PxGt8KEILazDPgl7luxnl4pqbr4mVs=;
        b=ZtcEtsBI9ys3BitPo5Ei3dIl7XW+BHOnZ/enX2hYZYAY+yD4y2xhtqdyLJVk7U7jZB
         ik3IZSGheX4fGjH3Q/z1ZeZNAlJmzG+y9BoSs76RTpZ7A1/Q5VKY/k8sPEd6uvMi856E
         PjQnuMKPRXEQw9RJZcVvLeT13lKyvVO5LxpP24avoRIIbQU2IRzhyMFsbnrMOmRfWeEV
         oYWKISZCQME2oTE/C2SAtXjRXPP34SeJYxZy6diQNzJp990tQGY4Kq4GpdirXrvXRCHt
         GF8Df8L3kKlJgvfUqUnFNw0T/zR4NA6fg0DkQFflDY0hWunI0+XawBfgOxsM1JSBTuyW
         Iq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791700150; x=1792304950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kBtQan1uSc108PxGt8KEILazDPgl7luxnl4pqbr4mVs=;
        b=ARqnFFPyysoCRH9qvVSsNZxM0ItnA+jmB1nt8vA89uqWgdZMN+kJJpb8Ka6s1Vn1Ny
         B0JR/mDz5qkmfMNgf/2BWpBeWRSEVo7XevmWfaVgc298W7N1jH4EIRy2ll6lcxit08N5
         rBnWRDu/2zPgE8AFKL4OI1nRjlslI+HaFpPu3eM5goNuEmea+BapnjN9vnVvP8cG94ij
         MPwO7iNNfYXMgyakIxsvAr+edq0uNvhmrOhzPSM1y+OMZzdCEGfn0oc9WBqS9XJNYQQl
         NofELMgkX5UyoA+Vb22iqlr3BpmULzyJD/pv0L8PL+zWU75nOduOC/JaIgAa3VLLFk2n
         t1dg==
X-Forwarded-Encrypted: i=1; AKwUvBwUbnCeuwd3Vwl1KsKUXv8EqanjLZD42sh9PamrlurYbQfB6YSj0g1qwC8+nddh/Jv2Nug3E55bLWw+@vger.kernel.org
X-Gm-Message-State: AFq9FYJGygWG/BawwR8pCAK19IUWSpOLatQfci+cOq63sifNpil148lm
	KvsdvtlByEfKKxoUEetOP9dOjBqG/JKDCLC58YI9A/FvkDqNYz7Sm3j9+i2jCKELocM=
X-Gm-Gg: AYBFou21d9mb+QxMLcIU/7zvNbWZ11WzFiE1xI1hPSIj1y0b3x3cRVqoML5R3aaqpPH
	XTSGcjh60WMriN+mtU7NWFJMh1zXIOi+Ts/QBufBO0lYbBK8C7g71b7223VBI/mA7ORf/8KCfE0
	M0vrHjQu3x3QBHy/N1or9IQr9GN/8l5rJOCNCdJ39ZaRKrhKu9TN2Q6e3uUPQQ/dIGasUwLq82q
	2JSUFr5JCI/t0y0620jXWwvj+Mn8GhX05j70LwAsCGamuzuOX76Mcd4KZLG8y4pN7PZlz6LMI6G
	nK1ESEf9FHwFf7suZeSbS1GnvFQk+LdcY835A5DWJAo+2QqFJ/6zY58apfg/MEA0LYOutH5FIu9
	kGfghGghTHTsAoCMpHqB8ZQ1cGozbCO8CMKtN/MKzEx3AF8F3y7yZTbftp32QN0qqdYKtJiiNmJ
	zSG55JcIawcuEEykgj2Jf9UEboktSkD8Khw1ZAEyym83mpbphCtmeZMK+3qNw71x0k8cqiVFGMb
	0NASjPFsnQuO8VBCLYaqPFpZXK/j+YF896kjMfE9srDBbQfdSXxTZctgP5RbQzv4hk/DY9wUIOE
	ha7Lf5GNNxXPAJTR
X-Received: by 2002:a05:600c:609b:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4a18e4c9944mr106707295e9.30.1791700149633;
        Sat, 10 Oct 2026 23:29:09 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18f3b43efsm222579135e9.1.2026.10.10.23.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 23:29:09 -0700 (PDT)
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
Subject: [PATCH v3 0/3] mtd: point() for cfi_cmdset_0002, on simple maps only
Date: Sun, 11 Oct 2026 06:29:05 +0000
Message-ID: <20261011062908.2365879-1-orgads@gmail.com>
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

Changes in v3, from sashiko's review of v2:
- 2/3: an XIP erase (FL_XIP_WHILE_ERASING) no longer lets a point
  through either; v2 only covered FL_ERASING.
- 2/3: the changelog now states the cost of that rule: jffs2 points at
  a data node the first time it checks its CRC, so a read that meets a
  garbage-collection erase waits for that sector erase instead of
  suspending it. It also names what really blocks behind a cramfs
  point: jffs2's umount calls mtd_sync(); sync(2) does not reach the
  chip driver.
- Assisted-by in the form Documentation/process/coding-assistants.rst
  now asks for.
- Not changed: sashiko notes that 3/3 keeps the static flash_map,
  which a second probe overwrites, and leaks the mapping when
  do_map_probe() fails. Both are as in mainline today; v2 removed the
  iounmap() v1 added because, with the shared instance, it could unmap
  a registered device's window. Making the map per device would fix
  both, and I can send that separately if wanted.

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

v2: https://lore.kernel.org/all/20261010180840.2152492-1-orgads@gmail.com/
v1: https://lore.kernel.org/all/20261010172142.2138956-1-orgads@gmail.com/

Orgad Shaneh (3):
  mtd: maps: only point() maps read through the simple accessors
  mtd: cfi_cmdset_0002: implement point() for simple linear maps
  MIPS: Octeon: flash: use the simple map accessors without a shared
    eMMC

 Documentation/filesystems/cramfs.rst  |  11 +-
 arch/mips/cavium-octeon/flash_setup.c |  36 +++++-
 drivers/mtd/chips/cfi_cmdset_0001.c   |   2 +-
 drivers/mtd/chips/cfi_cmdset_0002.c   | 167 +++++++++++++++++++++++++-
 drivers/mtd/maps/map_funcs.c          |  12 ++
 include/linux/mtd/map.h               |   2 +
 6 files changed, 214 insertions(+), 16 deletions(-)

-- 
2.53.0

