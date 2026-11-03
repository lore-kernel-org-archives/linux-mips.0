Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742651;
	b=nUzF6+TVEyJZRyuM3Sfit2pRhGbiLqU47MuhCeREMETRT6Mjabg9aRtjdMeLiGUsH3LK
	 Hd10l/z7Nqxw6HHqMxnXdJYbqbZjF1DG44Kyw4LG+KoXIk79ZCW1xEGuQHNAw6YXzs+Zm
	 F1jW3Ms7fN+0P5Q44+cnt6UyTRbd9crgLyRUb0/XIGTeipTFRFzPfeF+m+jC5kIPCKPjM
	 Rtj58rNgqBCKRWJj7vbzAZ6G8BIsXM9zSezb8Erg2ttKSUbqMl6nFn+BL8Qn3et+uwqrB
	 0OuMKoUMgohCycF4daEjU5J9WpAdzwuJ+QL34+JjeEjGvondF8JIXaXOVuB+gVGr5nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=9h9kWdl4UuQD3zSaTMBwk6BIuE+01bV25xA/FSfWtZo=;
	b=FY/u+OKgwVe0xybicS4OhXfdqP0fG2/fcT6Q0STu89xFTwAALsE/iHWLK6t9cM4/wQCA
	 Xoyf25LeDA0FBASjHMCGe98O06DXoGplk3qFpo3uUHgFYeoKpVxEh/9FtjWAEhzloeU4D
	 IwGzn4VoKbrx/aPlt5Gypvj638Dwfue3Qqpd//6uAjx+Ae0gDjhydkTOZMPmPHMeWFG18
	 uAoV3ycevnluT8jDmKD1ov05VlH7Of3BLM3yRDzrJ+5E5VxirRNcqMNL6sB/1Pw29JQTq
	 ycslZokP+rObDOk7HHx953wHCdCFin+vn9d1PSld3BiePVGHGv0icgH4IDDcLN2pZZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Or0e9dZ8;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED89E606A326
	for <linux-mips@vger.kernel.org>; Tue,  3 Nov 2026 21:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED89E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Or0e9dZ8
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-19305bcb72cso79881c88.1
        for <linux-mips@vger.kernel.org>; Tue, 03 Nov 2026 13:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742650; x=1794347450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9h9kWdl4UuQD3zSaTMBwk6BIuE+01bV25xA/FSfWtZo=;
        b=Or0e9dZ8H5dVBMFVLgOI0FokeolSMzfR8Bv2+18x/RMttwmjYXCnBwKgZrWhkfI+6z
         FhRT0mw1DsQze2rn8D9m9lIB0v2Ku0IYyTf7y879F7np+zbnfKNRvf+/EHFzbnzlZYwD
         v0VjEtOYfhpOu97/rBapk3hkzuWtqy4/XY+hAUWqWHrukFFJgZjjXvYYeVXzxkwO+t8t
         mBKtAy7Ax3fgkH8oSfeEqeiZ9PcRW1xFS1iLArJy8LTnIGUYRQZQWJg4ORR8Af1Bitkq
         Lc2Z7dRt5zmy/7QxqMQD5+rFsF1K9H5bUIVhd2AFf8+R1SghPNN7jYWPlJLlMhrMB7E+
         sPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742650; x=1794347450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9h9kWdl4UuQD3zSaTMBwk6BIuE+01bV25xA/FSfWtZo=;
        b=RxPJI+o47TVXTaV7vWKrnf1D2wDY1joEODaL5kBlfCN6hu3vFBPEienYDrKW8Oj7HC
         559myTVq1tu7KOqIl4/8U/uFHCGPfdBAZVnTZR+LObM2TluDEhmODS2v0fVf/KmbUfvJ
         wKIfBKylBwqmfMll7hIE+h9YXegkvovNqPz/58Z1ZUiR1utQ/JVbk/8gPkZvMlNRAcVU
         embSoPzGxnNbJXAViB45KWle0ibRZRpCdawuIH0vu5jaUUZlXeHt9tJjD7/GfbDtnS1R
         kkW9HI9RxSH1LLE+jtT8bG/Lyktnq5iWFfJO86k/wztLPJum1eWZLbXMob1FZJoshwex
         Pzxw==
