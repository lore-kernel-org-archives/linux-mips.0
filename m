Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.84
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794471051;
	b=VpNGIEIb/mM9TlHGEmhNJgMMdr7ez38sfy+PJgMCurEidkQjeWCZcb5oGyRg30/z3xc8
	 hlnDGcLeigsfL/2ASnUiAVRq2hTxU3lnaz7nByFXIkIp4pIWUqZTP894vfllUBjFiXT3T
	 acnIBmHojiM8SZgh2YpkrCFtl9Hxq+mz544oImeqWmMcdQUJmi76cLzsYOtbUT/JpFeix
	 5/DZhEKELqvOPawcQvkbVFENqmRIYuQYH67VEUXkFXVU3dcTje+9DfU64N5Y2s1VHqf3n
	 DfoR/Z0n7i0Savcax3UNq/6AESVALzDzcvmZDfvBrxFSy7qYyTulpiCiHbqgqKp3RqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471051;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=s30hh9orco9NOV3RX62WWjRL4giseTM4tezO2/sET1k=;
	b=uWaRJ0TXsLpOrCzJCNP4/djcMCLZvG+tZxHun6LwP4d4M04t4igYeZCAGdxrPzY1Wuts
	 l108BX4w9Ocb1xJ6wTgnlxRpWQbls4P1yo4Od1hVoWLsHJbJ6Ly1Edc7gdSkmzD990Cor
	 ONx/RONY7vP4YHSLY18H60U5bPjaP4HxQaHBbzilKeb1lI55EvSVTrmDQsI0pPHFERzrl
	 woOZYdO4s/4VuS84mQCXBu0pv2w1L8U6XYgJo2tfDn8fLh6mOwvA+7zX0K7fUlthSc2OH
	 /I0DgbOkjctul78nWtgLExCAF7LS3JhW5VbMvAb8xtwKGJZ0clwTeSNLG6x7NeUIpWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=oXcZKdqJ;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=rbj6n0XO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.84
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC31606A32A;
	Thu, 12 Nov 2026 08:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BC31606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=oXcZKdqJ;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=rbj6n0XO
ARC-Seal: i=1; a=rsa-sha256; t=1794471036; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=QyWjTjgDlU2dbC+D5/cM3anv0JdXJJLtvUP6BfNxrNzbLMgOmCE9at7yeNteUA686T
    IADqH4JPfZSIUQBPIe48s5bru4DjqVMWae3OisPQ4gbn8nELM4CAcZwn7Mbi17xL0VZI
    XolqIXHS9mhexRk3zqmPa4QkW0pB0kpXm8gHixSoArQz9pdIv8HOEuow9NFIYTr64k6h
    cXu8t0pBSjgUsQXdaV8NN3kuiA9xtE6fatddjXJpUbdXG9imL80Fx0FizSLedlr2FwpJ
    TKlmnmuCjks3m807v+MgyUvg51b7DKSNYWBgiDzoSelMoDw/df4yKJaV5VdL5tF7PY6A
    lFCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794471036;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=s30hh9orco9NOV3RX62WWjRL4giseTM4tezO2/sET1k=;
    b=GJVMSNLYFrLgjaTAemblq3xZKNDVYoAgWqW9sxjy8MSp+wpobhwoMqjY5LhnOCnIEE
    pmge/p5NGyrawOcAl/dNmWrbjcOyaRdqpzaPw3CisE+Rj2yji1mWB0sM6LhQ5g/wn3UC
    DSHcoUbLAdplALNFvUhsrsi91Yl/CV8rZGCnweQsmzNdRvMIYCEYW36n+3oH+9SwGOra
    EImj9g8/eTHRN8GcFYSvdYezjmr11Ci2udncQtGy/qupKFdtqT/H6JAi+JofqZWqH4QF
    jpK93mfgsTaYxMi5IZOREoQcRu1HaFBmqOXzJWSMqeGicGMyRx00k3hwqKpylq/JMrt3
    5ZsA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794471036;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=s30hh9orco9NOV3RX62WWjRL4giseTM4tezO2/sET1k=;
    b=oXcZKdqJubuFMxDc2n7j2JEgzjbV4wEpb0NsbGeO7Z6VdLOPKZmY2cpSHL2yZVVmkW
    44Pn1enRwSJjWhTmd8XP3ujezhlJke/0KnAkiXD6dbM5P7vKkAU+oUTmTY4qaykfivQw
    Jgr1AjKDsr7v6u30yQ192Ng0GTUXEFZgcfdCSD24/NypDIQLIuHME3xCjqWGiatYbeBs
    oLv78Dt+m01vxmjiuRhdBOlG4EZpveLSE6oq2+MAHa1HIbFIiZ7dqmAeFotLInuGhEwr
    ocYhaLfaCAVOI9k4LwVi+npjDslZbpnihPzRYts7Py5R85XeG7slZNPnVQFvVSxzuZg6
    L6hw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794471036;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=s30hh9orco9NOV3RX62WWjRL4giseTM4tezO2/sET1k=;
    b=rbj6n0XOvI2gthBlGy5sL34rW4H1UEgnfWChRUKilqzwyjQuPkc1ys6B6NhGEOFwXQ
    1TJR6xv+LT3kvMHcwIDQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV35pZz8iNKp1rK7chac7b5mVucO+Qp4KTQNe8"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AC8AZAbf
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 12 Nov 2026 09:10:35 +0100 (CET)
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
Subject: [PATCH v2 6/9] MIPS: generic: Add MACH_INGENIC type and compatible for X1600 and X2600
Date: Thu, 12 Nov 2026 09:10:28 +0100
Message-ID: <87a3ba40389df599efe30af922ba1564813be8f6.1794471031.git.hns@goldelico.com>
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

