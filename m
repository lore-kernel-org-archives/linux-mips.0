Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795206687;
	b=nGzIYXwz7HiwmWiRy/QsQNRrEOJWxE4rQMz0Dlz0vlfspdlMF7BDCYfQ1CRU17Vd7KL8
	 n+I0EQPrbnGLLKm6SUlRovsZYMv452pm8Ud2yXKOFfWHyqPNknd0G4fAWMxqjJDtrVSNn
	 bPLCJ+LQ6pKVRZlckqAEB71YxHRL1u8Xl1glqtrYpdtqh0Z2/WXTpjN/Pf35rFuJtWg4y
	 VoMg43s7uWefZQWtvXrF7Sb8vC6d6CQBJ2M8deg6D4eARBToyzjkzrUci6nfbGbTU4W13
	 LJo0kLTBCns6G8Wyu9qEg0DiT/f1xf8tXuD8Cg3InJfu0Nrefs8YPho58R6Xw90tUcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795206687;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=saU8ySDuW+sAImtAHKQ7Tbp83ATJq4sdaTOMJlpojhQ=;
	b=JuO4nZfKRcrVakltjG5Q8fL+xUNlr2n/DizSiXRJAu+NHvzkZk07d3E3Ae9nLR0DnL7A
	 xxbRsMnmniFkoozL7hHife2fwiy0tFWuBVkZcGSDUvZBAGSFdHF+RrsnYA8xlHP5W/SHA
	 x41BceoUr4XvfTvlWBObD3lv4KsI23SrfxHcKFV1Vn4HXWP8fzGL+Hm+dmxwKaqaA7JJh
	 EwG3aJRQpocoAqKIbbQ77Cntjm6ymuUVXG7S2rvAc24rdlXGxZV0WNS8i2dGNcRxz+u/T
	 wtK9mYn79iBccXIpZOSfERIx0X+X7haoxsIsHFoXf6BNCGLI0zKBxb4yVg0aejd/DAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IGGWDLIS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD56606A6E3;
	Fri, 20 Nov 2026 20:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IGGWDLIS
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795206687;
	b=EKTIoZWCvbR8wHxAFAcIRBKF2sFQh/SuCH/nRaScYn/gYDuolLhp2mS/G44q53Hgm6th
	 n9HyX3xNYvciG5jLTpr/brRVTiungzb/3fSOzSFOM/CS4LAV8wgrfm1qc2zlol/52s+Ix
	 lJGC9JAolNHoB1sGC1cpztzb6HGR3nBlo8OY4b+QAiPcqTm4PcjPWeKld7I1jQZVqSrfv
	 DI1iqi9+i+zfIuB/qyPU2cFcWpF29kEFtlpkXF3Q2hHIt/mFSq/wBkbXp9FWdPXKmsysZ
	 6Iu5oqRuZSL7afo8RvUOcUBcvTCwM77sZFFPiLpX57y8Tys7efPTWQXqYwhdRl1g7mQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795206687;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=saU8ySDuW+sAImtAHKQ7Tbp83ATJq4sdaTOMJlpojhQ=;
	b=cWyMcKSqGy3sOTSaAumsRrJQeBqw35r7hm/So1MNkHLXHL7Q+kglPpYIB3SFeyJUROTa
	 XXI4zxv9xHgjrWaEoYspF49tbJbQsJ8EY3iQF6AClBk3ghU5p9UzzbvjIvfdVQjCNJt4h
	 TTf3C1yk4EH676waKY8KOuakQ/ZVzYpQV1PVufZV+ky2Ui1VsL0XYfqwXpt+Dr3kh2+4x
	 2Hs+PQzJoLTtytDltymFwxSrw5Ew4NzRnxZlBboPOnAns1TTrXWSePjaDwyY4x/rRBh0Z
	 Fclp4FMPBCpFG1P59/J+ybF/7EHRCIDH6Sm1kzq/7GscHO2fuVLrbijcvk/7nXqUmsQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 61EE61F000C0;
	Fri, 20 Nov 2026 20:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795206686;
	bh=saU8ySDuW+sAImtAHKQ7Tbp83ATJq4sdaTOMJlpojhQ=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=IGGWDLIS9ACrvTsiCnftOImac3YcH0eJ2QP6tdi1g+sJVg2i/vW4cX4N9AAQ4Bmob
	 fwACEZDFZExdPs8Am0Eb1RIQXPEdTHwBiDN2ValfEpr4YWGi9FqS6RqF7KaEOrHO6A
	 US/UUxUyj01eg4hQ5KQmHLwCPprcWS5WphxWfCMIhilTO5p3tU63XgzRJV/HGcHeSE
	 0+OC73qdha3i8tYawuauyZUdxiY1ZUNbG9VlurH7MZa71lx+4xfWEw+oqMAkD+PTHe
	 39A5uYYZmIrI78Yh2QkkkEr8ILVODDnmo/vFY/hw7EGFXR0E1WCXwGF0n0592aOuTr
	 fnOBwSpXpQwCQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D6CFD4BA10;
	Fri, 20 Nov 2026 20:31:16 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Subject: [PATCH v3 0/3] usb: dwc2: Add Siflower SF19A2890 support
