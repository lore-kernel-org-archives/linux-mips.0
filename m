Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68D6366054
	for <linux-mips@vger.kernel.org>; Sat, 10 Oct 2026 17:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791652910; cv=none; b=jmBhmERzK2eITeL5WNzmlvb/hFaBYVuSt1j5FQrQcgmHQYXM9JSE3UVP+HlaQ/NSJS3pc+cvXsnxmGWOoh3ycA1actgntzkfwC7f+xS17VUNE7bQcx9DPkR0xG1MXlY20j+zHwFjZvy2c99Qk1TxbkefnJb8ALE6deF7IW1w0rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791652910; c=relaxed/simple;
	bh=wmb8RU13DlABWzUQZGDUEkLZ1yZyVA2wCBhjzL8Pzms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PQbc0VCbhT9S1bl4u+QdOKQo66mEC5btEwNw/1WYqTZ/RuUhueNDxU+MYLrFM9oGG42S4X4gq6o2ncjvIBEw/ygpr568H0RH7qRrPBc+PBXiKZ5nO1vgEtMqdmoHQXxCy+nacH0uIWFAucIqXqujLB2yG+/DZRxF7BVBVnh7qJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NsBiVpQ3; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NsBiVpQ3"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4956869750eso5306845e9.2
        for <linux-mips@vger.kernel.org>; Sat, 10 Oct 2026 10:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791652907; x=1792257707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=keoG8XwVgpA6EDDGDJlk3W6Or07o/787lmm8XZwarFg=;
        b=NsBiVpQ36ZvVBUupKIPW1+AsycFnO3tBcUC3mdODQBxo6GnWJwY3PH50MnHEGK4rZ1
         3UKxKe98HfuA2CsDcSJ4e+MQgNnLWM0LikYAqT5od/HssV/4CDNFmDtoehfoPq9blc5G
         4XVm20coTID0eL8x1deeSvub8mfYzuUCOjKw6+a31gaHwmGop6AqQiIf+jxfxPLVr/1o
         GdyHjl9hLSZKysWwVq/wK5gaetOoFUQfKhLV/j0VIuBBCWFjDOJ7fBZ2b76Dduww/9Lw
         uomrFvoEIJG0kEk/91U/GsmK5uBZ0yEb1OI9BJCroGHLkDDIZYLfIbxoUC+oZomT7ytJ
         PiRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791652907; x=1792257707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=keoG8XwVgpA6EDDGDJlk3W6Or07o/787lmm8XZwarFg=;
        b=ZldHfoOLaSC2KpuOjlXnA+UQMKkEznYTV1iYE21XJfst0Y9D3+Hhl7Yf8sXQ6Nx4K8
         s+fikXDpfCLJb3k8PItCV6LGxfA7Qebz8tJUw9shaeeyNRW7n8dzKEksNPWEhaNSGjU+
         oHS/HZb4UQDFSHpqONMmlMmnMz8AuN1ub3E2Pn3/Tjid2zN5mJnE/To6vIdIvUpUZKF/
         zMyfIe5jadJL7in/4Ei4qa353EF3vbkzUk/YSWKIDiyYIRjGzaDByy15VdP/bDyyh7Ln
         3F0NUtYuHSgeZTy2i+CVOZSkAMd2+kQSV6sWMhti4qQGRiVxU6pPEnDbBin57+vYggHE
         hKNQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6wVBJ1WmyfqxwbU7u+0r+vzS2lVFQKXash8UXIWly8/iKmgjPmdBT6Fab9RlYGqvdGjDVCGWx0TFi@vger.kernel.org
X-Gm-Message-State: AFq9FYIwbjZSHnM23EvHSh3ZTVziWsqXGEfcZ6R5GJcVTruBY4yfiTAY
	Iqsr6hLICbcE9AKuRdCP5J8ijxkfaBKK0TmcqOzu03U+TNrxT8lsjgbIXcg0egyTXNU=
