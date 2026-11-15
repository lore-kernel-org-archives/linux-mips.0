Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794770763;
	b=qvOiX+VieaHWUwDvKI5Araz+PWZbCxRp/IkCqrCE6KcbFbFrdL/aDzapZbFhcvvtA2Mr
	 ZJhcu8Tj4/QGsqt7dMnEohWWb+kOsGxyCbaHLtHEDB0jsbjpGiBdjwjnsuGctdVUwk1Nx
	 7l1v6pBgxB7geKKl/aYoAUWKLFlrQc3uVTljE7HOeFZB/PO9xup/v5MdalxEXU/B423mN
	 NuB74Ep/DyCMcsGDYapxkHtDVlM4MswNgD79gAJuDekWFXA1u6uUbRUn4cL17KO5nQuUD
	 XZ1bawnWOs8CmwYkgu+6jmXCdk+ATi/vXnGszS4qEPJW9qjJROpa3fGs5Y8vm4VQIgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794770763;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=zWNIBsO5D570AE0b0ZHB7VLmfe1MXCra+FnRJQpgE3Y=;
	b=Oz9RrVZd/OJ5TPB5YM0+XPgQ9BFxvQGUB1wsYLL0mtSB9KrybHzvMalrq5qK/qbMQWiU
	 fvw9m+VOGO4o4q9vT+FS/UVKl33a0qZBUfzZoaBwSwi+cleB7Gkc8H3cqc5JFigm6e9e2
	 sqtu6kbdRXEqGRi+ev/Vlbj498hg9LNZHJ6em7B9Oz7DRmzeBJyz8hgCSA70ScuxGrlG+
	 qC2YYhw7WZOvF/MXk8GPfW3ocjqnq6n9xcQZHJ8AXfC5bbzkINj5Y1mf5GvEqMZpALu00
	 2x5jYMe3q+UOqIhuWAEY0mEsPRHxnjSSUraF8En6aTwUsN91dAn8JtlXFc+WlwM1Y8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D0PZpGlT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F97606A335;
	Sun, 15 Nov 2026 19:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D0PZpGlT
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794770763;
	b=UYTagONP1tEMrKSgoz6fT/RlmZ25Yp45SbCnJvxVP4M52HDb2jCUMFDPkSetH4ZLaDDr
	 19vjI5YmhsPfbPzA+fQ/7Lqv1EmIdsmyL4+n6862ccxeIaiw9rD05gaHrTOqjZxEUrEhB
	 I9serDJhcgjy4oO5+AGUq+NUymglJHI20R4/92Szf5J4I2/wY5Ggm5Fepa3DMzCUC+Chg
	 wGivFtEdnf99BEifnDCgdlnqoWHxWP8PMcwThiFn2Tkoc99pAcFLBtBkM1qF31wDQeuZ+
	 +ezVXtJ6M+8ZduIYzm+wPZx5JsIkdXbfYAChJrLPP/74BCeuNvcll/A0Wk2Jc00I8JA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794770763;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=zWNIBsO5D570AE0b0ZHB7VLmfe1MXCra+FnRJQpgE3Y=;
	b=y1Ir0U0XbUrpvBb8meXWbSO8zXc8VABFD/5Df3cbs/k3ppVLK933wDoRyVFS5qEH2s6Q
	 85C2iQHx+1zwQAo3qb8TtrNzePDGvFQSV+MNQ+bqLl0AuZiq44UYmjkstWmw1SuSwZV2h
	 iOwqY+0rEZQqDV91mQKNR8bRledwCPBgWlSRgHj2/XR/m254lOGxia0ztc7vZSStyncl/
	 pO0cjTyrPXCuzpV1UkIgguGzIP/FO8jUmif0viKR2oALRIzRQ4faNBcMai7jLfP03+5y1
	 Z1JjUJvt35LqMobr4snTd7jxITKqcLKyqAqCEtjEWul5GJooN//3ORo3migIpb/35EQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 320E51F000C7;
	Sun, 15 Nov 2026 19:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794770763;
	bh=zWNIBsO5D570AE0b0ZHB7VLmfe1MXCra+FnRJQpgE3Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=D0PZpGlTIdTwuJ1iztcnHCnm+wtacjporlS0/nbmVBvUg7lwDhkrpth3L/zH0TV6o
	 xmAUgAaqiG29Y/cBQl/IXnkdoXQruuxbAJUTnveqm5spFxNDPnJiVDdm6LzYLspw2I
	 Vn7/Xd0S3+fvMhmj0IrO7lQkZgITrjoO25kIZ3HAw+nNkS+JO7edDDCFLLRAAjFRRp
	 aN9Nn6+hKn7K7jpQRjwCXiqWXTzqeVWckZZNQOVSU5mhRl3/6cnwVhJeQCx7RcDJNw
	 5lBInTo2BxJOkVaQljtlxEMSOmBsApEUnQqTEsZ0wGFG7oqhZThFUgehtmDpaOIO2D
	 91VaznbHASB9w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AF17C4A168;
	Sun, 15 Nov 2026 19:26:01 +0000 (UTC)
