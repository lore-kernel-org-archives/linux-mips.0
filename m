Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795590400;
	b=gaUhTD1IfLT7UzkYyvlNthuqCW/4cnv8Fcu172BUIISrBiOqxXM71hukajh+Ze4mXtVq
	 bTPfqsI2MLP1hE/TmHamfBH8NZHuM9az/vK31lSCftJHNuqkTU1t+OgbP0zYM+hPu7IfX
	 C7ncS3QVm2Znfy5ezd0d5+5JN+4ZQPu56XTcojJx+pceMxLri3ZuLLvY5iJRwH86Z1mQJ
	 8tMnUJIIf2Forkzdc4XucN5vCZMmu7iVLHypTH8vwfw6LFjqOIWefNmhuAUzpphtEi+rM
	 7v5Ig5IrhPY1LveihKRgHiwQ43HR5DD/KPWkRKt6JuKoqGpVdT/07KFZ2NTsL1G5HfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795590400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=gmnsZL6PXmHWpydEIkdgE2KEvzktJfU2Jz8mQTYdqWs=;
	b=Qlwg4swaR6d6SJIq1MvAS1i3touMC50MqIkVzGOh1kbvqnBTSZuoPEIbiKM+5lD3vQwf
	 sZAcWCcm+24A88paC/dFAaIkXd6SyxFuelE5nCjdvc79GyRxICXgGn8wvNScifmRiEW08
	 ylS9o9R307/1C381xCbRfiw09sYqNjGGWxeae6LNHQIl+MZq802RUJy2nUhFysGdwAXAP
	 bUojLPuOIGImI67fCFgL75gvnHYgFXpoQPSAcn0Yevb8pb/p4+1angKZTQkNMBnz8kxRW
	 n2TS8I4p5KojTdsiCJjGYhKLu6ZDaqW8RYx05INRb4JFZdrEakaB8C2U5u8ysXUnDew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zx5OLQtV;
	arc=none smtp.remote-ip=209.85.160.46
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4D1606A696
	for <linux-mips@vger.kernel.org>; Wed, 25 Nov 2026 07:06:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE4D1606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zx5OLQtV
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-4ad60ec5eaaso4903671fac.0
        for <linux-mips@vger.kernel.org>; Tue, 24 Nov 2026 23:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795590399; x=1796195199; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gmnsZL6PXmHWpydEIkdgE2KEvzktJfU2Jz8mQTYdqWs=;
        b=Zx5OLQtV52kO7Rqe11YUKw2noK9nz5ab+o5D/bm1mSZLA0E+/1jHItg1pMm+cHb5Sb
         INlD1RHb7V8/arN6DEKm7YhREmY9u9aGlJ6EXLH6tQOx2CBxjGSxtE9Ji/D1SlXAOS/B
         DGZYaLGAOMssNUHvLJ45CfKK4SqHRJxTGWYdbKKxuxRPR+xulvEFtJq8zu7lcvhPl0N8
         49EVu5OYvH+Tsm8vPpydnWmWZg6bmba9WSiNjwjKrjXJOFqFYZMbPSHQ0tx4lHLEn3Bg
         M9z0+3fyRYVStUNdYO2JwvUc29hbaX3v/RN71/HyYuoNwLQ3YYJu+EBgBQxBwg8CqCO2
         7jeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795590399; x=1796195199;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gmnsZL6PXmHWpydEIkdgE2KEvzktJfU2Jz8mQTYdqWs=;
        b=kCp9e1+WGU7XMfsZt/cB/bgjmx6rIHvHbBsuu7lYbxApvUDH22Rrlr3kHMQhyiHKcr
         sbKmCAGbKMZledepMrq/jIiZkLyoT12ANeqE1fNgrUIpsW0LDVSV4RuVkU+pPMcst1Rs
         U/RLfNqrRhD9sulfbxpOo/uYfPaYtnidHY95RdEZi3DVqmx8kITIeGHKjzpFXMpMoMUg
         FF4DyBtrw/XugBf8ke19EGODnmI4f66UGg467hBeZ+Q+IPthBX8V1vNhxNX9ftOTDVgA
         CX3ezh4ymM8fi4U+c+A46TKBIiNAx8upLCggXAAnPYthnCQQbgYRZ7JxbigpvsJgQfGV
         YDcA==
X-Gm-Message-State: APuU4Z8V++gmV5P0yONDaBXjCB+DQ0FpXRjJ0an6OT7vLlBtkSsGle9d
	zwnQ2WlBh6azwDdqiXEYDzQ8lQk0Gr4djReikPUuvQSRvzeSKP+qQhWR8ZWDjrvQMKs=
