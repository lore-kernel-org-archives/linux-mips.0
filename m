Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793135380;
	b=s1RkMwjEyZnJbRwIFNMEjyzlB20YB4BkeJXeRS4SXCYWIGJRMIpRKdRisIugZbDX3JbI
	 9pgoKzzpCib9w0FhEzDcV2FVBGc/0nUa5P99r73Fhi0LwgIid+qnZXj4rh2ceM2HYMkcg
	 Aji9ttAdP40hKXddOr93V/8TeEEvtV7atiYNAiE81zABjH9KCxu/nzaHiJB4Xs1QxboTJ
	 cgQgUAna5fjdp2V+REexJ5XA9qJd0Wu/uraD2+aVotMZ5AX7vLzjC/FMaIsSK8zC51Xje
	 NC3HGYEStyTnnZ9Q139azxKfle78AxelMHcmxWnfV2dpdbbnCZyFYxBkdknW/lgoTPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793135380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5xjzIYr+bH8hlCaoTxpmkLS6NjvJyW6sNrJ1hHd5rJ8=;
	b=AMiBJxIXUapGPrVWzwF+q96CH9mqGXLhUfZyxfQT1KxY3Ag7KcGVLUl/rAxWNACXcahZ
	 wnZPlwnnn+9fOrQdrjp/UKZ0pJFZvIofkqp6oKaBqvFOS6JC5sIfg9DTSQTiGE21Z13FW
	 OJ3ufAIxmSebJ4cFfPPyzutdzgqdIbhpbQlBg0kchwMJbJlPVEK+o6x1je55WxYnkd8yM
	 +E8GTykZNSluzQ1PF7w0S3OqM+7yzgj2TyUfCzcJsA1Zw5BWnDOWdCvW1yEbDzm4MLhWr
	 Q6bTZJBtU1+P5loHuwI0E+9apeQzpuECLLyeF+6p57wlmKmc8MjvDtdMNp9kNgzaKyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=c4f9gxA9;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FD8606A31A
	for <linux-mips@vger.kernel.org>; Tue, 27 Oct 2026 21:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3FD8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=c4f9gxA9
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e10a70540so191908f8f.1
        for <linux-mips@vger.kernel.org>; Tue, 27 Oct 2026 14:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793135378; x=1793740178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5xjzIYr+bH8hlCaoTxpmkLS6NjvJyW6sNrJ1hHd5rJ8=;
        b=c4f9gxA9gFBSUh0oJBf053KSbkujgNmeShZvYgLYY2/Y/MjA78j5OIYZ/bPiI8JcyK
         VjpVUOHlivKbXVx+g1cUv6I6+l+S7rowgRSvSOEZ5soXIqixdTMJlyHFcWLBaTLmoo6V
         RMN3C7Zd5+LUwQcRVeZXTjqMkjUVtCQoMgSbe0e8tVJ9pjOYr/I3E2U5s/SSeUppUtOc
         +Z7eMw5HLLS8bu7cB9FVKdyW6c2Tisvm2HiGpBJBRiJBragyR1zbS/JIUpuxM46OAL2P
         VNk5ilLHefUlsi3KwRisMDvpYhmNxfAGXvSUZy0Ty5wU/dRTAu6Jcb1yYnYqvBfmh0om
         ufbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793135378; x=1793740178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5xjzIYr+bH8hlCaoTxpmkLS6NjvJyW6sNrJ1hHd5rJ8=;
        b=yTsUY+HutpvbH+cOvW9PZnz5kW3G1Y2OOkALKx02gl5UMdfZedUly4lfbaM28vdTzN
         5DMCwuC9Htld+YMeQEnohdlO9SYUm0hkaF0PNkuQXHZzO+ME/lKvbtGkRw53hkECwlVY
         dm41mkTdigESjqky+CicRqfQLF7zBbnH9kzXcQuH7Nd9K1RhLSp8iPF3JZ7BcE4lscK8
         wtbW67MZuu/PoR6QiCvYpMqKX10D+Dz0+4FIH/xV97lhasNwBBH+OChl0bwIxpmp/XJw
         a6JXv4Hpc5opI3LYKWzYXQA+byPB+OdhPuphiiT2yCHMX/zb6k/bNBbOMvQ4niLmtqJq
         tk+A==
