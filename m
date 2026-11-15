Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794762094;
	b=r39hWYP/LKGQL+k+XYLNUDikfLO0S4dOdxBkD416w2Dac2wuUUaFS0arFu3r0nXu7JuZ
	 TrcGc1VpeGizcKSl4aViaf2Bf+YHrSF9shBPvREZcn30sa1UQfLSKKsF10YsRDSsTPBo+
	 afKS5YhexlcXytXUUdtuEc461UgUzLMioNY2bdFu9j0pPW1ta79ah9AYC5/hEtpn5FTcw
	 tks3f9cXlV4gQhg+5vN7n2K6Ew2iEnrgNuXvSfQjRAjEOx6nJD7uSgzBMZ2y9dCvyhXUJ
	 djk/p8TA3Rk5dtXBwirym86AxEbvFYnGDAlqTa8GmSsaH6lx7NPwIaBtfUY6LnDLpDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SVZwwH4W1zKgtEsp608WvX3HiMcrtY/DDmZr7nWB46g=;
	b=3tYQEe1UqVH9eDlcnwwD3GXz/qxooJPAwPwAb1Zc6o2R8NN5fD8nOtoD2zWKh9s94z6o
	 ehHKsxSy2IXlY1MdEkEsyI9DUyvDdCFPFMNnofmF1fJiiOz4K+gy4mAm+rXNdOjQRH2PQ
	 U9B7y/YaT52lpknrKwFCTSycqA/kbF8ZD8cMu/mVelzL/mPQ5bZJQQQxaEa1qiAsjv+fF
	 i/KMmPppgQYgnQsNXqHj9UMwFLoHoaXBTFpuTgw9lOpMshqqFAR9tflVwROcVUXlVR+xj
	 woHMxOhafq/u1z8Qm0RrplvG8fhWBiuznpwLJ4O5ltRuLhQOCN2Xn8pl4N1JjMA0qUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=qY7h4cTy;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727AA606A32F
	for <linux-mips@vger.kernel.org>; Sun, 15 Nov 2026 17:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 727AA606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=qY7h4cTy
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-497614c95f0so1156203f8f.1
        for <linux-mips@vger.kernel.org>; Sun, 15 Nov 2026 09:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1794762093; x=1795366893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SVZwwH4W1zKgtEsp608WvX3HiMcrtY/DDmZr7nWB46g=;
        b=qY7h4cTyq3eIH+N1giwXEDGq77RYhniijXUA3ssiqYQHkVUOqSPUzZNIJh8/q3vOj5
         Vg+uUvEC4nn7iEaKd6xMBxoP7aSz7qN6X8Er/wZnjRwoxwhKRybf5uDXXMdWLtUfW+CV
         jfESgM4MIKHpMKpm6nyS6SCvHyZ/JYLyHL6pgfwukS7S7rOxUnlNqHPcUQIcOaWA7aNf
         XsK441+fZF+TScjo9fOnJYgroil/hxxXP0YRDCOAZKuHgmxIwQfvwdhDe2RyMScqnum6
         h5NwYCcwou2o/wJ5szE91gIY3aLP00VBveBktR+MD+J6jLSiTgFDXufCb6s7k+e48Qn2
         0NbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762093; x=1795366893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SVZwwH4W1zKgtEsp608WvX3HiMcrtY/DDmZr7nWB46g=;
        b=p5RjJrCW/nqao6H5VxOCzhW4IHDE5ULN5ZKqjxqrl/ux4D5LA38EMsfPP0BPRSEtVi
         CxQeEqC+z5xCQSbVwWlhchBI0CIqqcLz7h7+jfahs1RZyrNnFjH1d+Zf2kb2WS1nK3/h
         JSy4OmwMa6yvlcCXvpQgDPV164gJ4SpVUCTx69cTFo+3xKf4Xge+a/doviiZPk3vR4Ui
         gg4NhfcBbeuRMI7SDP18Hd/TsQFu8bm9Tg5XJHY+fOEPjegwQaU6SvOlr+Jt6C+IUXEP
         DTV/1JUKqE2Ml2wgXr+78CBmb/l8Q3NDSUQPAReKdRK3Ztc4knOwcKStx/TL+dC1AjCy
         Lqwg==
X-Forwarded-Encrypted: i=1; AL+hErGsU/UT/PS7amb0TCNveacZdU38ssceFHDl4uVLhzglMEqQ3DHz0q7XZAmYMXiKtk9HYtP8VyTkgVDh@vger.kernel.org
X-Gm-Message-State: APuU4Z+r3ylgc10FZYzDE9i0xTTUgR941kF3RY+lQbZaLy9R44pIDqAQ
	azbTOOKB/DKXYPWazBO5I+xs4Hs/ckAwPUjkNuYpr+DhG3SorSeDkthYGWtJbgJmXi0=