X-Gm-Gg: AYBFou2TX9wMZkKhklwymHk2wCHpSrYZ0S1ADn0rUFoN9q4G7QDHG3FdbhhyvmV9Zdz
	d4oAmQnPeE27NEy6UuHFluqW9xNlO7AkTJ2kubr8ig55j0fJx1/S9iA1t48aZQ0gTjS6XfmJqkK
	7vJVsMmTfMzcrFTGRo24T78+nRDiTfbyI834QP5vwG7xYHf3dkPS5k/fmiFY8zPS7JHceXsb1dY
	TiH+cawT5Vq5nHrsJZSr/XXKD2q0pwJUZC7F++VyaI1HQFSvmfQsrBZErotKP4vY+mtrbahHclT
	GYqGALQUOIathX8mLpwQEw58ICLsDkO8NKoBWAHxDLGRHZtnSY/NhyKbDvkyrF30F4In4vRipiG
	Bo3KaZQTLbYDZC2Skn1Gnp9PavC1RWbRUeDtq5nD8DQvDSHK95/yk/f2ntvsezw2G1AwUGF3Y0R
	/MvkkKQcD0Dug6/W6ztjwQsbpTfZkR7DhOae2f0+LkUSWD4s87E5P+7cWMPENsVEAsrB630J8iA
	a+pBIf8s638+mgc6lAp2bN/V36JLg7lF8oFyV92t2vNvmKyBYQ6CjonIbyO69n/f6sQLOuX+GGY
	rJCBl+1iw5KNA7wz/VNb9QWhTJ0=
X-Received: by 2002:a05:600c:46cf:b0:4a1:7e1f:21bc with SMTP id 5b1f17b1804b1-4a18e4d6636mr100564775e9.29.1791652906732;
        Sat, 10 Oct 2026 10:21:46 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c85009csm114159655e9.2.2026.10.10.10.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 10:21:46 -0700 (PDT)
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
Subject: [PATCH 2/3] mtd: cfi_cmdset_0002: implement point() for simple linear maps
Date: Sat, 10 Oct 2026 17:21:41 +0000
Message-ID: <20261010172142.2138956-3-orgads@gmail.com>
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

cfi_cmdset_0001 lets a linearly mapped chip be pointed at, so jffs2 can
scan it in place. cfi_cmdset_0002 never got point(), and the jffs2 mount
on an AMD-style NOR copies every used eraseblock through
map_copy_from() instead.

Add a point()/unpoint() pair modeled on cfi_intelext_point(), entering
array mode with the AMD reset command; get_chip() already handles
FL_POINT. Like cfi_cmdset_0001 it is only enabled for maps that are
linear and read through the simple accessors. Where it differs:

- Points share the chip when no operation is suspended, and the reboot
  reset may proceed from an idle FL_POINT (the chip is already in array
  mode); an unpoint after that reset is not an error. On cfi_cmdset_0001
  a point held across reboot leaves cfi_intelext_reset() waiting
  forever.
- unpoint() releases the chip only when the last reference goes, and
  point() returns the error when nothing could be pointed.

As with cfi_cmdset_0001, a held point makes writes, erases and sync on
that chip wait uninterruptibly for the last unpoint, and system suspend
fails with -EAGAIN. That matters for cramfs on MTD (CONFIG_CRAMFS_MTD),
which keeps its whole image pointed while mounted: before this patch
mtd_point() failed on AMD chips and cramfs fell back to the block
device; now, with cramfs and jffs2 on the same chip, jffs2 writes and
garbage collection, flash_erase, sync(2) - and so reboot(8), which syncs
first - block until cramfs is unmounted. Name cfi_cmdset_0002 next to
cfi_cmdset_0001 in the cramfs documentation's list of drivers that
support point().

On an Octeon CN6635 board with a 100 MB jffs2 partition on an M29EW
(8-bit bus, ~3.4 MB/s reads) the mount drops from 15-30 s to under 1 s.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
Cc: Nicolas Pitre <nico@fluxnic.net>
Cc: David Woodhouse <dwmw2@infradead.org>
---
 Documentation/filesystems/cramfs.rst |  11 +-
 drivers/mtd/chips/cfi_cmdset_0002.c  | 156 ++++++++++++++++++++++++++-
 2 files changed, 160 insertions(+), 7 deletions(-)

