Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE8130DD22
	for <linux-mips@vger.kernel.org>; Sat, 10 Oct 2026 17:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791652907; cv=none; b=ZXYLCxC8fnub85MARd8gdYeWQ3X6c04OjERmktRq1eG5xV6VYASv7BZOyx0pc2CTc9sts3wSlBcTFatnIeqvWCzty2IuRp2MpnfyvnSL/kCSt/Nsq6u3bBET7csezGv4lMH1CGt9Il43mvsrkSWyBtn28MBC7mlth4/nLsgRyFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791652907; c=relaxed/simple;
	bh=QDzKbGVhT0iQaMhfqVz+PDxyGNf4k2FWJsrJ6MN3ESA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eI4eF9zuNr18pHw8KU5rxJWMr7tvx2145PdWwn3ua3iUGRbKQpbWLhGjKRnkIuA+gG/Xqg2nle1dqJ+zagKdgevmDJFF0nmFP2ikWnhfsFA/fhd2MBq2wqHYpUA9IjI67kMiVhiMwB+9R0mzC1MD6LnpMfq8phyfAEPktmoZ4oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CeKhzGay; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CeKhzGay"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so4654425e9.0
        for <linux-mips@vger.kernel.org>; Sat, 10 Oct 2026 10:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791652904; x=1792257704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qzwaUnI7IRPLhxyFnbCvNhosRBqBfqx+J3GlDpy+vjk=;
        b=CeKhzGay8bytaVTO9QG+Tr7MTkNlzdlqi+kkHgxRSDu6TUX0KJrFb7UMWO9AWQjZBv
         a8RFdVo7nMijv5OhnNVovSeRtdbZHSf070O7H4oZlOPJ8W62exBEub1GPJgywWsmslgv
         TasaKkGRwUc7emRlbR85qzzG+l0NpC9fCRAB14V+vNxXvq0ITW9GVA6QsS/Nf4e08ywC
         xa7PhacFeXheUBhsTH+/G5WaqdTLmz7lJSlo2IWeKR8jt6FP9p8rdtq7m4T66lXYVXKU
         TDeCOSQ06Dy/yGvqtzC8MWIHMg1gUFRzq/w9gL3HgNYBT5xnW0ge6FBE7oKbwFMDAKZ7
         4Z0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791652904; x=1792257704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qzwaUnI7IRPLhxyFnbCvNhosRBqBfqx+J3GlDpy+vjk=;
        b=ewfy1WGrpgkY3F4JiHW5XksTjTLmE/QnrlZJn2SMC5MeQKIA9QsaB5AzhUkwUrViLe
         InMCH7ZJ1aEC9yQLVT+D9fsYxM9kZHXeIfKe2LF+u/Z7fMuoAsg5o+DojCl0ONPI08pt
         H3FxlSbShC44w1PfJ6CKsGU3Zk+axmrhU8KYK+e/eWKrtQf0T0S1Ju96WHwOyxpYRZPf
         xKtcimcO9E7vXIxBvcV493FIRodLBnoNejM0gTOc02jlGfPiBmGgJsQZELwC1mYX9DWl
         C5nvZYSOPU4aZ3dIawuAVczjGZ3DSgu9V+ISXdDwkmitbOU3fvPUiF7t60jSLozznRzL
         X2Kw==
X-Forwarded-Encrypted: i=1; AKwUvBxh00HmM2ReFsv9uBtJt0lcQpY180k+LX+ZHlKWzR7UYM1Czz9ucTdFD/sb7i94fl1tiUWgVQfk0D4s@vger.kernel.org
X-Gm-Message-State: AFq9FYJtDrjP9jqs99bQicnz1hEPISAI12yyAAsTlLUJgNHZzCvAp4sA
	Y1/kX40d+3rTrSKimBbUavoa2z5bnoKKpwF7LYGuTpV5/18kDhHa4n8A
X-Gm-Gg: AYBFou3zPzs4WQpdMrl+WtOHC4bLPRWvh8+xzvUzQSH9Ge6i3AHd5uUrlqTM16fEgFb
	hakUun7sNmdcocSsh83sxbLzMVXmWW2RYON2edAcoPCCgwvO8Rz0BRvdhODxJI8zh0x3v5pFbVq
	ahW+OLSozE/AD5SjTVDiVuQsa6oiwNOl60lJhNnqoITT0Xo9qAutkYZB4jdBHJ3NVZi1/4bpDvt
	/p94lLRWvABjTJeqw3dSR4xMBNYi8jpuS/eYKwDXC3AR3vW6F80rSFWjJXIwwc2whXCuwf7OoR3
	LLmrhyHOH2Z0azUdQYxOQv5NsM0H5oH7zRywVZwdWhmihzZsvNVS52KAOn1WfONxy4G3ffC3Pr5
	afnceyl6k7f5vlUKwHMz/EsqGH4x5WazVJETBysDvi1il74NW/kdPWKtetUZPs6fOnzIHNoWBfg
	f9dcAd8HoetccWoGN02y9s72xoKQ9fzPt25llKQjjrZARyEfeJfikSV/F1pygKganGhrJSjCVm9
	OYhVizIftfqe5QgYInci0LpShhAZLbgkx5jSuKFwzh8bgB9yEvPvt3MPMPhXx/5WbhEBwdwVvTP
	lRZFhZTA7ITLv8Ci
X-Received: by 2002:a05:600c:3e8c:b0:49e:6861:50f7 with SMTP id 5b1f17b1804b1-4a18e49d251mr95380695e9.5.1791652904195;
        Sat, 10 Oct 2026 10:21:44 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c85009csm114159655e9.2.2026.10.10.10.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 10:21:43 -0700 (PDT)
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
Subject: [PATCH 0/3] mtd: point() for cfi_cmdset_0002, on simple maps only
Date: Sat, 10 Oct 2026 17:21:39 +0000
Message-ID: <20261010172142.2138956-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Orgad Shaneh (3):
  mtd: maps: only point() maps read through the simple accessors
  mtd: cfi_cmdset_0002: implement point() for simple linear maps
  MIPS: Octeon: flash: use the simple map accessors without a shared
    eMMC

 Documentation/filesystems/cramfs.rst  |  11 +-
 arch/mips/cavium-octeon/flash_setup.c |  37 +++++-
 drivers/mtd/chips/cfi_cmdset_0001.c   |   2 +-
 drivers/mtd/chips/cfi_cmdset_0002.c   | 156 +++++++++++++++++++++++++-
 drivers/mtd/maps/map_funcs.c          |  12 ++
 include/linux/mtd/map.h               |   2 +
 6 files changed, 207 insertions(+), 13 deletions(-)

--
2.53.0

