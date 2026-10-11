Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4903E3C68
	for <linux-mips@vger.kernel.org>; Sun, 11 Oct 2026 06:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791700156; cv=none; b=gWY2yK3fD4bWSnoYlStEoCt6a0Mht+UwZKEJzqkwZeKt9Kxxk1C/ilEWKbnS25Ns7G0O2uXWScN9qXElDn08o233/tVQc1cP8Hb5zJ5qxxCkqjKwanjGPBGSXeLAhQpDGYcjNypR6iPpDBRuqVRi/Yw2K9DS5SPX92vn4yRpygg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791700156; c=relaxed/simple;
	bh=hQPw7Rz6rPPRhCmI+3Y3thQk8tt0SOVoHkFwk3e7quM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yp0AazuyCsaH9tNaA/1JcfKujh7GmrK2p8y3/dVoyHpIvg+ZOXlR/3lI7t5LYDWfAGpX6brEMHm/E69YlTr3xao3b7CwintYh73CUh5yvfJVWO0JRn1p1FsoKkbKGVHHPyOJ2MWDWkLz/pESD3I3TBc3v4MTLokd23bHfdWp94Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RCz+usjl; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RCz+usjl"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a01933b584so8505125e9.0
        for <linux-mips@vger.kernel.org>; Sat, 10 Oct 2026 23:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791700151; x=1792304951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J8wJNav0VeCBQbkiLcC1MA8IWAWYLflWAd2k1EXH59I=;
        b=RCz+usjlze0FYil62pDWNsYNv3xyW1n2HzQftE27NNlrj/W/NG0IVDg13Qrg+3hXcl
         LOWuRGpRcrcyQ0MZsXcL3IW2NuvXhBgEVnN+ujWjSKo4jn1V7qaiVoTphYWwnEHMB33S
         ixuHT1pu0/2fwhjrk9q5+ZFAFCFVXSHCaFE/dIM0UmiTnmq+/FAugcThFKI0twa9GkOY
         sBJYYNpi+odvOS5X1ciiP8dTEVon85s/Be9fnHowF95g7UkaNZ9fcff0PRAL+kV2O3YG
         gOeesDk2yV0I4ACjGCMg8dDVZqdqYGPU0ARKzaHXOLz7TC9cYt+aZZ9DX42wNxF4Fxpe
         1n1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791700151; x=1792304951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J8wJNav0VeCBQbkiLcC1MA8IWAWYLflWAd2k1EXH59I=;
        b=iwTPX5kXDBsuYPD0cOt8+otyVLEcbGM92M06RoJqdWRkogVb+B9vB4HiRVMl7RJeIo
         da1n+wQ+w7/H3FcugLQ0Pk1Nn/PosvIA+IQi7PfKYFGyWZdf1l0HpAlk4SQ5QrmKh5S+
         98/Tseuob7fTXXrER1e2zJW7izFzixRs3N1quB909YCzBjjQUiI0mYK8A+gurEkv/d9S
         mb3OfUTVccTMWcb+io5uAGcUn3XoLe9RwQ/V9qvYJPFiUDpQMLuZbr6fJHFyAYqLXvAy
         nNkiwlE0cXn8C+YfXB+YkL/34Dtgy4QN0+q32AuXgrEa3fJsA7fFQ5VbkheA29xilMv4
         ZA0Q==
X-Forwarded-Encrypted: i=1; AKwUvBz9OsWA2SJwUJXGcakY/mftYAUkRW03Nd3a97RM8hkc/Lwd5uTEvPC0NsSXfs5DWOf6UvU2i2ikN0vP@vger.kernel.org
X-Gm-Message-State: AFq9FYKHcMbYmmQEmuw3Out+P/stEY1by2KKsKETb9DQm2iUswLDYcND
	JBoCunu3JmvZ76Yex0lYUvFmDWG8DOkts8r3CcrZU56vtNPjSqa4qey6
X-Gm-Gg: AYBFou11I7+NQ7SKkVkLbldKFFCGY6JWP9prionIh1rml+3d7V7HymJ+sAR4C4x1YnU
	GHBINsfxHTh8fir8ZB7dbZntQ7mXzX3JOa8yYsCOoQ/nCD5HnC1P4e9MHqCBXXvmt17WlZmehl5
	DzXO/zWFZFZnu9H46WrA05GG04lBLX49NF42/aHQgvqwh9GzYuazsMIS49jMU9uHZKngF1SvB2g
	Dh6+FTPLittGH976TDGSW1+spSiDwGnBX+f+e7/J2D4sEfwqVj0ECqXXIUYV8lW89KAZrcQX4Hi
	ecdNiXRF2kFzLuJ0jaaM7kvy4ZD/sgFFOupM0Pqm+PPMHCRWfysVp8hWc+XiLzBEoz71re3TyLg
	FNWNdhgdULha+wekuH3TdxzAmx4akd3vS+DJm+weB70SqHr2NrS3yjc2d0X+oTOOyZmb/+Kw86I
	OzRB3n4X4RBhq7OYAfA6/zTPzlVQVjWN9i4y+7PUH/n2pkPhTaL0tpFOyrNHsQHhf0xBzchh2q5
	FTNF6J+C60TtgYYSL3vNKuuHHALqkZ7763AdjCpPFLZ9SRjZITE9+ttXOgX2Gki6yCkJL7kvxGv
	5K6fdFmo3Jo0xMeg