X-Gm-Gg: AZFdTZeGFa0SDldpPv0EiK+cBK0dBDG6Xbw2kawyPcJe1nkQhJdhcSQWKYQge7/cWvj
	/Fwx9jySldzRDiIBYZ1IcOUNzBpu8hOGv/jBy/1Bt11RBiVd/AZKM2C6Iy5SlVVFciaJcN2yNbz
	W3g1nSGY+ye0fTMSyn8k/KrUyteD+Z2+5SKVOnsQEnWRh1UQwEzTSZ7W7RhGMas0boloVminuI4
	Zhm1LRwPMxzjXQmuUiPInMiBXVqs0WjcpueX2yzpIVYPJ14qSwAOfCZHLpSO+0V5BAS5vYgZbm3
	HUo186q3RGM6LbK1yJ/L75nJ3GuVvcAvCXnoKZPIy143WVp6/spoPs+jTRzBvVxIDgYvwqpIc9p
	b8n8u3qBpNYYduXVch/6xrbE+CbrT8JKvQnjBuvs69/j8iGPFj4zdBFeTtJt6N3Ks43pIKjf18s
	gbQq8YxH1eSuCZ4qAf0U+khTtvgzE6lxV9CXSoN+S2AxlEATjkYoDG/IZL18pwn/0EODFpuLs40
	JF9WoJ+HSEm0hKjOCn4B6hHtVtdGpVc9BEbV0n5gzq6XpG4WIlw7xThLBR/6NcXgc4J22GsuO7T
	UkQgtUPArKRV6iZ038W06AgfdYQYOO/Kkg2iZ/oiNsblJrO0mmrteDwSdIPuSp7cG9ys1aW6Ym+
	wV3pxng==
X-Received: by 2002:a05:6870:5e10:b0:467:e082:b93c with SMTP id 586e51a60fabf-4bb353c7a76mr11282899fac.2.1795590398552;
        Tue, 24 Nov 2026 23:06:38 -0800 (PST)
Received: from smalls.localdomain (ip-198-145-71-161.az.bambroadband.net. [198.145.71.161])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5b07d766sm15575902fac.2.2026.11.24.23.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:06:37 -0800 (PST)
From: Hunter Laux <hunterlaux@gmail.com>
To: Paul Boddie <paul@boddie.org.uk>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Olivier Louvignes <olivier@mgcrea.io>, Andreas Kemnade <akemnade@kernel.org>
Cc: linux-mips@vger.kernel.org, letux-kernel@openphoenux.org
Subject: Ingenic X1000-class I2C is a Synopsys DW_apb_i2c; i2c-designware runs
 it on the X1600
Date: Wed, 25 Nov 2026 00:06:36 -0700
Message-ID: <179559039637.3640816.14396135268364714521@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi,

For information, in case anyone wants to consolidate the two drivers
one day: based on my testing on a HiBy R1 (X1600E), the I2C controller
on Ingenic's X1000-class SoCs is a Synopsys DesignWare DW_apb_i2c.

I noticed it while looking at Olivier's spike filter patch [1]: 0xa0 is
DesignWare's IC_FS_SPKLEN. Both of the R1's controllers identify
themselves:

  0xf4 IC_COMP_PARAM_1  0x003f3fee
  0xf8 IC_COMP_VERSION  0x3132302a  ("120*", 1.20a)
  0xfc IC_COMP_TYPE     0x44570140  ("DW")

The registers i2c-jz4780 uses for the X1000 and later are at the
DesignWare offsets (SCL counts 0x14-0x20, enable 0x6c, SDA hold 0x7c,
SDA setup 0x94, enable status 0x9c, spike length 0xa0).

Test: Letux 7.4-rc3 on the R1, with both controllers' compatible
changed to "snps,designware-i2c" and nothing else:

- I2C0 at 400 kHz: AXP2101 PMIC and CW2015 fuel gauge. axp20x and
  cw2015 probe as with i2c-jz4780 (regulators, battery and USB power
  supply as before); 200/200 reads of each chip.
- I2C1 at 100 kHz: CST816 touch controller; probes, 200/200 reads.
- IC_CON reads back as with i2c-jz4780. The SCL counts follow
  i2c-designware's own timing rules (FS high/low 123/223 at a 140 MHz
  APB clock, against 102/239 from i2c-jz4780).

Neither driver programs IC_FS_SPKLEN today, so Olivier's patch [1]
still applies whichever driver is used.

[1] https://lore.kernel.org/linux-mips/20261024212520.91401-1-olivier@mgcrea.io/

Thanks,
Hunter
