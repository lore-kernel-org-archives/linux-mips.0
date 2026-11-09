Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.149.156.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187083;
	b=KndrR4GTxDO2T1fG6mvrFykJS3LipT4fSn3Y61575ANnEhZV7StF+w6UFi6LKQEw07KP
	 H5PMiHxgFvatTPfFCJ0omaycA4lZ4G9DPD9Q3DWgKKYIwErt0B4v2TsJl85GdU67fAnFe
	 /C44vDZaHqfNMVxra/45PL6x9RiWp2hGDscVUwN07HKiKd3oMzfTicpmMqBe8G6LRhpoS
	 q/0paRDQsMPpqPTdZwL/Eo10UZbxYKBCqaNcQZ/XdMRX0vrknjFk3Jn4qFSk5FjamcHdP
	 wbEgTG5+I/ciNbJixb4QTeESZhiy2Ha9p636Pwa3Y5oAYST1m/9o5z4KgWkjX4yBRJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187083;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-CMAE-Envelope;
	bh=4XltKv9j08futEKwreOKMozha5nBa7yYaFGpBttg/Vk=;
	b=AHf8SROfEssW8xzhaH0VGaOkcnmLGe6aZP+dTcSFr+8Nrxr1w0THZsEvQhT28+NWpHUq
	 LGA6DQPWH0GkMRFgzeL2rGJQAicr8VpSlWvMSp8hYO7wJ9Z+uxeNoPYSrI9trY90ZXkrR
	 pcvfWwfX6sqH58nOwT6Pyo88gUuJsc9f52VvRJqP3V+WqRvdmepZCELj8WEHE/pL9eFpS
	 g2PJ22fWpI2XYwh6FgpBxetEhsYzxPqG1zr4WhlMUPjWcWmOFcIaS+aU/LuBgsQSIRc9E
	 KdxPQBNnZy04iC5dKTu7cySTfuIfIDQVhBHgqCLE0ENt76NPACw2vw/IREzky5qwI/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mythread.it;
	spf=pass smtp.mailfrom=mythread.it;
	dkim=pass header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=nNwbng4R;
	arc=none smtp.remote-ip=62.149.156.116
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766DB606A326
	for <linux-mips@vger.kernel.org>; Mon,  9 Nov 2026 01:18:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 766DB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mythread.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mythread.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=nNwbng4R
Received: from [127.0.0.1] ([87.16.49.252])
	by Aruba SMTP with ESMTPSA
	id QE1AxMsH06VShQE1BxPouz; Mon, 09 Nov 2026 02:17:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mythread.it; s=a1;
	t=1794187073; bh=vKCGoYZkyy2tX3DnxdaTcewcIzz4/PetZAI2mHkxFSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:To;
	b=nNwbng4R6q1PjPD6GQyi6wRf8DHOvySEklMuQaLl5LOZclKJF+Fm4IvfyMyYGC92c
	 MeP67BdIeEdtXvHWEJ0ZgsfyIEc13EedhMC9FpN/sD/Ea1CfR0FIz9yFYiMsu1eEWO
	 S2/wDADUKbFnQA78dR05rXUv4rR4MuNC2byHwKEkjAvHVGCK5j+KmOzePF62824vwf
	 /IoBsV9S5YgR/SQ/8YuwhOHj62u56G8cP61ty7lLCZUTdW7AK+zmzLLWgh9mLa8Bhg
	 zg+c1rwCR4lnh6wDUE/uoPpvPb/w43BcjpkBvahWbFHs5cvwkzrmI7GEerQsVCamXL
	 LopXQOO0x5mCw==
From: Alessio Ferri <alessio.ferri@mythread.it>
Date: Mon, 09 Nov 2026 02:17:51 +0100
Subject: [PATCH wireless-next v4 01/10] bcma: core: clear only FORCEHT for
 BCMA_CLKMODE_DYNAMIC
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
Message-Id: <20261109-bcma-ac-rev1-v4-1-de1262c18b54@mythread.it>
References: <20261109-bcma-ac-rev1-v4-0-de1262c18b54@mythread.it>
In-Reply-To: <20261109-bcma-ac-rev1-v4-0-de1262c18b54@mythread.it>
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, 
 Michael Buesch <m@bues.ch>
Cc: vit9696 <vit9696@protonmail.com>, ville+git@takio.fi, egc112@msn.com, 
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Alessio Ferri <alessio.ferri@mythread.it>, 
 b43-dev@lists.infradead.org
X-Mailer: b4 0.15.2
X-CMAE-Envelope: MS4xfEdioDTGY1z/u4GjVMe1mHbLmWpT+rI4H8Xls66NQln3AiF++CcMvxSaaGmsBXk3x4g8Dib6BHu6BK7TnmTEOyW7ehauJEouv8SmkiWXnR8yDAh0bB+l
 EloZ/IAJiS+pl1kaopHIob50iIHTC/gQWIgjGsi2LETExhRM+4Iw4SCq/wC0LddyDFKmHZ1+cC9a7yW1HZgGp/1yMl5U8vhOCUJNDyGRBZVhLbHUNeFzuHa5
 El4XezI2nRw/fKrMcWh6jLOdHOlPh61DGekcC/bMC7HU+xVzJxUEkJhFHncDdWUYTu9ZDKdKoVTiCfIGDOjT4RrpaXx0JVGSUZ4h5ElM/Icp1mpuzk8xrtoL
 lqrk58HMIeGgZOleaDyOXw1A8zY//V541UoWSHJa05W6otiIa2vqQ47zRVXM8GFp6e8/iRuanRLI5ji6BUU/0BWNimWWZaL78D4YfdbOLmR7Op+ESZdUK2Rx
 +AtcAd9UX0hdJ+tOJ0A1x3quhZXaT7BEcnQH7A==

Clear FORCEHT with bcma_mask32() and leave the other CLKCTLST bits as
they are.

Signed-off-by: Alessio Ferri <alessio.ferri@mythread.it>
---
 drivers/bcma/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bcma/core.c b/drivers/bcma/core.c
index 37a5ffe67..f4246689e 100644
--- a/drivers/bcma/core.c
+++ b/drivers/bcma/core.c
@@ -100,7 +100,7 @@ void bcma_core_set_clockmode(struct bcma_device *core,
 			bcma_err(core->bus, "HT force timeout\n");
 		break;
 	case BCMA_CLKMODE_DYNAMIC:
-		bcma_set32(core, BCMA_CLKCTLST, ~BCMA_CLKCTLST_FORCEHT);
+		bcma_mask32(core, BCMA_CLKCTLST, ~BCMA_CLKCTLST_FORCEHT);
 		break;
 	}
 }

-- 
2.34.1

