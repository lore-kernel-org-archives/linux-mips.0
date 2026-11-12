Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.101
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794471051;
	b=BffzAvxa/9rRYYFSn6eYaqoiLuII0B7Wz+SWYuzSDqwWlamAbvL3ktiIrPENtQktarv3
	 qRd4DDoA+AhPaF7YzQwp4C+JforM17ArfVghnhc6HRHmM1kpF8ITsiV8hyGeBZQnXyh8/
	 uyycytXpm787ZknMzAIKP75fakFZ2O8m81ChneDcHwSwvCokulytHLe7n1cbPSdqhLf1J
	 wHkLZxIe+3J4jUW3+faXgZFUYJ6jiTi4RccC4YJuaVVCurRe6YDft7HLoGDLyU/gAd4yt
	 To6QbdZsj+0L9EZeQy2aDVAS2iuRgNGl+lGjZVBGsy2gD3z1zPYs4Y+rn5Bz16XNC7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471051;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=y4stZLY7/qFErDyazGHQZM4jxHV6kGPBs+gSS/J5ccs=;
	b=OjhYgVjXYK4hEPuWdNm+RVdlSKRdc4CeyvfJyGQBGraN9fX3YmihPP6wY4ctIuXGyk1e
	 X5t1DMRMED4/CT9u/Nl3PwDakSoxcv0GxIpZvRrSE5NFRwXKGDC2DZwpE0Bc3xCmXpgpo
	 t4ZklRK7aiobzsQGPxB9A891jifkqJaXD2NdZVrFAmUDap93ScOs8BFl917ssQs9mZxVZ
	 upzpTAej+ZL+ccNw2Mb7Ati2wQc9VGNPU7DqMy1LySptEMM7prvtm57ZdkVbeHJMDihl1
	 +BjLEU+K7TdKBQkIKQ2RT7dn/m8lqxzVkRtwkwSsF3UhwWnDbmW9L38Pmu6jwHxF/gw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=nqqKxemY;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=ggeD5FSS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.101
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de [85.215.255.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B7B606A883;
	Thu, 12 Nov 2026 08:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93B7B606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=nqqKxemY;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=ggeD5FSS
ARC-Seal: i=1; a=rsa-sha256; t=1794471036; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=B/wr04t+RxEccFcw38vLylRTYNFe2dCD9Sif+kdSD0LuauKpyABQyZvCNpy0WCuSpu
    4l1S8Uvhg7xtCK3CrwQShDRL9/2TU/S0BACNOCPPpZnHDNjPvdKwD8DZbuowHvUiBHhI
    t70p6qiUI9D3Q6YPVX6+a+o9uTr7+N6iv1j/3u+kzwDIcw8k8avplU9w0Am5UZrOlWzE
    lFegmhhRefGS69SpgbA4PBauYr29UqEE5g0hNBU7JLkFczbxTnV4pdiakh9ocTfMKQOx
    j1ifnBJaFuGvFvSfkgFT8GvrNGGu0/KIaWn9Ppostqpn11FWXyhitXQHNJ4UKgtJWDpo
    KZWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794471036;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=y4stZLY7/qFErDyazGHQZM4jxHV6kGPBs+gSS/J5ccs=;
    b=o2gdpIxCi+IPcacOqJt1BO8J/SmldGYDYgESHTEDXUleal6lq31sacnSh9fWA/2Ped
    dhJY3V6ln2FGLTzigntGOmNIX3NsZ0VNnDb3nNDPrgtgcUGJFsbbQ/DuwM7QcdrRIhFR
    reIhbmPZK9tSdCyDCr5WFVCIqsWWVRvLFnMJu0nFWgraCnNzGUCTa6HGD4WXZeH1wXS2
    WuXFBZ8A8tEHgrDFmlRqGj0zcXf1SW3ZJ8QIAiYdFFGp+TOjNb+sVca9XbkHzCjmwcuX
    Jtvp+9eGFAGULLKV0mTqDLMLHtL0c7oTHwI5AWkku+eJwv2MWYclG99G+PRtBZm3JyUv
    4pww==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794471036;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=y4stZLY7/qFErDyazGHQZM4jxHV6kGPBs+gSS/J5ccs=;
    b=nqqKxemYQdn7PPtHQbkIxZgDfQNSFZe1u1tjUjOyk9mFuCGab0aLy73954i0XeKTUJ
    VmXsZ8mWiVbfvTZxMsayqhd/isAqg5/M4nGxPMleTkv13+NLKyMYJmHWlUcCTHnlweI1
    yp8zuhW1TrkA7Exo5keFfduwsz0USD5R5QUM3tm6GhuALcthIEyfo5iqM4JsZUiD40sV
    Au/sE+GQPm9LC8ov7Q4CbPjGMCcilSgnR0LF0VVgHSUXQ/xePLejrLJpboe9N95ZGboB
    V/DAcyFyuBUm+09pnS9BCSqfjgtz3C9A1Ea3w/Pu6cEdoPbBB1maBCk+/eNGkzrnS/ry
    MNjA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794471036;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=y4stZLY7/qFErDyazGHQZM4jxHV6kGPBs+gSS/J5ccs=;
    b=ggeD5FSSEOKJPHWEwXSj9Oz8FTB0nlaOhhN6e7SPWKMOtjhcxJQuXRhV235HTuGxq9
    90IJjTyv7VJySp/B2MCw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV35pZz8iNKp1rK7chac7b5mVucO+Qp4KTQNe8"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AC8AaAbg
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 12 Nov 2026 09:10:36 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Cercueil <paul@crapouillou.net>,
	Paul Burton <paulburton@kernel.org>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	"Christophe Leroy, David Heidelberg" <david@ixit.cz>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.de>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	周琰杰,
	Paul Boddie <paul@boddie.org.uk>,
	Olivier Louvignes <olivier@mgcrea.io>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	letux-kernel@openphoenux.org
Subject: [PATCH v2 7/9] MIPS: Ingenic: Expand Kconfig for X1600, X2000, and X2600 SoCs
Date: Thu, 12 Nov 2026 09:10:29 +0100
Message-ID: <4cbb6412d3e7713d6c464051a107db19feef1278.1794471031.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794471031.git.hns@goldelico.com>
References: <cover.1794471031.git.hns@goldelico.com>
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

In parts developed by Reimu NotMoe <reimu@sudomaker.com>

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/ingenic/Kconfig | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/mips/ingenic/Kconfig b/arch/mips/ingenic/Kconfig
index f595b339a4b84..5d351b42bbc9b 100644
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
@@ -62,8 +71,10 @@ config MACH_JZ4770
 config MACH_JZ4780
 	bool
 	select MIPS_CPU_SCACHE
+	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
 	select SYS_HAS_CPU_MIPS32_R2
 	select SYS_SUPPORTS_HIGHMEM
+	select SYS_SUPPORTS_SMP
 
 config MACH_X1000
 	bool
@@ -71,8 +82,35 @@ config MACH_X1000
 	select SYS_HAS_CPU_MIPS32_R2
 	select SYS_SUPPORTS_HIGHMEM
 
+config MACH_X1600
+	bool
+	select SYS_HAS_CPU_MIPS32_R2
+	select SYS_SUPPORTS_HIGHMEM
+
 config MACH_X1830
 	bool
 	select MIPS_CPU_SCACHE
 	select SYS_HAS_CPU_MIPS32_R2
 	select SYS_SUPPORTS_HIGHMEM
+
+config MACH_X2000
+	bool
+	select MIPS_CPU_SCACHE
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
+	select MIPS_CPU_SCACHE
+	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
+	select SYS_HAS_CPU_MIPS32_R5
+	select SYS_SUPPORTS_HIGHMEM
+	select SYS_SUPPORTS_SMP
+	select MIPS_O32_FP64_SUPPORT
+	select WEAK_ORDERING
+	select WEAK_REORDERING_BEYOND_LLSC
-- 
2.56.0

