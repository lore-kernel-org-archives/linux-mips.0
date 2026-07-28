Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2288D470424;
	Tue, 28 Jul 2026 18:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785264641; cv=none; b=DyiIsaFlhtYBytKdmDUsbH4zLUFJAq7pLGeoqC+8nGY/Ylc2hxEbVGyO+qy9yHVvOulWAzpNMTorLotiipMdo1X/LOTvWx4FtrCTIMD0d6NF50+HMjtG8VbJcUaQFeUjwYikvBfOWIjW0+GA+ln/migpj2slT++1S2orCqAfhRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785264641; c=relaxed/simple;
	bh=YT+86nJwEOUECHQB896RvkvYStj32QHHatM+YTInQEM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SI0dneDjDtddiGZrBaX2j2jB8Ndw8H47xBRW2Mi97fBY4pvmO0SyVT8NuIGpoUK+UDTB4rV/Tzqo3TCt4pQLW84FpgsAsUPepa4Su4ucPnGc46Hygjg+pChJhb/Z1e+e6h6B5uqqURF5+AsGtF4B/m07EpXgbpq3z/67GEMxD2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=I9w5szzu; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="I9w5szzu"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0D9C58818E;
	Tue, 28 Jul 2026 20:50:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1785264631; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=krUX8qWX7+YYev2kAywivXQtRbDed2gudF3aBPSpIu4=;
	b=I9w5szzu0dST5LY4HQBekjaK4yNgFqsIC1z3UTWhIq3oZ7ZJKs3redi0p+W87JpT5Altwz
	UtEJsVGP96p7iDzeG4KnnPuLeKik6kjGp8ygnt1YWTjaz4ir+PBbYPNioe7EMXL7T6vbPp
	mpJ8hmOADBb7R4pQmlY2SsgBBYS87JvrCjk1QRS44UnNJE/+ipxM1UEG1A5/qKMx5mBPY2
	ji64/jMuSaUaE72j2lbMnBpoDmwVDchN799O99DgkLFcvgOL/h7BKBxHQ59KRGQ+vmw74T
	qo5JbgkfzmMQkEME/wXQQOYtew+DJePkQLaALfHHUp1MnAmaHkOvHRbCFyGO5g==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	devicetree@vger.kernel.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH 2/2] mips: dts: econet: Describe dual-VPE 34Kc processor
Date: Tue, 28 Jul 2026 18:49:59 +0000
Message-Id: <20260728184959.102441-3-cjd@cjdns.fr>
In-Reply-To: <20260728184959.102441-1-cjd@cjdns.fr>
References: <20260728184959.102441-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The 34Kc processor has two VPEs (threads) and the interrupt controller
on the EN751221 re-routes (in hardware) the software interrupt pins
zero and one to numbers 7 and 8 in the flat VEIC interrupt domain.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 arch/mips/boot/dts/econet/en751221.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/mips/boot/dts/econet/en751221.dtsi b/arch/mips/boot/dts/econet/en751221.dtsi
index 72cb65654c34..57ae84a8a9f8 100644
--- a/arch/mips/boot/dts/econet/en751221.dtsi
+++ b/arch/mips/boot/dts/econet/en751221.dtsi
@@ -23,6 +23,12 @@ cpu@0 {
 			compatible = "mips,mips34Kc";
 			reg = <0>;
 		};
+
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "mips,mips34Kc";
+			reg = <1>;
+		};
 	};
 
 	cpuintc: interrupt-controller {
@@ -65,6 +71,7 @@ intc: interrupt-controller@1fb40000 {
 		interrupt-controller;
 		#interrupt-cells = <1>;
 		econet,shadow-interrupts = <7 2>, <8 3>, <13 12>, <30 29>;
+		econet,cpu-interrupt-map = <7 0>, <8 1>;
 	};
 
 	pciecfg: pciecfg@1fb80000 {
-- 
2.39.5