From: Akshat Singh via B4 Relay <devnull+automobilehacks.gmail.com@kernel.org>
Date: Sun, 15 Nov 2026 19:26:03 +0000
Subject: [PATCH 3/3] mips: dts: Connect the EcoNet EN751221 intc to IP2-IP6
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
Message-Id: <20261115-en751221-intc-all-lines-v1-3-dc03a40f47f0@gmail.com>
References: <20261115-en751221-intc-all-lines-v1-0-dc03a40f47f0@gmail.com>
In-Reply-To: <20261115-en751221-intc-all-lines-v1-0-dc03a40f47f0@gmail.com>
To: Caleb James DeLisle <cjd@cjdns.fr>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Akshat Singh <automobilehacks@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794770761; l=1352;
 i=automobilehacks@gmail.com; s=20261115; h=from:subject:message-id;
 bh=2qagY6yBzX67d4cZ5XajQuXtH2Jf23X3ZRemiwVV7dI=;
 b=xmGEesZVxG+yiKXMProyZ/11vN8zXbjYk1bvNEKu0PdyM0v9wIlQVB45J+t+ubI8P9s3v4+Q2
 vTujTeZacTECFFq/HsDIwaGK2mi4QUQXRYbFmxyi+qaWowvyLu+XWuK
X-Developer-Key: i=automobilehacks@gmail.com; a=ed25519;
 pk=wYmYXn6wy/XN0edTCg6D7UtE9nYLei8mbfqydGGCdf4=
X-Endpoint-Received: by B4 Relay for automobilehacks@gmail.com/20261115
 with auth_id=1535
X-Original-From: Akshat Singh <automobilehacks@gmail.com>
Reply-To: automobilehacks@gmail.com
Content-Transfer-Encoding: 7bit

From: Akshat Singh <automobilehacks@gmail.com>

The interrupt controller presents the number of the pending interrupt
plus one, in binary, on the CPU interrupt lines IP2-IP7. Without VEIC,
chaining it to IP2 alone leaves the odd-numbered interrupts, such as the
QDMA, xHCI and the first PCIe port, waiting for an even-numbered one to
run the handler.

List IP2-IP6. IP7 is left out: the CPU can also signal its own timer on
it, and only hwirq 31, which is unused, needs it.

Signed-off-by: Akshat Singh <automobilehacks@gmail.com>
---
 arch/mips/boot/dts/econet/en751221.dtsi | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/econet/en751221.dtsi b/arch/mips/boot/dts/econet/en751221.dtsi
index 57ae84a8a..5e3f626b5 100644
--- a/arch/mips/boot/dts/econet/en751221.dtsi
+++ b/arch/mips/boot/dts/econet/en751221.dtsi
@@ -66,7 +66,12 @@ intc: interrupt-controller@1fb40000 {
 		compatible = "econet,en751221-intc";
 		reg = <0x1fb40000 0x100>;
 		interrupt-parent = <&cpuintc>;
-		interrupts = <2>;
+		/*
+		 * The number of the pending interrupt plus one is presented in
+		 * binary on IP2-IP7. IP7 is left out: the CPU can also signal its
+		 * own timer on it, and only hwirq 31, which is unused, needs it.
+		 */
+		interrupts = <2>, <3>, <4>, <5>, <6>;
 
 		interrupt-controller;
 		#interrupt-cells = <1>;

-- 
2.43.0