diff --git a/Documentation/filesystems/cramfs.rst b/Documentation/filesystems/cramfs.rst
index 221c0bf..7b706c5 100644
--- a/Documentation/filesystems/cramfs.rst
+++ b/Documentation/filesystems/cramfs.rst
@@ -75,11 +75,12 @@ The location of the cramfs image in memory is system dependent. You must
 know the proper physical address where the cramfs image is located and
 configure an MTD device for it. Also, that MTD device must be supported
 by a map driver that implements the "point" method. Examples of such
-MTD drivers are cfi_cmdset_0001 (Intel/Sharp CFI flash) or physmap
-(Flash device in physical memory map). MTD partitions based on such devices
-are fine too. Then that device should be specified with the "mtd:" prefix
-as the mount device argument. For example, to mount the MTD device named
-"fs_partition" on the /mnt directory::
+MTD drivers are cfi_cmdset_0001 (Intel/Sharp CFI flash), cfi_cmdset_0002
+(AMD/Fujitsu CFI flash) or physmap (Flash device in physical memory map).
+MTD partitions based on such devices are fine too. Then that device should
+be specified with the "mtd:" prefix as the mount device argument. For
+example, to mount the MTD device named "fs_partition" on the /mnt
+directory::
 
     $ mount -t cramfs mtd:fs_partition /mnt
 
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index bd4f1ed..67dfa8f 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -63,6 +63,9 @@ enum cfi_quirks {
 };
 
 static int cfi_amdstd_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
+static int cfi_amdstd_point(struct mtd_info *mtd, loff_t from, size_t len,
+			    size_t *retlen, void **virt, resource_size_t *phys);
+static int cfi_amdstd_unpoint(struct mtd_info *mtd, loff_t from, size_t len);
 static int cfi_amdstd_write_words(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
 #if !FORCE_WORD_WRITE
 static int cfi_amdstd_write_buffers(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
@@ -512,6 +515,22 @@ static struct cfi_fixup jedec_fixup_table[] = {
 	{ 0, 0, NULL }
 };
 
+/*
+ * Let jffs2 scan a linearly mapped flash in place, as cfi_cmdset_0001
+ * does: without point() its mount copies every used eraseblock. Only
+ * for maps read through the simple accessors - a pointer bypasses any
+ * byte swapping or bus locking a map driver does in its own.
+ */
+static void fixup_use_point(struct mtd_info *mtd)
+{
+	struct map_info *map = mtd->priv;
+
+	if (!mtd->_point && map_is_linear(map) && map_is_simple(map)) {
+		mtd->_point   = cfi_amdstd_point;
+		mtd->_unpoint = cfi_amdstd_unpoint;
+	}
+}
+
 static struct cfi_fixup fixup_table[] = {
 	/* The CFI vendor ids and the JEDEC vendor IDs appear
 	 * to be common.  It is like the devices id's are as
@@ -519,6 +538,7 @@ static struct cfi_fixup fixup_table[] = {
 	 * we know that is the case.
 	 */
 	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_erase_chip },
+	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_point },
 	{ CFI_MFR_ATMEL, AT49BV6416, fixup_use_atmel_lock },
 	{ 0, 0, NULL }
 };
@@ -976,8 +996,13 @@ static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr
 		return -EIO;
 
 	case FL_POINT:
-		/* Only if there's no operation suspended... */
-		if (mode == FL_READY && chip->oldstate == FL_READY)
+		/*
+		 * Only if there's no operation suspended: the chip is in
+		 * array mode, so reads, further points and the reboot
+		 * reset (which only re-enters array mode) can go ahead.
+		 */
+		if ((mode == FL_READY || mode == FL_POINT ||
+		     mode == FL_SHUTDOWN) && chip->oldstate == FL_READY)
 			return 0;
 		fallthrough;
 	default:
