Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=85.215.255.100
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792956093;
	b=ILkcreJXUWZKm+maow937BhWwCY/aFr9VcyC2wbzhDWwdFRDLpZWu3Sz5KD58ncazN6c
	 0VpLCEavMlNY1ArULdjlt21BMn6OpNDsXxsfeWZyFV1W36J+Fd2u3J1LDemvSCC9zoUOR
	 UCdJNZYxugEcalnQITvsK3sFUtaoNzzySeyt6EL7SSuInr/dwF7ytdRs1UHLPxr1AEMk/
	 xRrkLAF5ue1a6C9G2U+BSGBUPrxi5OEluUt6LbJhaFsnn9b7GyOa6MhaGO5SvBYlQ/Pby
	 JgB6sVrbh3Zbp+h1HMl68Jn0XkjehQzguRrTtFGYyF0birxnSP2cCYHx4bturPrJGiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956093;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=zGpsAJlOmHZbcXK8PuBFw7TY+SG5EPzu+GubpDd99+Y=;
	b=UYQWXxq5BLeUZZEa1zHVMRqiFfme7JbsxLhwqvmr7rKdkDvetqEcbiXgnexN+VMwKot7
	 5ztP7aElvXVi8+aXPHXmYeCfbmQxDw2qDDNlTLVedzgONBFoNc3OgeDkwHDi5LrQfEHyT
	 VSegC4QEdhBcUTmTUX6In0vCTALGAESz7kDC4Fr4z9ovdJNa7RFek9A4uyJK2EukGntSP
	 z7xwfsKmjWlF0J4HYbvhMOCC/M51J2JT5WBplhtBe8lesr0mzf2z2xaLPDH1lbv6uL09I
	 Q1DLoVDZfBcnxdCcGohYkD0eqB+bQkXRZiDQJHji9+7/BhROU6VLtFCCf4AxTmG6iXA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Lih83JR5;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=njQJFmsQ;
	arc=fail smtp.remote-ip=85.215.255.100
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de [85.215.255.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F95606A32F;
	Sun, 25 Oct 2026 19:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39F95606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Lih83JR5;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=njQJFmsQ
ARC-Seal: i=1; a=rsa-sha256; t=1792956064; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=OBvJRDPgy66z6unV6E4ozSViwCqwLDQg+JmLvTBYfyQxSOtWvH/j2S7lxE47Tjl/B/
    prxc/NwfB+fCRDC841vuSorJfgHtczzInPwhlx0kEkeNJRdfTiFRqBHxqhptphHc6T+p
    g6FboS3rJo00qkGylKj8abCKvKAsEVXnszwSrgn/XMguFaMhSdw39V99GD02c1C3aCmP
    rVT0TSSjJLNJMEf5lfcNIT6TmgjKykp5Rxt0G/XvN4vQf9PB1eiCEHz9o05xpNGsZVCX
    IJQusQZuraWXMUUIHVUUKp2YeJs0yumf8lVeLQ7UMMx8n3DXGMYURIjdl8svk0S722ti
    kkRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1792956064;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=zGpsAJlOmHZbcXK8PuBFw7TY+SG5EPzu+GubpDd99+Y=;
    b=pRxJJBT90S6YhElNu+RIoFeSO2HGKryWqXWOR0Z/lxNhgrV0JrSl9TAN98lD6fr42J
    qQCt2Ur3c+EN/3oSEIx+L0iQLjLdg5zp4LS+AJRp3j+mRvZnZt/s7HvMuIkWY/H6ZZ5z
    nKg/dVGlJ+6MZq7Qsg6MxHO6N1ak5sQmLlmUNDJf7dVeuRfno/lyxJClL8w21+OMmMlI
    X9+U0aFwUXLv4zRbySuL5+fxI81zWGvLUr0/7oGEwThbGNy8fcjmasobOklYBTGoAlWl
    a8DgCnTm9hulHok2ldf3Flg1PpmBwSs3kC1NUgtbU04fbarYiuf2G+nify+y83BdNp/G
    nBLA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1792956064;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=zGpsAJlOmHZbcXK8PuBFw7TY+SG5EPzu+GubpDd99+Y=;
    b=Lih83JR55k28eaWdj5FNq1ceQSgEYpERpjsfAQX/RwY0nt0tQoWKPTBv64YjYwjqeR
    UwCSMni9oyll5CRkYcVC9PP77PUvA225mGWfUmbVsy8jy50FiJq2erjw/jJTfeANy/EH
    NEKNp9VCIAGP8vkeZ2BBVdMV/Wxxo1Uv1TgxmqgIZgXINvZx7BemdFTfFGT941Vcosir
    fLqBghkO3hNAjC2IyRo5MhmnJmZLDoyNRheD43FPU6gRBN2Srjmh9zJcDu1EZHBd9wZ7
    FUaiPzbWZf5pVTYGt8u+w+y50mW8Tec1EpWO57GTZ42t7kHOibc2cq9fTTQNCoTe5Ri2
    LZUA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1792956064;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=zGpsAJlOmHZbcXK8PuBFw7TY+SG5EPzu+GubpDd99+Y=;
    b=njQJFmsQVlm3+uiE7QyBtq1RrYqmDhq3JXLbtzu6rcO5vr3ejc4i8oRZ9Iq7RGgb1X
    gNqWJnWLjqm6W8H4BPDA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrS2poNy8iNoc+LWkugLIF0fnfvFgpgbBBt2w=="
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a229PJL4zRH
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 25 Oct 2026 20:21:04 +0100 (CET)
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
Subject: [PATCH 5/6] MIPS: Ingenic: Expand Kconfig for X1600, X2000, and X2600 SoCs
Date: Sun, 25 Oct 2026 20:20:54 +0100
Message-ID: <381641a70be5c115336924b0f725081cc316f17a.1792956055.git.hns@goldelico.com>
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
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

Expand MACH_INGENIC_GENERIC to select all existing and newly added
machine variants (including JZ4750/55/60/75, X1500, X1600, X2000,
X2100, and X2600).

Introduce individual Kconfig blocks for the following SoCs:
- MACH_X1600: Selects MIPS32_R2 and HIGHMEM.
- MACH_X2000 / MACH_X2600: Selects MIPS32_R5, SMP support, broadcast
  clockevents, O32 FP64 support, and weak ordering optimizations.

Also, drop the unused MIPS_CPU_SCACHE select from MACH_X1830.

In parts developed by Reimu NotMoe <reimu@sudomaker.com>

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/ingenic/Kconfig | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/mips/ingenic/Kconfig b/arch/mips/ingenic/Kconfig
index f595b339a4b84..98da239dd6966 100644
--- a/arch/mips/ingenic/Kconfig
+++ b/arch/mips/ingenic/Kconfig
@@ -5,10 +5,19 @@ config MACH_INGENIC_GENERIC
 	select MACH_INGENIC
 	select MACH_JZ4740
 	select MACH_JZ4725B
+	select MACH_JZ4750
+	select MACH_JZ4755
+	select MACH_JZ4760
 	select MACH_JZ4770
+	select MACH_JZ4775
 	select MACH_JZ4780
 	select MACH_X1000
+	select MACH_X1500
+	select MACH_X1600
 	select MACH_X1830
+	select MACH_X2000
+	select MACH_X2100
+	select MACH_X2600
 
 choice
 	prompt "Machine type"
@@ -71,8 +80,32 @@ config MACH_X1000
 	select SYS_HAS_CPU_MIPS32_R2
 	select SYS_SUPPORTS_HIGHMEM
 
+config MACH_X1600
+	bool
+	select SYS_HAS_CPU_MIPS32_R2
+	select SYS_SUPPORTS_HIGHMEM
+
 config MACH_X1830
 	bool
-	select MIPS_CPU_SCACHE
 	select SYS_HAS_CPU_MIPS32_R2
 	select SYS_SUPPORTS_HIGHMEM
+
+config MACH_X2000
+	bool
+	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
+	select SYS_HAS_CPU_MIPS32_R5
+	select SYS_SUPPORTS_HIGHMEM
+	select SYS_SUPPORTS_SMP
+	select MIPS_O32_FP64_SUPPORT
+	select WEAK_ORDERING
+	select WEAK_REORDERING_BEYOND_LLSC
+
+config MACH_X2600
+	bool
+	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
+	select SYS_HAS_CPU_MIPS32_R5
+	select SYS_SUPPORTS_HIGHMEM
+	select SYS_SUPPORTS_SMP
+	select MIPS_O32_FP64_SUPPORT
+	select WEAK_ORDERING
+	select WEAK_REORDERING_BEYOND_LLSC
-- 
2.56.0

