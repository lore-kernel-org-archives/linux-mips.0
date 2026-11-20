Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795206681;
	b=slSVgreqJ8uc+A8WzlCWbI4MMTWymhuJN91XGFo/vtjclZfPi0ci3W+31NM5Eq4sQnY9
	 ZnexJKZm4Tf6xLPw4o46TWCUu6tmA44+evnF4+NVuLW1lcVAmjjLG7okIgjPCaXm+r65/
	 FQkaucDTOud8j6mSOi0Cj2Gqt8zsmV2TbJqt+/q1xFnJIGpvt4VJrJIq4bauJgay13Bgu
	 f0C8YjgtQ+mCVmsQfOMJi1qpltBXBwGVGYg5bpMzkDSNdpY1Uo0vsuwvk5FEBrXv3bJ2b
	 7lJ685noeniESqmu3dd6C1bv4HRpAEiP5eKDB81i+ZHxU0OcirBXkNhstOlaG4mjsPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795206681;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4zRAvWGJX90y/LPem1ksgOXfZWd70rTEihHErfZFz1c=;
	b=sR5c1rLCl95OOl4t9PNyJMscoIFoRiS+RvN0fmbN1h23ie1LCvnoRn/TUsc0u4QYvuiB
	 nu6lVoPxXsVvt5KHTS0gIyCTryAnjLlMFn9nrcuauAxzGP4h7jc4pNtEIl6NzP8J1erI8
	 CqcWKNRlJp6a15ltFAwUoF0X8V/vzdr61nf4ezByAx/2fBlQ++iC5qsX0ly9Vrx24P4g0
	 vEo7EJT3j2vIDRqgp0W+rvOmNI96AmgOudUb9JrYdFQ1xe3Bls2HDpidP5+QV5U77sBLD
	 nBGEoG/UM7JR2fj8/flAl+uTha3/qfF1JsyCUOzEXSJ2xRkraTd8DDzGbkLuQnUY1lA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KV81EGr2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37D3606A6C1;
	Fri, 20 Nov 2026 20:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KV81EGr2
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795206681;
	b=1TAE8sK161Mb7g8BhvR7WBaN02zkugYqIdIaZcuEup/GagRD6KQVlVsvaHKx9h+R4qh7
	 edi4NaHxr4MNB4ESefdkX1ceHI2i9mIY0iq4ejhtY6h2m5jYsWU7+ROmTFuXjUzjvLv6R
	 IgvpHMF0Sm913NKjkxIG26gfcHKNdCpRuqgTGz6U6TWlHHV+L/G6QhR/Ee6TbKONSkdUH
	 80k8vVM3/O3uaT8F/UWMiBLcNiFmg/PQRJqKEPgwb55MGo0YOfXMKwjS1RIt5LxOXzOCv
	 StLhD9dhDo42qyEuKk74Fx3VC4H1kdA35W7sfc4QtkSgMpAH5XilViog8ITV5N9oYRw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795206681;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4zRAvWGJX90y/LPem1ksgOXfZWd70rTEihHErfZFz1c=;
	b=kbwGS7oQVpqWICHmVs7m99wjB0pGn+L/8sHCvuZAEGnmchQadVLtOuvpBKk9+kSNZ7DH
	 jDPliQbq18DtZFMJrCDd62JYRtHv9mPh2h+O7/X99Kq1pKui4OJU+9p9qZa7JzXYpwaKh
	 74nt6LnbcQ6USvNQ1d9s4We+Fut1b3ternvhYIolEDwGsg/hqpX1nHLo/MUJHuZ6AIRuw
	 06cLOwoeLnsqvkhjAHlomddcMUQToZ/RGpLXmBo1DbDpCn1pLKP4NAQ6D4IxdNZUdQPPf
	 eTNKmmHN4j5umG0uXKWgUZg+xB5l9VeSMrVVUXj4gq369RyeF7+1bGhh+9Sym413y9Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 772501F000CA;
	Fri, 20 Nov 2026 20:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795206681;
	bh=4zRAvWGJX90y/LPem1ksgOXfZWd70rTEihHErfZFz1c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=KV81EGr2KTzp7J7pefFxl8DO48f1D+AuI8EWfjDuA8Xzj80KRmbp7CdqL0Xqe+j8f
	 wU4RwQ3apB4meNUQvVNpRo7/UlsB+pn5UfvWVWwZqhbE0O2O35u/ptnYmp4AOpCrUG
	 A2QWBVARKn+mFP6is9i3uC3qv7mDZUeAZlAT+3JVDnEQ93yfG162/keEZX2NuNObbm
	 mDDKkkZccMB8roQ25z73TZrUKHv2dUYHBTkVFaf89zFyWFco3lztbgp3TmiBbI5aoA
	 hMo6eMZndlhsZICeCPPxxKUpzpBijn9Vgjrf5vhks6+6T3Imv4XlHVlmh0Nkcey7Wk
	 Cfb9JHv2mdp0g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 055484B9F4;
	Fri, 20 Nov 2026 20:31:17 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Fri, 20 Nov 2026 15:31:06 -0500
Subject: [PATCH v3 1/3] dt-bindings: usb: dwc2: Add Siflower SF19A2890
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
Message-Id: <20261120-sf19a2890-dwc2-v3-1-de377bd408a0@telaak.dev>
References: <20261120-sf19a2890-dwc2-v3-0-de377bd408a0@telaak.dev>
In-Reply-To: <20261120-sf19a2890-dwc2-v3-0-de377bd408a0@telaak.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Chuanhong Guo <gch981213@gmail.com>, linux-mips@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795206676; l=864;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=w+QiNRAN39ZqxwzT8eL/SeZFAxcNqrljvHT4hVUBrPc=;
 b=+aanc8SFiEJySAcjYFTPjNa/h7pkwT4ilDA6rSZ97oWc4EJ1W2leT/yP94vOE2SajMrcmbtrA
 9DkBL5QMdRGAu2XkHpWWSnDHcXthaUKOn+L3zICXhcZb8m/eV1AOGKb
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