@@ -1216,6 +1241,133 @@ do {  \
 
 #endif
 
+static int do_point_onechip(struct map_info *map, struct flchip *chip,
+			    loff_t adr, size_t len)
+{
+	unsigned long cmd_addr;
+	struct cfi_private *cfi = map->fldrv_priv;
+	int ret;
+
+	adr += chip->start;
+
+	/* Ensure cmd read/writes are aligned. */
+	cmd_addr = adr & ~(map_bankwidth(map) - 1);
+
+	mutex_lock(&chip->mutex);
+	ret = get_chip(map, chip, cmd_addr, FL_POINT);
+	if (!ret) {
+		if (chip->state != FL_POINT && chip->state != FL_READY)
+			map_write(map, CMD(0xf0), cmd_addr);
+
+		chip->state = FL_POINT;
+		chip->ref_point_counter++;
+	}
+	mutex_unlock(&chip->mutex);
+
+	return ret;
+}
+
+static int cfi_amdstd_point(struct mtd_info *mtd, loff_t from, size_t len,
+			    size_t *retlen, void **virt, resource_size_t *phys)
+{
+	struct map_info *map = mtd->priv;
+	struct cfi_private *cfi = map->fldrv_priv;
+	unsigned long ofs, last_end = 0;
+	int chipnum;
+	int ret = -EINVAL;
+
+	if (!map->virt)
+		return -EINVAL;
+
+	/* ofs: offset within the first chip that the first read should start */
+	chipnum = (from >> cfi->chipshift);
+	ofs = from - (chipnum << cfi->chipshift);
+
+	*virt = map->virt + cfi->chips[chipnum].start + ofs;
+	if (phys)
+		*phys = map->phys + cfi->chips[chipnum].start + ofs;
+
+	while (len) {
+		unsigned long thislen;
+
+		if (chipnum >= cfi->numchips)
+			break;
+
+		/* We cannot point across chips that are virtually disjoint */
+		if (!last_end)
+			last_end = cfi->chips[chipnum].start;
+		else if (cfi->chips[chipnum].start != last_end)
+			break;
+
+		if ((len + ofs - 1) >> cfi->chipshift)
+			thislen = (1 << cfi->chipshift) - ofs;
+		else
+			thislen = len;
+
+		ret = do_point_onechip(map, &cfi->chips[chipnum], ofs, thislen);
+		if (ret)
+			break;
+
+		*retlen += thislen;
+		len -= thislen;
+
+		ofs = 0;
+		last_end += 1 << cfi->chipshift;
+		chipnum++;
+	}
+	return *retlen ? 0 : ret;
+}
+
+static int cfi_amdstd_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
+{
+	struct map_info *map = mtd->priv;
+	struct cfi_private *cfi = map->fldrv_priv;
+	unsigned long ofs;
+	int chipnum, err = 0;
+
+	/* ofs: offset within the first chip that the first read should start */
+	chipnum = (from >> cfi->chipshift);
+	ofs = from - (chipnum << cfi->chipshift);
+
+	while (len && !err) {
+		unsigned long thislen;
+		struct flchip *chip;
+
+		if (chipnum >= cfi->numchips)
+			break;
+		chip = &cfi->chips[chipnum];
+
+		if ((len + ofs - 1) >> cfi->chipshift)
+			thislen = (1 << cfi->chipshift) - ofs;
+		else
+			thislen = len;
+
+		mutex_lock(&chip->mutex);
+		if (chip->state == FL_POINT) {
+			/* The last reader resumes whatever the first suspended */
+			if (--chip->ref_point_counter == 0) {
+				chip->state = FL_READY;
+				put_chip(map, chip, chip->start);
+			}
+		} else if (chip->state != FL_SHUTDOWN) {
+			/*
+			 * After the reboot reset nothing is pointed any more;
+			 * ref_point_counter no longer matters there.
+			 */
+			pr_err("%s: Error: unpoint called on non pointed region\n",
+			       map->name);
+			err = -EINVAL;
+		}
+		mutex_unlock(&chip->mutex);
+
+		len -= thislen;
+		ofs = 0;
+		chipnum++;
+	}
+
+	return err;
+}
+
 static inline int do_read_onechip(struct map_info *map, struct flchip *chip, loff_t adr, size_t len, u_char *buf)
 {
 	unsigned long cmd_addr;
-- 
2.53.0

