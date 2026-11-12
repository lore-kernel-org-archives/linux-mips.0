Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.81
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794471050;
	b=q3h7DnEuxUHJOJWbVUcu0JeCIbS/S3I4UmJAPbxIfCGlkKHw8OEoWMRdi2r6XEVqgqa4
	 a4TTLpG3Kr0G1hZIn/pn7XkOnH/KYM0rMnRJQWoywzyW3AO2HLyi2D0s46ROLlb7ae49M
	 8CHqQicnfENDbX9cSeR+6n1JLn66D63BaeQR/f1qVR0JRbc7G5NVjGhPNzPX8z3QJMD/R
	 dmTj3nvSsBEX5IE2peCaVMxzzGFa57iWWfyyfS20fPbmLn8ggeY5k9yka/JOsOzBi1FSR
	 w2qB1LiMIYPVwh+vMsrQHX4S1clF0Q9KTZtgVaz+PXvbyAemroDd5h5S9D3USLkpqHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471050;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=PBfHtmR6x97qCKnvQavKSbMYmfP7sYC3UXsBEcoqbWs=;
	b=CtOVHydPvQ1xyzublocpdVlDjjNpReq+ScsW8iM6jmWpwsyuyuCsz1/cDiVLsUVTrO3r
	 hOSJPGnSOXKn7EUxLXytPNfMRQ3V3XT9vrWKbTFR++JBzGiLBDyNkMuWttuCuEILJHzmg
	 pAfGeYEh4H95Af6jYPfSYSSxCDmIvLzKrs6mlcHb3bnKpl8/CdBgzl5dcjo8CqmA5mZpf
	 ukbebKvE6Dj9xM7NkDRxHV4Ljo3pzQnJ7h+Ix7gI6JucvveDyeB5T5QAokQ5vILlj4Z4D
	 CBk+r9YxU+STkQJYjfO4VNVKif+zdrPckANfLfM78dY9iu7c0xGwn/SZyjtIrpnpSfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=WGw+3PsG;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b="o+P/CFNm";
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.81
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AA8606A880;
	Thu, 12 Nov 2026 08:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92AA8606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=WGw+3PsG;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=o+P/CFNm
ARC-Seal: i=1; a=rsa-sha256; t=1794471034; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=i+GiiUkiwcbcVZsKQPyYbzR/PB8g+HEMGHGj1Ec59DSXqaAgv3IBD5ZVCqS2c+TXkz
    fEjFcTllBDDhaJjgUNnJHtxxHT3IvMIf9DKY7o01QHGCSVneEsRnyRszML9RhUoqANGv
    4Twfd6p8vdisWTC6laqbuM9mv3ogN5gr2tKooWGBt0+v+W69XSF1S/lFadykV1Tp1/SV
    DcEYn251Kx4MsB0oGzMxT4bNtdh92sWqU2h3ujOz0KGvXDOVgZFCXc5Fp5ADBuOgf2HV
    2cdl0hhdYUQYDIhud1AHB6GJ//xlG6E81BRtDSwBJh3Tab9O7H63WmEJdniKnPQ1xcnJ
    uTGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794471034;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=PBfHtmR6x97qCKnvQavKSbMYmfP7sYC3UXsBEcoqbWs=;
    b=grdzZ4trnuUjNAP45+o0IyLpSXertLQxwScGe70LXHZcdY7bQnhHjEbevU0gBx1kka
    cQ8D89TFl7yS60RKWdoZsbkVLv4NwPSYKz/BTQoiT09Qrfh5bb1lux44LVCSiAASzw3O
    b9cV4hNZBOr+k2aYrH2Wi8J6JRYRjG8+jC2RxFDBEpityRElWi2dPMZ2JflA4vuSi6z9
    Pqf+Xr+dK5tZ3aZMrf3L6NOGqSYSLC6raYlCMAPw+MZpvyx8MeS2+pyaM9LGzgQDDYkT
    w+05WAmm9bseCoLjDNPhlTLyya9lhq2Fhc/QyqtJ9cRhP5Ze7AjCZw0M23M/a2x6XpjP
    5T7Q==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794471034;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=PBfHtmR6x97qCKnvQavKSbMYmfP7sYC3UXsBEcoqbWs=;
    b=WGw+3PsGYKD/4wbXIeBnnKcMErRme3ZNvHEqr1m/jP2JLQN2GlQkfwEMGFvycOsN6Z
    AufnrMBkcU6env1Mmpr7MvMiTl4psw/zVK1dOE7suWDxdGvz2U6X3LTA/Xpf68AchdaZ
    fTLvZ03t1v7lzncELUNFQ2eC2gFbxgV3cW4aMcSiNLMN/MH5Jm+l49GxkF1SqrncRlV0
    vaeQygmV32oQWjllL1650XjoZonxq79eX42IiNXOrp3ijFIPo1sZLRZR/x6vOjElCP6p
    Aw0MW43HbmZxxlX5Cip+UJMNOzVqIevQQV4TRr2J0Xc6LSo8MDvwbjOVB2OBwVrGIZYn
    JYcQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794471034;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=PBfHtmR6x97qCKnvQavKSbMYmfP7sYC3UXsBEcoqbWs=;
    b=o+P/CFNmw9br6purM79Z+PZdL5wnHa8Ky775+KxR8rvccv1mq/DyLScR31C/ZVNU68
    hP1+ztwiDle6bCzXhDAw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV35pZz8iNKp1rK7chac7b5mVucO+Qp4KTQNe8"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AC8AYAbb
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 12 Nov 2026 09:10:34 +0100 (CET)
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
Subject: [PATCH v2 2/9] MIPS: Ingenic: Configure CONFIG_BUILTIN_DTB=y for Ingenic based devices
Date: Thu, 12 Nov 2026 09:10:24 +0100
Message-ID: <8201bf1e5021477ccd89317059726975b7832073.1794471031.git.hns@goldelico.com>
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

