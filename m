Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683553;
	b=SZ0KlaoqFKx5tZd9FslAXR8ZsZZMdE34VbSC0TrYHBRlQ+ZEe+LFgNng8mfwrTFiPwNW
	 ndR7hRNsU08H6bTLu6ku/EQxEH71QPmruJAVXEMMnEd1uMHSrxoRjrijAtl/2vQnJ1pCP
	 9A+aK9W5SBSquvESIFF+IzIXIt2QBunIxG3NTY6AaWDGCBbM2+fAQBgUXYUd5M53GOsy+
	 L2y5bWz/Wqs4/uiUWB7WrxOBzpGqvB24Gdw9G4Y6l2h7HCZ4LFbl1wROOl4rE/VrnUUE1
	 8Hp+FrklJtnDBR/kfl7VDFOJlAtvUIIk6z7SMgVeGPTr21Fjm1I4RD67SCQjuBOtwwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BQs/stfzWfhu5y1o8FnTdxs743T1XzE3knaeJk+HyjM=;
	b=bUIWJZ0Vhw5TgVK4Vwu/4+Tjoa8qKn+6yxUCk0xatvybXToYbaHl3Yc3zPOlHZoGN7Ya
	 +z2MwRTiX2qqjCicXRD6uM9OTaNOIIHrzAT/EbEKooZl7V66bOYLeSOjNJGOfFRbMfB9x
	 PyAZI4iHWqWU932OIaGU0DnNAQ3O7bN0T4GbEJ5PPJvCoSu/RCjR6ryqnyWq+P0sUMxih
	 j8tHDZctlkZDJOl3L/pdDjrmvrzJX+bcGD7PkwI71+K1NoD37RMTA/GwL4Dr3qCcD+UYo
	 uG5Pdnl5F3fyV0nOYQ7ZirgumDV83FC+rKpOgd0BhUGHtJuGrz7NjG2psHFMSFEpjjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JUQEbeul;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA957606A32C
	for <linux-mips@vger.kernel.org>; Thu, 26 Nov 2026 08:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA957606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JUQEbeul
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so56444775e9.2
        for <linux-mips@vger.kernel.org>; Thu, 26 Nov 2026 00:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795683551; x=1796288351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BQs/stfzWfhu5y1o8FnTdxs743T1XzE3knaeJk+HyjM=;
        b=JUQEbeulhtNUELseGh7nQjMfl0lbntVck3/ekLWnZlDxNhN0jsxTisc7f3jApoCRzI
         jTPaiUamqjwJfzwDViNjHt/SHz2nQvLqYUUwZLbbKqkINvBXbXOvDVcJal7m3sFUUP2N
         cyJ2Vieq4dOe/fzJQ+U5GjLE9cj8LgsZzcZSba/B8VvprSvxZv3r26JM/wacr1RepOYu
         fQjCIMp9kBIpms3oHtMWYWBomqtyiUmFJJPsXwbAd4ksz/qunO0OscYTACnDY7fpx0Aq
         PVg0EJ2X1CEEEmgpuBPCHv+n5J8YwYwRg4C/HUDcNfitQSSJGkEuUqiTdkLGeJNlEZB7
         mMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683551; x=1796288351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BQs/stfzWfhu5y1o8FnTdxs743T1XzE3knaeJk+HyjM=;
        b=ThPmX+Gj8SoP+N1ClVSZAVPy6kzUrX+DqUU+tkWM6cagXdv8HlFw9xCT2vmLGlKmF7
         ZcauSS5blHcfCYlIX8XgvHPSrwOD2uZbiHSbctknXxbHe3AAXbZ8tlZFoBulNy3zFqxd
         i2a/SREGH6ESsDh/GvMlclE8K0ee4L/LcS+k8xuMpD3i09N1w1GWT1ZshfryTAehklNu
         BQxXjlpTHSFJhLQPCQlTLdAkLKmnJTnd4WYyV6KQUlXQ7vZUoSrEEaiGW5VzQLtcf0pR
         MB/aiwyWD71fjDx2Apysgl3ErAgveqVjLB628f2ttGeDny19qlM2V7Vw9JX8ZqsGHwLw
         ii2w==