Date: Fri, 20 Nov 2026 15:31:05 -0500
Message-Id: <20261120-sf19a2890-dwc2-v3-0-de377bd408a0@telaak.dev>
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
X-B4-Tracking: v=1; b=H4sIAAmuAGsC/2WNzQ6CMBAGX4X0bA1dKKWefA/jobSLVA2YFquG8
 O62GBN/bjvJN7MT8egserLJJuIwWG+HPkKxyojuVH9Aak1kAjlUjOVAfcukglrm1Nw00FpwUbR
 CY4OGROnisLX3Jbjbv9hfmyPqMVXSorN+HNxj+RhY2r3j5W88MBovyWUhOEKlmu2IZ6VOa4OBp
 HqAD5+xPx+irxsljSlVCbz68ud5fgJVnBlR/wAAAA==
X-Change-ID: 20261102-sf19a2890-dwc2-87573f7cebed
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Chuanhong Guo <gch981213@gmail.com>, linux-mips@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795206676; l=2375;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=5Fbe18oY4Op0Orls0kCxG//pb0Q6XyFf2Ud9BgK1RGo=;
 b=eMv2f/LlgjHl/vhxaWhaeobxe+GjTNRBWd504efnupfITibJXJTKjn/mtN0c3G47ZTamNkGLK
 TD3TVrSCQI8BCFt+VvFCiJmK3oxsApJXu7P3kl1/Vo4phe+sathJEAE
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev

The Siflower SF19A2890, a MIPS SoC for home routers, has a DWC OTG 3.30a.
This series adds its compatible and parameters, and handles an
interrupt it raises without flagging it: with battery charger support
enabled, the core sets MultValIpChng in GOTGINT but not OTGINT in GINTSTS,
so the interrupt is never cleared. Chuanhong saw the line disabled with
"nobody cares"; on the GL-SFT1200 the system stalls instead (below).

The two driver patches are Chuanhong Guo's, from OpenWrt and his
SF19A2890 branch. The OTG one handled GOTGINT on every interrupt for
every core; here it does so only for cores that set the new
otg_int_unflagged parameter, which only the SF19A2890 does.

Tested on a GL.iNet GL-SFT1200 with the USB PHY driver: a USB stick
enumerates at 480 Mb/s, reads at 5.6 MB/s and comes back cleanly after
two replugs. Without patch 3, a couple of replugs leave the system
stuck, the console repeating its last message with the same timestamp
until a power cycle; no "nobody cares" message appears first.

---
Changes in v3:
- Send to Thinh Nguyen, who took over dwc2 in commit 688bee95b423
  ("MAINTAINERS: take over dwc2 maintainership") after v7.4-rc1 (Greg).
- No code changes.
- Link to v2: https://patch.msgid.link/20261111-sf19a2890-dwc2-v2-0-cba9dd4a4256@telaak.dev

Changes in v2:
- Write my notes on Chuanhong's patches as lists, with Co-developed-by
  on the OTG interrupt patch.
- Sort the new compatible in the binding and in the match table.
- Describe the OTG interrupt fix as it is now in its commit message.
- Patch 1: add Conor's Ack.
- Link to v1: https://patch.msgid.link/20261104-sf19a2890-dwc2-v1-0-d959375e26ab@telaak.dev

---
Chuanhong Guo (2):
      usb: dwc2: Add Siflower SF19A2890 support
      usb: dwc2: Handle OTG interrupts that GINTSTS does not flag

Joseph Telaak (1):
      dt-bindings: usb: dwc2: Add Siflower SF19A2890

 Documentation/devicetree/bindings/usb/dwc2.yaml |  1 +
 drivers/usb/dwc2/core.h                         |  6 ++++++
 drivers/usb/dwc2/core_intr.c                    |  5 ++++-
 drivers/usb/dwc2/params.c                       | 11 +++++++++++
 4 files changed, 22 insertions(+), 1 deletion(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261102-sf19a2890-dwc2-87573f7cebed

Best regards,
--  
Joseph Telaak <joseph@telaak.dev>


