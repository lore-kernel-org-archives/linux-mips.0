Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.81
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794471055;
	b=fMIqlTul/1Rd0NWgDN9ZF4CezTALXJvvm+8YmXD20EI1Yqk39pRqYih4P88DAwTwQAKm
	 FnJWJ3eFfewJxtuHG/sAolWTJXx5cJf/faM1DHTA6u1hwSH0EbjUoisi7CAfxcylFeYVm
	 hjXTiDPg045smWHlSQJyP1kqu9AfqAj8jqFR5oVqpgeY61sdsFBgA30kSjm9L4sYXmwYa
	 pckQiYnH0ON/p8PxGfBNMl4yKPfaWCr7/hRbClsLdNnqc0A+XaHdd4AOYk6GzhehBOtE2
	 fXVQYZSOt+3HOIJRdcrw6ynZo9B5wPKeAvXpqLmOTvsD0ScOAfNfsOfT3AIzd8gVTYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471055;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=OtV2Pa12MbcHInWbgvFShpANT/vmdTc3N+DfOg93zZk=;
	b=MTko3ni0xg6XtZZf2a7e5f0pi33ORA5uDPbL1mt2kAcmXTN4VzRusb6aoWjUIem6hWp6
	 dqQN31fzuGC2UfccpbkfiQLOOUaYBEoqkn0Iunz1C1rO6mNyw297guWE2762kp1wfRdCS
	 K3e6ht5E4lTHFU9bddVREvprvocELjfWoWZ37yD79NgTxPGMzQsyl4RWlBAVznk6/TclY
	 UwjT3YROJA/9XDdIFdUxpAzKH4tBNzAx6u0Xr7S5SicNIbNDIadM8aILzGLxlxO3GOGiw
	 /gfSotjnSjSNapJBSlPWGWtgGVXYWWxIPNamqnG5DkSdFb5vWIyVqjkZKZg2maReo4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=ZvkG9wUX;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=CbGS5Jr4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.81
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAF5606A32E;
	Thu, 12 Nov 2026 08:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EAF5606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=ZvkG9wUX;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=CbGS5Jr4
ARC-Seal: i=1; a=rsa-sha256; t=1794471035; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=KS3e9Qu/HeJIQVyF26pIp2BClZRrUONN0saBSDSZi2JJeO/j113+b1Q0AWyYvdFCHQ
    wGFkrCFcPfDftRoKghcQHkTxEc57Uqy/y85h7x/1+bfL34VHtFVjdsL/Pi9L/L1k6W21
    NSDudPlNx0Xvr1VJDgeEoCc0lQogQWqM96OdTW+1LzN7wVN2OLvKhXztgOwJPSbEbwM7
    dg9FOIsXaGIQfL8bVICJe3lIHKUZcuIAqfKlt8r9xHxmDvEnI79LeVIhlOONaX532ZTu
    HmraFWqwx9wmb8rJNAZIngvlw8q6m1HnXqsgfQwRmI53lO0D08yENXvV57YHZ5qoofel
    p6cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794471035;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=OtV2Pa12MbcHInWbgvFShpANT/vmdTc3N+DfOg93zZk=;
    b=XflAKdwlidWtefikP0z/NbkAlKczJWP+WnD9il24qMU+tDYj9n8wBhCA8JK6yiIEtv
    RnJhlbzaJl2l0jFe5SMJXydWozFDmooa2KyZ6NhT8f99MBz916kngiGU/fl0qspJRiR9
    lvEPdFLQpLdLGYZEcQ1RUcSweGsxQIVXtzzOsS9hu3QUzy8PfDOKdZUSZ3ri2nnec1tN
    rTIZg+lxV5nu9qGTTeZpedPRpe0Cgfz6hLvu45TQRz/LgjNVB0XqTV8JRuEH2KAgJijg
    DT/dpd9qWDYIPpbNEiw34ynysxq9/E1c5/objx5zprdWiW7JCGihV4niejetzrVw6bL6
    WKtA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794471035;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=OtV2Pa12MbcHInWbgvFShpANT/vmdTc3N+DfOg93zZk=;
    b=ZvkG9wUXKvRJn4k4Yiygc1Occ7ca8hBiEVcmgJC31zuylUzMrmkQJurMrjN+v7jQmT
    1xPyoRZ+tkNzpVj2KNcnOfYRYUmzYc9leV8qqspesYxwin26IY6MBR/5aoJ2SS7nKPaU
    78v30q3j3aKDeqeYAkXBuk/F2xxXPtK3BgrQp75HQ73PPNoRWJAzQhVE/G0DlF8rIQHz
    WpNctSNUe1TbjjCyv0ZIwe58R1xyaG8ArIO4DMN9klWnxou7P7KvEhFvE57f7dl+vPJL
    /0UBqNTLbwqycW4fBQRmrqinLPDdej8w1PpQJyq0zch0Qx+OBWx6dldu+/jagrmdl3K4
    qNuw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794471035;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=OtV2Pa12MbcHInWbgvFShpANT/vmdTc3N+DfOg93zZk=;
    b=CbGS5Jr4FhJXu94vI+X44UsLK0XNb9K9j25ePWai7bXxtzr9vmsvl7RpyYsxfndG/i
    ed7HQE85+PV6EROBW4BQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV35pZz8iNKp1rK7chac7b5mVucO+Qp4KTQNe8"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AC8AYAbd
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
	letux-kernel@openphoenux.org,
	=?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= <zhouyanjie@wanyeetech.com>
