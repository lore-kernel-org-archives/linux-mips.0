Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B8F3E4C64
	for <linux-mips@vger.kernel.org>; Mon, 20 Jul 2026 14:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784557548; cv=none; b=Gj3xjuyAI0GT78K7mX5UdMjRFbF60ghdyFmddpPoHj+3wzYnbI64wG6LNWpV70ezDubPGwX+U7oWIeow3itHkp6USXBk8AdgxUTJQMwDz1vMRkafjlG/xg67ND10mVnCMEJNnWLkkbu6SxeBs2zrqbrx82MwVWdbj9V3RIQOMJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784557548; c=relaxed/simple;
	bh=/RfTADsW12Id5ZIFtR4N+8sBBIRRaNwpklsrtw2m+Vw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EMfay2eJwGKl6usL2VIT35FITwQVGjaGnZYT0Mgb9i7ip6LsiGqK4S58lNblsWymTL6Tc0CJSrqz4Ivxwbpraz7zcZQhx0gy3Z8pVkTOYznAcliK9Z8G5dRRqyh9xUcR1sCNEshmNheARpuMxks8qS9/orj06jlobVkTzBZZUqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZUWAcCD; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZUWAcCD"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4955de8797cso6394005e9.3
        for <linux-mips@vger.kernel.org>; Mon, 20 Jul 2026 07:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784557545; x=1785162345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6RW4TYKmMYXfGYOoT15J2gseVEyM5W49p7Cq6vVyAMU=;
        b=dZUWAcCDWq3bidtBDwRTmUg2ANYp0tZAIh3/gMAtFqWuxWW14sPlfjz3nzR751+vAx
         ehSK6yvd+UNhPkBOMP8P4HUAy5jJeSezUYIl77A+EfpZXOcFgOzONGS240CbXtD0uufH
         IH0YE6zyWb4fiBIHnbqoL2E4zLymFf4xuLeZBX1zgklMcMRxahRs+VhUtTnzRNalnSVr
         aW6ZqGAeeGQTapkXsSQHEXCMKYbBQ/TTCOqXQZ4xQbJsC/ihOcZeeUUcFS7Yq+PAKeoT
         0olapTOQ6T97gLI5hIat8+Ps2aWir98IYIWl8UGyAtbP7ZrsxQkW/BDcB2EnGN0KMHny
         FBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784557545; x=1785162345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6RW4TYKmMYXfGYOoT15J2gseVEyM5W49p7Cq6vVyAMU=;
        b=QiyIXpXgaSFjAIqjVzrreJT6lDEwPsKgKAfMxPKgdI+KlQqHn2fjnYU3jQvvSb5Mbo
         eoRSC92Dk+u+I+A9wkkuzf4JLA3C5csC5hSIWQd0G9Mscy1wkbfm82rlejY3VNJ7a8Nx
         ItL++idNsqkcJstT32PbZSvUCjOUV7o2xIJNSv8CBAmO7QaTnr/USYUMDwqY07r8P/pt
         X9Y49a+ajAWHSF8EVVlzBxvVZhqD6JW3iPN57xq1nr5ICPZbVEYwmrzwRDeSTFI6DEM+
         Vsb2+ULoAlakzScm9/86k8KXoOEfIMjM/Vn2G4lVzM6V40ZyRCMe/aBSyc5513bt0tiY
         DelQ==
X-Forwarded-Encrypted: i=1; AHgh+RpnYX9p6Z+X3z86lvKI5r9z2FcQRSHpQqUKAD0X+UNp1QC5h+W/I4vTWSHuJY9N/j4m0ijfg2/5wzYt@vger.kernel.org
X-Gm-Message-State: AOJu0YzIkh2+giMdLJRvLIe+7VPNu6sAhcOwdQspy/lukP411YovS6ys
	pV2SsmGZmY2+d08rS8LqzYo/fpHiZ+3bd61hhXjTkzsluub1iaGiM9TQag9L2w==
X-Gm-Gg: AfdE7cldb517VKDL7V/Vw4tyjCD6UbHb6CexSyjBQCQ3q/+8dM4HElOKpX7bzg3yQ8I
	ze0LrZPtoJ7SVHndw/qKmmdanC9mNUvRyllu0fjHjVzwm6ufn31eTjNeHr2bIByvbtFWWBYv87h
	k0fsA5ofPbPdgrqjMqMZeC+n1O+aJMXC6HyL/L2ZtNTCN7gNNATfjqdJM5UkipcR1wc4lRPrBex
	4c1ir+uMk1RRnQZfIzx8dF06h9L/JZBzW7RWb/kw/im86CqFhSkXcRaoahYpOw2iFyCDc57hs87
	2oimiBuWiqAGKiONWdjgWflZIMoBkdW7OR2Zr8tSI3RtkCMsCaKVu3CwL3t4tW9g9/9/8CeJdBg
	MKerRI4vZ3iUXwnMX7v8d/axbODPD9J3xNKLitMUnasp2NX/F/57WoVGD48iLDgELKsqT/s7/Ii
	EzVCaWk3x3frSv4Ueq9ieFo6w=
