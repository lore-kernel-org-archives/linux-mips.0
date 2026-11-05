Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910772;
	b=UESuQ1IYcOHXE5or2OUrGGz1cKj8f4yNwWQw8+3FjHfkXL+qa148SOr8zuHHqzsaCNoy
	 0+1x5IPLyIYTWgqXsVyRxB+XXCAtdWsfUTUiud/hEokuzMVcm9asDNyWTwqx9eZPM5QXe
	 lxwXhTfbQLELneMvOE2JYCyx0PC9m4mCeD6ekbcn+dhThAkdbpLz9FYXd3EOZ1fQkxWLn
	 TW5CWR3y9cSERrVkdLF5B6s9tth2kH15KUfNC5HhUrHkKiBH0qrBoUwYo7FhGY0Ez31kF
	 /sQuYx+gc3OrwtU6tiySYhRWIxPe9HZZQFd1G8cAsHuNqrnZmgKz1dDDKeeAj1q93/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=9Z8PMfPvxrxGf+DKOk0RzngX5JOV8DGnXZZn1Uac6KU=;
	b=RUEuiquxRMQevvsJs87CJry0bi3zOO1d/Tn7oydhhpwCLd0jvngUxrsEqHdrE0XSwme3
	 82KZaf5+WFNCdJNbs29foX8cVrpBohRqhJk+32hHkesHqUtChte1kn+2P37RUQql6sbuV
	 VYaK+vWblVj5mdw1HQVW6GeR1ICLscEkiDAZ7+R4Ekc/mNAFkRBYCb/QcD8vOmVPq/yUO
	 jCyKsBYPTjPyragEewah9ACjHjm4a36ULBd3K8d9ZzlhATDT06QUDCK1Ggq8IrWsGB2gS
	 HRroVT0S009n1JyIUAI+74GxWiqpdzIzXkkk4BOCNOGgnEiGn+CzVk7X2eY10iPAvpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mm8Va+dD;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1C0606D815
	for <linux-mips@vger.kernel.org>; Thu,  5 Nov 2026 20:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F1C0606D815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mm8Va+dD
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3282db206d3so101399eec.0
        for <linux-mips@vger.kernel.org>; Thu, 05 Nov 2026 12:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793910772; x=1794515572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Z8PMfPvxrxGf+DKOk0RzngX5JOV8DGnXZZn1Uac6KU=;
        b=mm8Va+dDv5eBFA4fNuGRrRC7b/jHpu1S6axzT/y01V22GTWPiRGH/88mr355Cvw2iH
         XdSGfQN+mhgniNO6+ZJaibST4Vpp9w674OIrn1Emx/Z76gGcYVBTSoIa7gMaa5D2fSDW
         vLi/1nGkVodW4fNo+a0mc1Ys25FReXMmsy9+5VV0uH9sdrnMa46c8zRBEQS4poTYaTTq
         PnfcMF2TLQ7qWxkJFpkSgLj0qZZSK8OII+vIVV+JFiGsSSg8yXOEOjBZj06M/Xo8Rihm
         /y9PLyltwqAJpE/8MNBLlgRiR8Xl1Kfc/NOvm6npN8F/GjiKMhfedzMrGrHGrPGski8m
         TTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910772; x=1794515572;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Z8PMfPvxrxGf+DKOk0RzngX5JOV8DGnXZZn1Uac6KU=;
        b=chnQVRl00xJK8UG0kQ6YHYvImpzv+mO0xnCbr4RI6nRA1B9O9idEtQXFS3RZUI6Far
         Uwv2+JdkmNq1+Ydy4SiOX/XdJWDefHgzjiYqezrgidIZxu5dsUGUmVMT288YYUixzFzU
         Lnc94Um9Qb5hUB/u/P0Nm8FMnR3MY0OlX3dRfrY5PE9/jn5i6gQYwMJkY96wQg2XvPMk
         Lp0iN0iwaTyG5b+AV4wfQEyYh2qs4V5YaEGxsWNacFU653WtihUYNwsaphbyhJSZL6oB
         /FAEo+wkbRGyMugmFF3SoSV33F9HupM7Ya684rCyTb7Ehc95rP/yxMLqiCDxfYa/iCCI
         JpYA==
