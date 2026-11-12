Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794510567;
	b=funREbYWcUKQFXW6YE0rSUOi0FmTilAO4lBJPb7qydeEONXIxCOEJzOkFMulGkwPXYW0
	 49o3XBokSdvbcf957OnuWo3fAKQ4Sla/Bol89pApgsM8p7qpnijLTDPExDGA+lhsliMxH
	 PJaWF4ruE8UfLglFsPZHF5qKd6aXgsrY07kNHBCSnWzLIYW1t8u0aPJ9WtWD7fiawX+6d
	 QBeEaD7aG2GfMO2o3vL77401ww50nnqgTXwcgfRgyAqBiXSlcndnb1aihGEiKSKfgSWM2
	 3zwFTeoa24y0i8i+nZBg8VVy+CuUXNjuROzT007BAa58yT8aQ1aFqQ/3r6zoQKIVB8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794510567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=c1dni8wQl+kQkoRfg2fRmlfc/EYuUZuhfj3zW0/x6MU=;
	b=2PKBGXwr75aAuuXG+71/4hGqUFO1Nm22/wVuxP4ay3rVZpfusNZoaVu39lODcCjWD3O+
	 aNUUBbGkNunQSRbeOM9It3OzPDxDFrwUIEBfuqxPct+akt9abtFkqmWyZY7TBRTUB2jKi
	 6nLfnBJ+IeKfnIVUqr4v09IcMzphJyNCZcalXcNJ5afBpCFANWOnFt4ktQzTzMlw1dCdx
	 MFVsAc5VjrU1u3ewwdDxOvIIheuPIdUMzzYtmMg81+c4cLAud01fg8NAJq7jEKPzF6QX3
	 VWfnuG4evoAOV9CM1xQV6SsNiQw/B8zkwKzjOPqS5Uy042BbXpiU7NI0XmwHuhk4A3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PpIKNO9i;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FFE60A2603
	for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 19:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37FFE60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PpIKNO9i
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-37628596783so358486eec.1
        for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 11:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794510566; x=1795115366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c1dni8wQl+kQkoRfg2fRmlfc/EYuUZuhfj3zW0/x6MU=;
        b=PpIKNO9iCXFN0JuyGZ/RjZ00OHOtXTxwdAm4SLsStsWOLkqrrwwVw0caO0Ele+3UrT
         GxTZPKtkK51agJTDDENcxoOs0wyewqtU13D1SGzYQB14hbh+382ev0/qIpmG701aBiuJ
         4W8Z7iwA52jkHhetKcadgSjc6RFvrHLBovzVvAIMGDJOt77cAYhORPDFKD+tjbiS8OYk
         7d8uU3QRfp0pX9o+fiwGd2YvMiP9Busry76kmVmG/GIoXyQYHnPZyGQm/GdfBv/fL3X1
         HBrtnY+BdBEIN2CyYcKuCWAMWA8/Jm/pyolaf0VaUdNYJfdJqd1EVuybQ0mF/RGhzbCG
         DBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794510566; x=1795115366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c1dni8wQl+kQkoRfg2fRmlfc/EYuUZuhfj3zW0/x6MU=;
        b=PQfc20qKu+cEv1qNH3AVXZOPZyx9UMw+4WcMDpkG/jzGSiQreMgv70Dy8hMsf5K0i+
         /bg4mbxnjhV1Jx7ZUQEcWOCs9ASzY/1vyoiZdPxkoku1fOb7XC+mzH6+XepKGZV8gqX6
         45UNPLRe43vGYrPaqEMbbGiV7t4eRztRNi2pBix/6lH6TjPhf1Uj1U6FDyTshV4cPuT5
         tk5XJhFro0WiagX0Wo1iNh+j9RzO7vnKE3+2w5APkRPz+bUJ2rvvCu5hkZPwKY2niCR6
         IYkpGI2gdkuArtihcnUBCWKOryTTC1S6nlmslgWJI1xJE96uz9T7FO3W3buv75t7ENFJ
         XijA==
X-Gm-Message-State: APuU4Z8PbizWs7L18Ti1TRp0ujSoUGDNlyv7KKaYiSkTL74FbwfJBjS1
	4Rw8IUfNZvrTLxjNIxjaO71bQgM+1dd0We/BLCLEtrOp88XuGXRxnkMiryRKew==
X-Gm-Gg: AYBFou0mwC+Q1tpqFMejSBcyiQDlL4RHqBu95DhKiYF+xpR3DkhvQ6msxZYtPStJ43L
	co+AzKfU81yka2b2dCxf6wzSu2AeGsKLzKB2R182exTS5EtJou8QHRqzaKxJn0Cp7Nl91ozQYfd
	c18W5RoQzK0/UtudEngni3JfgYDjSHlwxJiqEh+sNwssh7tnmRg2crfE14fiEuC1bbflbmJG4w7
	Hfv/orgFBBkzhxkzBJjd8p32wMxatU1UpqeZSGvbw7xdhiTx3py3Xh5hP8bT8jmGo8pIOUn5lZW
	l10sc893cv6nEa06ZUJbFoD65VlKIoK8z1ZBVF/4iUaJb8/xd8f8jbMQZxutalep0t924JGkOeT
	wjFxVVeHfiVwHwYV7sl3d7QDQwNK9Ig5IuNRElOBhjGG8VtNVeQDJ8G3Kb9F1OOroafu2NJ8sf3
	4uQjADNZjXHN1v9ff3acupQYiToqRrBMEYVtIY3NY8S61n7bwp/AHwCtvtOn0Cy9EZzQUQbF/ID
	KZ0/ckfTYJEU/Uba3sD3AUaMVo18F1npiTPEXWV9NtoT5+rwb8TexI7Wkv//LSjRONNUXDNl4Ou
	TbFMs8pG
X-Received: by 2002:a05:693c:8816:20b0:36f:350b:3838 with SMTP id 5a478bee46e88-379671247e7mr76378eec.31.1794510566008;
        Thu, 12 Nov 2026 11:09:26 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad6casm395674eec.26.2026.11.12.11.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 11:09:25 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-perf-users@vger.kernel.org (open list:PERFORMANCE EVENTS SUBSYSTEM),
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: [PATCH 0/3] MIPS: SiByte: Add HW PMU support
Date: Thu, 12 Nov 2026 11:09:13 -0800
Message-ID: <20261112190916.3725141-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
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

This patch series resurrects the SiByte HW PMU support which used to be
supported with oprofile but was later removed.

Florian Fainelli (3):
  MIPS: SiByte: Wire up the CPU interrupt controller
  MIPS: perf: Add SB1 userspace callchain unwinding
  MIPS: perf: Add SB1 and SB1A performance counter support

 Documentation/arch/mips/index.rst       |   1 +
 Documentation/arch/mips/sb1-pmu.rst     | 162 ++++++++++
 arch/mips/include/asm/mach-sibyte/irq.h |  10 +
 arch/mips/kernel/perf_event.c           | 106 ++++++-
 arch/mips/kernel/perf_event_mipsxx.c    | 373 +++++++++++++++++++++++-
 arch/mips/sibyte/bcm1480/irq.c          |   7 +-
 arch/mips/sibyte/sb1250/irq.c           |   3 +
 include/linux/cpuhotplug.h              |   1 +
 8 files changed, 647 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/arch/mips/sb1-pmu.rst
 create mode 100644 arch/mips/include/asm/mach-sibyte/irq.h

-- 
2.53.0