X-Received: by 2002:a05:600c:a010:b0:495:5365:c0d2 with SMTP id 5b1f17b1804b1-4955365c1d0mr110673245e9.14.1784557545214;
        Mon, 20 Jul 2026 07:25:45 -0700 (PDT)
Received: from localhost.localdomain ([72.255.58.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49548e0fcdbsm242840465e9.2.2026.07.20.07.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:25:44 -0700 (PDT)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: Keguang Zhang <keguang.zhang@gmail.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	linux-mips@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Subject: [PATCH] dmaengine: loongson1-apb-dma: fix residue calculation for queued descriptors
Date: Mon, 20 Jul 2026 14:25:38 +0000
Message-ID: <20260720142538.2766-1-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ls1x_dma_tx_status() locates the descriptor actively being processed by
walking the LLI list and comparing the hardware reported next descriptor
pointer against each element's next-descriptor pointer.

A list_for_each_entry macro is used in the comparison phase, which
internally expands to the container_of macro to find the current
ls1x_dma_lli's next-descriptor pointer to compare against. However a
problem occurs when the loop reaches the final lli list element and wraps
around to the head. The head is a different struct ls1x_dma_desc. It goes
down to the offset the node member would be at in ls1x_dma_lli inside of
ls1x_dma_desc.

This leaves the lli pointer somewhere inside of ls1x_dma_desc at the end
of the loop. The subsequent phys debug value read therefore would print
garbage as a valid phys address.

The primary bug occurs in the residue calculation list_for_each_entry_from
macro. The lli pointer still points to somewhere inside of ls1x_dma_desc,
when the list_for_each_entry_from performs the same wrong offset
calculation on ls1x_dma_desc to determine the stop condition of the loop,
it lands at the same offset that lli pointer is on, and the loop
immediately stops.

This produces a 0 residue value, while it should be the entire length of
the lli list chain. The driver advertises DMA_RESIDUE_GRANULARITY_SEGMENT,
so a 0 residue would mean the transfer has completed.

Found by the following Coccinelle check:

  scripts/coccinelle/iterators/use_after_iter.cocci

  drivers/dma/loongson/loongson1-apb-dma.c:461:6-9: ERROR: invalid
  reference to the index variable of the iterator on line 450

Note the check still reports this line after the fix; the remaining use
is safe (the cursor is only dereferenced on the match path, or reset to
the first entry otherwise).

I did not see a bug upstream detailing this error, nor do I have the
hardware to confirm this bug or error, all this is from a pure code
examination.

As I do not possess the hardware, I cannot test the patch. Compile tested
only with mips64-linux-gnu-gcc.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 drivers/dma/loongson/loongson1-apb-dma.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/loongson/loongson1-apb-dma.c b/drivers/dma/loongson/loongson1-apb-dma.c
index 89786cbd20ab..8bb6e6e5719d 100644
--- a/drivers/dma/loongson/loongson1-apb-dma.c
+++ b/drivers/dma/loongson/loongson1-apb-dma.c
@@ -439,6 +439,7 @@ static enum dma_status ls1x_dma_tx_status(struct dma_chan *dchan,
 			struct ls1x_dma_desc *desc = to_ls1x_dma_desc(vd);
 			struct ls1x_dma_lli *lli;
 			dma_addr_t next_phys;
+			bool found = false;
 
 			/* get the current lli */
 			if (ls1x_dma_query(chan, &chan->curr_lli->phys))
@@ -447,11 +448,17 @@ static enum dma_status ls1x_dma_tx_status(struct dma_chan *dchan,
 			/* locate the current lli */
 			next_phys = chan->curr_lli->hw[LS1X_DMADESC_NEXT];
 			list_for_each_entry(lli, &desc->lli_list, node)
-				if (lli->hw[LS1X_DMADESC_NEXT] == next_phys)
+				if (lli->hw[LS1X_DMADESC_NEXT] == next_phys) {
+					found = true;
 					break;
-
-			dev_dbg(chan2dev(dchan), "current lli_phys=%pad",
-				&lli->phys);
+				}
+
+			if (!found)
+				lli = list_first_entry(&desc->lli_list,
+						       struct ls1x_dma_lli, node);
+			else
+				dev_dbg(chan2dev(dchan), "current lli_phys=%pad",
+					&lli->phys);
 
 			/* count the residues */
 			list_for_each_entry_from(lli, &desc->lli_list, node)
-- 
2.54.0

