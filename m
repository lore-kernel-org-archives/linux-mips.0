Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591241;
	b=ryQpFEg3kVZlF+eyYsrA4BsvUwTna6C5hle8P+ACehWGJ019XBjAL9ZvgOTmUGcQHZ0e
	 i3pv91LM6fb4Xm7sIV8FvLROAvvv2puw42e5uQuC0EkFzJq/8/QmS+9Em/4u+gwB7RN6H
	 hgxfj/+l/l9wF7RNLyt+bjiFSOk9IqMwKsN1QpW2UKq5OkeWmz7VUrnbc1DE7jtBW/pxQ
	 Xu93TEfa0f9lvlQl5KFICe0p/MzYXOiEnlubjlumCrq9PoSEC9GJyd/9pHpfX88Aascn4
	 JbiDzKzJ4B9ZJEUKzUjbmCwOYhhklElq7fksrQxVatzSmfLlKM2nWeljZuJ6kg/JcdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=l1SQBJPQH32GaCf6i6Hpvj4B1BS4U8Mq3RY+38E+QYU=;
	b=BkhVxvYD/DpUWZHX+IBXtBKYBUt9oczovxKrniOTgZbGUCpTbhpRrxEDYTRvxENqxPhR
	 i6KUaN9tMvBmUyr9IZGpX+ExR3DZ8GzHNeLX/EoluNqBDlHHn5cHpQp0EUePvMco32/bD
	 IpUkBDkVxeodCw3NyohU2menqnPJTrrNZPHXNmb3rhhUu7OyecuNn7iB+L5nUoAnnRpe1
	 pIG5CDW+ArEBiH5ziG78vKaDEod0cUBIjucM4FD6iUcUAid0f9t5NWyCaKPodOPZbm7pp
	 hG6bIdH4EvD9nLtEFTuKLcehkTw/yxEVosFEDvMTg71oopjaZ9/K7SmFVV9UlFb2blw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Hj0WHV0;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A9E606A331
	for <linux-mips@vger.kernel.org>; Wed, 25 Nov 2026 07:20:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3A9E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Hj0WHV0
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-38190551625so10862398eec.1
        for <linux-mips@vger.kernel.org>; Tue, 24 Nov 2026 23:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591240; x=1796196040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l1SQBJPQH32GaCf6i6Hpvj4B1BS4U8Mq3RY+38E+QYU=;
        b=0Hj0WHV0sCenXk/k/xVcG+zSdCreRDnD/0hLussH4OcMEsCHKs2cJCeuaNJHXOdMEQ
         5icV7kjOJoiRr2VoLmk90HusSg9HJw+joHGCkYzd/qs5wgplo2gNXHItwA0r82O67+82
         Bk4viAMgNdSQw7Z7QdrhGHtxOEhU8OMjGwJGM+boj2LbVL3XwPKarLQ8R0dYZ8AyqTHi
         v/MJ++szMSU4Nx8K8v/iPc6R5HheJrifO6Yun/y1quskPQtygqyBFeUpf4M6iTWiNKUU
         4IICQN7VqE54J428XNHhD7vVxXuWxuWT3FLR35EgR21DSrvlNdW2sjKyUVO+S64I9C36
         3yLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591240; x=1796196040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l1SQBJPQH32GaCf6i6Hpvj4B1BS4U8Mq3RY+38E+QYU=;
        b=Qq2uRC1W7pt43Uy3a0AkYONeQTX27y/BcAp9zohceT8c0nuZHdJ2j9NXkcH8XdkbRL
         u3s7+tOhVoTzqM4cjHp2LICBoqgAnUrh9GOnx0+7gxsnDpvJYgNH4n7/jE3sp2QY0FPQ
         CvmH+MewNpaCm43r29qlpwD0hOg9xYnM53jkHEpl5MwcPDpYLXj5gpQMAYagcMIsBh2Y
         bllRcsFyn0T1BCCE+JCyr0YZwRYiHTFxEgKc/cePqL7VzvSRchLI6RArh+8o1gId8ZJm
         jIx/j6yu3ELYDJihUlK+MjhnXZNFNXs9U/fKXoM2ShDiwCruSO9XAgZN6VUaeTREUF7J
         vZ4Q==
X-Forwarded-Encrypted: i=1; AL+hErGTbnpQitNtF1gQtVYUx3dWIfwd8qJkg2bl+XkJ16tVfsR0bxGLd1wrRIRzN/XF4tJAF8oTNtfnAu0M@vger.kernel.org
X-Gm-Message-State: APuU4Z8e7CszTSLyvzxObaDt0u/90O5FydMuQE8ZLyJ/PCvVOW8CS5tQ
	s5wQ1jZXXxUs101DhdQB4U4r4B4VRXDuyDVd5kLCUgxeprNiwrwVhcg9
