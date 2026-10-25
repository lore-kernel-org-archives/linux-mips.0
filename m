Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792956086;
	b=BZYACZC0IVzYNKx9f4UTCRsG0dbdc7MTXUfCezDWfTiU1/NnufmNf35j/iayE3n0zD2n
	 Sge1KPsmopSQy7Z74ZkJDAVs/PYXOkBYLDREswsC9Oh9IkcjP3+lM8Mvght7/7XZSn6n7
	 gI+RK9Refq0G3tw5Vtdj2ByPMafM0cjsi5TmN6a3MmFLEzhdCpYbCgFwJfUsK2SWUfAU5
	 l2yFAqPwGdHdIaQCpLgFOdfPJDuAemCoQXRSlr4gOapeAsqbem+rAFQ7z6WIAcR2PyWmL
	 RDa9C1EGZhZP6xI/2KOMIgT+w8yeMnJc5crqXC06mkvbSUApAg/pDQ2jHk5SAB6+icQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956086;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=d2xIgSpkZCX5R4QkznOeUogq1Fb23myzFIqOzWal15g=;
	b=Mm2isOkmgH8Jel4nJZaeeFS3w3sNNJMOjY7WXQSMSL48Ho7jkAhOzEHR24aHAZl08LrM
	 /Oh7GWy+xi6WtB++rDogNtDXgJqTuAel6bVClXdhXTM8yI+BTFKD4qarcnqdy1+KvMEu9
	 85TQWbYvHIc89BhW/bs8DAcdtC70+GAiwwgN0b6xu3CkiPTcy4a7Fz58zfn4RuoeWtI4M
	 E5+lol52KDKKaC62kD8/QSKarji18K9w2EJUytBaMPnweumbwgOJfoi6kqXrxStfRjNbN
	 tdmySLibQQiGeYkw1BMSLx8w5DtXSYQs9DAWttXzPcAR8jLKUaZytj9l9CHZbhnIciA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=WQPMFEag;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=KTarybOe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.173
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de [81.169.146.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5032606A323;
	Sun, 25 Oct 2026 19:21:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5032606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=WQPMFEag;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=KTarybOe
ARC-Seal: i=1; a=rsa-sha256; t=1792956063; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=swotxSIXpCoo25u6Gc18LK2wr/u+HjRVnWudj1ftqYJJija03u0hg029rCV3A05yCV
    X7cSKoHi68p6OM2Q7vyqpEh6u570kqlyvLXIusQd2AusqBl5Wl2TjnzndYOZHwxdnG+o
    RSn3X1X+IW1eXoF+hubyuc6Ao8NROpXvGlbSKLFeMeX9vZzuXT4876MYBkl2sndSCXP8
    G/PtXnkHWYcrwl+4/uL9ZaUG1XV9U2vNBG6+4EnrHK4WtInTDBfm8teg8qqizl7DwfVy
    DjH2R4h4/bLVaY/cnPSouAyiQKML5f+c6O23iUnHY54FGziL0U+HiGKw8BwSmHmwkhgC
    h3Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1792956063;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=d2xIgSpkZCX5R4QkznOeUogq1Fb23myzFIqOzWal15g=;
    b=Cvn6zz7lLJeMvyENa+IJ1INWQp9ZE45AIv/xeP4Avlgl8O67oosTyydshI9zYa2AHg
    SI9Z+Rz1qRRK28dTOd1OPr+DOag7u3o5RkSwKPQegSeGZefkTaiz547sju6HCZ1aXoyF
    BQ4IP0HdjsBG9zcOEudB8cB5VjFYXNol312OZ4bD3b/o+TKKfE8VmGk6mw1NWHAupIZF
    OlrXkgbbyAV1N/XbUYzXtVkjNILKmP1cDBhQpL8ptsh13U9OZtJXaj5wz6+FHgC0Makt
    geU6jkztWuTVl+hiCiaUWkbjNoTwO9Z6GNlQtCgXUe0tptdi8sMpBxIwSgMfCiyYBXQN
    Pe/w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1792956063;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=d2xIgSpkZCX5R4QkznOeUogq1Fb23myzFIqOzWal15g=;
    b=WQPMFEagNbdySUKamlrTLGP/oOdp8tr3GdqfwjVt1fvySlrUvWdKPCJyotyk/ofjMX
    HfAL0AWJHXt75mwQW4in0ezonVgelLyPmcEeWMfNPNO0mAs30KrB3Le4nX0zgc30Tve4
    VG9vlC5BTXBU03QB7SfJsUgm9i4r31a8CoGUnb6xlVFuDp4+MdHZUwvIkLMb05bh4hhb
    /+lYJsexrDbZLTE8hUZIEdRXykApHPDY7YUAv0zwkkCi+9D15dxNb1I+Oosbs+kOFfg2
    ip8g0IxcD46xrdDHe5R+fFBgzQY6XNklSqYcmhlTAD1HmzGuy9Aw4KaQWpDXngHfBK10
    V0fg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1792956063;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=d2xIgSpkZCX5R4QkznOeUogq1Fb23myzFIqOzWal15g=;
    b=KTarybOeAiZEDaumBa94PwRKbTBx5noEW2jyvw/G2pW/9hhhZGh8k38ot6NVOPcabI
    t/SUhUIH5KEpYUGMC4CA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrS2poNy8iNoc+LWkugLIF0fnfvFgpgbBBt2w=="
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a229PJL3zRF
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 25 Oct 2026 20:21:03 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Cercueil <paul@crapouillou.net>,
	Paul Burton <paulburton@kernel.org>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	letux-kernel@openphoenux.org,
	kernel@pyra-handheld.com,
	"H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH 3/6] MIPS: Ingenic: Add cpu-probe setup for XBurst and XBurst II R2
Date: Sun, 25 Oct 2026 20:20:52 +0100
Message-ID: <1658997f198411f20bc5a489e9488800e4597e19.1792956055.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1792956055.git.hns@goldelico.com>
References: <cover.1792956055.git.hns@goldelico.com>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit

Add the missing cpu_probe_ingenic cases for PRID_IMP_XBURST and
PRID_IMP_XBURST2_R2, which are used in Ingenic/Lumissil SoCs.

This correctly initializes the CPU type, write-combine behavior,
and CPU name string ("Ingenic XBurst" and "Ingenic XBurst II R2")
based on the processor ID.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/kernel/cpu-probe.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 489612ed9d498..f4924c14bd735 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1768,6 +1768,13 @@ static inline void cpu_probe_ingenic(struct cpuinfo_mips *c, unsigned int cpu)
 
 	switch (c->processor_id & PRID_IMP_MASK) {
 
+	/* XBurst®1 with ISA */
+	case PRID_IMP_XBURST:
+		c->cputype = CPU_XBURST;
+		c->writecombine = _CACHE_UNCACHED_ACCELERATED;
+		__cpu_name[cpu] = "Ingenic XBurst";
+		break;
+
 	/* XBurst®1 with MXU1.0/MXU1.1 SIMD ISA */
 	case PRID_IMP_XBURST_REV1:
 
@@ -1828,6 +1835,13 @@ static inline void cpu_probe_ingenic(struct cpuinfo_mips *c, unsigned int cpu)
 		__cpu_name[cpu] = "Ingenic XBurst II";
 		break;
 
+	/* XBurst®2 with MXU3.0 SIMD ISA */
+	case PRID_IMP_XBURST2_R2:
+		c->cputype = CPU_XBURST2;
+		c->writecombine = _CACHE_UNCACHED_ACCELERATED;
+		__cpu_name[cpu] = "Ingenic XBurst II R2";
+		break;
+
 	default:
 		panic("Unknown Ingenic Processor ID!");
 		break;
-- 
2.56.0

