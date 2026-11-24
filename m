Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795509935;
	b=sV+DrzJrExfbcnKobQjlNSQkVqdHmC9LDcI6jUfJ5y+ObNKLmi6Rh7/cErXXY1i9ciQu
	 YfEXKabY/FrOk+EcrFc0ZG2joPbo3iUmg/ZSoWUT+O+etI/fRreF6ba0CLI7jpO2RuXOS
	 UjRNnqilK/AzyHjAgLmfF1f3AsG0stX7yg/Ls/brxEgS1/qOJzPcK0o1WBqRjPOVJGvC5
	 tAWPxSipjQu0XFYSoqfBy4vE6g/LrtlnFBYoiZg6fH+UJc9HYp0NUXQvAjA6Q1Z4xpUHs
	 1aP09MWfV6/MouY7m9gXMxqxB9GWL/fEdGUeiDxp6edTe+wtXK97TKhZxMJ1XBuvEmg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509935;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fxSntwja7aRJzUm/P5tC/T4QpdH99PtJwcIFZb9OmLc=;
	b=3a6ihnV87GHPbelgXWJUXWnmpZgykrvIABXsxQUbFzvs09fJQkHz4Akgv3KGpQjE2WAi
	 mx+Ki4BsqeKsEe3vpapye1YngvGNFLpaNczYGnmn4Ouh3Rx4B0wgkGMhsQtj25+YJgIwY
	 jx4UhOHqrWiMjo0YOMMctJeAd0UsaJ8kKlKZHlgyf0ErsVYu3T04PP4GHNVJadgHt5M0I
	 T04maOEZp3hVC8icFNld92j2P0Z94ApnIh0Tprcly1rNbanC6VhDxkVSa84gSoQ3em0Zo
	 eCJyjWTUllI0/nFQSphoLpVnYD667boqBTPeNAbvk7ZRHb7l/LGZyGE0RSf9xPb0Hgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TK9rqwKz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD63606A326;
	Tue, 24 Nov 2026 08:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TK9rqwKz
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795509935;
	b=z+coBZdpo8KlY9kc3p4TqjljWE11e50bpKup6Tphbo32Odmejdn/TJ6Q3UgvmNFTtQDF
	 Vp4qCN0AKLlLpRU1W73LAwsf+C7eU9dc1nY2c2Zpw9/DReGi1sfC/DPUBInpHoyEDsP3I
	 MpzFoEDC0q/h6Mbh3F5zwsGLA5wUdoqRr+BnSE754id4pQRmDz6XuJjjlWb0UlfhGKepM
	 er9J1QAG0KvhKQaFpgD+8ZVbUevdGHgnjfbUIaTFGgoPXpLdUQb2NovO+iHNsf/IKTaT8
	 lxZ5w7yJih4dY5ZPpTIaiKl3dcVb3u091BPeXnTYZG8D7xLGUkDq5s94r3udtSHPg/w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795509935;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fxSntwja7aRJzUm/P5tC/T4QpdH99PtJwcIFZb9OmLc=;
	b=Ay9VTqJLZiKIwRfZ3HJw9yqlbEYcAOHN+L4Fg+eSfroSljadhEMOwawJBuwnauRZNFB5
	 tRGvvNGEqvMrbs3xcOR6WwWCzvkbsr06caKCmfZPSlKzZcoEVIRhgVfCDMb3cAv7Gq3r8
	 jwvvg6Knb3alfworLN2RFvNAiNeVmYxISDFCJvVoas1xSbUnVEWHbxc5CZE29NINg7mRn
	 26pe4xAX4C7w+4KPuBC7vozmqsc6HVoKpXR/S0Kvl6CgXfYdqqfJreSF3NHZMJk/CiGl8
	 6w4asbMq8xlxnurgmzMDMpvs/NcAevBAkA43AYy2dRY/cbfd0DvEdQNff68ntEiKwQA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 94DF11F000D1;
	Tue, 24 Nov 2026 08:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795509935;
	bh=fxSntwja7aRJzUm/P5tC/T4QpdH99PtJwcIFZb9OmLc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=TK9rqwKzHZv0vLIWORQXlnd23Kc4ZdWPoKzplL5qhUsbo2kDGau7uZqHaZ8wq21+s
	 UrUkdT4oyDMzdWhLjJZbo03sySRkGv4pN3LJkaIivFgB0KPWppObIeYQAfO5W4IukS
	 uT7y8q9dEw1AFlsyd17tINnr5nthY2jmm/Mpzw9a+m/F69b0dlejk9McwlSXAOZvbg
	 hp8DAhMktNFUIjeLXiJeZMVs645L8Yqk//cDqaJmZ1k2KfwAdLBtLYnlsDBmq6hezf
	 CPWAF47u3mcEM6zj9nHXLzsWHKNmmVmKuCS5tLe87Uu1OA8UWXZENHo55nEu6FrSZh
	 9JiB0e8Ez87Sg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1FBED4C95E;
	Tue, 24 Nov 2026 08:45:27 +0000 (UTC)
