Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795509933;
	b=vAruIawxESA63s/1K3CpQR919RREfJ2P3UUoWTwD1uO42DemksBykO5xFER+GVEY3+qD
	 zGg6pd262tJ95i4aRVgv9Vcj1A6arDLHEcTPB6Q1fwyDlIYiky27hRdmJu5EnzfXuPLKm
	 QQ0exY/35IuiJroCmWBnP577oBJ9KWrasDph5W0PgkFHsonCkPSAaTAle8B0FoJGPAFZk
	 +WSJjdv3F1xJi1EcdMs8Lgx5ujEXdNIo8cInSj68FcqxyA0PkWeO3RWPJK8avULmNzX1c
	 IYqC8ccmRWK+SnQ/2ZTLTAkPLotUjww46kr1xGS4J+CfMRhRCyAZIpNuLc02MX6v1MQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509933;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=TjxJu3J0SFQEDSM4IUN64kHna5JaDyXrFZEdC8PQ8vM=;
	b=0YCGrbNVf45UO0TDF66spYbCSVe72F2B+T1JcKMyDppxFg3tGhYam+QJ3G3lSJqs+g8V
	 SJetCc8mawetz451ZX9QK0uCL8gYaa5gRhJQk52EULdCX/GiQWB9LkRRIMl1L8qKt1JUy
	 GHHbBXtf6oNjhUF/pzaNjAzmMd8qDXYruOTCkwKFab6jsQK+XE8M7W4hN/uw+48pRirIh
	 BJNqP/Lw5JtIN+tbs2/uOLSVcAjVXW9GgznBpakh5TB4QjSjLmFWOHhUmja1VA01xK+oj
	 2Qs8z0py0/CWESC91+zhHi4wgd6ssZ8OcHu3rDpFsKsT+sULjACegD8Q1hQOBHF7sKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FZ3L468z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F46606A322;
	Tue, 24 Nov 2026 08:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FZ3L468z
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795509932;
	b=j/Pq4UvvPNJaLASLYTB5WCKUlV4cke6Rho13FXFHX0eYtgLMjaIUCjkTN4Vv8utLlsSg
	 OgjyDuluvFA7He48M6bXcLTrNdgXv96VdkaTifGAniiRwS4VDj3IcEPJH++f6Ki9pwOJB
	 7GmB/Ty5iSZl+O9K3/RIEgZkOCYQE6OLxy30rVIDdCYblWpMzP011AScxEanyMLO7YSyt
	 lvk2gYYojsSMwqAErtXT2XnMw/HuytDcp7Ezmj6ei9aatxe0RdSO86nb/WFXo2cuMfQxe
	 kVz6beTRgpugKOvotGlnovRtbxTpfeZRnu527EoQUYN1TKRICujpXemRZVraxhmdQvA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795509932;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=TjxJu3J0SFQEDSM4IUN64kHna5JaDyXrFZEdC8PQ8vM=;
	b=vDYmAwggWjKAFCFEAbJ79inMgFFZXrnOXiuNOb+KiUO08qk5Liat+aJ00cVFeDsUBPVx
	 v3fxBTUBalRCsJY+FnW+KLOq+hQDyNfUnosxBsHsEWq1oR+4+DPd6TLIAMdMbFEwhoOkU
	 mK52/22gqqEg9RQr3Z4IdSfLD1qsoVQFzj3mB8FIjm/Zrwec8Vyg3cTwzwaANXhhGWB7q
	 ILM3VS6PTTT1HMBCZjZ1gVtwCa9AUOQtjINou+1gny/ynD3GSU8cVKm0YkKFfStO9EN2G
	 pL+jrNlXpFl9DiZ9ZFyuA/vzKT4YG5VTIsFlJKybedyAWkclw2vhCKIFZExlHEuUX0w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 94D6E1F000D0;
	Tue, 24 Nov 2026 08:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795509932;
	bh=TjxJu3J0SFQEDSM4IUN64kHna5JaDyXrFZEdC8PQ8vM=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=FZ3L468zW5/zcR2PFLstI7NVdGnB4RWuSIgN+Dn6YJf792Cgl2xWDBclt0MIB+ZuW
	 fNsuz1GDwX0hmJ2SwRPGnARjOX1wrCb3o3dgFNORK2WjVhmYn6h5qc/lL+F3OaX72n
	 RoB0HxSYo8IoCt74rzzWfQZUEioLKWu91KC5oO/+hhmkWzF3KKUnGSwEg8kNBKmS7M
	 wD4W6MMYgdXRGh7MBQLq7x9AOIwiDYOZerlY1uZ952PjKRfbrKOz4nSyPVZA7gFSPA
	 fobvf9V2KtQ8MRh/GGs/yNskifNac6ImF/9wXQWFnWTwhCarFHunlVIwytr11JSsx9
	 CP2tLqYDN7Sdw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id ED8974C960;
	Tue, 24 Nov 2026 08:45:26 +0000 (UTC)
