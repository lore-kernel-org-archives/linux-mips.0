Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794385589;
	b=Ma/VrSCN9oKsFdZUvFybQXqzM6urfUzCP5+e161YThEv+Kw3euBG7zB6RiBTeWwBID8D
	 q5QI6SBjGHaN+cFrPFIaS43F2mvbEKFoMx3WFK+8RZ7+P+jKwjYMldq2e53pJqc8RroPo
	 /4x2BeI4zJcYgfkSxdHFLAz8RCtZc2BF/FCjiIw87DkYAxJsAoS6LWjPlIDNIppkPwADs
	 UIm6MFVA4sp9JBZHOMzidfZiQHOhw91Z/wiYTjVp+ZKiLOO0BlZrNPJ6lZJH8AHWlPXX8
	 Dv846mpmLHHpi5M2lmgso5tB8G2NzMOsToaWjlGHP/EVSu1JJ8KGDExU1tQJVwWgkrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385589;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4zRAvWGJX90y/LPem1ksgOXfZWd70rTEihHErfZFz1c=;
	b=GDJk55YJv8zF/TP8EjD7qiMmNMPgZFQ/eHZGlOz/QHtFqGFiNaDTbcfDQtoP20qhUBCX
	 1wBn7hSklYAPYvGroY+lu71zD7r+whOCPsPf6845coG3uYnhyePSx31HYmLjpRMxRFcTz
	 CoSsLgW6epSo4ubHlM2HqX6PLbCinhl0yJI4dVmgOh40q3BFXDH2zwWyrb0ZpO2GP+Wuh
	 HDYq55tukm4lKUZ/qW+BwW3rbhV10i6CM9RX4jAA1P+9pkrBXZp+wCegqhmsa4G60KWkI
	 ABmtGYZv0nMsk8oT6ZK8QXzwzfofHuS9cbENNxdphUQjSIIKuJ0EZBVjb37Q/QlrpIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="XTW/sTnt";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A699606A320;
	Wed, 11 Nov 2026 08:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XTW/sTnt
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794385589;
	b=MdV3KtHrCoKwyG1rk1nIxAen8KmMLLMj6DddeXPDou61LVOwDee9X3OTP25wc2rlw6rF
	 cuuox95jp8ZGZkaafhylXFk06jJX2eqfglaZTZ5spiYDrXWh9FOtIhhtkTkaYt47UgTIH
	 n6ASLi8+pjbRgwBEkTTQcGq8M9QrO7FU7EVF2WvgyM6eg3Q0c7o73DldUpiC7uPNjx85R
	 jeG6OY1bnDp8bcfDMsp/YOar9Nx5ipl4bgPXwJoc6rmSyAa/2nY/hZF0ea30uH5EtJORm
	 QV0PjL8yqXibWY86/upZ92PeK04vb8y85HltHJI0nFDOcwBBZemgJg1RK27nQvdgw2A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794385589;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4zRAvWGJX90y/LPem1ksgOXfZWd70rTEihHErfZFz1c=;
	b=ojHeQuXvlvhLEZ0Me0In1RMGGWcLKKRujpXT8aUNSKPtHydjcpgmqPtkaDt/UaUSQ+X6
	 7MR96rVXSJD0DRiwoqOT61h4kpUqsJjm3cQijz7gPrsCke5fF5qxpXwKLwzkZZrZ9h9wa
	 k3V/6h1o3qARI5nSC8tgLsU0VhzIDQGzpq0APHmY4U45cYQvVyKVka2BkolU2lVnqOKrj
	 RroVjbICng1NFcVPLHZfi6umuXMqGpWTUmPzICFoqxP7MsBkRG72MmyYsr6klntDOgkQy
	 SOvjniiicYnHm4mSWfqFwgBNtv63Zzjehgc+UOUIRWF3gHsoCoyOA4+Ujp+c9BkOmkQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 064F21F00A06;
	Wed, 11 Nov 2026 08:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794385589;
	bh=4zRAvWGJX90y/LPem1ksgOXfZWd70rTEihHErfZFz1c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=XTW/sTntNQrkgtdOE/JneRHY1aNsL+1TA92K+svxpJgwu+XC9ZLbSLHM1u6D7SWPA
	 DsQkO034kecRH7fiYEN0PyJreXYkbjxRihFRsRJEc2GebT1IznwGt+T7UepIHjNn/s
	 krCbEi09tUxoE629kOk/gyJUkUPiutSwEOpr/2cwwY5GBTayXyYyyk9YD0aYukQ0E5
	 tFJtdF4aKJtUiyVr9vtgK6XpjSFWBDgnYRVNETfHJmDyhlUaDQp/txu9wVG7aob9o9
	 Oqa23DWoYXGK3/9gFOfrtkc2whUbXSHZc2pvCEJJIJbP0x+U3PoAOoy08ZDf8a+tE1
	 lRHOa+V/NUlyQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 67BEA48E90;
	Wed, 11 Nov 2026 08:26:27 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Wed, 11 Nov 2026 03:26:01 -0500
Subject: [PATCH v2 1/3] dt-bindings: usb: dwc2: Add Siflower SF19A2890
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
Message-Id: <20261111-sf19a2890-dwc2-v2-1-cba9dd4a4256@telaak.dev>
References: <20261111-sf19a2890-dwc2-v2-0-cba9dd4a4256@telaak.dev>
In-Reply-To: <20261111-sf19a2890-dwc2-v2-0-cba9dd4a4256@telaak.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Minas Harutyunyan <hminas@synopsys.com>
Cc: Chuanhong Guo <gch981213@gmail.com>, linux-mips@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794385586; l=864;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=w+QiNRAN39ZqxwzT8eL/SeZFAxcNqrljvHT4hVUBrPc=;
 b=8QkyI4LlP5b0EciBNyD36T7kWuEd9PUdnpoj9mCFmX11f/b6sb2evM7GFP3PqCNSdhpHIPgmB
 0KHNbY8ZF1gAP59Kt02Rz1bzUCwGohqJZripDzz2URbRYdnIXAdPJV5
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev
Content-Transfer-Encoding: 7bit

From: Joseph Telaak <joseph@telaak.dev>

The Siflower SF19A2890 has a DWC OTG 3.30a controller, with its own
bus burst limit and an OTG interrupt quirk.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 Documentation/devicetree/bindings/usb/dwc2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
index 6c3a10991b8b..3b4763f476ea 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
@@ -58,6 +58,7 @@ properties:
           - const: snps,dwc2
       - const: amcc,dwc-otg
       - const: apm,apm82181-dwc-otg
+      - const: siflower,sf19a2890-usb
       - const: snps,dwc2
       - const: sophgo,cv1800b-usb
       - const: st,stm32f4x9-fsotg

-- 
Git-155)


