Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794951709;
	b=xu0ZVoRSJhN+pBOnh0IHuJdKvhe0FKmutbXXBV1u61C1fpNguGUO28PRDG0KC5+lF5gy
	 aeihk6ycn9LPBskOr1pDaa7rpkHHiM/FIiRmDKdoP4Dj2Xq8yXMMDmeCWvcxleFGXBrlu
	 E3yI7q63LhTFbu9v4P5J5/Skp/uNRUU6flkThnHizlEnGGgjZTz8H9WRLziW3RScXQ/pn
	 6UWp5JalifFtuts/7BJpxDxSgllxR6k2Zq5WFONhhbxvOI8L6I8Kn0sAuyT5S98Z0u52e
	 FQBY2FGokcCTVm7rgDWNTrqcsMoxR7xCG3DGJ9p8rTPCKXF0x29STMtk4cKZZLHPGig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794951709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=p9ECy7qx0HTIAGTgptqCz6Ap2mwcl7ltxQWIu4DbPCE=;
	b=xEMw6UVns5sHYseHnvJ0EJAXesCSQ2vocARLTSCmbNbmv/pcgEIRke6hQQSfYpkGIvCs
	 6W81jozxywravbE04/SQ5ehq1rSAaz4m8HUgrxLeLHKU5BWzRA1YyYLfpRVxDnrakeWna
	 z0mUUrni23Wx1Yl2Wi1MutXv6zcAlCbtshmXvkcooU0i9SUTB6QkJFTL3dWQFcwFpgwVA
	 oxn4TLvEs4D/Q8vUghDH6k0lfmBM2AupRkxBumZ/Ca9E9JBzVgZZ0Fq5jEouU/M+VUqSJ
	 nG3NZY19m8w4n9QAIvmoACcXRFV4P62h7Fk7Q34GqmmJa8E8+bGYl/LMxkWfV7ozo2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="My/CjOf6";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3772606A32A
	for <linux-mips@vger.kernel.org>; Tue, 17 Nov 2026 21:41:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3772606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=My/CjOf6
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so119603f8f.0
        for <linux-mips@vger.kernel.org>; Tue, 17 Nov 2026 13:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794951707; x=1795556507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p9ECy7qx0HTIAGTgptqCz6Ap2mwcl7ltxQWIu4DbPCE=;
        b=My/CjOf6O3EmsPbl3iJXFDlFDwa6/KxJrvdmxes7skFzmZEb26r7zKHda0m5P0BF/m
         WX+gVzId0+vIVjz/9SuEBLapfz1jftw10uPHpcHlxRqL9bjS46ADR3/RD0tejwkNtksp
         jrniqQiVbEVAkyxiGzzuml4MNOB7aQAz+zTFetvLYqJw4YmtXts1M3fmacr4S+/0W0qb
         49tZVA0aKUgVKJfIEJMQAjt+nur3WXVltRVgsJgluE01bi4aJcbqGQtoxHdVaRb/ncsy
         qMGca0WDG0gtX6+ZvcX6OFc/JgGgDbKHIhlH9F7YZNPYOpp06CJUDiJPXMxMvdeT3xBS
         D+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794951707; x=1795556507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p9ECy7qx0HTIAGTgptqCz6Ap2mwcl7ltxQWIu4DbPCE=;
        b=MXmhFoLumprOsE98kjuXsExQppj/P5g8yGAtQWuwFt/nKzarH+ZUDvF6CCnLzAz1R7
         ADVXZV3u7lS9/585DHqw1FbuTNrA1gLeqN/athtG5BoGPb4quE8slMu/N3NPCOudQHdA
         g+xnYbShOxs79scedFTTNDUZPtaCZKTRev4dZdiZJvpqjTER/brVoRhmGiWM8PMkKIoG
         gONRjk1+/4l3g72wbMDP/MP7ndJt4qVJvo41yiWm4wPh3TQuAGNmosFeTppSv8JuEzqX
         dfW9LKB15y9CwPz5Zeiex8lcBkRBrhaCSP5RJu+o+lP84TtzxDVYUD0mz2WiZczd2xY0
         ZhBQ==
X-Forwarded-Encrypted: i=1; AL+hErHZRPGF7+3klw3X/zZOeW2ffmEu5sUdll5qDop6BynbrA5bdXBWrJytrATsx9Qz+7bH3m/Fqf2zfvmC@vger.kernel.org
X-Gm-Message-State: APuU4Z8xr4g+qN+ZAMCeT8nhGiXYANYqXb/IzWDY4YO4hN3xl9pd4lyb
	49U2utE3qYOVWTqSVmmUZbnv3mE2qkf6kZCveAVWJXuLDs3RQ2VzMw2T
X-Gm-Gg: AZFdTZeLUyY4wo2ZBhIG+xbkp9P2ZezRRTdtz9usxmn0g1efKkffu5/3MltnZqfyhaK
	3sdR5dYZuQXeRzgeQAgGn+XrfjGocluqn4XOjtivTl54l6mE5+K+7Hj4MSF/L4K53H1enO2tysZ
	MJF5VzNy2W5iIWGwOOh6myD8EZ+d35SIFG1e1JaSGylS3SkjmmWzM+nENlhGBrRqOiwBPFcCAYq
	l4lkbdS6a3R9pDa2PSCWcmAncz+PG8ishZ6BggobcGwe+zuQFMiR82Luze+Yh7L14FGrLvLNG2M
	QeO5HI2d67d7a2e+pVM+IcmolJG0evJGWMwZDdKE6qDnAx1bum/NawhNY4Rp7jh0/Ohf0/wkxCa
	5jFls6Ur6lDlannizxV2WuvdFCl0brmsZteDTaG6bLvmtBZcc4eKVNkVXA9OwZlIY7dP19QSNCl
	IXO/Q4WzruaeGDPdCW9JZj4mxycg/DRs57qhMmNjYLLO6xTDN9K0uN2Uxa/brtsm5uWtdK+6PfA
	GsgL2JSxP4koQlCaWBHx+8TP1Vsp/RuzZkidJJ7HMp4mma0MY/KF0X5oKVSUyXCAVYYHojhxsni
	MwJtyqEZIrpyKtPN41tm938uFLXMBIHyryJ42+aLNtqHzJLOT9aHgBbEvNPvQoeZ7k1jbf0Ktiq
	675WrbRl6eKAz2psbdq0b6wGscqS9hixVK0zpTk6ekmdACzYIrCSLHTK8X5eMsFMxLdD6
X-Received: by 2002:a05:6000:2602:b0:4a2:edb3:5d45 with SMTP id ffacd0b85a97d-4a63ae58033mr1542726f8f.41.1794951706891;
        Tue, 17 Nov 2026 13:41:46 -0800 (PST)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560b5f1sm978391f8f.21.2026.11.17.13.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:41:46 -0800 (PST)
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
Subject: [PATCH v4 2/4] mtd: cfi_cmdset_0002: implement point() for simple linear maps
Date: Tue, 17 Nov 2026 21:41:39 +0000
Message-ID: <20261117214141.3826637-3-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117214141.3826637-1-orgads@gmail.com>
References: <20261117214141.3826637-1-orgads@gmail.com>
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

Signed-off-by: Orgad Shaneh <orgads@gmail.com>
Cc: Nicolas Pitre <nico@fluxnic.net>
Cc: David Woodhouse <dwmw2@infradead.org>
---
v4: rebased onto v7.4-rc1; the Assisted-by tag is dropped (an LLM
    helped write this series).
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
index 100cab9..1fc2709 100644
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
@@ -1215,6 +1245,133 @@ do {  \
 
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