X-Gm-Gg: AYBFou0cqQJI1Vpiwq8zoSIvYn1ThUTjZ7x7VNOxgqbN4A8PgTz5eSHptXTMyiEMilw
	lN2Vlqg6QyLwf3qRf48k9YJ1lwu+ZVoEmvJxvCQb+PTLDI2dOKO5vTuSrZ4pI3OSDesJYkALEBU
	oWSAQunpSiiNFAm071poilvpEClsnlE87A7WfG3zq63iM7Ndd+AXVwHRYYvlQrOU17wJqH+wLRC
	1UX63nLpcNPO4847x6j54BG2BFt3txB4xl9AFlXNIZeH9ESvjlU49/GtggdJ81TrgwXL3nt2/58
	tYnOgzrcF0PetiP9ksgCzVtxhHpgbbwvhvspwiCFiv0KDsIugR9spaBkxpj/aJiVE6CpUX2ESuQ
	eGqjXuaxX5ChKmkPiIEnCOzdTU9gdH7OQyXw0GVNmX4mlV3XG9llU028wN0tVrMZQT/wBvo99J5
	qJfluzzhn3/ujtbThfXodyGENVPkYBuLsTkMkJqYJNYfjMPydWa3gtf16WP0nqSaUJbC7pFJ6LT
	kvOvLkuQrkOkfna9zxfcY2AhDfM44RtHT4snCqaCf1nN3eoFOiqYrhYMj0Z3nv2bZ1tuOyjErCD
	LYSLfpxagKHDwaAL920B143UIlxGxEvUfOqR1ZrgxB3NTDdSypfRMKIIgVQTM/SdePzWr5XCzC1
	EJG/skGY=
X-Received: by 2002:a05:6000:22c8:b0:492:7efe:3fc5 with SMTP id ffacd0b85a97d-49c7381ae3emr20826396f8f.23.1794762092143;
        Sun, 15 Nov 2026 09:01:32 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:b9ad:41d3:c29c:11b4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d615sm17595092f8f.56.2026.11.15.09.01.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 09:01:31 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: "H. Nikolaus Schaller" <hns@goldelico.com>,
	Paul Cercueil <paul@crapouillou.net>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Burton <paulburton@kernel.org>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	David Heidelberg <david@ixit.cz>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Takashi Iwai <tiwai@suse.de>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Paul Boddie <paul@boddie.org.uk>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	letux-kernel@openphoenux.org
Subject: Re: [PATCH v2 5/9] MIPS: Ingenic: Update Ingenic XBurst implementation IDs
Date: Sun, 15 Nov 2026 18:01:31 +0100
Message-ID: <20261115170131.24669-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <7FF80C33-895A-40AD-8149-70A7F5B42E54@goldelico.com>
References: <2e21dc4889ec55bf210dfc205bfadb57acb93eda.1794471031.git.hns@goldelico.com> <7FF80C33-895A-40AD-8149-70A7F5B42E54@goldelico.com>
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

Hi Nikolaus,

On Fri, Nov 13, 2026 at 01:33:23PM +0100, H. Nikolaus Schaller wrote:
> So the lower 4 bits could indeed encode the MXU revision
> and the upper 4 bits the XBurst revision.
[...]
> IMHO, in that case defining PRID_IMP_XBURST = 0x0000 would be correct.
> Maybe the _REV is misleading and should be _MXU_REV?
>
> But that is quite some speculation.
>
> Any thoughts?

The core manuals define that byte. XBurst1 CPU Core PM, 2.3.1.8
(PRId), bits 15:8:

  15:13  Generation: 0 - XBurst1, 1 - XBurst2
  12:8   uA, micro architecture version ("please reference to SOC
         document")

The XBurst2 CPU Core PM, 3.3.1.7, has the same layout, with uA 0 for
the X2000. Decoded:

- X1600 0x00d00000: XBurst1, uA 0
- X1830 0x00d00100: XBurst1, uA 1 (PRID_IMP_XBURST_REV2 today)
- JZ4780 and X1000 (0x...024f): XBurst1, uA 2 (PRID_IMP_XBURST_REV1)
- X2000 and X2600 0x00132000: XBurst2, uA 0 (PRID_IMP_XBURST2)

So the upper bits are the core generation, as you guessed, but the
lower ones number the micro-architecture rather than the MXU: the core
manual leaves their meaning to the SoC documents, and the X1600 PM only
gives the value. This is the reading Maciej gave on my v1, where he
suggested PRID_IMP_XBURST_REV0 for 0x0000 (REV1 and REV2 being swapped
with respect to their values):
https://lore.kernel.org/all/alpine.DEB.2.21.2610262045440.42255@angie.orcam.me.uk/

I have asked Thomas to drop my cpu-probe patch in favour of this one.

Thanks,
Olivier