X-Received: by 2002:a05:600c:e558:20b0:4a1:946c:953f with SMTP id 5b1f17b1804b1-4a1946c9744mr31267535e9.20.1791700151041;
        Sat, 10 Oct 2026 23:29:11 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18f3b43efsm222579135e9.1.2026.10.10.23.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 23:29:10 -0700 (PDT)
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
Subject: [PATCH v3 2/3] mtd: cfi_cmdset_0002: implement point() for simple linear maps
Date: Sun, 11 Oct 2026 06:29:07 +0000
Message-ID: <20261011062908.2365879-3-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011062908.2365879-1-orgads@gmail.com>
References: <20261010172142.2138956-1-orgads@gmail.com>
 <20261011062908.2365879-1-orgads@gmail.com>
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
- A point never suspends an erase; it waits for the erase to finish.
  The erase would otherwise stay suspended for as long as the point
  is held, and the reboot reset with it. The cost: jffs2 also points
  at a data node the first time it checks its CRC
  (check_node_data()), so such a read that meets a garbage-collection
  erase now waits for that sector erase to finish, where mtd_read()
  would have suspended it.

As with cfi_cmdset_0001, a held point makes writes, erases and
mtd_sync() on that chip wait uninterruptibly for the last unpoint, and
system suspend fails with -EAGAIN. That matters for cramfs on MTD
(CONFIG_CRAMFS_MTD), which keeps its whole image pointed while
mounted: before this patch mtd_point() failed on AMD chips and cramfs
fell back to the block device; now, with cramfs and jffs2 on the same
chip, jffs2 writes and garbage collection, flash_erase, and the
mtd_sync() in jffs2's umount - so a shutdown that unmounts jffs2 while
cramfs is still the root - block until cramfs is unmounted.

Name cfi_cmdset_0002 next to cfi_cmdset_0001 in the cramfs
documentation's list of drivers that support point().

On an Octeon CN6635 board with a 100 MB jffs2 partition on an M29EW
(8-bit bus, ~3.4 MB/s reads) the mount drops from 15-30 s to under 1 s.

Assisted-by: LLM
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
Cc: Nicolas Pitre <nico@fluxnic.net>
Cc: David Woodhouse <dwmw2@infradead.org>
---
v3: the same for an XIP erase: FL_XIP_WHILE_ERASING no longer lets a
    point through (sashiko). The changelog states what waiting for
    the erase costs a jffs2 read, and names jffs2's umount mtd_sync()
    rather than sync(2) as what blocks behind a cramfs point.
v2: a point no longer suspends an erase in progress; it waits for
    the erase instead (sashiko).

 Documentation/filesystems/cramfs.rst |  11 +-
 drivers/mtd/chips/cfi_cmdset_0002.c  | 167 ++++++++++++++++++++++++++-
 2 files changed, 168 insertions(+), 10 deletions(-)

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
index bd4f1ed..35e9f8b 100644
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
@@ -922,8 +942,12 @@ static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr
 		return 0;
 
 	case FL_ERASING:
+		/*
+		 * Not for a point: the erase would stay suspended for as
+		 * long as it is held, which for cramfs is the whole mount.
+		 */
 		if (!cfip || !(cfip->EraseSuspend & (0x1|0x2)) ||
-		    !(mode == FL_READY || mode == FL_POINT ||
+		    !(mode == FL_READY ||
 		    (mode == FL_WRITING && (cfip->EraseSuspend & 0x2))))
 			goto sleep;
 
@@ -964,8 +988,9 @@ static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr
 		return 0;
 
 	case FL_XIP_WHILE_ERASING:
-		if (mode != FL_READY && mode != FL_POINT &&
-		    (!cfip || !(cfip->EraseSuspend&2)))
+		/* Not for a point either, see FL_ERASING */
+		if (mode == FL_POINT ||
+		    (mode != FL_READY && (!cfip || !(cfip->EraseSuspend & 2))))
 			goto sleep;
 		chip->oldstate = chip->state;
 		chip->state = FL_READY;
@@ -976,8 +1001,13 @@ static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr
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
@@ -1216,6 +1246,133 @@ do {  \
 
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

