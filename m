Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.149.156.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793438138;
	b=jT9O0Utks1rt6VlyAQV3aLv+BGZyAncus1Ao3BL7wvgH2Qwnoeq0jUevYCUrvbPqwsfE
	 LxoLR733sOrepf6YwSAixoqepQpjWsJ7IXFoqUa6eNCechwfJdPlqIHzgMEkDqf0kZxsN
	 9FA+/G86zlwm3ozw0b5TrZPUm3cnhPhL/Ie3iOfyIabtZJtMzwRACea1Qin8j/5KpBy+n
	 pJ1frYFulGc7VknQoA1C/Yg1bXIIuNcuVkO1Rz0yP5qfe/SaOCxn7Tzum9sCR5UZUClw8
	 fmtO/y+FtS67MCUc/18stBD+ptChJtibxylNZo4Gc9jxJaHNp1iRrsZDRQ18TOrhwsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793438138;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-CMAE-Envelope;
	bh=4XltKv9j08futEKwreOKMozha5nBa7yYaFGpBttg/Vk=;
	b=KZf60xuTKeaeHug+NQ3zYZ2amPCgpHMyKJtDpNEydRMtBhZNJZdApUulz+9Q8MH8mCtA
	 Fct8vwZuN90KtzDdPFTOzpL8b6aVD5bl3goLmqmJL4sqK46BIHDnIu+oW7zRS5wqvLBWI
	 esRGxyWhHzCPmKembSID3ug75GEPtXtVJowkPSbZ2byEosVsaz9eGReuKiGw5yMN1otaD
	 /UxGKAwbLJtRh6oEFpnCES+3gshCDM7H07stlCAHMb3wVtuRJ6tSSrh13j2YdnGTTdN8q
	 urNrSUEHoy1J3guIEEtFjMeSfmm3bofZDbmG45pydIycDj9BCucr6yjYtEE90S6Iy8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mythread.it;
	spf=pass smtp.mailfrom=mythread.it;
	arc=none smtp.remote-ip=62.149.156.86
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5F8606A31F
	for <linux-mips@vger.kernel.org>; Sat, 31 Oct 2026 09:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D5F8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mythread.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mythread.it
Received: from [127.0.0.1] ([79.43.52.162])
	by Aruba SMTP with ESMTPSA
	id N5BMx1hYL6q8sN5BQxVoSt; Sat, 31 Oct 2026 10:15:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mythread.it; s=a1;
	t=1793438128; bh=vKCGoYZkyy2tX3DnxdaTcewcIzz4/PetZAI2mHkxFSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:To;
	b=d9o1l+fk8P8nuxa5q8jjFctB1N1Q8HFUh70i0a2bSDbjKTdRCbZAsVdAIYByeJQfN
	 hfjMQRxBdXM3hMVAWhJ1dhD+xNilq+Y55iuThPnhFxpCaATBinBhmG44xro2liP+Zf
	 LPJy+bu/6c3YxhlLd1VbXQ5cHceE+wha8UUG9LxsT2Ric3+BbxwQLIo9ZAczZuidv5
	 ayjxW3Tka6aZvaVeJ6mcg0tMV1VT89QSXpUFxkQjzVo+p+oG5Thuu3IrBZQn6axhOp
	 RrChLhXcMpYiMSzEw9yUBEu+17/s8xYUeaYaCobpSWkc32wX//C5DyenPqF6Sk3+5G
	 8ROzCoQA0rJYQ==
From: Alessio Ferri <alessio.ferri@mythread.it>
Date: Sat, 31 Oct 2026 10:15:23 +0100
Subject: [PATCH wireless-next v3 01/10] bcma: core: clear only FORCEHT for
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
Message-Id: <20261031-bcma-ac-rev1-v3-1-1fbe38e8179b@mythread.it>
References: <20261031-bcma-ac-rev1-v3-0-1fbe38e8179b@mythread.it>
In-Reply-To: <20261031-bcma-ac-rev1-v3-0-1fbe38e8179b@mythread.it>
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, 
 Michael Buesch <m@bues.ch>, vit9696 <vit9696@protonmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Alessio Ferri <alessio.ferri@mythread.it>, 
 b43-dev@lists.infradead.org
X-Mailer: b4 0.15.2
X-CMAE-Envelope: MS4xfLXXc5T4eu0nzpLMSWy+X5gfVikXSiNlEnMUR1sGQcqxa6SVj1y5a5wd0dIRkGGZoqwr4hPUxi5I4aohl7w1Fu6FJI/2ZDNSe1Yw8QD+5xrg5es9zSJq
 bG+l3GjKmx7dKTLLx7M7sZ5GB8o518feW0DT5e1Gbqh73uDSat3ZS31rlwytDhnVIuz/dxTbmbY1u4PXnwAWDn/INFjf9kjwXgPedXc4p/k7acy9mAhR033H
 SDXhXP/V5eYCEg50yMUi52TFaydiMm7Xx46MXbDqHcmG2OQ9Eup0t0G5MMnN1ooBkh2IkNMS9DZg/FMEN6nTP7nJD/fp78DT+kp96s0AXXHj6ZtkxVcJi4Il
 NnoIGNBrsJS+ImjydHvTtXFfYTb6w7/MKLrrg75LPB+xXp4AV3u+XHLYiJZtY9f5ULRWNX0/Pm6ox4B4yPuRQibKbgtm6A==

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

