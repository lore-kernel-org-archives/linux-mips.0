Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794787210;
	b=uaEtINVrOhG3j9nl7QE3EwaC2/1w5MtKJXhEtHZBPyHNgCBRB1Yup89ckc+XxjND65NQ
	 RzGt1yGEtosdVenYSIsFF8xg18YpjM3ghwv5QmRinQByROMUWf4JKoamdg5qXy33k97As
	 zZKtcA8M569kBe4W7BKPplTnFaTyTD6zPzg6wLKZ2i697KGRm9yvEkUlsbDfaU2WyWyGn
	 hiKa2JOf6Uzg3Schd9xG8ljwVHE01goKSF5fhe0VAG0doXHEsp/SYgBzeaB1NOsGm/IjP
	 mmioFCV+gIz0xFEhPsgqyhigbrlQssfoYyuMQyAQG+JKsZbCHUn4a0c3VpFy10kNW8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794787210;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=F0Vobei1EYt8zo7eZiXAiBol6p2SGs6zmAbcsg/JNog=;
	b=ZHW2xD/+OGJbCUjFedUf7vn2ti8QRYLixBAe7V3EZPuUS654SmmlBazW0pWm7kamunin
	 gnVX6wtZQqAASseSfoSl42jN/Kh5jcwuq/5ZfaXOiwjzv22z8IEBZBtCCgU2aI7migQm1
	 Qbc8NN7bM+J4XJNIV6wpbZVgEqqgW8V8my0/auzcyqfZUtZFlKSj2Wcasb6dN712u0Bve
	 a4BiFkYw5ByXIQICOjZElORqBj5IWi83A0hTdjJQT2iryuTwth/fBmitTfxqAajyWiZNe
	 OWxA/bG7lmLi1Fv7c1oLK178arGlD5H96mTPYCe68kBH1sRP4cQHhSm4PrQWuvGz1pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RiLIhjMw;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE90E606A331
	for <linux-mips@vger.kernel.org>; Mon, 16 Nov 2026 00:00:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE90E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RiLIhjMw
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-37600b0db49so3447392eec.1
        for <linux-mips@vger.kernel.org>; Sun, 15 Nov 2026 16:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794787209; x=1795392009; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F0Vobei1EYt8zo7eZiXAiBol6p2SGs6zmAbcsg/JNog=;
        b=RiLIhjMw292QqtMxqukW+S/5CfM2U9RQAWjuZktRDnYCgzA1uVHTR9ThyZtgPk+Y2r
         8vgW8iPsuK4kkLv6+x60X+hZGVp4bznXgdHkZc8jHyuaFi6UpwSnFh8h1gNUePR9414m
         O5+I58U71cl8fiNsxTXYWOOP7lgW1jTzP/ofdic/YtQprNjv6DC1CMfoiBCl2BDwMEvx
         F7SfPGyAdKe2zKJUQdWvJJe906S4Ioh6pkwbswS6VfEs8fav9HKqvWK7De8qWv2B3aKx
         MBGuyKTHABGZKRRPeYTrBRFzK/6MrzDUiSDjafQscptVpQvefr7ffsafEUxNc91E7Iwm
         C4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794787209; x=1795392009;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F0Vobei1EYt8zo7eZiXAiBol6p2SGs6zmAbcsg/JNog=;
        b=rlWqCZ+0TJ+UF7hauPnvb7QwoVnLihIRn6p+PsdGBdC8QZS+ac0o/NtLXMrNks8iW/
         jKH6RQCKEMHtXrDSoR39VZNgWwtmqxPJx1RLloxVjN7C+91lTSURyi1wx14JcCNjhfK1
         kJVGmPwX/kc3qciMIQtPrn9mrBAu2qlicwCg45FMqh0Bgs2osTII7POgI141WxNgrrKW
         TYT30YCfoLB4E00XpDIw3zxRG+n+DW9rtXP4CeU4+VQyH9IwlJ9IvXdlKSDBNJDDMhnE
         jn9s2nJQbeLinkyHWte0dpeFrqBV8g2z01ybZQbun2kTWdtPcmyemByTu3V8wbS4SE7R
         lNwA==
