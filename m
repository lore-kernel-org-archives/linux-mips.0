Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769DD36923B
	for <linux-mips@vger.kernel.org>; Sat, 10 Oct 2026 18:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791655731; cv=none; b=EGxt8aDkuW2y5FDuTTVOTmzOGjmxotVSCxWA46kVuXi35YKbLLNLEZCeqWXXcNd40bIN8rHu7nerV6FQ81wJ8lfjrmmaio5v60AvQrOXkcvgU/oYTl+sZEg5zoVF/5IfMAKGIZCifMjoA39poOyae0G+9UTGD6RFeWi+/f5c/kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791655731; c=relaxed/simple;
	bh=oL1tj+JddJbZs+8aPd84rdl67gDVa6MHL6kZr25xpxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YKnSILkK/+zbvLWcB7V32IbpvHzZzk2pjH9qgSeP664jDRR0X0V5kSEnOSelcpI9O6kYN+y+GgRztbFMhdNjve0Nm62dWLN1R6cnVzhMKPlkf+j8DFZhSWeVItkeZVyb7xUYAoj4pwId1Z3jLNgYL+qtDdNXTtR9k1SbWqpTsyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iofdCH/H; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iofdCH/H"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so678393f8f.1
        for <linux-mips@vger.kernel.org>; Sat, 10 Oct 2026 11:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791655727; x=1792260527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vcqIx5ZHTyVbwnT9JsODmu7/jC4GQuUPl3/Y3jt0FjA=;
        b=iofdCH/HUMXQnJOxcNISjjRKTHpW29ZGoY7UD54wHkq1QlDyfMr70yeEbUWfghhN1m
         V+OyngEWcXKVSSUa2v//HG4kQ/Il3TqXY0bI1GlHUXm77cA9naglRtneyKQse8aXv82K
         QxhX0XANp58IERFWEtpIHmj+U/rQ7qXriLw4xinNDH81uOak7ed9iItlbFPywc7qt6XW
         4FBgF0c084bQ2HwWmpM/U78ECVdGi9BmVuORQI6JUEiN7dE3Z+3Yes+KPZio9Hsjm0Fw
         XFa9nvEkl0E7d2zlpdqAdpyHfdLP39KPxDVNaYX4mk3LDQGQeosuw4fm3OMBNYqVjAx7
         rC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791655727; x=1792260527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vcqIx5ZHTyVbwnT9JsODmu7/jC4GQuUPl3/Y3jt0FjA=;
        b=jUOPg70X5UwrtGKQ2LMdYTcAr3onWCumE8a1iQ+c4ybWJ+loubZ4fBlnxXYlDsxFqY
         37f8cPaMhk87cuRMfCH735UvvvWRxWqCY3eC8R4JgyULKlpGNiFwXdMzKfOgespSsh4r
         z7VJms/kc0vAMI4zagPyndNKBRatXvwcwF4GMPXkBnn6a53RQevlOhC3B3KIztFO8TcJ
         x5WDplQ0wRitnkaU4gy63DpAsdvXYzZei71QqJr9ye9DjelzhAazphy6LwZZ6SuxEHqx
         hYED/vK/pTfi/oP/dSZplkWfoHRHMn6fU8CjQj49Ary2npzTn/rzXqfPksr9z3ztjZ5B
         WCqg==
X-Forwarded-Encrypted: i=1; AKwUvBwIgRQ3DAlXWtS44CWXNYhCujvZPyX0HmHciBxrJUoJZdU7NFpi+1z1pZ+SLhsotSs1oxHSXFtrJDcb@vger.kernel.org
X-Gm-Message-State: AFq9FYIYr3r0vkx/+1NQ/DpHjdWH/SAW6A2yrdXifONVjwx734nZg/Qd
	i6ANLuvB/sR8LQAcMrdaoacOeDkls4Lhu34HnSaWH1oI3r3FUtH3A3Qy
X-Gm-Gg: AYBFou1UJ+gqjPF5RFD2KFdhEVttdi3p/Eo42gXxFl22hQ0SpPKzzRnmpF/bFXGExUT
	/LSC6cU8jqx/tROO4xSgeDjz7Y0/52raM+AnFpZTW4SA/Tx5IlryxvkB9vZMNg7zDNilfx7crYZ
	rbqUQEq4gAW0Q7N/JXznqNgUkjZbHEv3cLUDK6B18LnHEmlWKycfbz7gT4HMlxDvzIguKgI6cU9
	sEa9I9tfun7HU3n3yBDOqQI8snnFjKnz37j3xhRJ56RjkFkRQB5tUn00iDcol5rHZigzegXabkI
	1y9MYuhgXymXyy3apYbcJtWPYTWe/5tGbYwJHuVzSTOHB4MVFe21WL09DXA4J49iHoGHRtmGij5
	64/JtJlfJg4E6Yz8iA5oeluIacENGX9EIJZQiS6FLKltH9uLWVrLVDPfd4zTEp8pYpV/Ka0WEmi
	8jfxFefY54+ZGYkCbXWQr4ahLTFyX2hfHuusug8+TsUVVfcJhmscDdXOKX52FB75AfrSNH3Cxak
	Tt4/MG8TyIM3zvNPa4G6dHiI1oaS2r0tEWyw4ZJhly3uD4rlWgEjzCyr26azX2jIyZoKZBbxtWp
	LZz7IxMXuZrQLqMP
X-Received: by 2002:a05:6000:46c7:b0:488:7dc6:4e9 with SMTP id ffacd0b85a97d-48dbaadd40bmr6536672f8f.10.1791655726559;
        Sat, 10 Oct 2026 11:08:46 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db97ce3aasm10187163f8f.21.2026.10.10.11.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 11:08:45 -0700 (PDT)
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
Subject: [PATCH v2 1/3] mtd: maps: only point() maps read through the simple accessors
Date: Sat, 10 Oct 2026 18:08:38 +0000
Message-ID: <20261010180840.2152492-2-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261010180840.2152492-1-orgads@gmail.com>
References: <20261010172142.2138956-1-orgads@gmail.com>
 <20261010180840.2152492-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
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
- cobalt-flash reads at an offset inside a PCI BAR while leaving phys 0.

cfi_cmdset_0001 hands such pointers to jffs2 today, and the IXP4xx
boards carry Intel StrataFlash. Add map_is_simple(), true when the map
reads through the simple accessors (always true without
CONFIG_MTD_COMPLEX_MAPPINGS, where the accessors are inline), and
require it before enabling point(). Maps with custom accessors fall
back to copying through them; on big-endian IXP4xx, where pointed reads
happened to work, jffs2 mounts get slower.

Fixes: 9d3b5086f6d4 ("mtd: physmap_of_gemini: Handle pin control")
Fixes: 2aba2f2a704d ("mtd: physmap_of: add a hook for Intel IXP4xx flash probing")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Imre Kaloz <kaloz@openwrt.org>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>
Cc: John Crispin <john@phrozen.org>
---
v2: no change.

 drivers/mtd/chips/cfi_cmdset_0001.c |  2 +-
 drivers/mtd/maps/map_funcs.c        | 12 ++++++++++++
 include/linux/mtd/map.h             |  2 ++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index b73596a..3f3364c 100644
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
diff --git a/drivers/mtd/maps/map_funcs.c b/drivers/mtd/maps/map_funcs.c
index 1a4add9..ccf1dbf 100644
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