X-Gm-Message-State: APuU4Z/Jd+My+WiKALdrfx2byprbbqK2I+xU3X3deC8L89cA6bxwl02M
	Zu6wUq7jLDpOiSKN1KX+e9Jkya12pHvAv7av6wFdWram+kwNourOvMyTw/vJww==
X-Gm-Gg: AYBFou1CLgIJ8Yd1lhFjdODZk1yzfvEjxVNqZJ85Kn16P/+vEJGEibzdn8oqAVJe4ms
	GGyleaiyu6SGFVetdyxU/VYIRO3yQ7RCyj2i7hPqD6O39H0VgLbFhUVm8v5sPG3FCAoXG6FnGS/
	8Twk00vACZikZSERgMbTweghsT45szkwiuXHvfG6/1pNa8TmxFuGdhx97nJHNfEXQTtocZ3YvgF
	sFiLUfQ2vcsuJyRfwSg918MeLxf1+WN/GQAUJLzC+hOO0VF53gxtJ2KRgPs3pUTdoSYRgRIGM9i
	0lxlS8WkkUQOw60SoX5kq2GgRf9mHYJAPyq19BLY+5sB+Yjccty1i/eZQZeFbBfAWswuXemiph9
	hGB66rabmv3zt5qcRlrLf72wjDW9AWCcJ7Su1PF0cZJWBxTCG4uuSmprZObPu3hPHRicJVGL72M
	LPRhe4bVIe9ZriRkWdEL9/SRJ91pyax6EsiYlCH+NQarpips03F7FKsRy+PmXNgvRy8bOupsmlg
	o6j69dqzuFx0g2Vh6wNgW9YkItVTZNl/gf48DPeRGdq7uopcH/ajjvr0gVD9V+mgV2c+BnYZq3T
	lRMeizNy
X-Received: by 2002:a05:701b:21db:b0:1b1:251f:d732 with SMTP id a92af1059eb24-1b23f20d4b8mr4609129c88.31.1793742649905;
        Tue, 03 Nov 2026 13:50:49 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm1583934c88.8.2026.11.03.13.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:50:49 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: macro@orcam.me.uk,
	Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] MIPS: SB1250: Validate and update IRQ affinity
Date: Tue,  3 Nov 2026 13:50:40 -0800
Message-ID: <20261103215043.1190947-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
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

sb1250_set_affinity() selects the first online CPU in the requested
affinity mask without checking whether such a CPU exists. If the
intersection is empty, the resulting CPU index is invalid and must
not be passed to cpu_logical_map().

Reject affinity masks containing no online CPU with -EINVAL before
accessing the CPU mapping or interrupt mapper registers.

Also update the effective affinity mask to reflect the single logical
CPU selected as the interrupt target.

Fixes: 421d1563c662 ("mips: Validate online cpus in irq_set_affinity() callbacks")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/mips/sibyte/sb1250/irq.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/sibyte/sb1250/irq.c b/arch/mips/sibyte/sb1250/irq.c
index 2f08ad267a11..d7a656cd7ec0 100644
--- a/arch/mips/sibyte/sb1250/irq.c
+++ b/arch/mips/sibyte/sb1250/irq.c
@@ -76,6 +76,8 @@ static int sb1250_set_affinity(struct irq_data *d, const struct cpumask *mask,
 	unsigned long flags;
 
 	i = cpumask_first_and(mask, cpu_online_mask);
+	if (i >= nr_cpu_ids)
+		return -EINVAL;
 
 	/* Convert logical CPU to physical CPU */
 	cpu = cpu_logical_map(i);
@@ -103,6 +105,7 @@ static int sb1250_set_affinity(struct irq_data *d, const struct cpumask *mask,
 		____raw_writeq(cur_ints, IOADDR(A_IMR_MAPPER(cpu) +
 					R_IMR_INTERRUPT_MASK));
 	}
+	irq_data_update_effective_affinity(d, cpumask_of(i));
 	raw_spin_unlock_irqrestore(&sb1250_imr_lock, flags);
 
 	return 0;
-- 
2.53.0

