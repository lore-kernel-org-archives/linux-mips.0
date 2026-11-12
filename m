Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.167
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794471050;
	b=XFUpMrvOh/ThufveiEPNoqDTLQGF+FJss86i+Ea7cT6e4cZWHHtuXxq0rtQqMjeQTV+1
	 0RLkLzGsaj/Nog7vP6K9FmrV6NHrVpjg6RfSPSQD33yMgbq+S/VVplbG/gf7vqk8ogNnX
	 GnptoipepdSNzJvUrQ83rQ9E+SuNtLpUViMgR1DRrG56UrgLgBfhCBnanalU6c7+rI7uz
	 RQzUuH0RdEqYudixf4xAhmeYpVZToBwrJaF0nlQ+TcH+eacAw7MBW10cx9oyaocpf7HTR
	 WXCRlZpW0wqBo2TzKxaWsXw+f46lgopXFFkWnPLhHop0XrpcAHCsqJ7cyr0E9Z3y3Jg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471050;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=J315p/nA8/LIK4s075FbW43IkpkxmesS70y/K+NP0lY=;
	b=c1WtDai6ADua/6Jf1VUG7wQcy64Okoa1ktlI+QLGVbfhg1zAqEXbh8qpJn2CMZmKfRf9
	 HKU/YhBu3Mvj8blmzsrc3isJ0Rz14LGBYXaj3dFumYnBEO0wneyF0sHSAMxDfD+Dbfs6H
	 KC1JjwdXtqNgDruqMS/1y2ImdH/Vhbo8oKXaIvuukTWcgOrzqr1/EhRkHzRjxOFtYymSr
	 2fxvA1RgNGSVXefLzmv/1p0s+p4TcWB0eD3ng6/Fd5pigYWZXHvM08uA8RQ54Oz7GJ23L
	 D1R8W5+v+LpgP9gdH0TaytbIaEPW/c30TI9up+B3Ma4fnwp8Fsqfl/78d/w1h0kTSng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=YwDxyaF7;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=Ot9KOqs5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.167
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9241C606A33F;
	Thu, 12 Nov 2026 08:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9241C606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=YwDxyaF7;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=Ot9KOqs5
