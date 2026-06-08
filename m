Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36AC1B6D1A
	for <linux-mips@vger.kernel.org>; Mon,  8 Jun 2026 05:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780896743; cv=none; b=RonCGEQRdUmb8lqoWteOgDUgu508Ph0WiYhceDc1C8iQWOjD20JzqOY9v05VEzupIvSwmuquG4qvCq97ERyfK/+vLJXi2MCpdAh/w3/vBBs6+Kns35CiuFIbtgp2zNcb3/DV00KjJAedj4v78fv786OodMwFakQSH0raRKvS5h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780896743; c=relaxed/simple;
	bh=L36nlBpBnY281FzOJjX0G2x2ETccgVsQym4w89qq/L4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CSZiKfeUs0nX/yE2NnOVClFxf3Tf+LWokcur15icI4Mj/ZnVCTfVZjHnElt05OC3JLMyK2nZ+kIYCKcjyX3NV/RxRHeBGVicg46N8PxuNblGXi1k3okj1GBAPpw7XAz4C9gI1xl/03QKHpRh4L5aHwFSFGedSQmhZn6jJxHZ8/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WQm2GqOt; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WQm2GqOt"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36bb3551f6eso3319578a91.1
        for <linux-mips@vger.kernel.org>; Sun, 07 Jun 2026 22:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780896740; x=1781501540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OigwQgbSy1UvoaAKfiepGyHvBWZutBpwSHyT2nj2TAs=;
        b=WQm2GqOtcWhUQZAiaHuNHXWHHqwbxhG+1duHq8+pC/bAmBHn/Cu8Nmvt1FvGHhq7kl
         spD4cuf4kxka4P3Xynx70zPIJA/gN6xaL/QLW3SATUvCnpBTx7PWJX2Q9jdfYBT9IgSE
         3UchtAeZj59VOxWj60Z4U3hNubIIQE52nujaokf620Xc50oV7gb0mIogalnop56rYBIb
         4IZbtCFDnxUulhUZDxq65hkGqlFhjZNuVyKS612+CEQY6h8fn1gZBzxiDBuUQg/czX8I
         q+gM8gQ9qOpmdRWH2LvE8QHK7pEYYj5hZrgybT0gN3eps2X9A7KIwnYwmv9Y//xyMHzT
         wS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780896740; x=1781501540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OigwQgbSy1UvoaAKfiepGyHvBWZutBpwSHyT2nj2TAs=;
        b=Z1DfAH8sz7InXGXMiI+63HzjTnvka2VQB3g4KSo5rG7GXXZNaQxzpYSvWPbzVG2LUO
         jCniC9bkobVPfBxNVlLGDTydK4d1KD33UklLL/8EIh1PeCV0asewSS5QbWomFjOkgL3b
         Hck6iFaQsRWQPFScp3+CiEk41G95iZwHxxjH2hgSICZt8y3k14BC/rDzW0+Nuutw9cbl
         SoY4EHAh2f8afDpNzaw0uLRuOikZIFFjRil66LkeMeVqsiJ1OE9m9eW+/mvIXLTwotH4
         MUDe5CbXMmy7/MRsobBB4kM775fx2t+xR6CZbPali6AzLSwMhYKCCZH82o8pcizmix8d
         /OTw==
X-Gm-Message-State: AOJu0YzGcjnc/IzjB/raOXVjNy2Q/0diuMJGDYZSL8uc00XXT7H2vBQa
	N5dW7SVsF49h99wxmoED711ybw1fB+SHzrVDxCmRnFUXnTSEWwQyWblRaqoSMhd1
X-Gm-Gg: Acq92OHOmtsP7xQx5pjo82BaFcMuVUT+6NgM1m+epmG+etWr6tp6TL8uucCHcDwJRxA
	hqAjs0bIfcQhOjhaEQIqdfculQftNtA5OPVSdjAjMhd4l7bzG75AHcNfw2KaLtPoIKvL596vDSI
	sa1UiDqcTqbkDLmxh6HmpR5w9c6sM55BKO7Ni7RC1DIcdAtUKcJP58coEf1YvDDQmKTbvVuQW8H
	3x5raP1M8mBZhftz86qYEwfr6cIj4Bf/ZnzeNKSontTNNF+IJcCNvP5fC1dmsL3EyDvBLqIAcLz
	nLJV+xJkrm2HwWrv9LJTmJ12a+STfiuDitbFvZ+Hg+Suzc3Uu3wDKYPtcM1C2siAMG8eQ5pvVbW
	cT7Azd88LroPgM7WkSSrO2ObgSqAlJdXI35DCYMK1ai0DCMqqYVolG+3xnr7BUTfBs6kluKdbtd
	sodRQI6BSrjautfgAoF2WDizdUoty0zTyfc8U6rM+RAJ+kPPyu132Bh7MOir5iYjzzluvZ2M7/E
	iMcrM8iENVpRhh9nCoCqyN+a8PdLZTuHfy1DrvZ2041TA==
X-Received: by 2002:a17:90b:5345:b0:35c:30a8:330 with SMTP id 98e67ed59e1d1-370ebff342fmr14191018a91.0.1780896740281;
        Sun, 07 Jun 2026 22:32:20 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282918b8csm15867411b3a.57.2026.06.07.22.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 22:32:19 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mips: dts: ar9132: fix wdt node name
Date: Sun,  7 Jun 2026 22:32:02 -0700
Message-ID: <20260608053202.12004-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes the following warning:

$nodename:0: 'wdt@18060008' does not match
'^(timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
from schema $id: http://devicetree.org/schemas/watchdog/qca,ar7130-wdt.yaml#

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/boot/dts/qca/ar9132.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/qca/ar9132.dtsi b/arch/mips/boot/dts/qca/ar9132.dtsi
index 4d3c48a9f9fd..77225ed459cb 100644
--- a/arch/mips/boot/dts/qca/ar9132.dtsi
+++ b/arch/mips/boot/dts/qca/ar9132.dtsi
@@ -98,7 +98,7 @@ pll: pll-controller@18050000 {
 				clock-output-names = "cpu", "ddr", "ahb";
 			};
 
-			wdt: wdt@18060008 {
+			wdt: watchdog@18060008 {
 				compatible = "qca,ar7130-wdt";
 				reg = <0x18060008 0x8>;
 
-- 
2.54.0

