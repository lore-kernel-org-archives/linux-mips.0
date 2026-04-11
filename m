Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA754253950;
	Sat, 11 Apr 2026 10:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775902686; cv=none; b=S/B7PJH4iSulOQoLWiJtXFshqtVLrBD1+C5RgjGbuN97L30SK/uXYcr3B3favLEXEKCI5n9xjllTIFecHfNdRuo3eRT6kHHDVcObqmLHv3DRphlXjNFOpyAy0ECu67EcxMRVuq7UEJKnD9h792+IffbxpuyyOLUVJVUXGijGh78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775902686; c=relaxed/simple;
	bh=iVShpG0Z/dcJZEudexrQsbP4JDOi+uyIxkpcfEemDE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=baRMpn/cIQnrxTvY4yyP4ISrT5T+i1qJfGUlIB6DD4nkIaURDQFwcuzzDMF/3s6LdLxyDgqa1r9I8HgxoIRVDtP/usR6wztex71mkCUV+pNQFfSRwv9bQXaNzmatV3WF4PVUIHZJoxwMu6YcPcSaPWKWkGfNSwK9AFt1cJE5110=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.1])
	by APP-03 (Coremail) with SMTP id rQCowABHaeDJH9pp6sKrDQ--.17907S3;
	Sat, 11 Apr 2026 18:17:50 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH 1/2] MIPS: Loongson64: dts: Sort nodes
Date: Sat, 11 Apr 2026 18:17:43 +0800
Message-ID: <20260411101744.4020216-2-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260411101744.4020216-1-zhengxingda@iscas.ac.cn>
References: <20260411101744.4020216-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABHaeDJH9pp6sKrDQ--.17907S3
X-Coremail-Antispam: 1UD129KBjvJXoWrZFy3Wr1ktr45Aw1fAr48Xrb_yoW8JrWfpw
	srA3929r4FgFn8trn0qFyrXF4fAFZYyFyDuFs2yrW7J3sYq3Wjvr1xGFyrtr9rWrWrZ34j
	grn7t34jkF1xuw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBl14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r1q6r43Mx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
	Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwI
	xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWx
	JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
	C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbn2-7UUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

The RTC's address is after UARTs, however the node is currently before
them.

Re-order the node to match address sequence.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
index 6dee85909f5a6..59ca1ef0a7b64 100644
--- a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
+++ b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
@@ -19,13 +19,6 @@ pic: interrupt-controller@10000000 {
 			#interrupt-cells = <2>;
 		};
 
-		rtc0: rtc@100d0100 {
-			compatible = "loongson,ls7a-rtc";
-			reg = <0 0x100d0100 0 0x78>;
-			interrupt-parent = <&pic>;
-			interrupts = <52 IRQ_TYPE_LEVEL_HIGH>;
-		};
-
 		ls7a_uart0: serial@10080000 {
 			compatible = "ns16550a";
 			reg = <0 0x10080000 0 0x100>;
@@ -65,6 +58,13 @@ ls7a_uart3: serial@10080300 {
 			no-loopback-test;
 		};
 
+		rtc0: rtc@100d0100 {
+			compatible = "loongson,ls7a-rtc";
+			reg = <0 0x100d0100 0 0x78>;
+			interrupt-parent = <&pic>;
+			interrupts = <52 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		pci@1a000000 {
 			compatible = "loongson,ls7a-pci";
 			device_type = "pci";
-- 
2.52.0

