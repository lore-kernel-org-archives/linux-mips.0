Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.104
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794471051;
	b=SvsaLaoLLALUvwC5ZQo8lb/fMkznbbXqtRunRq79HGZBuhouiTCFneX3BfjKblPDmOW9
	 DJhR76n6PHiL9ms+bkr5zvxIms0UfY60thT4njxMbyLj+5jCOll/9LpXd3eHbYosbC52r
	 d1Z0AEqkEYrLQEJEXHcz0NOQZybNazIZm9YvGx6k9ZlSQ8r2RS+lsKahH8jbjKvfDvE9M
	 BQENJkfiPM8mQSxONXwtzwmaz8oTWIuUb6/38dPx0sv37Z0q7FBEC8g7XwrGXajiE4M1x
	 Az6plhjS9AFCV5/jUEJuMMlyG/kbGIvXRn507OqVLhCaIJ7lAei3P/VONkdHDjJ16Zw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471051;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=1kOQr3GG5QxY2CeCjY5dbSkzjnLF8IxSHa2BVVqZQMU=;
	b=lCSiG8a0Rh4XpbcsNfppeTAWrJ9CjyreqkU/27IyDNNYNhOBnUdgJINaY3lKo6fDUhdN
	 m4IF/bNXJ1i47lXxqFd4mzVM3LbMZSi9HrjooROuE3hq+CoaxPqVqLls8XzeGdJqpJALu
	 XTVMlSZ4HI14gsEXBxcB/4aYCrQ2JDAiqxo6Rimcz+tc/vEiJ+vAZRREu6qLIjCa/Y6ut
	 hnNl6fc2id/HHYhhoJSPAmGs83FmbznAwI3Unii60ibeU41tP4fw/cH+hRjV6zAGFbhIl
	 N2pBY2fass1GZM3/yZeGb5P0T93InRkOnrtNog52djQluYZNbRBAbgerKhdm/D42Mvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=WHU9zEox;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=Vq7OgT4G;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.104
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de [85.215.255.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFD8606A885;
	Thu, 12 Nov 2026 08:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFFD8606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=WHU9zEox;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=Vq7OgT4G
ARC-Seal: i=1; a=rsa-sha256; t=1794471037; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=EPGsedKOJpITiKcAvTsJZzwcJKRzD4Rx5aDrmeSN9ZkX4QiyqrPhUQ/NvDgCuFR98T
    dYuJwITP3Z7ETzQTmrBtrU/HlvB2Y+W7C1sI7sxbCGXaLc21aQKpuU6WmUh312VWMWu2
    4P78p3cp5d/GwSki/K3Vvtu8ALy7O2P+qES3j4b/UTl6B8xAyrkoSwdz48hrWKkiNXde
    mDLx5OTAt7gNsydZq18Ymaofy9+DiYeh/oSaRm/ldgLQm9lE/rdL0DWk7UrO400Q9HrD
    uD985idFHpN41O7vcEKt/xMhlRIWMANrGRsphVH18bU+njiftFfBmBssUnbs51VlL+/a
    aTLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794471037;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=1kOQr3GG5QxY2CeCjY5dbSkzjnLF8IxSHa2BVVqZQMU=;
    b=UvW6eUOhGNunXUUJWgNE2C/eq6+LO3wR5+K1KRl2hu3aZa5AZFis5paB7mqpXb/iUU
    4cuHrUbCbjPjESjs3vpeeqSXVGynGDkmjjOZziczQk1B6rXzRcKTuYdeH0p2eVkkif04
    tBaD0iRGahaDwnUKqtHzeNXiPLAZsH3E/W5RG7RvxarvenaZ81Xv3JF8FqhgZZipNoJu
    nd5S18o293GdI0GsBEuqt7qiAERsbYnekB5wDDzu7ByFZ8FkC93t/aY6uJ5cKhhay5Lc
    Py+2Uhuqih8dGaybXoh/KMZjlz2zmW60O2GUauL5Zv9IcKedSvk4YeBnI8LA4UKLSOPT
    pXBw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794471037;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=1kOQr3GG5QxY2CeCjY5dbSkzjnLF8IxSHa2BVVqZQMU=;
    b=WHU9zEoxLsMAvvxGePtA3x84ZPFdqmX4De5TFNa6N8uxt1OjZdFCbgewOHXADXM8yz
    eJf1jgZILPQxwgNJB9Esk98VmCx4+dvC9gmUXII+tDHZUlGqeoOb8CKusnUmtgfnLNgk
    FwFMg2d8v2Pn/OBhOwgfutqP+0QlFEhWsBSsSef5IXmG5pEsQpGvPHNe0zjakwSjInGg
    80SMaGHvnykzoSBGRW1bNcGT5Z/8lUPVwObcXICGx4H5QxShx2eksrJfncKu2nXQEM1l
    3Jti7e/zdEhdOCTCVxQSST9KKHyuOeG7ZNtOg2pvOgCFDHJtm0QAjkByaqg/umibA2Gi
    rn/w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794471037;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=1kOQr3GG5QxY2CeCjY5dbSkzjnLF8IxSHa2BVVqZQMU=;
    b=Vq7OgT4GoySidaHrEFUALca1HCMqIV3DqIZX7C2/EDh5v6+A4KBOQYhuqnTkEcZUAl
    OO7CeIuf63zF9jtkY/BA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV35pZz8iNKp1rK7chac7b5mVucO+Qp4KTQNe8"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AC8AbAbi
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 12 Nov 2026 09:10:37 +0100 (CET)
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
Subject: [PATCH v2 9/9] MIPS: Ingenic: Add Platform makefile and load addresses for X1600, X2000, X2600
Date: Thu, 12 Nov 2026 09:10:31 +0100
Message-ID: <4ef609bd18c2398a6eb8242a73448c92a08ef9dc.1794471031.git.hns@goldelico.com>
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

Introduce the arch/mips/ingenic/Platform file to define the default
kernel load addresses for X1600, X2000 and X2600 SoCs.

All platforms are configured to use 0xffffffff80010000.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/ingenic/Platform | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 arch/mips/ingenic/Platform

diff --git a/arch/mips/ingenic/Platform b/arch/mips/ingenic/Platform
new file mode 100644
index 0000000000000..bffb4529d799d
--- /dev/null
+++ b/arch/mips/ingenic/Platform
@@ -0,0 +1,3 @@
+load-$(CONFIG_MACH_X1600)	:= 0xffffffff80010000
+load-$(CONFIG_MACH_X2000)	:= 0xffffffff80010000
+load-$(CONFIG_MACH_X2600)	:= 0xffffffff80010000
-- 
2.56.0

