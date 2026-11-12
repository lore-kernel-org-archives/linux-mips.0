Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.100
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794471052;
	b=hFWdMDMTh5Yjj2UuSPoYS131D/LoiogPZUr7nCFRkO/e9MKmIU6IMX+j2cMrWCRWd9i/
	 B71bMVSFHP+feycxVHNK2zoXyVDp5g0f2Z8wcwMUBE0/TR+wZn7tkANAZdxlynYGiHfYr
	 TOBekCuUPCEwAE5yWhFVsQ9bLjdAMIi0u4GfGTpucLt5leU+TvcwCVk7XeLQaUCxvBHKp
	 NpQcKtojWAPal/BenrBojIEn0DNcFN7bn8xpAk6JNRpM90LHjY7XSYB2lsl7v6PBZFMx5
	 s7rZReqcFryfHjlW3ybJy6lt195nGE5f67OKt3knBAARd0H3PltnRt5/bY+jUGQVpNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471052;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=/13RVaZvana7iPXowXBtICChtTGrBK6xO1QPE+c3C7o=;
	b=mEz4qJ73TB0IkOGRsycYQy/p+7GxScQO9+GabE/q2KNu35O+GtYvEJwqG0OgF6blDT8K
	 VK7Rz0mtddoMrv11dsYQXd37CldHrj3zMZ2hkJ5LeCh/4/KYwru++UqEWLi1KXbrLbTSv
	 JDDxVklUN3EqistB3pgLe0VPdsEvvtiydXbnjkYsfp3vTyYxxcCRIIuk8s3w8P10Hf2hD
	 haXG9Xpl6+dFosDWC30jrSoB3K6mfUJjix7Wiw0qzkkt3X1MY1q2+piRn8I1KKI1PQNM0
	 7wpFVN4nWX51seLjY/JaiMWk6W9Pyw34kWd8YSelKqj0mXgetg0kT9Jt16VwoD1Tm/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b="lJZD8/zC";
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=N7P3hFe1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.100
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de [85.215.255.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93805606A882;
	Thu, 12 Nov 2026 08:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93805606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=lJZD8/zC;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=N7P3hFe1
ARC-Seal: i=1; a=rsa-sha256; t=1794471037; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=km45nJ98qc0SWd7v6rOkeaugZYWw1h0L/4rrrS/NOrMoSBuGUQd/oPEsKkyTzCE0LI
    YjiJRbek60f2Ox4lygC88ciE4hct9vxzBWde+kdHk2WE2XWyb/UCmjcJWeiYXjl+WqMT
    eER3Zm5qWk0FbSkAaco4resL2dVRIFrqx6KMq9GPkB3Am8CBux6Ryy0+FCyZinrjWzbj
    4PvEIQpdeY7IZQxyKdpOCE6hpnLHV1Nq5LEJOQLX+CYPBmXpcvzqKPFZ13AS5y8PR0xM
    VYvUenDJoEqg6+RiyAY9j+COIo78P/P2fSsqUfwF96II9CwdE4jNxxtt3bNeUybBiCur
    Hc4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794471037;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=/13RVaZvana7iPXowXBtICChtTGrBK6xO1QPE+c3C7o=;
    b=ONKYO5HV0HAvs6fyitwDInXBJX7C4jB+XnDaPWSMOsQi/lR5UXnTrBkzw7u29+PSZ8
    WVWGnQPj3+/04t61DrWLR/Rca1bPpUppwJ6MiKzdbPoEflJL1joXhstkRmP7teFCqGh0
    60kX70f0gYBIDGOCXu3v1Gr00Ze7+cub4lSKfbDWtec4IHfyTD7EE1gX5YD+E2wJZj3X
    jwXFrOew7aW9N0prL9KkWyIBjpG8gyltBQ/RgYxIsqra7ePUGiDONWvbJ0kDjALY88u4
    HYH02C7AElwO5aKpKvBc4hR8020LA7dc2r6yrDwLLx5g2ALNSmP5aICSp63YBbctFU4R
    CPLA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794471037;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=/13RVaZvana7iPXowXBtICChtTGrBK6xO1QPE+c3C7o=;
    b=lJZD8/zCeAp7wKPHCmSW9WC1wql5bA0mZrP8pmcipsneIYB9KKP1JEC778LVDORccj
    xbjRzsS7xIr0crejCqs23NtSuiAUTsrX1vAnnlvZrh6GQD3Vrwx7t6TqqMiBMVN5Bk1R
    x3BTyDyqsQdJduktkcMQt5gczp1UqyY48E/cgoWOj0lTlF5/TVzQPAaaLWsHhmlNUoZX
    +hgA328ePVj62Hd5cAVPvSsTTpt5/ZD0JYfAxpEyzJMiBgTmnyfSit03id+XNa2Ok/K0
    JIrQJyhw7d0SU1bwDmEtTrOcvVPZ0Kv9PWRYTgBrNn2A16k/LFoVnHIn1ztPknxlgd21
    aTQw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794471037;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=/13RVaZvana7iPXowXBtICChtTGrBK6xO1QPE+c3C7o=;
    b=N7P3hFe1kjCZE89vuVMgPQW7/r5io3nmriwo5KYNlBFEKqNdVP+ni6IRkZsI2+Ogle
    J+rseC0fBmYMpE3qDyCw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV35pZz8iNKp1rK7chac7b5mVucO+Qp4KTQNe8"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AC8AaAbh
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
Subject: [PATCH v2 8/9] MIPS: Ingenic: Expand Kconfig by MACH_JZ4730
Date: Thu, 12 Nov 2026 09:10:30 +0100
Message-ID: <ac7ac1a3113cfe26699b5fd65c32c4b9ab70aa09.1794471031.git.hns@goldelico.com>
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

The jz4730 is a single core SoC by Ingenic with peripherals
like LCD controller, NAND controller, Timers, PWM, GPIOs

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/ingenic/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/ingenic/Kconfig b/arch/mips/ingenic/Kconfig
index 5d351b42bbc9b..62b494ad77a61 100644
--- a/arch/mips/ingenic/Kconfig
+++ b/arch/mips/ingenic/Kconfig
@@ -3,6 +3,7 @@
 config MACH_INGENIC_GENERIC
 	bool
 	select MACH_INGENIC
+	select MACH_JZ4730
 	select MACH_JZ4740
 	select MACH_JZ4725B
 	select MACH_JZ4750
@@ -58,6 +59,10 @@ config MACH_JZ4725B
 	bool
 	select SYS_HAS_CPU_MIPS32_R1
 
+config MACH_JZ4730
+	bool
+	select SYS_HAS_CPU_MIPS32_R1
+
 config MACH_JZ4740
 	bool
 	select SYS_HAS_CPU_MIPS32_R1
-- 
2.56.0

