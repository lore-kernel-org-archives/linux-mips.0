Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PiKtiSXd"
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCBD31B2;
	Fri,  1 Dec 2023 03:15:34 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0CE9B1C0005;
	Fri,  1 Dec 2023 11:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701429333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gZ7oKcw0eqw6lprpX+dDIOb31hPprI1Sem1ITgrbMiU=;
	b=PiKtiSXdSLw3Dd1sg2NW3yqg9C6AVz6V0TCkn0sKwzzETklgGqeayH4O/1M8ULLtHi4e0B
	CWMrawoZMS23XwQ+nhn2YDsJ/r0q6RHs0VGSCXa63VW41tRQDFXqFudOatW5ozYAcvGpFc
	rmElCZl/C86WhjHd7d7F0cGGA4yhy0w+cnyB2iSyJLDtDKa39OvwiINZpWQikHq6YwTo//
	Y8cXaCAIzyfqdlREp3vdWbR4N/G5LFUnBWeCYgWIsqQz6HXb465c8wXv4asmX7NTGWyB1Z
	5tf/UCSQi8L3e87vAauNncbcWI++SuHMiMGoaIz+1RjxVnhrT10o/8hzF3rIBQ==
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
Subject: [PATCH v3 14/22] dt-bindings: Add vendor prefix for Mobileye Vision Technologies Ltd.
Date: Fri,  1 Dec 2023 12:14:57 +0100
Message-ID: <20231201111512.803120-15-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231201111512.803120-1-gregory.clement@bootlin.com>
References: <20231201111512.803120-1-gregory.clement@bootlin.com>
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

