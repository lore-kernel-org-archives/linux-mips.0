Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ch3z9zB4"
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF4BA110;
	Tue, 12 Dec 2023 08:35:30 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 48ED3E0003;
	Tue, 12 Dec 2023 16:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702398929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D5cCBpjLVQJIEyNHt7kbmGhJLdSXgsITn2458HFNHoY=;
	b=Ch3z9zB4RfHk6MKx0YDBteFeS7lmL3PQi6ptvM+2yfXzfwg0lvT/drOiiKQG0bjH5mLVpa
	cys/hkO9rn4Qc6k7GtEsdRdJYEhLHFJ2rTGnrgfdPvs+Gyq36bHYt5agBmyZNF69bhjXH4
	Tg5Q5rupmYUy2pYZFtNYVdfyfhQkY/nEQZDWUDI6cT0E6tcmMgnLMIPETXHXN8POQa45N9
	CSpu5Rgeg7C5oY2hOjUNYEIdQPRGv3pAGWHY0JIgl3Z1Cb54g/M+gxUpdc6H6rBqxlH7YB
	uiLGgwb8fDhiw+GEJovOacpEiIf+ABroJmV+BuEW5TuVLISbzEpluTBqFbELkw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Paul Burton <paulburton@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Vladimir  Kondratiev <vladimir.kondratiev@mobileye.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@intel.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v5 05/22] MIPS: Fix set_uncached_handler for ebase in XKPHYS
Date: Tue, 12 Dec 2023 17:34:37 +0100
Message-ID: <20231212163459.1923041-6-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231212163459.1923041-1-gregory.clement@bootlin.com>
References: <20231212163459.1923041-1-gregory.clement@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gregory.clement@bootlin.com

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

ebase might reside in XKPHYS if memblock is unable to allocate memory
within the KSEG0 physical range.

To map EBASE into uncached space, we convert it back to its physical
address and utilize the platform's TO_UNCAC helper for mapping.

Co-developed-by: Vladimir Kondratiev <vladimir.kondratiev@intel.com>
Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@intel.com>
Co-developed-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/kernel/traps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 60c513c51684f..230728d76d11f 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -2346,7 +2346,7 @@ static const char panic_null_cerr[] =
 void set_uncached_handler(unsigned long offset, void *addr,
 	unsigned long size)
 {
-	unsigned long uncached_ebase = CKSEG1ADDR(ebase);
+	unsigned long uncached_ebase = TO_UNCAC(__pa(ebase));
 
 	if (!addr)
 		panic(panic_null_cerr);
-- 
2.42.0