X-Forwarded-Encrypted: i=1; AKwUvBzUghfUuYUpYvr76gJ6gQvM7BcKWxVY3MWaABAQ9IaVENbXOkol6hlI8K0Pcyn/HysV3QpDuNYzM5+D@vger.kernel.org
X-Gm-Message-State: AFq9FYIB6Qsxjkei7d3XGgDqIgIA0EAa0QtBLlkvgxc/v1PP2ufHe82R
	zXBkdpe/3D/Agz2Mon5Q9+7EVocUah8WSudW6s5TZqY6MLIVo0WiDyX0pBVt3ot5GSRs2zVvKlL
	x+VcnNR8=
X-Gm-Gg: AYBFou3b69uaYkE3C9auFs4IRWrSZ/KOyPFHVRVhPQZO0mqs+fOMUCnnkg8VfleGqJZ
	2EwCWmxVg/gamBWDOrdibvoJCABBXBwOFNjT6Jw20omMs1/ESrAw55purCPs+B4Oz1Spw3R9onQ
	MCUoADqwBVzH5ZFH4kPTfoaH30XmMk1mDRCGg1AMslkLsXFtaZqxQjnjsc2082r7B+GlO2htLpk
	lwozbgu12DluwcHU3UC+BtsduxE+2PdKN/Ugh9rVavMjR5TpDkCPVNqIpQDgXs8f3bOewWmk2Lv
	0PNL4FI5aMRdtEDni15ulGJHFtLl40jcqSRSDUCyKzNj8MnJSL4XBh0RwhP9hV4l1MIoQu1JKCq
	BEgavt11SpoztjhYYWHFnI0twHzlSvleXOoxHANPtO1g+VVlDWLjM7m5wZoTT5tbfvMbqV4oTfQ
	4VrFPjdU4X6qcolWQGD+MIbTF1xwKDNk3YWOFBaE87XXKb+v3QOCRK/7TiMOkkCnofk11HrhyIk
	ckOJGv4wx2xs/zfXiEB6YA0QtwAal6oU70C3IAE3wSl7jc18X4TSam9I7ht3uLZGky30bjBM8zA
	rxNevw8jGojn
X-Received: by 2002:adf:e011:0:10b0:48e:43a:1d9c with SMTP id ffacd0b85a97d-48e5d5d9158mr1044256f8f.48.1793135377892;
        Tue, 27 Oct 2026 14:09:37 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:5cfb:af57:9834:741b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8dcfsm24488905f8f.50.2026.10.27.14.09.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 14:09:37 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: "H. Nikolaus Schaller" <hns@goldelico.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Cercueil <paul@crapouillou.net>,
	Paul Burton <paulburton@kernel.org>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	letux-kernel@openphoenux.org,
	kernel@pyra-handheld.com,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: Re: [PATCH 0/6] MIPS: Ingenic: Add XBurst / XBurst II infrastructure and SoC support
Date: Tue, 27 Oct 2026 22:08:21 +0100
Message-ID: <20261027210821.21612-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1792956055.git.hns@goldelico.com>
References: <cover.1792956055.git.hns@goldelico.com>
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

Hi Nikolaus, Thomas,

Patches 2 and 3 overlap my cpu-probe v2, sent the same day with
Nikolaus' Co-developed-by:
https://lore.kernel.org/all/20261025073146.25326-1-olivier@mgcrea.io/

Both add PRID_IMP_XBURST (0x0000), so only one of them can be applied
as it is.

They also handle the X1600 differently. Mine puts PRID_IMP_XBURST on
the PRID_IMP_XBURST_REV2 path (write-combine through
_CACHE_CACHABLE_WA, as for the X1830), as the Letux commits
ee3e4e8baeb6 and b799b9a5e4d3 do. Patch 3 here gives it a case of its
own with _CACHE_UNCACHED_ACCELERATED.

Tested on a HiBy R1 (X1600) with the REV2 path: it reports "00d00000
(Ingenic XBurst)" and boots to userspace.

Nikolaus, which handling do you want for the X1600? If it is yours, I
will drop my patch.

Thanks,
Olivier