This enables the new CONFIG_BUILTIN_DTB user variable so that we do
not need to rely on a select CONFIG_BUILTIN_DTB if ..." any more

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/configs/ci20_defconfig       | 1 +
 arch/mips/configs/cu1000-neo_defconfig | 1 +
 arch/mips/configs/cu1830-neo_defconfig | 1 +
 arch/mips/configs/gcw0_defconfig       | 1 +
 arch/mips/configs/qi_lb60_defconfig    | 1 +
 arch/mips/configs/rs90_defconfig       | 1 +
 6 files changed, 6 insertions(+)

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index 90536cab417ee..b45a6c7b54ea8 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -23,6 +23,7 @@ CONFIG_MACH_INGENIC_SOC=y
 CONFIG_JZ4780_CI20=y
 CONFIG_HIGHMEM=y
 CONFIG_HZ_100=y
+CONFIG_BUILTIN_DTB=y
 # CONFIG_SUSPEND is not set
 # CONFIG_SECCOMP is not set
 CONFIG_MODULES=y
diff --git a/arch/mips/configs/cu1000-neo_defconfig b/arch/mips/configs/cu1000-neo_defconfig
index ed2a620e4f86a..a505de6e9e367 100644
--- a/arch/mips/configs/cu1000-neo_defconfig
+++ b/arch/mips/configs/cu1000-neo_defconfig
@@ -22,6 +22,7 @@ CONFIG_MACH_INGENIC_SOC=y
 CONFIG_X1000_CU1000_NEO=y
 CONFIG_HIGHMEM=y
 CONFIG_HZ_100=y
+CONFIG_BUILTIN_DTB=y
 # CONFIG_SECCOMP is not set
 # CONFIG_SUSPEND is not set
 CONFIG_MODULES=y
diff --git a/arch/mips/configs/cu1830-neo_defconfig b/arch/mips/configs/cu1830-neo_defconfig
index 9b4aeeef58ceb..1fa7a49543063 100644
--- a/arch/mips/configs/cu1830-neo_defconfig
+++ b/arch/mips/configs/cu1830-neo_defconfig
@@ -22,6 +22,7 @@ CONFIG_MACH_INGENIC_SOC=y
 CONFIG_X1830_CU1830_NEO=y
 CONFIG_HIGHMEM=y
 CONFIG_HZ_100=y
+CONFIG_BUILTIN_DTB=y
 # CONFIG_SECCOMP is not set
 # CONFIG_SUSPEND is not set
 CONFIG_MODULES=y
diff --git a/arch/mips/configs/gcw0_defconfig b/arch/mips/configs/gcw0_defconfig
index 6d737810b470f..36ef053376185 100644
--- a/arch/mips/configs/gcw0_defconfig
+++ b/arch/mips/configs/gcw0_defconfig
@@ -7,6 +7,7 @@ CONFIG_PROFILING=y
 CONFIG_MACH_INGENIC_SOC=y
 CONFIG_JZ4770_GCW0=y
 CONFIG_HIGHMEM=y
+CONFIG_BUILTIN_DTB=y
 # CONFIG_SECCOMP is not set
 CONFIG_MIPS_RAW_APPENDED_DTB=y
 CONFIG_MIPS_CMDLINE_DTB_EXTEND=y
diff --git a/arch/mips/configs/qi_lb60_defconfig b/arch/mips/configs/qi_lb60_defconfig
index a1bb0792f6eb1..18fe70487817c 100644
--- a/arch/mips/configs/qi_lb60_defconfig
+++ b/arch/mips/configs/qi_lb60_defconfig
@@ -9,6 +9,7 @@ CONFIG_EXPERT=y
 CONFIG_MACH_INGENIC_SOC=y
 CONFIG_JZ4740_QI_LB60=y
 CONFIG_HZ_100=y
+CONFIG_BUILTIN_DTB=y
 # CONFIG_SECCOMP is not set
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
diff --git a/arch/mips/configs/rs90_defconfig b/arch/mips/configs/rs90_defconfig
index 8382d535e6dc1..0c57d829d1720 100644
--- a/arch/mips/configs/rs90_defconfig
+++ b/arch/mips/configs/rs90_defconfig
@@ -22,6 +22,7 @@ CONFIG_MACH_INGENIC_SOC=y
 CONFIG_JZ4740_RS90=y
 CONFIG_PAGE_SIZE_16KB=y
 CONFIG_HZ_100=y
+CONFIG_BUILTIN_DTB=y
 # CONFIG_SECCOMP is not set
 CONFIG_MIPS_CMDLINE_DTB_EXTEND=y
 # CONFIG_SUSPEND is not set
-- 
2.56.0

