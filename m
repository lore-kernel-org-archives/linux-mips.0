Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.71.155.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681816;
	b=a129i1HMlFnc1MDKVxXR5vbwajpN6tC+QtN2cUWz6fsJvYsE5poUN8WiD4CLwtrF6K2d
	 M118ot4o6FUXuldV0uTTiwRm6tSV/j335TaVwX/49s+Rzb8SdW8A/+mS3MRck70QtV/W6
	 sXVTUXnKEJAim1iE1gXSDub5LkzfD/NzSTQyv2ex6z2WyVVTgoMAIKVqoa2WgqVWmEpjP
	 v4kxhpi0uSFO61/5DXg+r9Se6T6L+VR0tiCkxQ18CRJdXoOJ0FUB9/aI6UAEa1JUGdYGL
	 H7Z+KOGPSjVhTbJtTiNxBJb2GFVtB32ubPZX2omuXjT3Qa98qYTxassVY9l46dbDlgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681816;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=K/thsnu+rWTDu23Pyij3HmH+LXEt/xuuNA2Li8t1Slg=;
	b=pCkLUy0j49Hh7kN2JWvMvP5J6nkH36NuAIaE2Cn1Rgb5YfZJJc59mzlOoXNXWwK6Rx/S
	 URGIGcRxRgbyoAE8SMMctrDBoWPHtFgi/N1vv6MT2j8A9VgXFjKSblQbPuuT/SCtOHatv
	 kVqti2Lhq7go9FreJzmTYE8KrN3isRf7f0gulxNqAv3++G+Hl8KKQOfP3mcOUjnbjwCrI
	 +2QZ/lXNV+A5peKBNK4aWGHXLn0fpbIKtcYwhGzCTTaOV9N1YvrFWkWgHMQUCCyseBmMr
	 06sNQAkKUQ7yzJYJF0FRQkorIHc4d4teXldKMHSgEu5LfoFOhb0mrV7qy4kyK+uqO3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=DwJT9wVp;
	arc=none smtp.remote-ip=101.71.155.101
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797A8606A31C
	for <linux-mips@vger.kernel.org>; Thu, 26 Nov 2026 08:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 797A8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=DwJT9wVp
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 561726a6c;
	Thu, 26 Nov 2026 16:30:12 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: tsbogend@alpha.franken.de,
	ryazanov.s.a@gmail.com
Cc: linux-mips@vger.kernel.org
Subject: [PATCH] MIPS: ath25: Prevent manual unbind of the AR2315 PCI host
Date: Thu, 26 Nov 2026 16:30:11 +0800
Message-ID: <20261126-a35bb25eb5-u35-0@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
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
X-HM-Tid: 0aa216fa00af03a1kunm0f5272703c2fa7
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGB1KVkwdHUJMGB1PTkodQ1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=DwJT9wVpPHh2C11JOPLAyATbu6lj3B/sfMfeHhGxtwpgJtblVI7oDpCqYfDMeQSqX5VutzQwQeCqNmMuTHfkw3gP50Lcb8Zy7WlI7mVjYjfl1o2AHg5iKunUTbXvmRkUQ5qxKzO70/VEZjRYTjVqy4eEY4XUEYpLPSoDYJxIXJ0=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=K/thsnu+rWTDu23Pyij3HmH+LXEt/xuuNA2Li8t1Slg=;
	h=date:mime-version:subject:message-id:from;

The built-in AR2315 host registers a permanent PCI controller and
interrupt cascade. Unbinding the platform driver frees their
device-managed state while both registrations remain live. Suppress the
bind attributes for this board-created host.

This issue was found by our static analysis tool under development.

Fixes: 3ed7a2a702dc ("MIPS: ath25: add AR2315 PCI host controller driver")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 arch/mips/pci/pci-ar2315.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/pci/pci-ar2315.c b/arch/mips/pci/pci-ar2315.c
index f72802e6c29a..9c3293a4ed3b 100644
--- a/arch/mips/pci/pci-ar2315.c
+++ b/arch/mips/pci/pci-ar2315.c
@@ -499,6 +499,7 @@ static struct platform_driver ar2315_pci_driver = {
 	.probe = ar2315_pci_probe,
 	.driver = {
 		.name = "ar2315-pci",
+		.suppress_bind_attrs = true,
 	},
 };
 

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
-- 
2.43.0

