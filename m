Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906600;
	b=DTT6/youtTj+nDLcBQhJesYp6CtZEQ9PPhqF4wKF5/PQDERkPHmpY64HJACFfwocH62g
	 DbZFHdjwXYElV7mQzABwjzNoICAswzX91OD6Qzu9Pja/9/54W23xq6vW/MZ0TeJ9Cy/98
	 r8tO6UwV8ZkHTZ6rt4r9LtQlPve2v2LiSgaO+neRN3pkycXOoakx5wEfHNc/1t/uskM1Z
	 E0pLcrG9c5KxWrtxDJh95yukr3kJvLmMVE8fD6HH/zFsgW6zwBuTCL9U11Y/vq3kvyyrz
	 OIQR3+ce3Df1tbQcRuoh58kf81JJXArA/NAtaKMoCslVCPTTPujkSUhtQQaFMy8Z6oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906600;
	h=DMARC-Filter:DKIM-Signature:Received:X-Mailer:To:Subject:From:
	 Content-Transfer-Encoding:In-Reply-To:X-Lms-Return-Path:Content-Type:
	 Cc:Date:X-Original-From:References:Message-Id:Mime-Version;
	bh=fHUvMEx0c2bPwIe6HR6SirI4dIsRD6+ZIL2vDk7n8vU=;
	b=GuQh1BJJwEEfhuGyp/lYMGGWVLm0JSYLBUVxZlx6ziDZFX7wlxfKC3W3LEFAY5jvIJgX
	 zD5ehWeGt3jLEFhV27kSv58h4tO2Jithh6lwGW3aKD3287nEVgpgXT0W+OEeHlyCrDEVt
	 zS3isR/zrvBFQ2Iz5RuIXGFmDs0j4X8iITuXQWtueet7jgcP2zbTaDiOh7zhdvFrKpr4F
	 H2J4MD+DQZOEPWWKXIiBKCQ5nzJrFSLa4lGjyWKdVJCmkcUIhlyhTERfNY9PXLbRWravW
	 QNtrbNB6RbBW5+tKP5riTSjULzT2BHJMjTqudiKAkCQNOVY952vzA+wMcxqFk2BsB+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.cipunited.com;
	spf=pass smtp.mailfrom=oss.cipunited.com;
	dkim=pass header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=Bz5M+yCj;
	arc=none smtp.remote-ip=209.127.231.43
Received: from va-2-43.ptr.blmpb.com (va-2-43.ptr.blmpb.com [209.127.231.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71942606A32F
	for <linux-mips@vger.kernel.org>; Tue, 17 Nov 2026 09:10:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71942606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=Bz5M+yCj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303200042; d=oss.cipunited.com; t=1794906589;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=fHUvMEx0c2bPwIe6HR6SirI4dIsRD6+ZIL2vDk7n8vU=;
 b=Bz5M+yCjaZHYlYGXLDxrUU2jdQtZu+AEPN0Wy63wmZLy1noGcRBH7FE7CK0iCV6bPEg7Jb
 deyS3Z3xPdgUO5tRR/tnMiX+AVyGMb1Kk9DwANH74ySmpOPR3hme31qYvtwmmxhrm6uJH+
 18BQxyIgL+zMv77uEG3Bbz3suMlYuzarFHtkAF023da5FTnn6QWWdkEMwKQbTtt7k3UtDk
 hFjuJ7/P1RNgiujUi46npsb7RMgAAeCBjKqYO4VmV6/eyOFsRmZpcnuiNx+C3hRxlXy01i
 b9ZhgaJKonSNTNZSqvDX+gxw0Vfs7Q3kdIr2F6NNcj0uOtVEviXdN/bCfguBHQ==
Received: from [127.0.1.1] ([171.15.157.139]) by smtp.feishu.cn with ESMTPS; Tue, 17 Nov 2026 17:09:46 +0800
X-Mailer: b4 0.17-dev-ce4c1
To: "Keguang Zhang" <keguang.zhang@gmail.com>, 
	"Wim Van Sebroeck" <wim@linux-watchdog.org>, 
	"Guenter Roeck" <linux@roeck-us.net>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Subject: [PATCH v3 6/7] MIPS: Loongson64: dts: ls7a-pch: Add watchdog node
From: "Rong Zhang" <rongrong@oss.cipunited.com>
Content-Transfer-Encoding: 7bit
In-Reply-To: <20261117-mips-ls7a-wdt-v3-0-2e88f7e1d6c5@oss.cipunited.com>
X-Lms-Return-Path: <lba+26afc19db+585bf3+vger.kernel.org+rongrong@oss.cipunited.com>
Content-Type: text/plain; charset=UTF-8
Cc: "Rong Zhang" <i@rong.moe>, "Yao Zi" <me@ziyao.cc>, 
	"Icenowy Zheng" <uwu@icenowy.me>, 
	"Jiaxun Yang" <jiaxun.yang@flygoat.com>, <linux-mips@vger.kernel.org>, 
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Rong Zhang" <rongrong@oss.cipunited.com>
Date: Tue, 17 Nov 2026 17:06:48 +0800
X-Original-From: Rong Zhang <rongrong@oss.cipunited.com>
References: <20261117-mips-ls7a-wdt-v3-0-2e88f7e1d6c5@oss.cipunited.com>
Message-Id: <20261117-mips-ls7a-wdt-v3-6-2e88f7e1d6c5@oss.cipunited.com>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0

The Loongson-7A has a watchdog compatible with the one on Loongson
2K0300.

Add a watchdog node with appropriate compatible strings to wire it up.

Tested on Loongson-LS3A4000-7A1000-NUC-SE and Lenovo KaiTian M530Z.

Signed-off-by: Rong Zhang <rongrong@oss.cipunited.com>
---
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
index 1793109281c7..dfc91e49ea77 100644
--- a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
+++ b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
@@ -74,6 +74,12 @@ ls7a_uart3: serial@10080300 {
 			no-loopback-test;
 		};
 
+		watchdog: watchdog@100d0030 {
+			compatible = "loongson,ls7a-wdt", "loongson,ls2k0300-wdt";
+			reg = <0x0 0x100d0030 0x0 0xc>;
+			clocks = <&pch_misc_clk>;
+		};
+
 		rtc0: rtc@100d0100 {
 			compatible = "loongson,ls7a-rtc";
 			reg = <0x0 0x100d0100 0x0 0x78>;

-- 
2.55.0