X-Forwarded-Encrypted: i=1; AL+hErHmvask2of8MoXSNZmlQwZGbKPGQjE4nmOEP27bgAkRVkcISMHp6gqwIv49Wk0HzOzZWUJ4gspaNtMM@vger.kernel.org
X-Gm-Message-State: APuU4Z/N7eJyHuzTRyqUxxj0O9jST0JYNkURnHAQ2pQ8REHIriKWHSHs
	0NHkTCiG/+/bf45TIRZFzFe+pQhmOEEVS7+YJvtA4OWETMRxctq8i40+
X-Gm-Gg: AZFdTZeI/aabw5egs7IwJ9rhUX962XFhHdtrVCM+KMlc4CmLEFYwakkTDHRvwY5MFbl
	vixLq5+SD01AGCn1FjUC1gn1NZ9Qva9XqSwetA+LgMNFtTIDT4bwFSmG2e6+Ef3gwzMApFeSzMu
	/a5f/iQ64H2hrBWoWvlM4fOKl1l5DciDDYinWDR1TjZimb1ZuPjc0kLQgpab2XhHs5shTh/cCsN
	0huRAgEDn+5y1vkw654DwyB2JOiGzD7TiQjdq6N75vxU7oENSglkxPYLmmIMiEDXBBl8cKFt80H
	BYp0g4z5BN6kudw6LAfQDcLm6jmpa9QkBikl8t9PfakGytG4LF4W1Q9/tTmkli5haxOyGKNP5Sc
	3U/L3B+4cn7jgavyDjOs5q8fT1wlsu+I761aL6QoKkd3MhpPuULzfsFqkchSsrGjApr27uCsUyA
	ARegrOMoXi5j7iwPCf0gBorZcTjz65Gwr3JIROZA2wdrLmlMlO38Oo0akYbizUH0LDTlROTuxUl
	ht9qrTaX7ei55dJ5TqrbyrO72HkbuAxZaziHb0v5BSEtNBAHGfQCe89ZE8sYT5xx28HtcSshomn
	JpCzhkUCtZJV8ijDCa1O7mxF9KmACmCDFMG37hxFj5YFFa74ltACAA==
X-Received: by 2002:a05:600c:3b8a:b0:4ba:761:c0c5 with SMTP id 5b1f17b1804b1-4bb8880f0e0mr415128395e9.5.1795683550926;
        Thu, 26 Nov 2026 00:59:10 -0800 (PST)
Received: from center.. ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm40313744f8f.58.2026.11.26.00.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:59:10 -0800 (PST)
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
Subject: [PATCH v5 2/4] mtd: cfi_cmdset_0002: implement point() for simple linear maps
Date: Thu, 26 Nov 2026 08:59:04 +0000
Message-ID: <20261126085906.814373-3-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126085906.814373-1-orgads@gmail.com>
References: <20261126085906.814373-1-orgads@gmail.com>
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

cfi_cmdset_0001 lets a linearly mapped chip be pointed at, so jffs2 can
scan it in place. cfi_cmdset_0002 never got point(), and the jffs2 mount
on an AMD-style NOR copies every used eraseblock through
map_copy_from() instead.

Add a point()/unpoint() pair modeled on cfi_intelext_point(), entering
array mode with the AMD reset command; get_chip() has an FL_POINT case
already, adjusted below. Like cfi_cmdset_0001 it is only enabled for
maps that are linear and read through the simple accessors. Where it
differs:

- Points share the chip when no operation is suspended, and the reboot
  reset may proceed from an idle FL_POINT (the chip is already in array
  mode); an unpoint after that reset is not an error. On cfi_cmdset_0001
  a point held across reboot leaves cfi_intelext_reset() waiting
  forever.
- unpoint() releases the chip only when the last reference goes, and
  point() returns the error when nothing could be pointed.
