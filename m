Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792879636;
	b=FFNr4ClK9SpMAsPOGleDX2yl3ZgTgAi25HEFGHDToaiNZ9Q8yBXC2sqvgwgPMKgffzdJ
	 GjZzQHQV74xclzOxcROpfTVY8zWjXpYZ6e3dJrzn/QORQsDF4ERDV/VQBRestmTX+kQ9N
	 sTFkIZ7YiuBtGY/bLx1FnTKpIxXk4sKrx4p6y9esnnhP5PiQXjVCmsPfS1a1ZYgOSfCI4
	 rCi6OBKrkEKYLRQ+562bDO77nPc4PUhD8IznoGAwGZ1KYQxhVGLOcY8w8N6bMQmON0bBx
	 xFvZ2eJE6PNPgfIMx+vfa3RJFRnMaw0UUD7cmk2lYq0U0HTYx+jiuFgzodLYszDFptw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792879636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=McYURVHSivgc1y7QO81KCrd/LSo/Pg6FF1ntLro9Qvw=;
	b=1NIDsmrTbFDXbXuho4kHPwnGpyolEPKjOX9lrlwWdiIZYEF/Z4UtiB4mCpURFE7y9rdo
	 mNeT76/G96EjC4pq6gtRZiMw4zBrV240P0YtfXP0tTdCj6PlYsHS8oJUkhRQsMkUUBijR
	 t0PluRTy6LlOtsJseajTJpRCpQnlMubFR6US9jbzCP7XFusK3DT3VFVi1Jxzxf6A59td4
	 CNKH3T9AyhFJ3K7PYPK/XsAeW8UpsD69kJq4mvXa74vU/DxBk4CfANkc5/j++S+LH+llp
	 278DEd/hkXj39qoHFuk2hhalTE4/YP+nCVrL3YilA0MHcXzJGb+bRhJmhVtgfgHQvzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b="m/Yiaxx0";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16137606A31B
	for <linux-mips@vger.kernel.org>; Sat, 24 Oct 2026 22:07:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16137606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=m/Yiaxx0
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a208d93758so20817155e9.3
        for <linux-mips@vger.kernel.org>; Sat, 24 Oct 2026 15:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792879634; x=1793484434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=McYURVHSivgc1y7QO81KCrd/LSo/Pg6FF1ntLro9Qvw=;
        b=m/Yiaxx0FIqI6y8cI2iuR0zdNsFeLRnz0FOtHgOsrzW+5KCuuPQugZ93Ke01QJE0CX
         bgEDUwewvdImvccpLlwzLdHkfPZWi2K/DoFq/lsKSQv0yIyu6uj8Svv8UWocoX/ECUi7
         Wv6KiU0K2hsSfxOzPqVVRrI+BT0H3JV3FlRPM0NckY3Xn3lnAdIWdBftRG/rBpPP8cbs
         8oJiQc4RsgtjfL3PzpAMPFlqZPHOD0V7FTsocJv8o7mW1CqfE2O+QX0+8uFQwxTd3ZgY
         Tj5hJwq8B/p2U7kBtr7+rtkWpbVQevAwMYQFJxGeWh61fK17emqcVXjCer/HZlmpxtTE
         WIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792879634; x=1793484434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=McYURVHSivgc1y7QO81KCrd/LSo/Pg6FF1ntLro9Qvw=;
        b=PN5IQWBouADUKb+w26WW1lJXDidL16KN6E+BYq5qMOcVoOmdHP1jtKnhIGIfG7n3bz
         1CLmaiJlxcy1LT5s6BBOvXQZzi+zly2retxUSYe+IBlp7EFGJDmeT7ZBLf0c7E7tIqp6
         sBOV8g1k0PVnvq0dUbe4byaz8K+FWYAXOHzOXQWWBhIhzJ2iY1PKPP63x8RgyPU43Pvo
         7UH8ZK5cxvjHE3Afs65bfHc8LulMV4z0Ka0R2BXzVnnkO5M2LIurTCAeEqq1qLY+pWjA
         dcSfBeJr3QFZ2rmMA33SMjqfsdm7cvqo2mR/C/p6Nq8jdtyN58hO9uS9CwnezQBW2UuB
         q9ag==
