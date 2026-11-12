Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.82
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794471050;
	b=oN7psHx2g4iiGJdNS6/zTbKU3mP36m0YXUNLAfLHpe6vnAzBk0iDOX/xJKfGIbxF7Bps
	 eg561JNMP2xjYDWP/vQIAMWMxnOlcg4fUd6sZEsqrxE8Rxh6zNTqv4KhYEaN/cyvE/ViF
	 g5JZCvowTKr0hUFU/nxZ5bgqOMCTQKG6AdHF3910GYmv/Ph1pTFOFSP02MISEThKyM48U
	 idsYiZKym0UKgR/T90nkUSDyIq5n2ylzpCijNPkFmsoiSQr5zfMQXwzLykCD+5fdktfMR
	 QTJwVcrpB+vUvY7bOm6jyU62Ee52zwP+tIiBG/FeaS025iBJIQi7F9OW5RTsJxNdxxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471050;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=3Niw6rj88SccCD4L5qvzZ25l7kraaGkUSkwQV1MpJ9E=;
	b=yvn/xGte4d06m6ytt5Lk9yw6iCRFSFxoE5f202yPJqFPyqzhGEHp+QOIVrNXFhR5MuSb
	 t+32G8klHPNVL0oQOCe4yq6q7rdA1WwfBQ2mn2NtTqBc4vqTUrlsoZ5Riqc9qBMbRulxw
	 JAWWCLIlbQf9jPlIdslEWF7RnZpkpRdbecZF8RFnY28a/9sQ74tO+5JrFR1fHYwtt5Jqj
	 QJOp8L7wienYXz5ApVbYYRhMEkLrczqnTajjDxlNrwy6dULfbY9EFgwfD0KwIbtM/h3ec
	 BxVE+ooHLq9p5gq1nOB3shVzzYLUzc6k98Tx9ptpTEAfhAShVRjhBbAEUW854wdLM+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Wbmdml0n;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=PSOn0GOo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.82
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E4C606A32E;
	Thu, 12 Nov 2026 08:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86E4C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Wbmdml0n;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=PSOn0GOo
ARC-Seal: i=1; a=rsa-sha256; t=1794471034; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=EVOlVKQw1SQkSEHSrx32L55JCwfb63tBKR6omlqZlURce1NxYq8HEf9Iq9/w/ljB1i
    VrVvbYDyJyXxeAk6wHvnthCX3Qch2kZiNphaoN15gVp3YOiEW2ZjaUdECfE6R5IZZKqu
    c3RzH1ru3MTpTNoS/yN6IdMUXVLIFDbERwElPQS1P0hdpefrD46B0KyUL5H6bToRB0Fs
    Y7ZyD6Mp91ILU3J1NIU/ovbg0T7+rmSf7gvOoJV08/uYS30t/HCkbWh26uTsVfcpi8Kd
    pcAYlHAHedUFsz8P/TVHYfuRvBI6y7yLHKrTkeJmD1P+eC0pmSxVysZM3XkySqI2X0en
    m+6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794471034;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=3Niw6rj88SccCD4L5qvzZ25l7kraaGkUSkwQV1MpJ9E=;
    b=nDHnymyZ2VArPQ40wsY1qsOvahyFCbaQAIVH11K7HT9QM9UOyPP7zE8bDnUaiq6iIB
    CtkH+ZyTJ2Io+zcLDQLM/nJrabvNkddjtb6MhkLmfceUR+7X1Rp14Dy44C2UMQtIXpK3
    BhfB54JNu4sqc2GqTotIoagchMixyZ24qbzJHKBtd5dtKpfGeEaMD6lxno/KZHwWUZnj
    GYDf+qe+eCfjy2cH9f1EZ5ARV1WkedmLfoV0cGA7wuhTiZcm70rctjmSqkEsRvhWQZd0
    Y7gi5BiQGX70zX6Z9D2hDlbpExisTLL//1Hz+2X18Z4p8KLxRFWYcpj32Dsx4P1+Dh6g
    GxIA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794471034;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=3Niw6rj88SccCD4L5qvzZ25l7kraaGkUSkwQV1MpJ9E=;
    b=Wbmdml0n/L6Ib4fEOIhB2/UJX62QuktS5erD+vEDBYDGHUxwBWfzCwVKkI7HTDV7fd
    ojWONxt8IQK9u9cFPm/cF1pYgsqcKNvutPZ++vNwvqSRJYwZmBfExiwWgaWkWLAYXPkt
    hDf/UzQ60UXedD7sdhcCLZwqum/6IUU1zSonGzLqnwhGOT087q3wS5vcA6fskqqelFV7
    IuVwXDoBIGejRC8GR6Liwu/Ak8fWrLOfv9+AM4KiBFhLgDEmtgud/iBF1gvW/1WPYX55
    OLVGgF9Z2i2gE3uRrMbqq1lzZa4Lbx5lV9tR3OmRR30pxbVGv7e66evAsEgKSMg42gHU
    XCPA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794471034;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=3Niw6rj88SccCD4L5qvzZ25l7kraaGkUSkwQV1MpJ9E=;
    b=PSOn0GOoDBRMhZeulH+x6sigzFZjCi4wYvqZktz1jQqa141CNbRNYMXrkfT3KQIoLm
    L2Jx6GEl6Nr04FAh72Dg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV35pZz8iNKp1rK7chac7b5mVucO+Qp4KTQNe8"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AC8AYAbc
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
Subject: [PATCH v2 3/9] MIPS: Ingenic: Do not force BUILTIN_DTB in Kconfig
Date: Thu, 12 Nov 2026 09:10:25 +0100
Message-ID: <fdc48b799f3c2f43a70236ef4d68bf1527facc9c.1794471031.git.hns@goldelico.com>
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

Remove the unconditional selection of BUILTIN_DTB for MACH_INGENIC
when MIPS_NO_APPENDED_DTB is enabled.

The current Kconfig logic selects BUILTIN_DTB when
MIPS_NO_APPENDED_DTB is set, although this configuration is intended
to prevent the kernel from appending a DTB to the kernel image.

While the kernel gives precedence to a DTB supplied by the boot loader,
selecting BUILTIN_DTB still triggers additional build steps and may
add unnecessary code to the resulting uImage.

Note that BUILTIN_DTB controls the build process, not necessarily
whether a DTB is actually embedded in the kernel image. For example,
CONFIG_BUILTIN_DTB=y with CONFIG_BUILTIN_DTB_NAME="" still triggers
the generation of .builtin-dtbs.S, but does not embed a DTB.

The goal is to allow a configuration in which no .builtin-dtbs.S
is generated and no DTB is appended to or built into the zImage/uImage.

Fixes: f0f4a753079c ("MIPS: generic: Add support for Ingenic SoCs")
Fixes: 15205fc05482 ("MIPS: ingenic: Add support for appended devicetree")
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 92bca520cd5ae..2135a69f9962c 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -127,7 +127,6 @@ config MACH_INGENIC
 	select GPIOLIB
 	select COMMON_CLK
 	select GENERIC_IRQ_CHIP
-	select BUILTIN_DTB if MIPS_NO_APPENDED_DTB
 	select USE_OF
 	select CPU_SUPPORTS_CPUFREQ
 	select MIPS_EXTERNAL_TIMER
-- 
2.56.0

