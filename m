Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793923974;
	b=wqy5b5kBYDn3/ngTzWzYYvpFZEPOSJYqtIDy1GsR7BtlMpetxiZz9JsgBwCDm/QSvrJJ
	 BE8CMwFZksO1qGFkjXil2ajJRC9RT97K8IIoGW9w3opeY9OQXzI9aap917i9HDzvgtfJu
	 AgSUDLD8lsfWZQQHpXTAdi4aWxITsgtErgZkIP/z86qhs/poj1WLT5+HEEIoAX4OTgDVs
	 rPqpnjIUTaduT66HdkxxfkT6AHDLdl8Mq6SfGRj/7U2D+P39h8ixHdJa+D5Crxft1zuWR
	 Obuaa/D4hN5D42EIvu6/o7dTnWHBFeKr8B5l12Z7AsfZIsojqZix6PozT8oujxL6pqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793923974;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=SGxBcvwVnn68G0KUIWhXj4n7e3+LPqUj3vgSEpFFHd4=;
	b=1gOwBGEt/TN/nP6ofRa7AcZjwuFmmKbPjnDIZsEW0VjeVTWitqdZ/I7aLcw8yGOJ0m78
	 g9q5fVCtFwQthV5WHU+vA/RQBs7fYSsV0K5MWHNGxWdHaA/GGEO5mjQo9SiadpF2Q2Dvc
	 l2raaEQL4pmg3Pmr78bsYSQg4Hql42vI3QUvrBhVwXXv4bZku71TrFSu+SbCQJjiy4BVc
	 6uLfET/RuOvxu09E1Jkc1COhfGF5yhGQLwLbL5oro9nqffJAMnmk/le18f3SiRHzZHMWW
	 vtDNePH2PvF4gdoXbSC9VJeOwKh9klbNPRot/rmSynfrAxKq5gmu1VrR9Y6US8tDCJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF22606D80A
	for <linux-mips@vger.kernel.org>; Fri,  6 Nov 2026 00:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCF22606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso692386a91.0
        for <linux-mips@vger.kernel.org>; Thu, 05 Nov 2026 16:12:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793923973; x=1794528773;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SGxBcvwVnn68G0KUIWhXj4n7e3+LPqUj3vgSEpFFHd4=;
        b=uActJQuLYreAngPIXOKQ1UDfvRrxV7V2UsGq6AIUnZrkpBdbr5PQyPFUhrZ/bDouOt
         jlVQUG3tzOkKG4AF/95nADbDTKGEspV+s5V/NlfBDBae8uqpR3WQzy+qwOFS9uQS+eql
         r4MyEqN3xDIe6NhM3KXweIBQP1bRX1cOwkc31E92aSQJDqU6becQzQQ6ViJ4WavNbocD
         UVigcbaHd4wIks1wkJhtriRViZ8+IryhZCi8N9ABIItHWhg09bpIpT4li39ePhIQkfmw
         Pk76leqL2853RTYmudAULtwEvo/HUBALElkjncaMnCumFN0M6lGrwhz3Tp3OLotot75H
         pWmQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdUJOOILkH4lxHHioR9slKm3SxgY2bnJZ4xKbKA93ZWX+cdehPKm1W4+y5VNTqOhNtgg5ZGQTfzUE4@vger.kernel.org
X-Gm-Message-State: APuU4Z+y6yl5TLrWKh/d/Mz1LBuszfGK+UyQRsAOyU37fTQA2mNJrTvU
	e1L+qBZdosvRlgFHMY8Y8aCxxvK5yLoMM59NWtCEIWJXFOX8kgbVkjA/Z7BlCTJh
X-Gm-Gg: AYBFou2b+asWiKosYxa/+fA04SkmV1iNNwgau5IS8HHng1qALvu9nKMi8/4R01X9ZEj
	kpKYW+jvDpT3qYgF+r4hedHXZicPJPL75yKp3RkeSb50S0bGhYhXwpSdrplIZvDyW2PxtqLdLDr
	BBPU/Pci4kDTda7kC4C4zvZyBSxO9UWGBOJcnkHH/+LovEtQC1ox5hkpfz88QdjVi5c0gr/Q5Pl
	AInmfbwtvTIxAyyp+VwYn5X55Cpto5zwIFvyku0P5uIZUOrjfIuLhbDYtpdoMXLi4j3rOghhVWV
	EcSH3gf2Qp48cY0OlNSUAp8Um/AKH5+Acjtfvcm8ivCZDNswCvb7wzyiMWNwNKl6IdnH8gc61my
	kgLU1L6ZbfFrxBrzBJL+XSVs8kGQ7gIH2XykS5k+X9uAmkxZvS/LSQrsuWc60H/Tij39jZ6RO2W
	pb+tbgq/QLBMAvfK878T5ScjKYk2sj+ml8nSkFXjcuO2Okk2509XVLvSAmGz4G52qIDXeurEbwn
	qIc/DYt9Xf7sL+x/7dcGdV9HZadF9gZ15e/E5hELoAm8qGV/nUfWIGsG+PrKBl60l0SBdmyR7cE
	8HQ/qhZhAwRx/5qjTe/LcOV2BtEH4lvZOZ4xzH52zvanLDbW7E2dzv/1QIjI64nc4vdfOMTLxkV
	hdlTQ01d0fFuFGX+XLBTiBr0HA9HW/FxLTEPTGaFtn/c=
