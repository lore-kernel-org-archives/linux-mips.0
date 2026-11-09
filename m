Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.149.156.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187083;
	b=A/qQQ1LNbE/3n+CQ6PnbjxSbXVgYx32aZ1Fgky1rT0pVDKr9ArcKeWx0upfNaXFXn6KB
	 4q/yi7jF1IT6DUcI14FJ03Eic5Pr9nqEdtls85gE7kOW23kwGa6NsOqrGIv0FNsDKaeFT
	 4EF6KCpcRN1ZUXE3LRuMDeOX+yPHp/5+hBMs355a9PEhdmIGd82so1HH7OoOaGmKGVAs/
	 XqFtDmuHp1Fv+ZFxhThvIuu8D2JlhVlsyqqK4s9Sy48k9/OqR6CUuQC3GNjplPHkr3x/v
	 rLiC+dia5uvI0xE2SgQLUe2DO9WOxCzj46qOsmHfMAE1u4gCazLjj71xqbU5Y7vQjRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187083;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-CMAE-Envelope;
	bh=WvG0kClh0TtoSxBVHbwJqxA9jzJi1q8SGW5f3Mvk2Ls=;
	b=IsCG8QfW9CRWVS0OQiAY0VbQlo3ZXfG7+v2DkcXeXoMX4sITVlaDgQYlXyaJuCW5fPKJ
	 OWVPhB24FNpvavMPgSupLjUQnr/GwiQc9B9bLFvP7WITwZKfVevgOIl5Znia0DFSOjuS3
	 UWl2VwoadroBL7MG18tHyAIH3EgT8Einmm8fDvB9bgjeVzBYK1+HFP43xzuCygJ5AeQTB
	 IaVQkpHXmlfkCc2cWvrkZtjpo5lgC+59sIW80VYRkWfxpJi7cqQiMiyzM07R0v/moBR1u
	 vCBc7Sb/KGHpA4nAF/EHaAiVjA8fDmCA5FehsBGEOjoj+gidMyYe+m0pnJGF5XMk4lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mythread.it;
	spf=pass smtp.mailfrom=mythread.it;
	dkim=pass header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=dYBvY+T0;
	arc=none smtp.remote-ip=62.149.156.116
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7663A606A322
	for <linux-mips@vger.kernel.org>; Mon,  9 Nov 2026 01:18:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7663A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mythread.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mythread.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=dYBvY+T0
Received: from [127.0.0.1] ([87.16.49.252])
	by Aruba SMTP with ESMTPSA
	id QE1AxMsH06VShQE1CxPovl; Mon, 09 Nov 2026 02:17:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mythread.it; s=a1;
	t=1794187074; bh=oLRFKUwHbKhCHiC98MhkOwsf0J/5kYlXvF/Sbi45IsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:To;
	b=dYBvY+T0Ccw0OUXRpirWIhT71Cq7XFsrJ7ZowC7wHvN2dWQ81F/K/28uhz0A2QUNX
	 52140I5pdGEIZYaK9jQ5JAyObqiHkEI9zvEaMzMgaFnvWwtQqUYbKy46dq0r5etAxk
	 n/Ic/KkM2HAVD/TG6SHOS2S7sqVqfYHsUV2TuwPMyrxfO7k2SZQuah7lqPX30eeSZy
	 xHq2f4r3f7NSIvfm6W3XS4ynA1wl4xBI6MSr28VXVANp90ILyD46UfORr63xWYkVhU
	 vZWWBM5GFemWu230RiY8liX6CMxNiIXtrlj+17QOmQ7n5iPBXmKrBp8/GV4j2MfVZg
	 XBNmYMSr3TAYA==
From: Alessio Ferri <alessio.ferri@mythread.it>
Date: Mon, 09 Nov 2026 02:17:53 +0100
Subject: [PATCH wireless-next v4 03/10] bcma: pcie2: request HT on
 BCM4352/BCM4360
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-bcma-ac-rev1-v4-3-de1262c18b54@mythread.it>
References: <20261109-bcma-ac-rev1-v4-0-de1262c18b54@mythread.it>
In-Reply-To: <20261109-bcma-ac-rev1-v4-0-de1262c18b54@mythread.it>
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, 
 Michael Buesch <m@bues.ch>
Cc: vit9696 <vit9696@protonmail.com>, ville+git@takio.fi, egc112@msn.com, 
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Alessio Ferri <alessio.ferri@mythread.it>, 
 b43-dev@lists.infradead.org
X-Mailer: b4 0.15.2
X-CMAE-Envelope: MS4xfA0SHnp7/o1kd6yqNJOwxQ9vhGBL4ANMkZqJ/MlRU6NcbLTLJG6wQLJXR978HuYWEYipWWphXGxbozZm8p1w++CcEwuVs3pTkD1lBJ20cKs7x66LY7ZO
 lPPxLcppsYWEvc99HGnRnIC1KkYsC01OvWhZjoF/A16my8XfcvPZtQinQ6hyBPO/54IZ57QV5xdcM4Cs2fG7IUipQQ3UyGsuZ/zSXSby5FILX0qafbbGO0s2
 lJyGypyqM5VPyry4Ig6v819AhE5kzGniuKo+kLbJqeAtozKB6ffkUgvuCRTaLm7+Q7V+5QN4gE2pGL0AGwffg9h0/VoBw3JAKiZjd3Ipe0WVfCgxB1BOh69R
 MRv+wSUc4/Ab1VnwNi7LQ57g0F53Qbmbk2v4s0EvLv29tM00yMnMLi6zhSQy0jWpm9SrVS847vMEtoc9SHjv6a/bgJBL8cz4NnEs/D2REzNpbRwn1oyKCn3F
 ylYWEYsSklBQcXBVXSj93DAHrMOimmP33IBBzA==

Set HAVEHTREQ in the PCIe2 core's clock control on chip revs before 4,
as Broadcom's driver does.

Signed-off-by: Alessio Ferri <alessio.ferri@mythread.it>
---
 drivers/bcma/driver_pcie2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bcma/driver_pcie2.c b/drivers/bcma/driver_pcie2.c
index cf889fc62..54daeaa43 100644
--- a/drivers/bcma/driver_pcie2.c
+++ b/drivers/bcma/driver_pcie2.c
@@ -170,6 +170,9 @@ void bcma_core_pcie2_init(struct bcma_drv_pcie2 *pcie2)
 	case BCMA_CHIP_ID_BCM4360:
 	case BCMA_CHIP_ID_BCM4352:
 		pcie2->reqsize = 1024;
+		if (ci->rev < 4)
+			pcie2_set32(pcie2, BCMA_CLKCTLST,
+				    BCMA_CLKCTLST_HAVEHTREQ);
 		break;
 	default:
 		pcie2->reqsize = 128;

-- 
2.34.1

