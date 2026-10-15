Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FCD598C1A
	for <linux-mips@vger.kernel.org>; Thu, 15 Oct 2026 20:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792096272; cv=none; b=b+xuIXeAv9J36j/tHqFo1JX/rsi6nskbBCQjy+1xss2YkFNR9crnCsy673fUDYP+x7xj9cIwNrj23/kcaZHCVyPfaWOrwD0Lyr1SE2mgDfnt6VE0TkVNl3sJUndcKw0BrVRbzfQPh3hY07tE6yQzzT/uN2sUEFBZFGhjs0MYevA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792096272; c=relaxed/simple;
	bh=lxbQ5/ioUInLVRx+yE+3nEiJw2cFSJvFb89VFYTZ8Rc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b8usQNrGIyNT9RghnWH6Yggh1X7odlXy4MXnhcY1xZig0O23YDv2DqT4Qzpvd19aaBpfQdU7q3z5zA124pcEG8MUezEN4Fk1kk4Et4agR0tB9nhqPJc1GZ/xq96jxZ8Lk24QdJ1xLz9th4gCAqbm5X7+TSgqghvpuduf/DScLYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KwYGqggl; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KwYGqggl"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1517bda04a0so4136224c88.0
        for <linux-mips@vger.kernel.org>; Thu, 15 Oct 2026 13:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792096270; x=1792701070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oL+BJV/AvgUD6fnBEkb0OUbDdDNxy3pH+PTZKDhfTUo=;
        b=KwYGqgglOTq+ClQCPyg/H0coyc1+ERH7WQuQcGon7xVAIBwRGL36vtRH6cjSGwD7wg
         KsXG/RnrMU+GcDCCM4HFNoiHED1xZDGRBZaupFh2ZwQO7QsN4DiG7VtyBXsW3F/eGqgS
         hUe/3DF1/L3K9qFyfWrspciGEWnslsiiC6hxl0jU0iyVcc3q0yfAG3SPgy31+AyRPg4U
         5TSd6xkCmbFg7iHpU0Z/bg8mMbPN40CNq00erAp2nvSxhcVxn2NMbqklOqbk6YCvCvuJ
         yqaind2xuxHz4N8IwdRDj/JcDtgOzvY3HjOXYeV+q9LozuHgNKR7TJGU5KiJeYYEI+4b
         k0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792096270; x=1792701070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oL+BJV/AvgUD6fnBEkb0OUbDdDNxy3pH+PTZKDhfTUo=;
        b=LEYsBG88MjP6iSN7VpqRI3V94WTIU4q2cwwylv6VptHljNppkXSRfdvkKm0iljmiGf
         RTyQBuoxQXkMStmCk6Ep5vKniESHQZhaC5/iDqNcIkJhZtHyEyiFM4ckFeF9PFxaSEvQ
         N0ywE+3AXLycocYE+zAkD4t48JJgRZCo9LRYMgJ16iK27oNvkd2HuUwvyACATul0Mgxq
         BFlSrJcKADF12ecGkgUBOniy1m/2nYgo5a7Fb2rp2+4fBRGR06VVK0gbpbbSN31Afo7V
         qtxWT/Li+WmbAIDUeSLg5GurPgOKfWY13Ve2gh6hnVjHUfvyWESNC9IwUER/2XJskBZw
         FdyQ==
X-Gm-Message-State: AFq9FYImw0SpVKukRAbnNey7yX6BDtwtCBV+0gdSBoG/B89EpeYGjGf4
	3ELXH5wD44JAlf3LPYRPuy/18AKfJ9XbG1bcBrIgNUoVmMoB0WcSmzPOzIW3QQ==
X-Gm-Gg: AYBFou2tTxCPl6YGTozvKBYP0Dae4Zz51qBkEintRE2zSD5T8P7h6ehEgUkUnp0jq61
	YwL2I8o6lnwSZnLOPqZVSNKPpDjmSyCIDL0eywPApRY84atFA6vqBRm+NZ2pj9bMLZyTHh7SqRz
	yrCKmpbm+AEtwvFY8NQhezXpsU5pbOT2kEPcrQs55sGAeCvHPSbjor+16QjVptsEfCDuapDJk7m
	qyESo6uJTBNlnrhNcOZv6rbwDQgmJ0Bded7s1BwZ2qtHO1xtg7y6es4SNxw+ui0nzz2Qg0+mIDO
	RNywfH3g3UFM2wbPYyr4WmdJ+NzvT7ESO08ilN5HL9zxzt2+OSfMuAZjxQcYFWfv4znxUzjPEVb
	f30KSPu+bQCa5qJu/SCnUIMaxnWOEsOfFtxpqRWvKI9N9Egh+/5QIJ3yJiOjqbPNoTVCluk6wAe
	Y8PnVyAu6gFXG6Z9y3zgYfr8fzqQ+pPEoAUQB0BnBOZuL3zfT7jyIbh+X5R6gmKP/DoEnwGId7T
	BmUW5pL41x4JqF3QW/u
X-Received: by 2002:a05:701b:2086:20b0:149:1b5b:1f25 with SMTP id a92af1059eb24-16a5adfc081mr27862952c88.15.1792096270067;
        Thu, 15 Oct 2026 13:31:10 -0700 (PDT)
Received: from eldorado (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831996071csm54204c88.9.2026.10.15.13.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 13:31:09 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] MIPS: Cobalt: Include legacy IDE ports in the PCI I/O window
Date: Thu, 15 Oct 2026 13:31:05 -0700
Message-ID: <20261015203107.545047-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Cobalt PCI I/O window starts at 0x1000, excluding the VIA IDE
controller's fixed compatibility-mode ports at 0x170, 0x1f0, 0x376 and
0x3f6. These resources cannot be claimed under the host bridge window.

Since pcibios_enable_device() was converted to pci_enable_resources(),
the unclaimed IDE resources cause device enable to fail with -EINVAL:

  pata_via 0000:00:09.1: BAR 0 [io  0x01f0-0x01f7]: not claimed; can't enable device
  pata_via 0000:00:09.1: probe with driver pata_via failed with error -22

Lower the PCI I/O window start to 0x100 so the fixed IDE resources can
be claimed. Keep the reserved ISA resources below 0x100 outside the PCI
window.

On Qube2, the relevant I/O resources change as follows:

                         Before             After
  Host bridge window     1000-ffffff        0100-ffffff
  IDE BARs 0-3           Outside window     Inside window
  IDE BAR 4 (DMA)        1420-142f          0820-082f

With the fix, both pata_via hosts initialize and the ST380012A 80 GB
hard disk is detected as sda. The MIPS64 kernel reaches a root shell and
passes all eight boot-smoke checks.

Fixes: ae81aad5c2e1 ("MIPS: PCI: Use pci_enable_resources()")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/mips/cobalt/pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/cobalt/pci.c b/arch/mips/cobalt/pci.c
index 85ec9cc31d66..293c02e151d3 100644
--- a/arch/mips/cobalt/pci.c
+++ b/arch/mips/cobalt/pci.c
@@ -24,7 +24,8 @@ static struct resource cobalt_mem_resource = {
 };
 
 static struct resource cobalt_io_resource = {
-	.start	= 0x1000,
+	/* Include legacy IDE ports, but exclude the reserved ISA ports. */
+	.start	= 0x100,
 	.end	= 0xffffffUL,
 	.name	= "PCI I/O",
 	.flags	= IORESOURCE_IO,
-- 
2.53.0

