Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE61A3D6CA6
	for <linux-mips@vger.kernel.org>; Mon,  8 Jun 2026 14:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928901; cv=none; b=o2VowsV1NS1i4pBhtaWgBmGi47KIVgX7BYDrzsreAtjANm3gt+7HEjal2E+o6Gezwat6mc/ewvTOm2TzJWIdun34ijf9nVWT/nDCWF717GGVAAZTd/rLRIQ94B6JGSGeSZxuBl03uR05K8Kha4y8FStsft2f6lPXNsmXoUnWGck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928901; c=relaxed/simple;
	bh=qLq31BYjVwoita8p3VYbMVHsnGBFQquUbQzcOZAQW8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=krNWvNKsPt0WjV6/O0s/BDCTJX4H7LI1SWqVdk/gRi3nK4ZsClGKMh7B15uyYSPEg7giwHJJ0/Bu6RS/ZTKwdSLmpMQbD9+OIqARTzb1WV2gX8A3yxEjGxiQCqFi49OFQ6xdWUkPKg7VPYRMrhsG2Zt1dqlTtsbiwfgPAj2enHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ge3ejgzB; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ge3ejgzB"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45ef1629ff4so2926426f8f.0
        for <linux-mips@vger.kernel.org>; Mon, 08 Jun 2026 07:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780928898; x=1781533698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fx/LUhwU/PuBYtkBp+ygwfhlhplOE7zsRH3troT6KA8=;
        b=Ge3ejgzB/KrAHeBQywsZEmHlINxno9LmmqQONI4R6lU57Mp35QbZF0Gr2RhPU8HGjj
         ag2XqpoTR5/IAkWCwJqsezVXQpLpRXYdSwcslPWqUy/r82yo1uKg2rWBmgXfy9xAjiB8
         mY4eR7KSHK/dQYwORfDxWwWEu0ULugEN0JLy+KmYNwc6rd7HOXFMI5da8m5oUZ8gHSu/
         APmByU6qvSFV1UHpt2JMqgamKfn+2hUJ77DNnYD1eJEzjGAPMdPb505cE/xIXtiQI1Ky
         DmkW/uW0zd7vQ2qMs6+a5LcRUfGeEtoFsr8izMjz+qpyQqoMpb0PskL91sQ7osUXqP6Y
         Yy3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780928898; x=1781533698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fx/LUhwU/PuBYtkBp+ygwfhlhplOE7zsRH3troT6KA8=;
        b=LXJKtPXa41l1VW2yg2DnxbGNWMtWjvIgfbvLYooNhnQHRmAQdkE2CQx2ab1JDRwlTf
         h57f36irG4DC9vJnQpbRhEnjYXWZn+NuWPuAVfMEGheksl6bREcl27IEJ30n/bu6ODCS
         //6MVJ8aGVkrugC0pNorJQpfe5H8agCw+EJuJMn4oQqbpVktRYkPaP6cxN9ACKV72Iun
         panpxFL9SqREEcQwytBmBRHEc9xBxCdwJtv/DGeqfdqWy7wc7kK6zrbxQnIXKTwcweMB
         z8hrFnD+ZknZiYr4ktZrdkAsWe7WXhgc8LAhaFDQg94F9+fr4TYZhbqmsxfBgrKXtRgu
         A+FQ==
X-Gm-Message-State: AOJu0Yzzqpxc/oCWAHRCal1beCf8xbqr22pLF8pLCEfyVKJhQE/nyNu9
	zVSl9dH3wJlMp5DL4zLVwDvLWnzNvHOgKb/cWkgQW1Ikdqg9stijGaGU
X-Gm-Gg: Acq92OFT6jdduAG4Z6ItFfcwnq8pUrZUOqymjQ92S7Bu/RZD1ai94/LuRjtMukoYtBB
	CpQLLLlNNhIzv+L3kPZz10jh6hu6iXJ/eh3soZiTVo+oqw4AgTvvK3Y0UxYDAToDd2LzxP7gKLF
	sQ5iNhkZF22Cbg9tegh0LrdswutIEIKCgjyVinKmWwQ6VvLkQ+BWRvsLV+n596R44iEbG4+HZdt
	kax3byevioVF/sAj5ffiBFVnwuxJnKxxKCLqrfzDuprcCW5KcFTU6RwI0K3rzRrQy6Bwh7TEwzk
	afA7cvnOoHLuy74RVYt/GZGkQg9ReXPZtDQMjtADDPUGSRD+n/xwSELIfsxoOFPfc68QMTVjU/p
	BoaKQBITg1fXYU0jsrRNjO+F1A2LnUZwtXcWaoONqTV1a7Rzw2CwSoBk5aexnTc7bHpGlXFHvgu
	rWxMwOHyoOsfFcYuyWuqLUmOrfgS82wDml
X-Received: by 2002:a5d:4688:0:b0:45e:da9b:97d6 with SMTP id ffacd0b85a97d-4603061e47amr18261428f8f.27.1780928898275;
        Mon, 08 Jun 2026 07:28:18 -0700 (PDT)
Received: from localhost ([94.53.77.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35eae5sm53479588f8f.33.2026.06.08.07.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:28:17 -0700 (PDT)
From: Catalin Iacob <iacobcatalin@gmail.com>
Date: Mon, 08 Jun 2026 17:29:19 +0300
Subject: [PATCH v4 4/5] sh: Remove remaining defconfig reference to the
 pktcdvd driver
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-remove-pktcdvd-references-v4-4-72f88b04cc87@gmail.com>
References: <20260608-remove-pktcdvd-references-v4-0-72f88b04cc87@gmail.com>
In-Reply-To: <20260608-remove-pktcdvd-references-v4-0-72f88b04cc87@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Jens Axboe <axboe@kernel.dk>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-scsi@vger.kernel.org, 
 Catalin Iacob <iacobcatalin@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=686; i=iacobcatalin@gmail.com;
 h=from:subject:message-id; bh=qLq31BYjVwoita8p3VYbMVHsnGBFQquUbQzcOZAQW8k=;
 b=owGbwMvMwCX261qtXAKXKjvjabUkhiy1iwcM25Xkd7+XZ3G9wyYlevnK8Zv9mgt/OF0QYeZ7+
 P0Jb8vnjlIWBjEuBlkxRZYX5663bdhzJuBekl0LzBxWJpAhDFycAjCRzYGMDJ+t787f9PvFqugg
 5uYn71v4UnluLU1gP+LcFD053+vXsV8Mf+WeCd1hD5963TmiXkXBOS3zxWLWM2JmYbsczBx3M8p
 t4wIA
X-Developer-Key: i=iacobcatalin@gmail.com; a=openpgp;
 fpr=F609BFABD84EB5C9DDDC37EDE89C6A3571CD0E33

Commit 1cea5180f2f8 ("block: remove pktcdvd driver") left behind a
CONFIG_CONFIG_CDROM_PKTCDVD reference in defconfigs. Remove it.

Signed-off-by: Catalin Iacob <iacobcatalin@gmail.com>
---
 arch/sh/configs/sh2007_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/sh/configs/sh2007_defconfig b/arch/sh/configs/sh2007_defconfig
index 5d9080499485..f287a41cd38c 100644
--- a/arch/sh/configs/sh2007_defconfig
+++ b/arch/sh/configs/sh2007_defconfig
@@ -45,7 +45,6 @@ CONFIG_NETWORK_SECMARK=y
 CONFIG_NET_PKTGEN=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
-CONFIG_CDROM_PKTCDVD=y
 CONFIG_RAID_ATTRS=y
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y

-- 
2.54.0

