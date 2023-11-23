Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gH30Q14/"
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45D371709;
	Thu, 23 Nov 2023 07:27:08 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5506EE0009;
	Thu, 23 Nov 2023 15:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700753226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YxBQIVfB/3LFTfuDMg1LdYvc5zsihHEyj9Q9WPYYQXw=;
	b=gH30Q14/dAn5j9eFyOQ0tAHqdE0Gzuml2tm6LhVXJ2e9wGOFzCx6wxy7RTnj+prlaM9EaT
	24yA33GHBSM/F1/Jg+b3j6oHzUpCS5JyGHOl8rWfsm1G8JH+itfkMSVEwcyd3bgdS19Y4R
	PpmUnHlSNFgP5RszIpGcnmcUi4BaYtauK1eroDUC343oGbDZcch+C81fz6FWtFaySa76xU
	C9NfP7GYbnBXp+gc7jHEuwxxOJgjihDfliBzJcrtDy9AguqyZD6gPCnXzuf7QTbA+nANAU
	cG/taaNvO2z3HC/rjJZQR852ddQVCGG/ZQixt2i5EwwbJmtkU19owdG4hFnJqA==
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
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 15/21] dt-bindings: mips: cpu: Add I-Class I6500 Multiprocessor Core
Date: Thu, 23 Nov 2023 16:26:32 +0100
Message-ID: <20231123152639.561231-16-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231123152639.561231-1-gregory.clement@bootlin.com>
References: <20231123152639.561231-1-gregory.clement@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gregory.clement@bootlin.com

The MIPS Warrior I-class I6500 was announced by Imagination
Technologies in 2016 and is used in the Mobileye SoC EyeQ5.

Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 Documentation/devicetree/bindings/mips/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mips/cpus.yaml b/Documentation/devicetree/bindings/mips/cpus.yaml
index cf382dea3922c..b5165cf103e94 100644
--- a/Documentation/devicetree/bindings/mips/cpus.yaml
+++ b/Documentation/devicetree/bindings/mips/cpus.yaml
@@ -39,6 +39,7 @@ properties:
       - mti,mips24KEc
       - mti,mips14KEc
       - mti,mips14Kc
+      - img,i6500
 
   reg:
     maxItems: 1
-- 
2.42.0