X-Gm-Message-State: APuU4Z8DGkEFoqLLCmND6Sx4k3qp3bgvXipAPpcZWVCxyoOZxrAVba2a
	2Coc/F6sk3cdZTwmfr5dtq8mCo1vyGzIJ9PEg0S5niR87BF/1ytCU1NY3kv9vA==
X-Gm-Gg: AYBFou1zSMSyCaZX25Zb6RxUC5x8v/GAWY0u1yl08M/ruB2ROQNyWEdV62XeeWA1ieL
	V+1Z5KKE/emNFBqGfI0iDN98LrNQm6DAlGj9sibh1WXtBj2Ufepu458R+DCmRGI/mt7JhtgtP2U
	oUYYDrA2oPW8X5RU6DPA51a2uGoEyAmCNTgmqeA8xHyYAdvKfiB9Zl0c/1GFheAnTu0GAI1CM+c
	+vMvOnNL6w2lUTZ8NZNmuZnP7j13tPnfADVPycno642yPebjBVnIclMB27F4d0mdAKkb4049/GV
	xuyTqvjF+ldLme4ARVDRHosvm9CDNmJYoAseSeiZYvlkztJXszV90CT2lMIzUKVPJ4bTJwMffRd
	nUnzD0wCwDTdofwPdk+gjF+/rcqPvqwMcOEC1YtvNKzJGUbOEk0DUKE+NAls9HQgUAYtxlD8tUu
	oIzOI/A4+SH91ALfY9zu9YvyIv7n8AbHiAONa8jtoWhzod8lGojihsPuc1mIdkMA5t+wbT8JNQn
	hkHm6M3tVobj5ihQ6BWKe1ZHm6/tgmkeK7MYX332y0uwaUUNiLWXIg9geLxTv3+lx5RFJCmtuGI
	IUodJnIufVSdgvn0kCwS4yB9IVrHTg==
X-Received: by 2002:a05:693c:2801:b0:36a:12c1:3adb with SMTP id 5a478bee46e88-36f75f26494mr291482eec.20.1793910771661;
        Thu, 05 Nov 2026 12:32:51 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f72dc30ebsm632458eec.13.2026.11.05.12.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:32:50 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= <zhouyanjie@wanyeetech.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Burton <paulburton@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	Paul Boddie <paul@boddie.org.uk>
Subject: [PATCH 3/3] MIPS: CI20: Enable SMP with two CPUs
Date: Thu,  5 Nov 2026 12:32:42 -0800
Message-ID: <20261105203243.2292647-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105203243.2292647-1-f.fainelli@gmail.com>
References: <20261105203243.2292647-1-f.fainelli@gmail.com>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>

Enable both JZ4780 cores now that the generic Ingenic platform provides
secondary CPU reset and mailbox support. The existing device tree
already reserves TCU channels for both per-CPU clock events.

Rebase Zhou Yanjie's original defconfig update onto the current CI20
configuration. The resulting image brought up both cores on the board.
The rebase and validation used Codex assistance.

Link: https://lists.openwall.net/linux-kernel/2020/05/19/739
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/mips/configs/ci20_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index 90536cab417e..09d65094b1bd 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -22,6 +22,8 @@ CONFIG_EXPERT=y
 CONFIG_MACH_INGENIC_SOC=y
 CONFIG_JZ4780_CI20=y
 CONFIG_HIGHMEM=y
+CONFIG_SMP=y
+CONFIG_NR_CPUS=2
 CONFIG_HZ_100=y
 # CONFIG_SUSPEND is not set
 # CONFIG_SECCOMP is not set
-- 
2.53.0

