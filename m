Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793650578;
	b=zJRQyMgs2NvGLVV+yIsWW/7XRLXwVR6kr7PrNgXIVfOFaL2/hacGticIeH6M427SbCkm
	 En32EBxNF2qtR4Img53Wyqo7Y28zMMPbcmWNggKmC7u0ogv4+9QxMuCNBQp86kYIXz1ix
	 apvzMfSI7TaJC8gDXBcvyVDfTF1czRJT/5CzX063RPPkFUiVfh813pjliIhQDuoGNBW2e
	 Okh7kgnO5mF382gWnn2P1ymA56bk21Q4atsvrtwqNT/fm4nGAjt3uzTYsyABaWHV2Cwvn
	 sjU5BPPq0ZaHOnp+5St+KlMcGu9gNuyP9Y1wpDzC4daxe7W/7t3r5g2bYVOKCWL1NsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dkGbvUDyeeZ1ewkhAMtnGT8VJqpJVXFal/OdRewYEcs=;
	b=q09nHn5G/h7iqsuEKMiafKI5/tfXICnKow5Kd1jEVyDTFC5JN48YqqFUJa4sooN2uXTK
	 loJdd+Llx6mgqu4VRcyDAG3KPwGtmkkZcG9rHIw43QwhnVmL3Y2x6qILjXvQL1N5rCSVt
	 9DsyR2u7eEmxClUp0AMcXNOQ1THQPIIS1XdKGxyDmATNkJscak9XCGixal/qEAVLo/T0c
	 u3bPyrsL4Y4m4R87BMuLpRIy5R7XXorjyU+LB/Xks8BBPP+b4KsPjdeTXNc8mYujs6GhK
	 SZ+ewP1zvd6T8Ed0itzEgJk0z4bzJIpV0etilVVHVXBdxBrTrDdViAHhC0zlhXxH+4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Ph8O0va6;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F99606A336
	for <linux-mips@vger.kernel.org>; Mon,  2 Nov 2026 20:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68F99606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Ph8O0va6
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so17813245e9.0
        for <linux-mips@vger.kernel.org>; Mon, 02 Nov 2026 12:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793650576; x=1794255376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dkGbvUDyeeZ1ewkhAMtnGT8VJqpJVXFal/OdRewYEcs=;
        b=Ph8O0va69qi5KtzeMAZfOR+XDswm9owVaSD7cGWwAQOJ96+cj8DyDmSW9R9AqpSRi4
         qSmxp5fV32iyNS0bzLuXiMm6IDaPiIah9HKWcvPAspPHdsBu+4ga08lN5JkARu5OneY+
         WtcH1ltRJI1RFnuHq4mqfFog7/KanXx6yxLLcYS+/YiINNRA99O5eekCF1o1hw8+KROh
         fyQYMFqDXUnzrsODZWc+ntNXOGuWG7+3u/aocO/UAbmc62K1R464txfBlM31BxpZ5BfL
         j3gkGR6vZ1v65LHnizKzbdOttle62TxIbDRLXj4tPqG8eWMB0++KkAsyZeaRiBaMyjD/
         cC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650576; x=1794255376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dkGbvUDyeeZ1ewkhAMtnGT8VJqpJVXFal/OdRewYEcs=;
        b=c7AnD8878XebbCpDgcskv1dxuahGh8/RatIgkDsXYxj+/kh00CjJZFN16GLTHIPe8+
         vo9u7Gn5AlwiDCU+blK0SyAe8WeoYZdz1W+NU0m6BjzjzMpxYvOkm29QtZtwG+gIzNN7
         eYdash68WvvEQp2/k30fhU2cUUWHRmlOkXWKq4lCvrT3ynwCT/3jD2OuMrno3zjqmC6/
         uwCpi2b9Tr+On+eK0+Vmv0VvJ54DIshZAwsYLTbwmx7G79+J8hRriT/D0YcP6+j2A+6v
         ho/P+YwUgwstEasqQZ6Ks1h5/wTE+LD5BHwjZ9so0bw6qD/xUjO8W3uEHsLv3qiiBOnP
         5JeA==
