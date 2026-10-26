Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003969;
	b=S9+F0+eIa6Dn4Rrm1o8MHsGpwwA0VK6jAdVOBhfZRrM90AJUEVZmVLjU4HP6QAcls7HR
	 Y1pJ3D+euQUtXLk36xZv0O2bxndulH/cwZ2UFwFecmluu7X5bDQyRNerRh0qEYtIaHi0k
	 illCn8kBwkUiasMXTbxnFxtAiZSU+NHgU9mUj65+sRszfSV8PhKr4cWEnSMs60z+572nk
	 o8yddFRRGFSkEyqHFvoUsQvpktIX0xTNZIedfYLp9u3G66LJgy2eM7KfIr+NWUAaZVzP3
	 slk8Y6VGQZl3i7qFpUErkeNmGGyfYr89W88qGUMBOzrIV5W8EXYDCll2C4sFpdPfMNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FNsk93EuVFBxLJj508WFUJM8x83vnwjCep0MYdpKjqI=;
	b=w0kvIYD8Jtixlbgcn44LsS6ZytqalTLO1b3lkGQiYB/hsW+WdaCdrrlEYrSqblWTe2cH
	 EbuiHPCl4n+egpZBAIw5fiZdzgEQ/yoI5vu8cm/0gOPjwdKCB/ZA39WEQV5FDQjSthRmH
	 cTt0PcGJQsdZ5O2/Saf3aNV2DxxCl+BuL9tPzztr2aQZ33YSXUJnvVyaWa9rdh0dplzGs
	 AgIw5QX3cPmeT8fZlr3WFMoYFbWbdJxnclsFC4NLbl9/Sy8+dWnXpCORLYQRicTqWjADB
	 C6yEzMBOKo3HFkOoe/DSgrWJvn3r/JHM1FmExUzCsWgn0sRhRwzx9mzz+z1Pv5eoFCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=rg1j5lHg;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EBA606A320
	for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 08:39:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13EBA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=rg1j5lHg
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1631788f8f.1
        for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 01:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1793003967; x=1793608767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FNsk93EuVFBxLJj508WFUJM8x83vnwjCep0MYdpKjqI=;
        b=rg1j5lHgIKe2pYctEnUSlK2gfR/BB707z/jC+v7QfZhX6VzgxZxs5z0aKmRwx9kbZL
         ixyd4iSTbbqPzYfy8XapAwDptOtJt+8GNnzD9HPmy/99EIf6ii3UmYFWTzXcPMNYNXXd
         gujqsxf2RTyoezpIOyMzyNuZQ0JRiySvH6S1qTephY9OxOZoH0s4k/+72RJ6Ssy/5WhS
         RzaAbPq87Rxhvn54uLbQm9t/kzWXMFupa5HSMYU1YVbMMn5MRih0CzP6FpM81bcM/o54
         +cIQDQJIQos50HjcBcdryfXvAurhHjB0oBs5c+Z8L4eweKXt8qRL/dE5F3FRqidRWIYu
         9hTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003967; x=1793608767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FNsk93EuVFBxLJj508WFUJM8x83vnwjCep0MYdpKjqI=;
        b=AxssdWd3v1anOCftNhXJxtoQxrprcO96RoQsBFitF+SJXurAio5v+8FKIOPlQwuBoe
         60dxEEzeP+qyzl6bPkhiUCanJw7Mvwodwjh1wd0CVsf+Sz+/9WzGiYy8FZJl3bRoE15M
         1Mct80AuFrG4RlmV2xg5fM7ZUzfdU0YcrBgUsyEwGmefifX7sT99tCMqzl6+WiVurclk
         Gtw5QkrlYaOa3++Esv2z0wI9vNQyim3c4T3rsGlv31ZYm5fWNV5C2ThEFJtKxti+HCO0
         jaoi9gs+khO4kZxi22bYrWU/sm6SU8BMZWghtzfskX3Mnrnh8G4UWLBbJ2WfEMpgYVY1
         w6BA==
