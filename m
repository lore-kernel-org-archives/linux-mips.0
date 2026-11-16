Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837545;
	b=M2mSU/5kf2Rd/23WBO3GgRLs4dOYw9mWiEreghlBEPMTno/IPOkMV1bsgpICelw/StgY
	 8T+2FGqSUcG92CwuFFawvvo4RCBRX+s6UNQW0Ql2/1ff2SdAn4z1wObD9fiVurSL5T8Z4
	 GsN44qoGH7hF26WFR42S3bdx6yxeCxCK7acI2+awBAg7qdVb7G6vLv0/njfzEodESgbeX
	 CW9d4IqTSegTTxpQY9nTQEJz95SEAIQPczktIeGx7maNv7A4QLq40bYVishv8HcckCXZd
	 IrOkbiGwPLxQun8FeBEDSdsHgwWp+5MLA4gp53/t4Gnn4zqCADAvHEPGTxm+bGyGGgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837545;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=Gy4/saHNMPW950lfD0nuPPuDqN+92Pe4X/CJgDRU+sY=;
	b=mwxytPaBdEQfSmwMUCB0zSDTZb4Joyty7lmt6mU1gwCfs7NO3LW2n34CZ186zHfjjDJa
	 xxyAWuX2jYxfZqZYdlD43f63IYXmgf653f6gY/VHt3mHXTxySnPDboDz6NRB4huEVRD3Z
	 WyifJ+ujUr37ecah8vVFG2UIcSrcCzZXpbQxPfuiUOQDMw30xwKf7E3d3vv5/YCNXUDF5
	 1WtoNS+kYSlGt5J0veTaO1P6ZRde/de39FOIWnDy3SkoDIFqll4ZHCQ1RvvAUn6Z/Tez9
	 zk7PEmQ0/yMZTEhdUHVTZ6VVPMOPGrO2pVb/nhsbEYZZ6Qz6PDhotX02IrZtK9Dn/zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=WJx7dfzQ;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC09606A890
	for <linux-mips@vger.kernel.org>; Mon, 16 Nov 2026 13:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAC09606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=WJx7dfzQ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AD6371A168E
	for <linux-mips@vger.kernel.org>; Mon, 16 Nov 2026 13:59:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 78B9B6023F;
	Mon, 16 Nov 2026 13:59:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C70A611BC05D6;
	Mon, 16 Nov 2026 14:58:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794837538; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Gy4/saHNMPW950lfD0nuPPuDqN+92Pe4X/CJgDRU+sY=;
	b=WJx7dfzQu6x7WgdFR5xX7ZyljqrPuXPb47ioR9T9Mp6mbN3eZKckLn7i8e5Wipxp1cLQLj
	eCE6tkbesOy5zAkFHkqA7cCjr1Jmx1nKVTUjndSbFSD3/AomgxcIXlaykPM1ZhQ6Na7n/f
	PtCI/qLsge/UPPRIYIax8DF1SqQ5V7CwyOpRAFLdMd8thcnE8V+ChpMLgtbpgfKSeG62KX
	f7NW1p5d04FZk44X3c1s9KFlmsC50f3MOoklBfWOOrck3YQhjIpsp/gY7v2Nc27gkrBCTR
	lpnUUeQMFrZJRKwyJSIIH+jPsA0dN9Ku+Up26J+1huaNeHLjV+04rqQes3L5Rg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v4 0/5] irqchip: add EyeQ5 PCIe MSI controller
Date: Mon, 16 Nov 2026 14:58:36 +0100
Message-Id: <20261116-eyeq5_msi-v4-0-2e1233b014b0@bootlin.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NSw6CMAAE0KuQrq3p3+rKexhjSj9SI1QpNhLC3
 S24EKPLSebNDCDa1tsIdsUAWpt89KHJga0KoCvVnC30JmdAEBEYEQltb+/8VEcPpVAKG75FQjK
 Q+7fWOv+ctw7Hd46P8mJ1Nw1MjcrHLrT9fJbw1Pu3mzBEUDPBNpy4knO3L0Porr5Z61CDaTmRj
 814aUm2TClqqEASCfZr6dKypaXZEimE21CiDZXfdhzHFyfMmvQuAQAA
X-Change-ID: 20261028-eyeq5_msi-86aa1d590684
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Hello,

This series adds support for the MSI controller present in the
Mobileye EyeQ5 PCIe ports.

Although the driver uses the standard MSI library, the EyeQ5 hardware
has several specific features. First, each PCIe port has its own MSI
controller, which snoops the MSI write TLPs that the port receives. A
port supports a maximum of 4 MSI vectors, and the memory-region
property gives the base address of the doorbell window. In addition,
the GCSR mode selects the role: in root complex mode the driver
registers a PCI MSI parent, while in endpoint mode it registers a
platform MSI parent. The last specific point is that the driver uses
the snooper domain as a chained controller on one GIC interrupt.