X-Received: by 2002:a17:90b:518f:b0:3a6:d850:bf16 with SMTP id 98e67ed59e1d1-3b0db6e1f9emr418827a91.23.1793923973047;
        Thu, 05 Nov 2026 16:12:53 -0800 (PST)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com. [74.125.82.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed475287dfsm300315ad.7.2026.11.05.16.12.50
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 16:12:51 -0800 (PST)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35829219da8so1223355eec.0
        for <linux-mips@vger.kernel.org>; Thu, 05 Nov 2026 16:12:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzX4fm4t1CbT9eavJepUKBGyFdeLlkpbyDCWeVzS2egYo4c8DaxTL9cD0ajrH93K1oRBKvuy/dsXxJX@vger.kernel.org
X-Received: by 2002:a05:7301:90d:b0:36d:6a77:960a with SMTP id
 5a478bee46e88-36f73893ca9mr1104956eec.1.1793923970093; Thu, 05 Nov 2026
 16:12:50 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gmac-v1-0-a15965a49574@telaak.dev>
 <20261104-sf19a2890-gmac-v1-1-a15965a49574@telaak.dev> <e134193f-ba1b-47c1-9a06-419b1b796ea0@lunn.ch>
 <CAPY4CJ74O1tFVCpcN9seoeWDF0VR9GNfKuE+rWODQamN2sjL3g@mail.gmail.com>
 <ba32cd69-23a3-464f-a74b-68a29e7b8202@lunn.ch> <CAPY4CJ6mCc5HgQUZd2Mq3C=Tsmwp=-acAV8dsWcpO_J87Pr6rg@mail.gmail.com>
 <7b4ab738-85c9-4747-bf89-1a5532af6901@lunn.ch>
In-Reply-To: <7b4ab738-85c9-4747-bf89-1a5532af6901@lunn.ch>
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 5 Nov 2026 19:12:37 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6Pa1T4v6=3K+qN-sJeRivJqGbUeR2svJNcrLHtA=Th+g@mail.gmail.com>
X-Gm-Features: AclHuK9z-s31k9cdXUmtbrS436ZgZs9Mvql6VWlVAJgIq_YcqPSSmicfRgm0TQE
Message-ID: <CAPY4CJ6Pa1T4v6=3K+qN-sJeRivJqGbUeR2svJNcrLHtA=Th+g@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: Add Siflower SF19A2890 GMAC
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Chuanhong Guo <gch981213@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> So i think we need a get out from backwards compatibility. We need to
> be able to break running boards with old DT blobs, in the future when
> we fix whatever is broken. Maybe the best way to do that it make the
> MAC glue driver and the DSA driver depend on BROKEN.

Before that, I measured from the switch's side. The switch driver sets
its RGMII delays on the CPU port in nominal 500 ps steps, so with the
MAC's delays at 0:

- Switch to MAC, with the MAC's RX delay line bypassed: the link works
  with the switch adding 0 to 1.5 ns, and fails from 2 ns.
- The same with the RX delay line on at step 0: at 1.5 ns from the
  switch, 4 more steps of the line still work, so step 0 adds at most
  about 0.25 ns over the bypass.
- MAC to switch, with the MAC's TX delay at 0: the link works with the
  switch adding 0 to 2 ns, and fails from 2.5 ns. The TX delay line has
  no bypass, so I can't check its step 0 the same way.

Measured against the MAC's delay lines, the switch's nominal 2 ns comes
out at about 2.4 ns in one direction and its 1.5 ns at about 1.3 ns in
the other, so its steps are only roughly 500 ps.

So on RX, 0 does mean about 0, and the receive direction still fails at
the standard 2 ns. That extra skew is outside the MAC's delay line: in
the switch's output, the board, or the MAC's input, which I can't tell
apart.

The DSA driver, mxl-gsw1xx, is already in mainline for the whole GSW1xx
family, so BROKEN there would also cover boards with other MACs. Would
BROKEN on the new glue alone do?