X-Forwarded-Encrypted: i=1; AKwUvByltKh0QqGjNNWd5U3GGebmB0jXgsj8HzPDiyAhpzhREkMg3okkyAVKg8IMRgnEQjtxW31zvbQVgF5v@vger.kernel.org
X-Gm-Message-State: AFq9FYJOJsld6aMmlpt/OYOYouYPMFXYaAhQCukB4qtZVXs+lMc+tRRN
	j0vRwJHsLbXR7I//NV03/FhxEuE0T63SRfoETWXdWxQp3L19HTfVbSfQ3OvPnuY/+ZI=
X-Gm-Gg: AYBFou1d/VuWRq5os1N2ntFQFykt63XTxqj2bTDsZjS7+z55TIH1ztPi/l3e74hpUMJ
	y6+Msx/EN2I5rLQV1PMvKCi/mds5VWDcIrIFo0tB2rGai2cvnkcxEdPHKJ+SNNJfUsPPEWuvwL9
	sWqT8Bu+7ep5iuhuHl9qk/QOEIMT8IJSW5k2lYYkdjE59rQluRlNn9tQK/wofoa8FkvSw07rg7g
	0tx2ufvs/zWrKqHzoYfOmOzaKPaPlyVTRo/A/0jkNtu/t4iaXxudpV5kgWNwmXjNYjGFj0hDGHx
	YBHVLLk+wQkZDrulR8RnCld17BM6xLuj6rZbUsBcFt9BVOtzwQyG/pQRy/cXCKk1YK50ed7O5Fx
	XRxdhiwFI5VlH3XwypkPkl10LzKtKw1u9jqV67BPkZF2RbpZvw+efZ/itEd8sX8Y1fxVbI/hdWs
	ZD99fBoi2pgPd7LgZPyDhW0szxzy2oBcn9rfzo0PB4+nkn/YGS2qyb7K/NROKhtJQC0nkEobfr5
	YQxNqM+XQf+78BAiE+0gzXdAoZQMoh9/6xZDRABb7CU+DjQbJgxCZlWMNenDb7XyLBxWAl8IwWU
	9R4xtz6vzbst4w==
X-Received: by 2002:a05:6000:188b:b0:488:8bc1:a2eb with SMTP id ffacd0b85a97d-48e3eb98ee3mr11807123f8f.39.1793003967452;
        Mon, 26 Oct 2026 01:39:27 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6dfc:5715:ead7:7540])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f25fsm14673690f8f.2.2026.10.26.01.39.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 01:39:27 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: Re: [PATCH RFC 0/2] mmc: jz4740: Use the integrated DMA controller on the X1600
Date: Mon, 26 Oct 2026 09:38:11 +0100
Message-ID: <20261026083811.67574-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025140325.73204-1-olivier@mgcrea.io>
References: <20261025140325.73204-1-olivier@mgcrea.io>
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

Hi Ulf,

Please drop this RFC, both its premise and its question turned out to
be wrong.

The X1600's MSCs do have request lines to the system DMA controller:
the programming manual lists PDMA request types for both (0x34 to 0x37),
and MSC_DMAC.DMASEL picks between the two DMA paths. With dmas in the
device tree, the existing PDMA path works on the HiBy R1, card setup
included, and reads as fast as the integrated DMA did (23.0 to 23.5 MB/s
against 23.5 MB/s with dd, the CPU about 20% busy for both).

And DMA_DATA_DONE does come. jz_mmc_irq() clears the flags of masked
interrupts, DMA_DATA_DONE among them, and on the X1600 writing that bit
also clears DATA_TRAN_DONE and DMAEND, which most likely is why reads
looked unfinished.

So the X1600 needs no driver change here, only dmas in its device tree
like the other Ingenic SoCs.

Sorry for the noise,
Olivier