Subject: [PATCH v2 4/9] MIPS: Ingenic: Add a new CPU_XBURST2 type
Date: Thu, 12 Nov 2026 09:10:26 +0100
Message-ID: <a398b4d68c085d334cef32430d55bec24bd7b4ad.1794471031.git.hns@goldelico.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>

Add a new CPU_XBURST2 type for the MIPS32r5 compatible XBurst®2 CPU.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---

Notes:
    This patch solves a build error in
    
    "MIPS: Ingenic: Update Ingenic XBurst implementation IDs"
    
    reported by kernel test robot.

 arch/mips/include/asm/cpu-type.h | 1 +
 arch/mips/include/asm/cpu.h      | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/cpu-type.h b/arch/mips/include/asm/cpu-type.h
index fd37a44a2f199..25a181fd0eb7a 100644
--- a/arch/mips/include/asm/cpu-type.h
+++ b/arch/mips/include/asm/cpu-type.h
@@ -56,6 +56,7 @@ static inline int __pure __get_cpu_type(const int cpu_type)
 #ifdef CONFIG_SYS_HAS_CPU_MIPS32_R5
 	case CPU_M5150:
 	case CPU_P5600:
+	case CPU_XBURST2:
 #endif
 
 #if defined(CONFIG_SYS_HAS_CPU_MIPS32_R2) || \
diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index 0fd9f9bbd21f1..add26f08e8029 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -312,8 +312,8 @@ enum cpu_type_enum {
 	 */
 	CPU_4KC, CPU_4KEC, CPU_4KSC, CPU_24K, CPU_34K, CPU_1004K, CPU_74K,
 	CPU_ALCHEMY, CPU_PR4450, CPU_BMIPS32, CPU_BMIPS3300, CPU_BMIPS4350,
-	CPU_BMIPS4380, CPU_BMIPS5000, CPU_XBURST, CPU_LOONGSON32, CPU_M14KC,
-	CPU_M14KEC, CPU_INTERAPTIV, CPU_P5600, CPU_PROAPTIV, CPU_1074K,
+	CPU_BMIPS4380, CPU_BMIPS5000, CPU_XBURST, CPU_XBURST2, CPU_LOONGSON32,
+	CPU_M14KC, CPU_M14KEC, CPU_INTERAPTIV, CPU_P5600, CPU_PROAPTIV, CPU_1074K,
 	CPU_M5150, CPU_I6400, CPU_P6600, CPU_M6250,
 
 	/*
-- 
2.56.0

