Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CEA3BFE2D
	for <linux-mips@vger.kernel.org>; Tue, 15 Sep 2026 08:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789460316; cv=none; b=qUgvJiwgX6Yn3iA0DvU412WapoLIXL3n+AQhU2b01oLXxx2fzNrp7IiLqoEYm5Q6fiJGSmaPAttTP4Fi/QS48xqQdEwC6S6e8csAMxC/I/8PE78maJ+UDHRbOHzVClRbb3TXBHvP7lnCJLqko3I/BbuiaZ7hUYiY2EVXg3ZswtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789460316; c=relaxed/simple;
	bh=Nez0wDpWr4G7sk10oIb3kHxb4r5QkjfbUppUPOGjanc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TiJCrtdbdcKdnbRD052NYhuhVS1Ozbi7fR0Mn+pCZjuIpVZvFuSB+AtNGPEmkVeL63T0hSFQjzYFuqpQP/VFbQKzACEP5PHQcxLReQHtwtEmSW2jf6IxH1d+joZSNvUHySTwTBLyAX2l86iwJ1VJzfeaUD6tk8kHf8sqzBp+Pu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b3n+sVwy; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3n+sVwy"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-486955ae01eso3455001f8f.0
        for <linux-mips@vger.kernel.org>; Tue, 15 Sep 2026 01:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789460312; x=1790065112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tvlSd6ocqZwERJFaaEwepp31AKr9wlHPm5bt+In6lRg=;
        b=b3n+sVwylerEC02rYyTEgngwH9klIFo11e8/xUHI33tH9Kq3+H7Wgpyo1VDdbV1QhJ
         LNPJuVrkUT9Jso64ybjP0ED4ReuPpnilRDwrUHlWhTPI4WDQPmAZxLmySRdZw373gsQM
         7TmQC7zF11rWe1sz/wF4nHL9LvTCJEemJmdTcO/TLaMMX1hAvqPYV35N8DIoRuycZ9mu
         lHEubDcJwOz5QReME8CUoghTkqirOvLV/2aYynxa61okPYZ2MDHgBurgnJIFHF1HtgVv
         +Zgr8HpF3lF4AzjYRL0OhhVtOwRu49iZWaLb2bdc5t9NbAmUlRaxcOgF8wQx2nrdIhYe
         NU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789460312; x=1790065112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tvlSd6ocqZwERJFaaEwepp31AKr9wlHPm5bt+In6lRg=;
        b=pjwPeiclFZggIDSgLfb2b9D7Hq9e2L894s+0Qcblh/DYGt0Lh05xr8mhPFI0VYlQ9H
         xZ9zWmzpvW24ZhOht0kjLxCZcfj9VLt/XUXgD9AXBkXPl7RWrlMio2GjAGcrGJKrsBgX
         gBErGybxKTpH6F2d6Us/wMGQBqQqfX0s2I01X/NRY+tdsuVSXEfHRf6b/wXmgNX6Fzm1
         u1D0XvW3zhVk34rodLRB4ZOk0XEn/t58HDSHpw2Raga6rBE3LWumQqUsCO18mwyi83c2
         jUQ+U+sWhx/NzqnmCOAscT/bBoKYzR9VLUrmTnEIWjYfwwU4WnnX/Xr8KdOwlZHm1t/v
         EN9g==
X-Gm-Message-State: AFuF++mJ52JeCIXsgZf4OtRxQZBTRywXe4Ug9N81qNlxp2+1d/1sXMU8
	NFZQItunWtVuIirllJeb0/4QVxy+WwlrydGaf9EIAAVsEm/L1qGMusGp
X-Gm-Gg: AYBFou2JR3Gl8o8n52+nLdCcyM6fDICAb+U4QHHwfbN0obg2me+EScXmc2GIq5D4tYg
	7v7ew6P6+qco9iZtg5e4/nanRGKoD7wvvDGhoofkvP6lWNzN6wZGnOU1UQNszqlHW4p1l273FDh
	Vv9z5sL1vaFmZqAGgOp8rstJd+IAHdwdcpk0twxiDZI3j40Q8NICEkqjPxmBotLHfU3g0nm/BXh
	+PbHP51NQrtVw4uGspbEPNJbymdkokQMoT3sIFk7k5VMpeDR201Ur5NTNrQGKDZzcSLx8Ia0vZK
	k/OQE66TKpsRtyC/D3/hDpE8axNd+5kJAovDIvi4AgkN5DRyuUMEFXTZ9OpB8Z0py5yKuX5VTIQ
	QzQyt7dpwYk2sz9AM28kckQzS2bzlOrd1HJXq9wm3pvU4nzN3MiRwDuEblOa2vAzbWwjJUgvXH2
	TGWvosH1TwKXisQVVEys3Gm0DT7QS2z6a/TwgfoeVs1zltIiPcxBLm/pE9HW7fAFza3ZcYxsjXk
	NE9/iCtkmdCa0BzRyu6n9InViYTdms6iBsCZRSidSYjF8RjyDVo4WS1mI+QV0/0bms3zVMv+4/Y
	cIH7i4TJwom8qkz3
X-Received: by 2002:a05:6000:1ac8:b0:486:f3db:e0f2 with SMTP id ffacd0b85a97d-48702adc271mr7574588f8f.14.1789460312125;
        Tue, 15 Sep 2026 01:18:32 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecfc3sm31341974f8f.4.2026.09.15.01.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:18:31 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] MIPS: Octeon: offer the RedBoot parser when it is modular
Date: Tue, 15 Sep 2026 08:18:25 +0000
Message-ID: <20260915081828.25800-2-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915081828.25800-1-orgads@gmail.com>
References: <20260915081828.25800-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bootbus flash driver lists "RedBoot" among the partition parsers to
try under "#ifdef CONFIG_MTD_REDBOOT_PARTS", so building that parser as
a module drops it from the list and the partitions on such a chip are
never found.

Use IS_ENABLED(), like the USB device-tree fixups in octeon-platform.c.

Untested - I have no board with RedBoot partitions; the change is by
inspection, in the same family as the two above.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
diff --git a/arch/mips/cavium-octeon/flash_setup.c b/arch/mips/cavium-octeon/flash_setup.c
--- a/arch/mips/cavium-octeon/flash_setup.c
+++ b/arch/mips/cavium-octeon/flash_setup.c
@@ -22,7 +22,7 @@ static struct map_info flash_map;
 static struct mtd_info *mymtd;
 static const char *part_probe_types[] = {
 	"cmdlinepart",
-#ifdef CONFIG_MTD_REDBOOT_PARTS
+#if IS_ENABLED(CONFIG_MTD_REDBOOT_PARTS)
 	"RedBoot",
 #endif
 	NULL
-- 
2.47.0