X-Forwarded-Encrypted: i=1; AKwUvBxRN2PkdIl+ECtmNelhUDSrrLZZNzDciBnX6SVh1JOKljhl2NoCAMNOp8Jy4u5b1no4x3bHI5y7EEoT@vger.kernel.org
X-Gm-Message-State: AFq9FYLwJmBUMS9jbasGum9DqUSbJZVlpLo4eYgkZfr+/BAnQwJ7d6Ss
	eZr+SxLWMYxfxdM429DKfRxXwmAfKLYFvBbyurwa8CgWMqguNM5NDciswakBx9TkCME=
X-Gm-Gg: AYBFou2hwGLCEkBNhW4Te+aVl3GEUswSrUQ5+kzpW212ZmHYqH7rDYgM+B7SZdINA0v
	nG0rrU/ByVS2NgXq7ySGcF568g0TfrRQs77fT60dcizaYypwaESDpcYpsw4xPSYC7aLNbgmkQ0H
	UAZqy1b1K/kw5AwV3J6oZP56yHdRCtiMTfVlXDRcRi7S3MOjpOrYZpaFzwX1U8DEz64rBnVpdAF
	z2ZSx41iCyVTA31Le3Y1f8xT+qoZYV/aUkx393Vbafh9yaG4OZ00oscHyCWwn3aXX95IE9iCgT+
	lKBTQdhPpFzpQMbV5OtON8zicCWd8AGkOZd02TQRhJ4q3udqXlsLKIAFTBJqMFqm+s9Pfn94yiS
	94nliqnOnYzxT5TrnQcMwXa85wVNkW8FFoeboFMjwy/+lFiIEjpcKnz6Mur25493nr36timGNYc
	LAYIprfBpQomVOvvPR0gOG6/rrkeB9FSuiBIK1I1WtVHZcVEjR237RjYv7m8Q1ZqBOVhUWnU04S
	r86wHl1LAcrJZFDeOp6QMETwi1AmtQ0BPmU4uY6ATf5DExbeLFuHJk9Hm0NK2T82fcQdLgcQLRw
	zAbMRX8ia+SX6E+O+yC6FuRDSNWHu9T/16uttiAHXsVJglWSHrULP7x0WwPhJck6J4Zt
X-Received: by 2002:a05:600c:1906:b0:4a1:7bd4:d07d with SMTP id 5b1f17b1804b1-4a35acc3f50mr41010605e9.34.1792879634534;
        Sat, 24 Oct 2026 15:07:14 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a06da5fsm53466635e9.3.2026.10.24.15.07.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 15:07:14 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2 0/2] serial: 8250_ingenic: Set UMR and UACR, add the X1600
Date: Sun, 25 Oct 2026 00:07:10 +0200
Message-ID: <20261024220712.23250-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

Ingenic UARTs carry a bit clock count (UMR) and a per-bit adjustment
(UACR) that the driver never sets, so a UART runs with whatever was left
there. On the X1600 of a HiBy R1 neither the vendor's 8 nor the reset
value 0 gives the 16 clocks a bit the 8250 divisor assumes, and the
Bluetooth chip on UART0 fails to set up. Patch 2 sets 16 and 0 at probe.

Changes since v1:
- Set UMR and UACR on every Ingenic UART rather than in an X1600 entry,
  as Nikolaus asked: the JZ4725, JZ4740, JZ4755, JZ4760, X1000, X1830,
  X2000 and X1600 programming manuals all have them at 0x24 and 0x28.
- Write 16 rather than the reset value: with UMR at 0 the R1's Bluetooth
  chip fails just as it does with 8.
- The binding keeps the X1600 compatible with the X1000's as fallback;
  the driver needs no entry of its own.
- Rebased on tty-next.

I could only test the X1600. On the other SoCs this writes the value the
divisor already assumes.

v1: https://lore.kernel.org/all/20261024051515.55639-1-olivier@mgcrea.io/

Olivier Louvignes (2):
  dt-bindings: serial: ingenic: Add the X1600
  serial: 8250_ingenic: Set UMR and UACR at probe

 .../devicetree/bindings/serial/ingenic,uart.yaml     |  3 +++
 drivers/tty/serial/8250/8250_ingenic.c               | 12 ++++++++++++
 2 files changed, 15 insertions(+)


base-commit: 1184f87e2790e8af9be3116f608d2e86b4792d7d
--
2.39.5