ARC-Seal: i=1; a=rsa-sha256; t=1794471034; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=d/c1kRc/Fia6jXd7mlJilvj/OrXt3y/Z8wzz5CkEg28s6PmPyXCh60+xFJm4L6+yMJ
    frfHBkF8XFn5hUb0atwQFR008+myaDzHpO+SbBGzLIrGZX+i7eL1CyfnNylYY0eTWBEo
    oX1Y2Mp0BF+0/6WMSEw61ZxKijTuHjQBWBwXkylpTV3AFdKjRV3nX3+OygvHQ4YXZWbX
    7d7Nq6KS1bWkOLHYyQhPpPb9IRuFpvaUtnuxSH6OGwTQKnTcpD/S8k6SxkrwCZsAoqrN
    TaDbEYhbSpHMHyfxt733WhR0D7S2NKZfvwXqRHQriLWb4vBg1k5MH1W12Dj0OuPCnz+U
    7WFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794471034;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=J315p/nA8/LIK4s075FbW43IkpkxmesS70y/K+NP0lY=;
    b=s6gM1bBL1veDAuLCH8Z9JFGI2d/1TrsZK3bSec0fEWyIXnsGYQtePHg9UQz6E9yAPp
    zDr8Hr9e0o0TG/bJ5e+SSi53dpxXv5WKqSxJU4SHelpuHqUkSUhuLI1i7SF4qxqDItg6
    wmBy8ZvoUpVq+mvafXEXXu3xRjWpeWUmBAGmxujexwYSZvDZZB1ayCoZdE/d79YEIe7b
    bM0Gu8tvCEMXGtJggshOeaSsKUVzITBfEM3WmtkDHVfb31MCaNU3c0nn+Q65k5tTXJhi
    A+XXw9JG9RQRQpFGZFNrFcxd4PpJinbS5frXrI3IiRGMs6NHuU5zAH4d9oWPGL6yuMJ+
    IB5w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794471034;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=J315p/nA8/LIK4s075FbW43IkpkxmesS70y/K+NP0lY=;
    b=YwDxyaF7is1ZI4SXLSdydE2vsHr49aoVhkZrQlLmXqt9fz/bo7HEFhz0XuGxhRFQPF
    ubLWHE8BGL5kA6wvizU50tMgjymuwQP7tnShy35XjXOuG8ogL+p/3Q4GeWhAIFgBGfFZ
    ONu03HzKka0pzhdGXV39QPfPQdBLf19kzKgdY3kiRUNxFY8FAI3acBpCev/JOQBoOOpM
    tOjMUe39HJc6czJgxvpsgrhfgH6ot5VHT8ckesRHaiq/eQVqmW9DrnX4QU8S7wUtj5YB
    yIhmP3MIkJQGPDiTOkAG3OvvSsm7veDHm0j3/Hjkl/JSXclYXxaP+AXQa5+C7kS03zQ6
    jUHA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794471034;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=J315p/nA8/LIK4s075FbW43IkpkxmesS70y/K+NP0lY=;
    b=Ot9KOqs5OnbSpdPKLDtl3ewoBIB/2fiHgp/5Ww6GWHaebq14UVfM92GE0udzoGjw4C
    GeFHYsjOcclV+Mh/0xAw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV35pZz8iNKp1rK7chac7b5mVucO+Qp4KTQNe8"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AC8AXAba
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 12 Nov 2026 09:10:33 +0100 (CET)
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
Subject: [PATCH v2 1/9] MIPS: Kconfig: Allow user selection of BUILTIN_DTB with description
Date: Thu, 12 Nov 2026 09:10:23 +0100
Message-ID: <873ebe259b8534fdb3a6f8a926cd16d1aafec74b.1794471031.git.hns@goldelico.com>
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

Make CONFIG_BUILTIN_DTB visible in Kconfig by adding a prompt and a
detailed help text.

Previously, BUILTIN_DTB was a silent option forcefully selected by
certain machine types (such as MACH_INGENIC) whenever appended DTB
support was disabled. This prevented modern setups from turning off the
built-in DTB fallback when the bootloader is fully capable of passing a
dynamic DTB.

By adding a prompt, users can now explicitly toggle this behavior. The
added help text clarifies the distinction between MIPS_NO_APPENDED_DTB
(which controls image appending) and BUILTIN_DTB (which controls the
compiled-in fallback data and code path via get_fdt()), as well as its
relationship to BUILTIN_DTB_NAME.

Suggested-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---

Notes:
    Help text and commit message generated by public Google AI.

 arch/mips/Kconfig | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index dac3ec5120a34..92bca520cd5ae 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2924,7 +2924,29 @@ config UHI_BOOT
 	bool
 
 config BUILTIN_DTB
-	bool
+	bool "Enable builtin DTB fallback support"
+	depends on USE_OF
+	help
+	  Compiles a Device Tree Blob (DTB) directly into the kernel image
+	  and enables the kernel to use it as a fallback during boot.
+
+	  This option:
+	  a) Links the DTB specified by BUILTIN_DTB_NAME into the
+	     kernel binary.
+	  b) Instructs the boot code (get_fdt()) to return this internal
+	     DTB if no dynamic DTB from the bootloader or appended DTB
+	     image data is detected.
+
+	  Note on MIPS boot strategy:
+	  MIPS kernels check for a DTB in the following order inside get_fdt():
+	  1. An appended DTB image (if CONFIG_MIPS_*_APPENDED_DTB is set).
+	  2. The built-in DTB fallback controlled by this option.
+
+	  If your bootloader provides a valid DTB dynamically and you do not
+	  rely on appended or built-in DTBs, you should enable
+	  MIPS_NO_APPENDED_DTB and disable BUILTIN_DTB.
+
+	  If unsure, say Y.
 
 choice
 	prompt "Kernel appended dtb support"
-- 
2.56.0

