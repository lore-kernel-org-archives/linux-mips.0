Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794951707;
	b=304ao2FfYMmQQuFy/4/uRgUzUteUQHX55O+KIjiPYErRQNuiqdOSSPXAcJCQQ7XktwWj
	 iY/UaS0C22x5mfEyiUxDTkJrx7TB6Idx7I2Nyh3/voEUTPCIg9q8Uvo7cPYKvnQvYayZt
	 coZ1eA0atwBBkOtqF/qmht5d7su26tp470U2rJ9dkbN83RmT5Wibawtpk4MItiF5C4Eoz
	 SmuPeN62gNDOJXE3wDqlNq3s81sTyrfrwoGDSR2+5C3ywQTFsPZYw5oizdUmS25iQtd3k
	 XvXZpp9mSCYJv+fKSbqetsPug/rPcKNRCRhH55pDAV/2+OPlZElWEZSOpLvCRcVs5xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794951707;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IzmjFOcyIIyhjknT+4ERxgpCmAjlA22Eb1QRiV9ePjY=;
	b=zDOt7JtE/h9Dzp4MaLOGH/v1FWmEzOkQBDopPnys6Z81DyL+3EfAnIu5j8H0JdJoIAXX
	 1CQ4yqBPG5fUVgK9ha4WmsnOkb1XwytkJC0lOu2eVe9X7FnEIGTVR6h1zhsGCvnrBg0az
	 uNL1NXAYKFfPNE3qnfyieWZn0rwuzUjjHjQI4pZqnaAR+jeMYTIhd/754ezmMq7cDVA5u
	 kfGAb5PKT7F1WKqZrczMDvXgsa35nxILjy/Kq3MpuTueXy1pYfXpR0qp1x2m/HOHGmy28
	 K2lGhxhH1voBK2IU5G7brtKQPa3qioduYLtYKUO1O1WYrFrskedk2y4bzS2c+oSXD7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M39DhCrs;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866EB606A33B
	for <linux-mips@vger.kernel.org>; Tue, 17 Nov 2026 21:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 866EB606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M39DhCrs
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-49d64a88222so904918f8f.1
        for <linux-mips@vger.kernel.org>; Tue, 17 Nov 2026 13:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794951706; x=1795556506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IzmjFOcyIIyhjknT+4ERxgpCmAjlA22Eb1QRiV9ePjY=;
        b=M39DhCrsJqlbj6lD2OWOO8cp9UywRLuQBf+UuxLo24QdzaL7+LsOO6j4q6I9qrQvnc
         fgGOGPZb2yAF0MUj8rN0rIthO5LpFl943/arYBTAiCbEdLwAYRozjcLY6Shr7HqCsov9
         PD+h/0ECwJIODOLcv9NPYSrSfZkih/ZlBGBQt3bxmVOz4a8mUFgdVIbWPeMmRkM3U9kR
         GHZgburFI6H9Kpnkhi7gz37N4I25SXtMcczek9SEgj2M4NE1Gib7EtLq1u5/ds7f5BwX
         fNM0M+DBSrZoZENbS3WYTLLc1oj0rWZKQMh/LneEuDoadVanEtTs38Mtw9ZXekVpHRd7
         VJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794951706; x=1795556506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IzmjFOcyIIyhjknT+4ERxgpCmAjlA22Eb1QRiV9ePjY=;
        b=FlPPwImOW40GyviQjwOjJx9YI2abkmFoKA4kUS7AXtt/3WzcK7zDte+c/KAoV/ePUM
         RPgvgz3h8IHy2pcfjGt2bAHcQm65eKWqdpfoRrpleko7HqN3a8PMVA0LGvXWmRNRvnzF
         8/jdJILvcfACAPbOqsx0Ybtm1FbM43Leb9kiFeoPhJ2ToNY77G0rsnPEbBjXMLDo5tAS
         AnOVsiKhGztP8JZdM4Buv8cRaLFGeerZaZgxlXJuLNKC3VMWtG6ILESpmVg+oDwU7WOH
         CQhRtDECCMU82LlpCkMdqV4OPxWM5b2/Kz5oUTVF3EhXJQZrfxFWXyniUh8f7gbIwBMD
         UIZg==
X-Forwarded-Encrypted: i=1; AL+hErEQUuXBzpt7BHw5EbZ+PcMGpslNOgYtEax6X0f1cYzA/qNtV9Fsmyfc4V4igrU9eBA2o4DuIAvZO2D+@vger.kernel.org
X-Gm-Message-State: APuU4Z/nLhiI62M6B+CJNOy//8WaUwS6DbOIbRSXRjo/pbYG0MT0pXr9
	+lrWGl3gPQI8Rqrev/FIAvPuqULBMSQ/CJUF1sOFQ1WE6siAh+Ldq7l/