- A point never suspends an erase; it waits for the erase to finish.
  The erase would otherwise stay suspended for as long as the point
  is held, and the reboot reset with it. The cost: a point that meets
  an erase waits for that sector erase to finish, where mtd_read()
  would have suspended it. jffs2 points in its mount scan, in
  jffs2_block_check_erase() and, the first time it checks the CRC of
  a data node, in check_node_data().

As with cfi_cmdset_0001, a held point makes writes, erases, lock and
OTP operations and mtd_sync() on that chip wait uninterruptibly for
the last unpoint, and system suspend fails with -EAGAIN. That matters
for cramfs on MTD (CONFIG_CRAMFS_MTD), which keeps its whole image
pointed while mounted: before this patch mtd_point() failed on AMD
chips and cramfs fell back to the block device; now, with cramfs and
jffs2 on the same chip, jffs2 writes and garbage collection,
flash_erase, and the mtd_sync() in jffs2's umount - so a shutdown that
unmounts jffs2 while cramfs is still the root - block until cramfs is
unmounted.

Name cfi_cmdset_0002 next to cfi_cmdset_0001 in the cramfs
documentation's list of drivers that support point().

On an Octeon CN6635 board with a 100 MB jffs2 partition on an M29EW
(8-bit bus, ~3.4 MB/s reads) the mount drops from 15-30 s to under 1 s.
A pointer is not faster for everything: jffs2's CRC check of a file's
data on its first read runs crc32() a byte at a time over the
uncached flash, and drops from 3.37 MB/s through map_copy_from() to
2.77 MB/s (13.8 s to 16.8 s for a 46.6 MB file).

Signed-off-by: Orgad Shaneh <orgads@gmail.com>
Cc: Nicolas Pitre <nico@fluxnic.net>
Cc: David Woodhouse <dwmw2@infradead.org>
---
v5: return no pointer when nothing could be pointed; v4 left *virt
    set on an error, and jffs2 would scan through it (sashiko).
    The changelog also states the slower first CRC check of jffs2
    data and that lock and OTP operations wait for an unpoint; a
    stale comment in cfi_amdstd_unpoint() is fixed.
v4: rebased onto v7.4-rc1; the Assisted-by tag is dropped (an LLM
    helped write this series).
v3: the same for an XIP erase: FL_XIP_WHILE_ERASING no longer lets a
    point through (sashiko). The changelog states what waiting for
    the erase costs a jffs2 read, and names jffs2's umount mtd_sync()
    rather than sync(2) as what blocks behind a cramfs point.
v2: a point no longer suspends an erase in progress; it waits for
    the erase instead (sashiko).


 Documentation/filesystems/cramfs.rst |  11 +-
 drivers/mtd/chips/cfi_cmdset_0002.c  | 174 ++++++++++++++++++++++++++-
 2 files changed, 175 insertions(+), 10 deletions(-)

diff --git a/Documentation/filesystems/cramfs.rst b/Documentation/filesystems/cramfs.rst
index 221c0bf91..7b706c503 100644
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
index 100cab95a..5b5a7811e 100644
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
@@ -511,6 +514,22 @@ static struct cfi_fixup jedec_fixup_table[] = {
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
@@ -518,6 +537,7 @@ static struct cfi_fixup fixup_table[] = {
 	 * we know that is the case.
 	 */
 	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_erase_chip },
+	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_point },
 	{ CFI_MFR_ATMEL, AT49BV6416, fixup_use_atmel_lock },
 	{ 0, 0, NULL }
 };
@@ -921,8 +941,12 @@ static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr
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
 
@@ -963,8 +987,9 @@ static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr
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
@@ -975,8 +1000,13 @@ static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr
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
@@ -1215,6 +1245,140 @@ do {  \
 
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
+	if (*retlen)
+		return 0;
+
+	/* Nothing pointed: leave no pointer for a caller to read through */
+	*virt = NULL;
+	if (phys)
+		*phys = 0;
+	return ret;
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
+			/* The last unpoint returns the chip to FL_READY */
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

