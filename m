Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C284457A9
	for <linux-mips@vger.kernel.org>; Fri, 31 Jul 2026 17:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785520081; cv=none; b=hxnVRMm3AYc1ydsjJczNw3l1GbN7PbzMcMkoU2oFTqf02/4+/d5ygyLZApEglNj3dnFHdBWRQRI3Y1neTevnLLnGgxMtatHTxSiwhH+rab1p0CH4HVWQk5NzymcOFhq3VXCVhqccbOOHK090Zf4CzFQVFmdj1vf23ioG6b094No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785520081; c=relaxed/simple;
	bh=0yNn6UCEpfxiasWFtsI4EcNwcryZJo4lBKG5Svutmh8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jknN22dyaVvc3lFZhhuN6GdJ71vcYhOFLyDzuh91p+OXY9bhTt8u2jLAtUohumsBBP755nTR3/Fr5qscYBhhDOmnnFpW4HeDAeKHdpHhbNkoYBLDx7d/BPoe1DHGD7pROVNuigdrZeSZFBn8EWB9+KJHxqal8HJoijEvgv3II3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtmjwvRR; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtmjwvRR"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-45691990234so897171fac.3
        for <linux-mips@vger.kernel.org>; Fri, 31 Jul 2026 10:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785520078; x=1786124878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N+XQUCg6wdOzJjQ9gmJVOhDWO1BvviUjv32Kg81AE2k=;
        b=UtmjwvRR8LdBz7N0kMvgX+0sCkqj/LASGn/vSjM4zLcpLwz8fC98Ox6oTFfaqKTZyd
         WqLqg6tqukuLU+ESQIGllfW75q67A9gHd667yHAgCp20n196FCFHieuXudJ9gXSKIsTj
         x4ZGwnBsMu4QBgprdxgninsxTbulmhOkMm9Z8MtUs/vINQVT5D9jYt1BqUbF+zR1wg5R
         eCoiBqhxS27cidcnTwNF7vywkO3MvL6XU9nbF7QBhbNEahulhXWOy5VVhVUM3b54jt4x
         ANHM3wrvEP5ZFdxDxOto0jVOLRDxqqGuefsNPTwTF3FErcmV30exfTR8EuXwDU6ToFZB
         UnUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785520078; x=1786124878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N+XQUCg6wdOzJjQ9gmJVOhDWO1BvviUjv32Kg81AE2k=;
        b=BeqGiJmEDlSCNfddYNSsnxXdA6vZak8gRlX1ZMHbiNFHcifVm0U4o9It90orOF7+Wk
         DQFGu2nks/uWpkD8m7xRjx8QvkkhuIicloDngC/oFdgUQ8eNoYjNmp+o7MIyBnl+g2ZK
         Dw8oERSEKb+2GwhmwOHvvZP6PdkIpgjhbal79FLWaRimumLOP9aAx5GedwQuLO9RgFSN
         45/hoS093vdZ1x7VUNPVnrvwgsFRuMh3zKMCPGAFI3IrelKXjCectPfnvRevVthmsON6
         3UcSgmEvAa8L5fp4E18NCsD1qgvKkuCD1laakk2+0NZEwX0bm1d1Iet1fZslFWZ6Q1zt
         kekA==
X-Forwarded-Encrypted: i=1; AHgh+RpHUrcvB3oJYyI5A/aNVxghKBB+IxuUlrGbvZYdk9OUbY7RkqR5OT1BeZG6u+s5C/WZKuH4o5fC21Db@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3kJmIpUL4HFR7PP9Az/5+gReX8S1CtQuhAs43+mtZ8f1KHQYj
	RVSzb3OLWCC8ExUYJHjOO85TIAG45gHagFHRPL0QqVqVaNEgl8j21Oct
X-Gm-Gg: AR+sD10B4wCdSLzpQSK7pi/+RT7Rd8V7zqYKhIkJ2rQhbtJbwpSxlNSm6wcg2pBEteq
	WSSSb97CsTEJGGZUCb69rpuN2+Oxai2fFFF1KYXRCvlknL+/8XLUkKH7/LFEKBEswAYLxD44nhT
	/jraUqg7gLCW6ipT3FM0TVP4AtP3guFjDjeSGX/2nlEIvs+K6dgUajZOQEo0a2oBe2KwOzjOqAO
	z6qMPVsLLRAPi2UKnyEMhMWjBzjeiolxSQih4N9JlFcHD7vHaj3sJCqTpH52gGUz17Sd1FPPwH7
	+bPdG5Ieq2BIxpDhByehYkMU9HmDuQjIkfNiGYUX1OQLKgoMqpyWee6E8eQwNdmGgNU+0XxTQO9
	2aPudCQptDcSpVp2o0cXn7uTbtuJ+hYR6mPFRa+Am7CpO6AWoq+8LJSCWPkE8s0jaKB0he+xdNm
	1J7yPh93Pj06puiVI9zNjuccA9L/ssIJaOFYRgh06oMoGqRlJv2NZVk/9kyM8q5kzeHyE+B4jjs
	JBCnf2tCa8vasgpcQ==
X-Received: by 2002:a05:6870:c228:b0:448:a3d6:c2d2 with SMTP id 586e51a60fabf-459059caa56mr2000761fac.10.1785520078354;
        Fri, 31 Jul 2026 10:47:58 -0700 (PDT)
Received: from inhnjlux1020.ls.ege.ds ([49.204.164.242])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458f664d812sm1845122fac.9.2026.07.31.10.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 10:47:58 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: tsbogend@alpha.franken.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Udaya Kiran Challa <challauday369@gmail.com>
Subject: [PATCH v5 2/2] mips: dts: pic32: pic32mzda: Remove unused address-cells, size-cells property
Date: Fri, 31 Jul 2026 23:17:51 +0530
Message-Id: <20260731174751.86819-1-challauday369@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The #address-cells and #size-cells properties are not strictly
needed since the child nodes don't have reg properties

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
 arch/mips/boot/dts/pic32/pic32mzda.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/mips/boot/dts/pic32/pic32mzda.dtsi b/arch/mips/boot/dts/pic32/pic32mzda.dtsi
index feca35ba56a4..433dff3cf14f 100644
--- a/arch/mips/boot/dts/pic32/pic32mzda.dtsi
+++ b/arch/mips/boot/dts/pic32/pic32mzda.dtsi
@@ -76,8 +76,6 @@ evic: interrupt-controller@1f810000 {
 	};
 
 	pic32_pinctrl: pinctrl@1f801400 {
-		#address-cells = <1>;
-		#size-cells = <1>;
 		compatible = "microchip,pic32mzda-pinctrl";
 		reg = <0x1f801400 0x400>;
 		clocks = <&rootclk PB1CLK>;
-- 
2.34.1