X-Gm-Gg: AZFdTZfWKHQGx7Q1emn+PrxfX+3tG9EfCgrBv1gVd9kQlMOV0bSoiPlVhKsOye9PyQ1
	GoLfDDsESQJmD92vMQ5dvoiCicSloMtmjZ/Ir1rSTY0uZ9rWME20Yix7KxaYcnnqRvUPx2LqMcK
	IgNsklx7ZbHYnHehGsnIn6/1uqjr4GFgUcW9POAquFWdsOy//DChS9zzPrP1kD9Fq79FhoB2KD7
	sXaUJvuO5FuS8alNcG3AfA3yaecdCaC+dHH5FbUqjpOgStVFQUyvJHcADN5lxvZN/BNYKRQeCfN
	IkU9syLUIcb/ZeizbU802tTwhmrvEXYX0jbITrHObAyKWKELhFaDYPmCKMLx8SCyTPiIsSxS6GG
	CzJDKv/EhebO18xLVzdCSgmc/MYEfCGZtuBJNJB7PRd2jLVc+o5e05yHpGhVwwA8mBgVN6sE5Hz
	qplUBCGJpefbh65N4IAluENNmxzBdA3I90Nw0fx4azJnSW658FUy+WewDDR5RNQqFMAcBdJlFrm
	1YpD8fUp2PANPc3aCIOuS0JvpAiMMwKeLMUsP8tromib87aYfAfNxdgKXEFQYrzO684SOLTnH9i
	NBe0CVj2V4vt0bLnBwr9sdFCv7rQghtLZQg4knWPlh60BVNEy/t50iMUS5ry9MIC6l072GMiQK9
	MIUyf9AuPDVR1vSl8ZBFzVpWAlxIqDBBcPHzbvRW1KqI4Clk=
X-Received: by 2002:a05:6000:41c2:b0:48e:6651:5956 with SMTP id ffacd0b85a97d-4a36609c994mr8636932f8f.0.1794951705772;
        Tue, 17 Nov 2026 13:41:45 -0800 (PST)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560b5f1sm978391f8f.21.2026.11.17.13.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:41:44 -0800 (PST)
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
Subject: [PATCH v4 1/4] mtd: maps: only point() maps read through the simple accessors
Date: Tue, 17 Nov 2026 21:41:38 +0000
Message-ID: <20261117214141.3826637-2-orgads@gmail.com>
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

map_is_linear() only checks that a map has a physical address. Map
drivers that install their own accessors keep one, and a pointer
bypasses whatever those accessors do:

- physmap's IXP4xx support: the expansion bus only takes 16-bit
  accesses (the reason it cannot use memcpy_fromio()), and on
  little-endian kernels every access also flips address bit 1 and
  swaps bytes;
- physmap's Gemini support enables the flash pins only inside its
  accessors;
- lantiq-flash serializes the external bus against PCI and copies byte
  by byte because the EBU cannot take a prefetching memcpy;
- the cobalt PCI driver's flash map (drivers/media/pci/cobalt/
  cobalt-flash.c) reads at an offset inside a PCI BAR while leaving
  phys 0;
- the Octeon bootbus flash map takes octeon_bootbus_sem in its
  accessors, which a pointed read on an Intel NOR skips.

cfi_cmdset_0001 hands such pointers to jffs2 today, and the IXP4xx
boards carry Intel StrataFlash. lpddr, map_ram and map_rom enable
point() on the same terms (map_rom unconditionally). Add
map_is_simple(), true when the map reads through the simple accessors
(always true without CONFIG_MTD_COMPLEX_MAPPINGS, where the accessors
are inline), and require it in all four before enabling point(). Maps
with custom accessors fall back to copying through them; on big-endian
IXP4xx, where pointed reads happened to work, jffs2 mounts get slower.

Fixes: 9d3b5086f6d4 ("mtd: physmap_of_gemini: Handle pin control")
Fixes: 2aba2f2a704d ("mtd: physmap_of: add a hook for Intel IXP4xx flash probing")
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Imre Kaloz <kaloz@kernel.org>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>
Cc: John Crispin <john@phrozen.org>
---
v4: also gate lpddr, map_ram and map_rom, which point() on the same
    terms; those three are compile-tested only. Rebased onto
    v7.4-rc1; the Assisted-by tag is dropped (an LLM helped write
    this series).