X-Forwarded-Encrypted: i=1; AKwUvBxPXDd07oljuLyIZOCxoZP7rtEsZywGONllvQ+iAm+3VZvHE6GNdPXFl9GnGwbVP0jDvzjHDW/TLIWg@vger.kernel.org
X-Gm-Message-State: AFq9FYIL3AJnVM0ZZML9JT+ipfd1WtjgkKXKLsycHU+c9c3DZPjA5os0
	ykf+7mLZg+fWLdm5TpQbzZi5Oq3eIyD20BGqLtSHholGVfaeN9deGExMQmNPufXakus=
X-Gm-Gg: AYBFou1CEygVM+atQl4CXWE4H/tuozZ+lpK2rhcgKQ2GsqXMd/Dp0sCLAcuVcOJiFry
	5YFqRDGDsGsavKFWaosynRUTXd8541n9LS+o4c2LP2b373M4PaN2daMcB9PlaOxGePpbr2ChV+t
	OS4+4QYCfEmx1h9jgtn3RROqmDexECmzOydF8oHUmx8sOxRzAdn8KWYBWJC54ZpRRrNVhN1wx/T
	/MU6rH8+gtJWH93Yfn/MyzOUJcxLExX3WHbksSHkW64XZxQULhyq79FDfclpux7EB91DT+DFTFg
	bnJTVXmH4PvKzx669gooHjjkcEj5qgr3LxHHgDNDW211lDIu+wa81hzdeTbCopefKSpzkjGXg9c
	X4CS9VFE3KtJ2q+VRP9ADxe7lDgpQ4BsA+rQqCbsxNh4REN1JZbYX8XnEgGAFWHlSG+JSQCu1ik
	c9CL3q8kqndo5+dLLmJYKSnLHhnL2JS7qE26HXUJQ9vuSd5ON93sMmTIwA4ntAjhjUZmuJ+yf5T
	jUsiwkEQTZQFvzTNPeT8DoqjB0exRjBvq2k0aA0hKRuthv42rT4ZPgoss50Pr450MgQxtnG/mct
	oczCeVGBQSB++Kt3T5dgOF0JmR60Y5+BB5cAzhaFg7i0tB6wsP+JMc7puM9r
X-Received: by 2002:a05:600c:4752:b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4ac18e5d4d0mr269807015e9.29.1793650575803;
        Mon, 02 Nov 2026 12:16:15 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6412:7406:ded:3229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac09bcc967sm220013905e9.3.2026.11.02.12.16.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 12:16:15 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3] dt-bindings: serial: ingenic: Add the X1600
Date: Mon,  2 Nov 2026 21:14:59 +0100
Message-ID: <20261102201459.49284-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

The X1600's UARTs have the X1000's registers and 64-byte FIFOs. Add
ingenic,x1600-uart, with the X1000's as fallback.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes since v2:
- Drop the driver patch that set UMR and UACR at probe. After a reset
  the X1600's UMR already reads 16: the 0 the manual gives is what a
  clock-gated UART reads, which is also what Nikolaus saw from U-Boot.
  What needs fixing is a value a boot loader leaves (the HiBy R1's sets
  8 on UART2, its console), which is the boot loader's business, as
  Nikolaus said, not the X1600's.
- Move the new entry last, sorted by fallback (Krzysztof).
- Add Krzysztof's Acked-by.

v2: https://lore.kernel.org/all/20261024220712.23250-1-olivier@mgcrea.io/
v1: https://lore.kernel.org/all/20261024051515.55639-1-olivier@mgcrea.io/

 Documentation/devicetree/bindings/serial/ingenic,uart.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/ingenic,uart.yaml b/Documentation/devicetree/bindings/serial/ingenic,uart.yaml
index d5f153bdeb0d..0c452f20e103 100644
--- a/Documentation/devicetree/bindings/serial/ingenic,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/ingenic,uart.yaml
@@ -35,6 +35,9 @@ properties:
       - items:
           - const: ingenic,jz4755-uart
           - const: ingenic,jz4750-uart
+      - items:
+          - const: ingenic,x1600-uart
+          - const: ingenic,x1000-uart
 
   reg:
     maxItems: 1

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.54.0

