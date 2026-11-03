Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.149.158.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793748721;
	b=4xuHIJnWbZmPJiltSKm9DaehbursfKhi2ODOcbsyJ+su8RCVzotBIng6AShkyhQY/yrE
	 quB7XE1Tb6D5eLH3p+jsyk2lzFl+OPjsEt/K7W2MZJxfjvYDp4tFw4i/X0Z4fLl/yYQdB
	 D1/+EHWW/SJYSfVHmFoFDL1CUSybM2U6KqkL4EzGmyYAMCSW7p8qfmcJJbYfU9E+6unBU
	 VDDMjFw4lJ6oOVmnV+Xz2GTsqjJ8OU1jKQXzuJdCTlY4njrsFwbec6q05DXa/ZauAk3g5
	 hdy+ms2WkxUAlW989lZ0nU+13ofNtf22cV78cf/j5y/k7k2wg1VVo/LuKuOgv15qRnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793748721;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-CMAE-Envelope;
	bh=5TwtxIqQu0ODnlWlYZyl8HR91auT2msTqkhnq+s5J2s=;
	b=cVSzT2cv9fYunOOxmctoxFn3EG9xmoHsU4EbH+usKY+x1YHO6FEtqN73sY6TWYcB0UF+
	 rmmWPBcaM6Xib8mKHVtk2GSL+nahSwjqHJWMk+j2ssw3cOJhvPJunTlvATNIS/sG6ngwa
	 9hqprcOGAMV68L0lWwlgUScWsxZM33MWQkaWbwWguaV9gNSlGoxLIYg98hZJcoevoTgom
	 iKZryL2ySRtTm1LLkTfap3/iqurh4W0QStutZdZgUMGd06PwzATtykGpNwoh5G1urOsn+
	 1Vw7wKZ7qXvDpJdtbFV3jRLFwR4ObCVP6F7HiFHQreZ9Kf2DvpgSj6z4fUiHzgn2O+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mythread.it;
	spf=pass smtp.mailfrom=mythread.it;
	dkim=pass header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=eXyn75gs;
	arc=none smtp.remote-ip=62.149.158.101
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5C1606A326
	for <linux-mips@vger.kernel.org>; Tue,  3 Nov 2026 23:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C5C1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mythread.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mythread.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=eXyn75gs
Received: from [192.168.1.237] ([94.34.125.0])
	by Aruba SMTP with ESMTPSA
	id ONxyxz48a7fl5ONy0xPxBQ; Wed, 04 Nov 2026 00:31:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mythread.it; s=a1;
	t=1793748660; bh=jy4TxJx+XkHxidqNHZWr0kONqDYylxSFwLKFPgPJ29Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:To;
	b=eXyn75gsMqWFg7PA0cWRXEpQ+m29obHLc9Pxp52H8I5UzDLujy/vet7ObknyLRJkE
	 OmkWyiidd5VeqY5UNKsycNVkrslWiv2aqs55ZoPDAs6rjnEVL3MYIE+jr1KIdP0tvf
	 fHElrZ2qQnBVKcLIW4q5Btd3uk4Sj/HLWPX9DgiUUOBOQ7dbZFqDAZ/2fG7vZSTLXB
	 Ka6adaqGtFrJ4Tu36YgvEXNhE5xtJIymeHMfCMnfhoK1IO+GfCJ6Q9T0BC7caf37B5
	 AQhj0NsmcJijkbAFuycXnN9t5r22prYStvO5cW7CVm7lgbA8bJPIBFyrMCUtTHwEq7
	 djMg7KX99TaZQ==
From: Alessio Ferri <alessio.ferri@mythread.it>
Date: Wed, 04 Nov 2026 00:31:01 +0100
Subject: [PATCH v3 5/5] MIPS: dts: bcm6362: add the integrated WLAN
 backplane
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-bcm6362-wlan-v3-5-e46562b2ac12@mythread.it>
References: <20261104-bcm6362-wlan-v3-0-e46562b2ac12@mythread.it>
In-Reply-To: <20261104-bcm6362-wlan-v3-0-e46562b2ac12@mythread.it>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Jonas Gorski <jonas.gorski@gmail.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 Alessio Ferri <alessio.ferri@mythread.it>
X-Mailer: b4 0.14.3
X-CMAE-Envelope: MS4xfLWDrBDUKvvhcNNe9MMO0HHIKMwYxompXOafOIBhlEtPIIoWvXCyQZSvHbSGmqYsCoxWMu77D9cHuBts6PkZeg2NMtJDqit0VXJtAKyLZjyDc1LM2idc
 By/Jz97ZNjXcC0iIjzIKOlZ++Pztx5tqSfClusgSLQyv30iyrVuM1pZdhu3Dshsbe4ttlJhircL4ddxNP0UuJJoQZc9HilLoAvRyww1l9wFbPzrYoNAkBnbU
 ijQAiCyeszbonI494NAx4t1Ggj84iN8+jOeNU8GOd61qawXy6wCfWumfwcdcEtVNIt0UJgKXHboDauorpLj2u+nZpa7iqZk4P3kxtRfbqYV2WI8MRGstcPPn
 6tVekLknANu7k2KXavtreOIrg1YMsv4jR24IhtiVXlFXLjMP+XTURiqgKbiG0EdlRQJ/fP44a3z98qnh8gt/tSoH+7FAzVn672JlKKuXn0nKf0P3NBYpTwc4
 3FKqirdLleoaZ8wx9J7LLVH3IZYK7YZsuvmOnKffFExpSirs47VUjOHYk7G6Ik8uP33usAiQ6XN703sh++mSib43ZIFk2/cTEWf94pXUpHCzUitLg4JNolPr
 XqxAPp0g1a8qm8BlySKKnjLg2dAQtEELcG0diqtMy663EEXJ0sGJVTYoG4raI2ThnbK0QGxq9HOplk8T0vlyH/thdgw/m55BGXawmMc8PUwqyg==

Describe the bcma backplane of the integrated WLAN macro,
with its clock, resets, power domain and the interrupt of the 802.11
core. It is default disabled, boards having the WLAN need to
enable it.

Signed-off-by: Alessio Ferri <alessio.ferri@mythread.it>
---
 arch/mips/boot/dts/brcm/bcm6362.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/mips/boot/dts/brcm/bcm6362.dtsi b/arch/mips/boot/dts/brcm/bcm6362.dtsi
index d74021925c53..c6de39588840 100644
--- a/arch/mips/boot/dts/brcm/bcm6362.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6362.dtsi
@@ -261,5 +261,25 @@ usbh: usb-phy@10002700 {
 
 			status = "disabled";
 		};
+
+		wlan: bus@10004000 {
+			compatible = "brcm,bcm6362-wlan-bus-axi";
+			reg = <0x10004000 0x1000>,
+			      <0x10007000 0x100>;
+			reg-names = "chipcommon", "wlan-ctrl";
+
+			#address-cells = <1>;
+			clocks = <&periph_clk BCM6362_CLK_WLAN_OCP>;
+			#interrupt-cells = <1>;
+			interrupt-map = <0x00005000 0 &periph_intc 7>;
+			interrupt-map-mask = <0x000fffff 0xffff>;
+			power-domains =
+				<&periph_pwr BCM6362_POWER_DOMAIN_WLAN_PADS>;
+			resets = <&periph_rst BCM6362_RST_WLAN_SHIM>,
+				 <&periph_rst BCM6362_RST_WLAN_UBUS>;
+			reset-names = "wlan", "wlan-ubus";
+
+			status = "disabled";
+		};
 	};
 };

-- 
2.56.0