v3: Assisted-by in the documented form.
v2: no change.

 drivers/mtd/chips/cfi_cmdset_0001.c |  2 +-
 drivers/mtd/chips/map_ram.c         |  4 ++--
 drivers/mtd/chips/map_rom.c         |  6 ++++--
 drivers/mtd/lpddr/lpddr_cmds.c      |  2 +-
 drivers/mtd/maps/map_funcs.c        | 12 ++++++++++++
 include/linux/mtd/map.h             |  2 ++
 6 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index e5805ee..42fb042 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -299,7 +299,7 @@ static void fixup_LH28F640BF(struct mtd_info *mtd)
 static void fixup_use_point(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
-	if (!mtd->_point && map_is_linear(map)) {
+	if (!mtd->_point && map_is_linear(map) && map_is_simple(map)) {
 		mtd->_point   = cfi_intelext_point;
 		mtd->_unpoint = cfi_intelext_unpoint;
 	}
diff --git a/drivers/mtd/chips/map_ram.c b/drivers/mtd/chips/map_ram.c
index 2dde70e..77c912f 100644
--- a/drivers/mtd/chips/map_ram.c
+++ b/drivers/mtd/chips/map_ram.c
@@ -74,8 +74,8 @@ static struct mtd_info *map_ram_probe(struct map_info *map)
 	mtd->flags = MTD_CAP_RAM;
 	mtd->writesize = 1;
 
-	/* Disable direct access when NO_XIP is set */
-	if (map->phys != NO_XIP) {
+	/* Disable direct access when NO_XIP is set or the map has its own accessors */
+	if (map->phys != NO_XIP && map_is_simple(map)) {
 		mtd->_point = mapram_point;
 		mtd->_unpoint = mapram_unpoint;
 	}
diff --git a/drivers/mtd/chips/map_rom.c b/drivers/mtd/chips/map_rom.c
index dbc34e8..65daa14 100644
--- a/drivers/mtd/chips/map_rom.c
+++ b/drivers/mtd/chips/map_rom.c
@@ -54,8 +54,10 @@ static struct mtd_info *map_rom_probe(struct map_info *map)
 	mtd->name = map->name;
 	mtd->type = MTD_ROM;
 	mtd->size = map->size;
-	mtd->_point = maprom_point;
-	mtd->_unpoint = maprom_unpoint;
+	if (map_is_simple(map)) {
+		mtd->_point = maprom_point;
+		mtd->_unpoint = maprom_unpoint;
+	}
 	mtd->_read = maprom_read;
 	mtd->_write = maprom_write;
 	mtd->_sync = maprom_nop;
diff --git a/drivers/mtd/lpddr/lpddr_cmds.c b/drivers/mtd/lpddr/lpddr_cmds.c
index a4167ee..23f0550 100644
--- a/drivers/mtd/lpddr/lpddr_cmds.c
+++ b/drivers/mtd/lpddr/lpddr_cmds.c
@@ -57,7 +57,7 @@ struct mtd_info *lpddr_cmdset(struct map_info *map)
 	mtd->_writev = lpddr_writev;
 	mtd->_lock = lpddr_lock;
 	mtd->_unlock = lpddr_unlock;
-	if (map_is_linear(map)) {
+	if (map_is_linear(map) && map_is_simple(map)) {
 		mtd->_point = lpddr_point;
 		mtd->_unpoint = lpddr_unpoint;
 	}
diff --git a/drivers/mtd/maps/map_funcs.c b/drivers/mtd/maps/map_funcs.c
index b005493..5991794 100644
--- a/drivers/mtd/maps/map_funcs.c
+++ b/drivers/mtd/maps/map_funcs.c
@@ -41,5 +41,17 @@ void simple_map_init(struct map_info *map)
 }
 
 EXPORT_SYMBOL(simple_map_init);
+
+/*
+ * True when every access goes through the simple accessors, so a reader
+ * may use map->virt directly; a map with its own accessors (byte swaps,
+ * bus locking, address fixups) must not be pointed at.
+ */
+bool map_is_simple(struct map_info *map)
+{
+	return map->read == simple_map_read &&
+	       map->copy_from == simple_map_copy_from;
+}
+EXPORT_SYMBOL(map_is_simple);
 MODULE_DESCRIPTION("Out-of-line map I/O");
 MODULE_LICENSE("GPL");
diff --git a/include/linux/mtd/map.h b/include/linux/mtd/map.h
index 75b0b2a..ebee3fe 100644
--- a/include/linux/mtd/map.h
+++ b/include/linux/mtd/map.h
@@ -449,6 +449,7 @@ static inline void inline_map_copy_to(struct map_info *map, unsigned long to, co
 #define map_copy_to(map, to, from, len) (map)->copy_to(map, to, from, len)
 
 extern void simple_map_init(struct map_info *);
+bool map_is_simple(struct map_info *map);
 #define map_is_linear(map) (map->phys != NO_XIP)
 
 #else
@@ -460,6 +461,7 @@ extern void simple_map_init(struct map_info *);
 
 #define simple_map_init(map) BUG_ON(!map_bankwidth_supported((map)->bankwidth))
 #define map_is_linear(map) ({ (void)(map); 1; })
+#define map_is_simple(map) ({ (void)(map); 1; })
 
 #endif /* !CONFIG_MTD_COMPLEX_MAPPINGS */
 
-- 
2.53.0

