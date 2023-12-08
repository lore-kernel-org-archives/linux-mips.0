Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DIUQTvSt"
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EFAC199A;
	Fri,  8 Dec 2023 08:13:06 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CBB351BF207;
	Fri,  8 Dec 2023 16:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702051985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gZ7oKcw0eqw6lprpX+dDIOb31hPprI1Sem1ITgrbMiU=;
	b=DIUQTvStCYaZCDNw2BKwsppgi1MyThi3GXWMjAyOLJJcwJ1m9PBM/Wp3Ejk8O3M1yW/GyM
	L1iAWLVv/mfPfz9Mpw5TYNrR8IPlI1ufz3IFJYsHJBJ+prBBC2ksd8w0il8iLz4b/pjZST
	Gql0ivCMa8Uro6MxN4mWqBGHGIPTyQPVqbjrTUOH8mRfLPtQ3piR1Od92HRv7NPmZijJdG
	o+Wlbo7zBRFgGFDMp3yZ9pn9J6hT/DxlzvX9+LNXNnh6M36L6M6Y2wppmMp8Kw418Y9jsw
	XyN6lDHf80yBU9EPMa4TztePaWc/nJ3RnW6/RJsDXu+V8U2bv1jTGm7WlLCJcQ==
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
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v4 14/22] dt-bindings: Add vendor prefix for Mobileye Vision Technologies Ltd.
Date: Fri,  8 Dec 2023 17:12:30 +0100
Message-ID: <20231208161249.1827174-15-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231208161249.1827174-1-gregory.clement@bootlin.com>
References: <20231208161249.1827174-1-gregory.clement@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gregory.clement@bootlin.com

Mobileye Vision Technologies Ltd. is a company developing autonomous
driving technologies and advanced driver-assistance systems (ADAS)
including cameras, computer chips and software.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 309b94c328c84..b45279bc97c14 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -897,6 +897,8 @@ patternProperties:
     description: Miyoo
   "^mntre,.*":
     description: MNT Research GmbH
+  "^mobileye,.*":
+    description: Mobileye Vision Technologies Ltd.
   "^modtronix,.*":
     description: Modtronix Engineering
   "^moortec,.*":
-- 
2.42.0