From: Akshat Singh via B4 Relay <devnull+automobilehacks.gmail.com@kernel.org>
Subject: [PATCH v2 0/3] irqchip/econet-en751221: Deliver odd interrupts
 without VEIC
Date: Tue, 24 Nov 2026 08:45:28 +0000
Message-Id: <20261124-en751221-intc-all-lines-v2-0-a33a520aac81@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAKhOBWsC/4WNQQ6CMBBFr0Jm7Zh2oBJdeQ/DopQBxtRiWiQaw
 t0FPIDLl7z//gyJo3CCSzZD5EmSDGEFOmTgehs6RmlWBlJ00lob5FAaTaRRwujQeo9eAickmxs
 yVKv67GBdPyO38t7Lt+rH6VXf2Y1bbjN6SeMQP/v1pDfv/8ukUWHjVG4L1RZlq67dw4o/uuEB1
 bIsX0jK/8bQAAAA
X-Change-ID: 20261115-en751221-intc-all-lines-2a35252b0b9c
To: Caleb James DeLisle <cjd@cjdns.fr>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Akshat Singh <automobilehacks@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795509928; l=2345;
 i=automobilehacks@gmail.com; s=20261115; h=from:subject:message-id;
 bh=M+rHP49TLFPFRmFeMJB9FFV/lr2vwMjOoBXs6QR6Uus=;
 b=+WW5vldNx762MxjMTGWlRLjmrHU2N10z4usZuwm2ONylsPE67VyzJfLVvAeTTY9lHyP5Z9UNA
 6O5AdIky2QRBV+KY4EoV/+A5/DsdEsx7dV83Q0gXYmCBBxuWnpOjquV
X-Developer-Key: i=automobilehacks@gmail.com; a=ed25519;
 pk=wYmYXn6wy/XN0edTCg6D7UtE9nYLei8mbfqydGGCdf4=
X-Endpoint-Received: by B4 Relay for automobilehacks@gmail.com/20261115
 with auth_id=1535
X-Original-From: Akshat Singh <automobilehacks@gmail.com>
Reply-To: automobilehacks@gmail.com

the en751221 intc puts the number of the pending irq plus one, in binary,
on IP2-IP7. with VEIC the cpu takes that as the vector, but without it the
driver only chains IP2, so odd irqs (qdma 21, xhci 17, first pcie port 23)
only get handled when an even one runs the handler, usually the next timer
tick.

a kernel without CONFIG_CPU_MIPSR2_IRQ_EI always takes the non-VEIC path.
openwrt's 6.18 kernel for this soc is built that way. on a nokia g-140w-c
running it, ping to the box kept cycling through 1-11ms. chaining the
handler to IP2-IP6 brings it under 1ms. VEIC mode is untouched.

tested on the g-140w-c with openwrt's 6.18 kernel, where the non-VEIC path
is the same as in mainline. on 7.4-rc2 it's build tested (W=1 and W=2, no
new warnings), and dt_binding_check, CHECK_DTBS and checkpatch --strict
are clean. Caleb tested v1, his Tested-by is on 2/3.

the binding patch has to go in first, the dts change fails CHECK_DTBS
without it.

Signed-off-by: Akshat Singh <automobilehacks@gmail.com>
---
Changes in v2:
- 2/3: rename the new local int parent to virq, it shadowed the parent
  argument (W=2 -Wshadow, from sashiko)
- 2/3, 3/3: add Fixes tags (sashiko)
- 2/3: add Caleb's Tested-by
- 2/3 and cover: drop my claim that the g-140w-c's 34kc doesn't report
  VEIC. it came from a kernel without CONFIG_CPU_MIPSR2_IRQ_EI, where
  cpu_has_veic is 0 at build time, so /proc/cpuinfo could never show
  veic. an SMP build shows it on a g-140w-c. please ignore my v1
  question about turning VEIC on
- Link to v1: https://patch.msgid.link/20261115-en751221-intc-all-lines-v1-0-dc03a40f47f0@gmail.com

---
Akshat Singh (3):
      dt-bindings: interrupt-controller: econet,en751221-intc: Allow up to 6 parent interrupts
      irqchip/econet-en751221: Chain the handler to all parent interrupts
      mips: dts: Connect the EcoNet EN751221 intc to IP2-IP6

 .../interrupt-controller/econet,en751221-intc.yaml |  9 ++++--
 arch/mips/boot/dts/econet/en751221.dtsi            |  7 ++++-
 drivers/irqchip/irq-econet-en751221.c              | 33 ++++++++++++++++++++--
 3 files changed, 43 insertions(+), 6 deletions(-)
---
base-commit: fa2933aac170dd19c6a7f0d7b81a8f537e40915c
change-id: 20261115-en751221-intc-all-lines-2a35252b0b9c

Best regards,
--  
Akshat Singh <automobilehacks@gmail.com>