Add support for the Ingenic/Lumissil X1600 and X2600 SoC by introducing
new machine types.

Update the system type string mapping and add the "ingenic,x1600" and
"ingenic,x2600" compatible strings to the DT match table in the generic
Ingenic board support.

Note that we do not separate between e.g. X1600, X1600E, X1600H since
they differ only in built-in memory size which can be handled by the
boot loader.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---

Notes:
    Note that there is no bindings document for any of the compatible values
    so we don't add them.

 arch/mips/generic/board-ingenic.c | 8 +++++++-
 arch/mips/include/asm/bootinfo.h  | 2 ++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/mips/generic/board-ingenic.c b/arch/mips/generic/board-ingenic.c
index 1f4906875e7bc..5840293913977 100644
--- a/arch/mips/generic/board-ingenic.c
+++ b/arch/mips/generic/board-ingenic.c
@@ -24,6 +24,8 @@
 static __init char *ingenic_get_system_type(unsigned long machtype)
 {
 	switch (machtype) {
+	case MACH_INGENIC_X2600:
+		return "X2600";
 	case MACH_INGENIC_X2100:
 		return "X2100";
 	case MACH_INGENIC_X2000H:
@@ -34,6 +36,8 @@ static __init char *ingenic_get_system_type(unsigned long machtype)
 		return "X2000";
 	case MACH_INGENIC_X1830:
 		return "X1830";
+	case MACH_INGENIC_X1600:
+		return "X1600";
 	case MACH_INGENIC_X1000E:
 		return "X1000E";
 	case MACH_INGENIC_X1000:
@@ -146,11 +150,13 @@ static const struct of_device_id ingenic_of_match[] __initconst = {
 	{ .compatible = "ingenic,jz4780", .data = (void *)MACH_INGENIC_JZ4780 },
 	{ .compatible = "ingenic,x1000", .data = (void *)MACH_INGENIC_X1000 },
 	{ .compatible = "ingenic,x1000e", .data = (void *)MACH_INGENIC_X1000E },
+	{ .compatible = "ingenic,x1600", .data = (void *)MACH_INGENIC_X1600 },
 	{ .compatible = "ingenic,x1830", .data = (void *)MACH_INGENIC_X1830 },
 	{ .compatible = "ingenic,x2000", .data = (void *)MACH_INGENIC_X2000 },
 	{ .compatible = "ingenic,x2000e", .data = (void *)MACH_INGENIC_X2000E },
 	{ .compatible = "ingenic,x2000h", .data = (void *)MACH_INGENIC_X2000H },
 	{ .compatible = "ingenic,x2100", .data = (void *)MACH_INGENIC_X2100 },
+	{ .compatible = "ingenic,x2600", .data = (void *)MACH_INGENIC_X2600 },
 	{}
 };
 
@@ -188,7 +194,7 @@ static const struct platform_suspend_ops ingenic_pm_ops = {
 
 static int __init ingenic_pm_init(void)
 {
-	if (boot_cpu_type() == CPU_XBURST) {
+	if (boot_cpu_type() == CPU_XBURST || boot_cpu_type() == CPU_XBURST2) {
 		if (IS_ENABLED(CONFIG_PM_SLEEP))
 			suspend_set_ops(&ingenic_pm_ops);
 		_machine_halt = ingenic_halt;
diff --git a/arch/mips/include/asm/bootinfo.h b/arch/mips/include/asm/bootinfo.h
index 2128ba9033911..f6ae983577f6f 100644
--- a/arch/mips/include/asm/bootinfo.h
+++ b/arch/mips/include/asm/bootinfo.h
@@ -81,11 +81,13 @@ enum ingenic_machine_type {
 	MACH_INGENIC_JZ4780,
 	MACH_INGENIC_X1000,
 	MACH_INGENIC_X1000E,
+	MACH_INGENIC_X1600,
 	MACH_INGENIC_X1830,
 	MACH_INGENIC_X2000,
 	MACH_INGENIC_X2000E,
 	MACH_INGENIC_X2000H,
 	MACH_INGENIC_X2100,
+	MACH_INGENIC_X2600,
 };
 
 extern char *system_type;
-- 
2.56.0