The series adds the binding document, the irqchip driver, the EyeQ5
DTS changes, and the MAINTAINERS entry. In particular, the DTS changes
add the two MSI controllers to the EyeQ5 SoC.

I tested the series on two EyeQ5 SoCs that have a PCIe link. One SoC
acted as the host and the other SoC acted as the endpoint. The
pci_endpoint_test kselftest passed the MSI-X and DOORBELL_TEST cases.
The MSI test uses one vector because the controller does not support
standard Multi-MSI. An additional test made sure that each MSI-X vector
uses its target CPU (using affinity).

As a side note, I am still a little annoyed by having to add an empty
function as an irq_ack callback. I saw that a few other drivers do the
same. Could we do better?
First, I was thinking of adding a flag so that in handle_edge_irq() we
would not try to use the callback if the flag is set. The drawback is
adding an extra test; I do not know if it is really sensible here.
At least we could provide this empty function in kernel/irq/chip.c, so
each driver could use it instead of declaring its own empty function.
These are just suggestions and they do not affect the current series.

Grégory

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
Changes in v4:
- irqchip: use a plain raw_spinlock() in the mask/unmask callbacks, which
  run with interrupts disabled.
- irqchip: use guard_chained_irq() to balance the chained handler on every
  return path.
- irqchip: simplify the domain alloc/free callbacks now that nr_irqs is
  always 1.
- irqchip: reformat the MSI flag macros and use a distinct "EYEQ-P-" prefix
  for the platform MSI parent.
- MIPS: move the EYEQ5_MSI selection into a separate MIPS patch, out of the
  irqchip driver patch.
- Link to v3: https://patch.msgid.link/20261104-eyeq5_msi-v3-0-2866f732cd38@bootlin.com

Changes in v3:
- Address review comments from sashiko.
- dt-bindings: drop the interrupt-controller, #interrupt-cells and label
  properties.
- irqchip: use handle_edge_irq() with an ack callback instead of
  handle_simple_irq(), so a vector is masked while disabled and a second
  MSI is not lost while the first is in progress. For this one, I ran
  some tests to confirm that the issue was real (it was) and that the fix
  resolves it.
- irqchip: convert to a platform driver because the node is no longer an
  interrupt controller and is no longer probed by of_irq_init().
- irqchip: stop parsing the label property and use the node full name in
  the boot message.
- MIPS: dts: update the MSI nodes according to the binding changes.
- Link to v2: https://patch.msgid.link/20261102-eyeq5_msi-v2-0-4aa3d3608064@bootlin.com

Changes in v2:
- Address review comments from Krzysztof Kozlowski, Thomas Gleixner and
  sashiko.
- dt-bindings: drop the num-vectors property (all ports have four
  vectors) and simplify the example.
- irqchip: use the fixed four-vector count, add lockdep assertions, and
  dispatch through generic_handle_demux_domain_irq() with a redirect-based
  irq_set_affinity() callback.
- irqchip: drop MSI_FLAG_MULTI_PCI_MSI (standard Multi-MSI cannot work
  with the address-based vector decoding) and MSI_FLAG_NO_AFFINITY; add
  MSI_FLAG_PCI_MSI_MASK_PARENT.
- irqchip: keep vectors masked during allocation, mask all vectors and
  clear pending status before installing the chained handler, and reject
  of_irq_get() returning 0.
- MIPS: dts: drop the num-vectors property from both MSI nodes.
- Reformat the driver for the 100-column limit.
- Link to v1: https://patch.msgid.link/20261028-eyeq5_msi-v1-0-c464752fb55f@bootlin.com

To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Benoît Monin <benoit.monin@bootlin.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Théo Lebrun <theo.lebrun@bootlin.com>
To: Thomas Gleixner <tglx@kernel.org>
To: Radu Rendec <radu@rendec.net>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

---
Gregory CLEMENT (5):
      dt-bindings: interrupt-controller: add Mobileye EyeQ5 PCIe MSI controller
      irqchip: irq-eyeq5-msi: add EyeQ5 PCIe MSI controller driver
      MIPS: eyeq: select the EyeQ5 MSI controller
      MIPS: dts: eyeq5: add MSI controllers
      MAINTAINERS: add EyeQ5 MSI controller entry

 .../interrupt-controller/mobileye,eyeq5-msi.yaml   |  76 ++++
 MAINTAINERS                                        |   2 +
 arch/mips/Kconfig                                  |   1 +
 arch/mips/boot/dts/mobileye/eyeq5.dtsi             |  22 ++
 drivers/irqchip/Kconfig                            |   5 +
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-eyeq5-msi.c                    | 432 +++++++++++++++++++++
 7 files changed, 539 insertions(+)
---
base-commit: 08b814ca0a6945b8effc1a0d64999d562f24c923
change-id: 20261028-eyeq5_msi-86aa1d590684

Best regards,
--  
Grégory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