X-Gm-Gg: AZFdTZcP7pojcuwoWE1qe7q0OeSgte63O/s22tAhbRwmeh7FGuwsxeGv6bZoHKLqihU
	a+Ift+CP+qx2KchGQZF7/fc9F5P1yB3DrPjql4JpcZYXqnuEbVKodnWlpVHEzS797/bqnJLD8ky
	hjss7t40+hzNbOFbUykhAfbwNJ46xN8n5yU4qNYkjdjXRpbU/G6659yc/HA/IYI9VjxURh+WU9p
	2x+bb2lUmeMVXoCPpVpF45qH/TM+cUP7PzmzsJS5W0gryCYsAyK0yPtaMowB0AP5CHD0ecrk/nZ
	jg17hEG11yKkD1kCGO1Jw39qm8crAyxZPMDv/sE/N3Hjz0eFg2bhpysbhRlqUC2UzNTbx/A0vIQ
	zkdnMG/6ldzA1qciUbswYNkxW/BVlEscrFrkahx0em2VigPiz8x0vNS7UDZQvREbcpOXsioGU/F
	C+qc+KpxXl8U9sFSDeFp2uWCDPbAqm6hNThwysc1qVYjbUL51eP6IXfm/swQZaj/iKyPc1GyVrT
	7MN2Nn7s42lAYpfsCmWnsAgerXr9ODxCWqPuk38D2e92LQQ5uMf4UB/TKw39fRC9HL/Q5hd1AaN
	j/5yoattce85yQzB60O/uvXoK7Ad1Yqy3A8seOXkJZUOIPx4ogwnai1eOOFNBtsA
X-Received: by 2002:a05:693c:6010:b0:385:2057:eb95 with SMTP id 5a478bee46e88-3857073f2a3mr22650185eec.31.1795591239429;
        Tue, 24 Nov 2026 23:20:39 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:20:39 -0800 (PST)
From: Prasanth R <ragaprasanth@gmail.com>
X-Google-Original-From: Prasanth R <prasanth.r@lineo.co.jp>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Paul Cercueil <paul@crapouillou.net>,
	CL Wang <cl634@andestech.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	Prasanth R <ragaprasanth@gmail.com>
Subject: [PATCH 00/12] rtc: clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:20:14 +0900
Message-Id: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Prasanth R <ragaprasanth@gmail.com>

These drivers set a wake IRQ with dev_pm_set_wake_irq() and never clear
it. After unbind and bind, dev_pm_set_wake_irq() warns "wake irq already
initialized" and returns -EEXIST. For jz4740 and atcrtc100 the probe
then fails.

Switch them to devm_pm_set_wake_irq() and devm_device_init_wakeup(), as
was done for rtc-pl031, rtc-stm32 and others. Patch 3 also fixes an
unbalanced clock disable in the mxc_v2 remove path.

Patch 1 is tested on an i.MX6Q SABRE-SD board by unbinding and binding
the driver through sysfs. The others are compile-tested only (ARM,
clang, W=1).

I used an AI assistant (Claude) to find these and write the changes.

Prasanth R (12):
  rtc: snvs: clear the wake IRQ on unbind
  rtc: mxc: clear the wake IRQ on unbind
  rtc: mxc_v2: fix unbalanced clock disable on remove
  rtc: mxc_v2: clear the wake IRQ on unbind
  rtc: imxdi: clear the wake IRQ on removal
  rtc: da9063: clear the wake IRQ on unbind
  rtc: fsl-ftm-alarm: clear the wake IRQ on unbind
  rtc: jz4740: clear the wake IRQ on unbind
  rtc: atcrtc100: clear the wake IRQ on unbind
  rtc: pcf8523: clear the wake IRQ on unbind
  rtc: pcf85063: clear the wake IRQ on unbind
  rtc: rv8803: clear the wake IRQ on unbind

 drivers/rtc/rtc-atcrtc100.c     | 8 +++-----
 drivers/rtc/rtc-da9063.c        | 4 ++--
 drivers/rtc/rtc-fsl-ftm-alarm.c | 4 ++--
 drivers/rtc/rtc-imxdi.c         | 4 ++--
 drivers/rtc/rtc-jz4740.c        | 4 ++--
 drivers/rtc/rtc-mxc.c           | 4 ++--
 drivers/rtc/rtc-mxc_v2.c        | 6 +++---
 drivers/rtc/rtc-pcf85063.c      | 4 ++--
 drivers/rtc/rtc-pcf8523.c       | 4 ++--
 drivers/rtc/rtc-rv8803.c        | 6 +++---
 drivers/rtc/rtc-snvs.c          | 7 +++++--
 11 files changed, 28 insertions(+), 27 deletions(-)

-- 
2.43.0

