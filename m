Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638265;
	b=XTOsWQvRbY8e9P0Js5GNPD1Qy2emwJQwxFWLxZpgxCrvWsIcduoej36uG/jq+Ozg3VuB
	 CvQM2uDnE798Qbxo4BL3uaH7z2TrrXv7WdhoXTlrIdDmg/W03BRSJyS5Ed00x5xSvm8Ap
	 TbeyfamAEaPH24f4qp1tc5r5oSzVTk1WkgtOA4Rr7kU2ZOB07Wnp58lWCXZL+dVC6m8Fq
	 V+agAPDj0XNvfDbQTkW2qrcd2GLIy23z2F7eHhEjlTU4lS95NlbDs3pwHn4rXZj5IDkJp
	 AAFNT/Bklv3EIVmSf4dA4RzyRLBMq5dZWfwsIHGGu+QXDIYN1ybQ52Y6NbO78ZqsAQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638265;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=N10zmkk/NQJ0l2/PcerXN/v257tgPcSx6+Q0OxuGl+I=;
	b=pB7dwiAeJ27Btftf+cPhdfRJ/AYxfahD1TegOcrcGM3Pmn/5Cld8k279BeKIjS1AwXgs
	 AImFmqI1CMUill7k6JO9Q2DaanHQ3bq2Anr94uM2U01tyxcjfHusVDzSKUMW7PDO+KUaM
	 xPDmGR5O/4IEebYhKJ9aZqy6pS/ji1Y1l2CnCMY5kZRAr1qQqjraE2TFOJ7SyiD0ZtfS8
	 ovGqCtiMmd0Ym3uvYpUpyJOZW+oj3+aPTzeD1CIw0DWX3sZhzjhd2uDPuag4oynUtChlT
	 C2Ylt3uE1dWF1i7OLWOxgXzma0HxSRY2MTv9yJs0hPaoB7pJiBDTdKcpENeMdbJIQ3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=i+SqVPvb;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB57606A336
	for <linux-mips@vger.kernel.org>; Mon,  2 Nov 2026 16:51:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBB57606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=i+SqVPvb
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 25C594E413C5;
	Mon,  2 Nov 2026 16:51:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E5418603D7;
	Mon,  2 Nov 2026 16:51:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B55D81032919F;
	Mon,  2 Nov 2026 17:50:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793638255; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=N10zmkk/NQJ0l2/PcerXN/v257tgPcSx6+Q0OxuGl+I=;
	b=i+SqVPvba+YJb654B/HVMQ+s0KKU2N0ZNurvs+q3kiwwNS+L8/ZJF97keyBVyPgeunwBco
	Huvo3ZeDQndAYbo0xjmOQvOVRpCgdAWRczd+dgiRVbHJA1iESESDIBI7vMQxiKsE3U9mG+
	N2UaroCnAX61zjsd6G+SX7VhS69xCxMIK+fRy87o+tFkkdCM4EnEb5yJO5SgRqGayAAn6u
	vdRYfWfKWVkNfuOqjcRROv8OMarDC6evVDNnIpY6TCTPYAGvT48tnLklG8UAEwEtys+L3+
	LTt9zKrisPRK8zCI17gbXTdOvw8wyprFQ/A66vxCXg1ZModSfNYyHbNzlvurww==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v2 0/4] irqchip: add EyeQ5 PCIe MSI controller
Date: Mon, 02 Nov 2026 17:50:37 +0100
Message-Id: <20261102-eyeq5_msi-v2-0-4aa3d3608064@bootlin.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBAAv0L2bE3b0Iqe/IchhpZF1kirXSQSw
 t8FvHqcZDIzAWMiZDhlEyQciCmGBfQuA99W4YaC6oVBS22V1IXAEV/m2jGJwlaVqs1R2iKHxX8
 mbOiztS7lj/nt7uj7NbAaLXEf07jNBrV6/7qDElL43OYHoxtnTHN2MfYPCnsfOyjnef4ClVv4g
 bYAAAA=
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

Grégory

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
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
Gregory CLEMENT (4):
      dt-bindings: interrupt-controller: add Mobileye EyeQ5 PCIe MSI controller
      irqchip: irq-eyeq5-msi: add EyeQ5 PCIe MSI controller driver
      MIPS: dts: eyeq5: add MSI controllers
      MAINTAINERS: add EyeQ5 MSI controller entry

 .../interrupt-controller/mobileye,eyeq5-msi.yaml   |  90 +++++
 MAINTAINERS                                        |   2 +
 arch/mips/Kconfig                                  |   1 +
 arch/mips/boot/dts/mobileye/eyeq5.dtsi             |  28 ++
 drivers/irqchip/Kconfig                            |   5 +
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-eyeq5-msi.c                    | 439 +++++++++++++++++++++
 7 files changed, 566 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261028-eyeq5_msi-86aa1d590684

Best regards,
--  
Grégory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