From: Akshat Singh via B4 Relay <devnull+automobilehacks.gmail.com@kernel.org>
Date: Tue, 24 Nov 2026 08:45:29 +0000
Subject: [PATCH v2 1/3] dt-bindings: interrupt-controller:
 econet,en751221-intc: Allow up to 6 parent interrupts
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
Message-Id: <20261124-en751221-intc-all-lines-v2-1-a33a520aac81@gmail.com>
References: <20261124-en751221-intc-all-lines-v2-0-a33a520aac81@gmail.com>
In-Reply-To: <20261124-en751221-intc-all-lines-v2-0-a33a520aac81@gmail.com>
To: Caleb James DeLisle <cjd@cjdns.fr>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Akshat Singh <automobilehacks@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795509928; l=1607;
 i=automobilehacks@gmail.com; s=20261115; h=from:subject:message-id;
 bh=Q16SqUnJq9TZKzQktewafiPW/Xjzjt1HWd82Q/C9cGI=;
 b=Y0QRWKIOwl6ohqSAfcol9hSOem629kdXJyKd+GLjQmDp3zwlLDcUVcw4GOlXz5CpRSgK44rpO
 A7Q7HdZQgODCKtgNP6SaLNTGKWXaws29FKgZraYzDNBeNWBbzCWSP43
X-Developer-Key: i=automobilehacks@gmail.com; a=ed25519;
 pk=wYmYXn6wy/XN0edTCg6D7UtE9nYLei8mbfqydGGCdf4=
X-Endpoint-Received: by B4 Relay for automobilehacks@gmail.com/20261115
 with auth_id=1535
X-Original-From: Akshat Singh <automobilehacks@gmail.com>
Reply-To: automobilehacks@gmail.com
Content-Transfer-Encoding: 7bit

From: Akshat Singh <automobilehacks@gmail.com>

The controller is not connected to its parent through a single
interrupt line: it presents the number of the pending interrupt plus
one, in binary, on the CPU interrupt lines IP2-IP7. A CPU in VEIC mode
takes that number as the vector, but without VEIC each line is a
separate interrupt, and the controller has to be chained to all the
lines that can carry it.

Allow listing up to six parent interrupts, one per line.

Signed-off-by: Akshat Singh <automobilehacks@gmail.com>
---
 .../bindings/interrupt-controller/econet,en751221-intc.yaml      | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml
index 44c09785e..098fdeaa3 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml
@@ -34,8 +34,13 @@ properties:
   interrupt-controller: true
 
   interrupts:
-    maxItems: 1
-    description: Interrupt line connecting this controller to its parent.
+    minItems: 1
+    maxItems: 6
+    description:
+      CPU interrupt lines connecting this controller to its parent. The
+      controller presents the number of the pending interrupt plus one, in
+      binary, on the CPU interrupt lines IP2-IP7, so it can be connected to
+      up to six of them.
 
   econet,shadow-interrupts:
     $ref: /schemas/types.yaml#/definitions/uint32-matrix

-- 
2.43.0