X-Forwarded-Encrypted: i=1; AL+hErELjdAus3Br80eIETuk/a42+d9rr6KDUcYdAuEoOJdnVCeEDCH0F6uBlTlGtZOaTzPMcd40mE8C68+L@vger.kernel.org
X-Gm-Message-State: APuU4Z9jaS7QCoiade9P7cHTP2hpvi5QvxYDf6DuQqNwhIr7ulu62neW
	GOmHxfASoApU/a3ziMwmOEEVNghov48B3vPEEuAB4ehZTMcURx29d/PM
X-Gm-Gg: AYBFou23AmKVpPRDiHTDA7lFczqGwR5toXh9nfcwsVTUzhnGI+0G1UPnTdSgk6CnClY
	3w0R925+kdI78+VIE8ZFi9q9m6DzsDqdRARS5cIkSqcfSCZxzt+5LCmRcoKOhbSScei4xEcd1gJ
	XEocV+3+dczLOFSyfdB+brgD2vQritxi7McvZh9/LyfjO9S94M6tm7/sFukwm51qQwIneM/msX0
	1jMOM7keNJYFYx0k+2GTumPPtKgS7oF4b4XsGFodNZ04gsIb7o5RC0IdCQdqx3eSBXDFMaP4LsB
	6YG5wQ4TXYTs4vN58vvarFUTzL4ta4Gmv6EXxmirF4lOIcRzpvL8gqqLv0o7ZT0O7H3ZYCM6AD4
	eYoC2fYhRlwaLjdqo4VXK6fRxxnnnR8ZKN/pUapAUiU4v07bsyda5OfMKflUxsgZJRJAxqnTLLX
	hukr+wR+utSgufwF5vzrUJ+AxB3wAJgMttiRY03M74WuzQlEKpjX1eijXrYU33fUJvLF7nAAPXT
	NeL5ZWj9npcMmzNUj4iWm22CKaGy0uM9LHYD9I37lUYRDyDaHsV/SzaZ1wkzzgDGbKA8Ngaj3HW
	Ed71AeO/QZNT58PaKSQKxhmnfAMff6X6JRXgSJqrKF0Sa/iW97zJg7BOhV3d4a4hMioEVKnrnAH
	nrEs51BubAoTArauYrlyDUxDPQw==
X-Received: by 2002:a05:7301:1509:b0:369:f3a3:fad6 with SMTP id 5a478bee46e88-379658c798fmr8199108eec.4.1794787208729;
        Sun, 15 Nov 2026 16:00:08 -0800 (PST)
Received: from smalls.localdomain (ip-198-145-71-161.az.bambroadband.net. [198.145.71.161])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d3e37sm32023039eec.24.2026.11.15.16.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 16:00:08 -0800 (PST)
From: Hunter Laux <hunterlaux@gmail.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Paul Cercueil <paul@crapouillou.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Burton <paulburton@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Pengpeng Hou <pengpeng@iscas.ac.cn>,
 "Christophe Leroy, David Heidelberg" <david@ixit.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.de>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Paul Boddie <paul@boddie.org.uk>,
 Olivier Louvignes <olivier@mgcrea.io>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org
Subject:
 Re: [PATCH v2 5/9] MIPS: Ingenic: Update Ingenic XBurst implementation IDs
In-Reply-To: <7FF80C33-895A-40AD-8149-70A7F5B42E54@goldelico.com>
References: <cover.1794471031.git.hns@goldelico.com>
 <2e21dc4889ec55bf210dfc205bfadb57acb93eda.1794471031.git.hns@goldelico.com>
 <f91a0c53b35ff28bed26622f46d562b5a6150008.camel@crapouillou.net>
 <3892D527-E3F1-49CA-8557-2C62E2C015C4@goldelico.com>
 <8da96916856e73c3ed368eeb8d28891750206a71.camel@crapouillou.net>
 <7FF80C33-895A-40AD-8149-70A7F5B42E54@goldelico.com>
Date: Sun, 15 Nov 2026 17:00:07 -0700
Message-ID: <179478720768.148352.14441091079180538485@gmail.com>
Content-Type: text/plain; charset="utf-8"
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

Hi Nikolaus,

On Fri, Nov 13, 2026 at 01:33:23PM +0100, H. Nikolaus Schaller wrote:
> Is there some runtime check? Hardware capabilities register to look into?

The MXU2 manual says MXU instructions trap if Config1.C2 isn't set,
so that bit on the LX16 should tell you.

Hunter
