Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794804567;
	b=Qd+PSlwGPGADYIrYK7oDUzQJluVWAkIeDH7PvvZc9E1rxoF1Ak7/i1x9kVx0ZvSHnL1l
	 otgJ5lK1xEAkDZfpq7YlSH1QS4ACqjpGO5xQ3rNpqZULnoPpQUXm5uzFOJauZLEJS2DgS
	 7nnB1Ug7n+WD/jE0Pz5UZBspB2VSrjpHxq/s9W0Icp1ae1njCN8ufnio0uH/1qiv6QB7C
	 DbHhRBpyOCa+ObAHWnmFsBj3nUOX1/4984VydfTiXo9I5dLRUf8RLvZl5AXCGa6+gUlau
	 65LI0gLCKoJgI4OVQA9XhHdnArk8R/Hf3k9lR2GaW6uNnJQf/W7NH2u8psp9A/41V6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794804567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=+r4qanG5HFrQTkiMyL1knKm50Zsb7RunVimgg67J/4k=;
	b=iKw3p+BuxA75BWV2Flhj7M5LMY+4lF3Nlq9k8hqKidHJjdrPIOUEul0RxFCaspabuGJW
	 54+MjxCzCzx7yiOKVQKq498WuCXEOkDzGE4ysYDhxoJIdQLAUwFNpjXFB5SqWxv5VLCiA
	 NEGYY3W7mLXkSy3xq8oYULp3rL618tp2sPJJAiujbO7CNl8VeTJ55QfTHIgVzQxGEqMCw
	 uWxyk66MzZHrw6nLon5Wgz5oIkxUIw3msOooQsecyfwRGSsba55Fqp1xu9xPfuXod10E1
	 emrH+jdO3px3AV/wCt/fsfbBdH2p3t2jU4867Gvk4h8QI3ilS4GHeynVSazvs0XBkoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jJlMStIv;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D95606A31F
	for <linux-mips@vger.kernel.org>; Mon, 16 Nov 2026 04:49:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12D95606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jJlMStIv
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-37628596783so5054520eec.1
        for <linux-mips@vger.kernel.org>; Sun, 15 Nov 2026 20:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794804566; x=1795409366; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+r4qanG5HFrQTkiMyL1knKm50Zsb7RunVimgg67J/4k=;
        b=jJlMStIv8CO/WWwH3KJUMlP+JqEIb5EABQ2CNUKnv+nIAQo5R82ulSn/HPthFhksLl
         T0GcMxMZnAANMIf/VY6cSW/O3lZ/iGdwoF0j95clk0+G/tS0tw3q02wTSD43zJothtAQ
         JfEBwRUZ6mPrLlAOrACebwzHmpU9l5dOwW1HqNxGA/lJcEyJR79JPsWQD6a0xNFqQB3X
         xUFmzg4vlhBYYjrRwgR/aCPOKquuPAEBnY5DooF6a0mRTzHjiAtoytANiZ/bygffHdqm
         se3c7qO6RR0bZuY8FJANMciFcQ/kVOt21VIHXY2AMU8j1j60eJW0fo8WmdSaMhXNfTQ/
         f9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794804566; x=1795409366;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+r4qanG5HFrQTkiMyL1knKm50Zsb7RunVimgg67J/4k=;
        b=DOkPzYFNUpK9oab8w8eK4fpfcZI7fhr0X/1ZA9B/BjIAiKW/zaQcEE+kjsrl9bfswX
         WH7iNuJKnvqQPJI9q6lzfWe9DallTxprhAWFh7WDQuRXb7cTIPQ2UbGAmP2Fs+sjXimN
         JnnYWFxNMfRggmuwGzKkTLnbcUfYNjZJLQRNmwH6NNB6eRgsLq5xjmaRpwoC5OFdkcDN
         UpFWawDwCkQQJer5HzlkijTdho9y3WW3lqR8pyPbkkQdn++WsVyu8dXQw7vrXLJQf+4K
         JyRCJbnPgnDjJbn1IKUDp+2tQ9kPxl+3Nc501ucEEB7EY7AUbCkmVMsDmPDc5Ek+ApsY
         hOQA==
X-Forwarded-Encrypted: i=1; AL+hErF9Z5vBCJsxBxN/WRoSxy/FE/I0pLeJWhncJoeGv2wLzeSs+SnGAbiJgqK8tUoSv/5SlrYwANyoK/XI@vger.kernel.org
X-Gm-Message-State: APuU4Z/aK+UX2Ysn7ic568TTga1XjRFAX+oUD/46Po8Jdt0cXIPwlIff
	yRoyrPhQCb/0WbQaeoyaIqQnsr30fXsDmzAcnJug/2EF1knDASfPDtKM/ddoBU80xm0=
X-Gm-Gg: AYBFou12nv9aWY6PvIr4eeNRwRTdRAGI9f+42JYAuV2fjbZ3ODQE2apGVuAfwTj5stl
	uv8xTtowQwirsU3iD1jb5FCib4CCxqKvgTYSEkMwX/EXZKeUzxKbWiHG5LP9/gUHe0CnERjBtmD
	SSC7ktnvhEfIZTDnBoc/M5ir+Nz870i0/Tv6QM7rU/vqDjvh784Xhg9+ZMmmdAb9WoQ0d+JVIHw
	51en5NxNmIVeGmoeuWyzvF8MmuUBsGPugpawxzPD2waCiSxrTPmZPWsf0S/H3B0w7/eIhfPR0k+
	pGdM8tB1b/d0moT/1E4LS6MeSCPAsARGFdFHAejDwCZ0RDTT4OQYkOeSrZgEaA4fciwgoH/UjNY
	/WrnEg6kUOx0ZMxDflfbPu/IQUvEEZojMZdM39gF6X+eSXQ0FqnxbVBJr7oMDiYKRcMBw4WlCrw
	PFRQu5OS2TLxHjXjpEqUbvEq46pkmJbYrsMyQP0wEVWHXqgjobHSAdsWi/XAFTcStekobAOoOq/
	YkQ8TUKzWDinU27BCBd6DnMAbYwExLjehoemdqlCRbb4qPa6+ghxqYCVVdm044r8hs+pnqYNe6T
	lDOdHQWD7x/Nh3GY/rJDurRFC7OAFA6iNMZ84THS5JzjtTCMNqgCmxJvujM+pWmr7FL7UjxSNJH
	XMoXj
X-Received: by 2002:a05:693c:4003:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-3796696128emr9718335eec.23.1794804566027;
        Sun, 15 Nov 2026 20:49:26 -0800 (PST)
Received: from smalls.localdomain (ip-198-145-71-161.az.bambroadband.net. [198.145.71.161])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm45873114eec.8.2026.11.15.20.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:49:25 -0800 (PST)
From: Hunter Laux <hunterlaux@gmail.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Cercueil <paul@crapouillou.net>, Paul Burton <paulburton@kernel.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>, Pengpeng Hou <pengpeng@iscas.ac.cn>,
 "Christophe Leroy, David Heidelberg" <david@ixit.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.de>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Paul Boddie <paul@boddie.org.uk>,
 Olivier Louvignes <olivier@mgcrea.io>,
 "Zhou Yanjie" <zhouyanjie@wanyeetech.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org
Subject: Re: [PATCH v2 7/9] MIPS: Ingenic: Expand Kconfig for X1600, X2000,
 and X2600 SoCs
In-Reply-To:
 <4cbb6412d3e7713d6c464051a107db19feef1278.1794471031.git.hns@goldelico.com>
References: <cover.1794471031.git.hns@goldelico.com>
 <4cbb6412d3e7713d6c464051a107db19feef1278.1794471031.git.hns@goldelico.com>
Date: Sun, 15 Nov 2026 21:49:24 -0700
Message-ID: <179480456454.1427711.8965713943172137555@gmail.com>
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

On Thu, Nov 12, 2026 at 09:10:29AM +0100, H. Nikolaus Schaller wrote:
> +config MACH_X2600
> +	bool
> +	select MIPS_CPU_SCACHE
> +	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
> +	select SYS_HAS_CPU_MIPS32_R5

With only R5 here, a kernel for just the X2600 is built for MIPS32r5,
and it dies at the first interrupt return:

  Reserved instruction in kernel code[#1]:
  epc   : arch_local_irq_restore+0xc/0x18
  PrId  : 00132000 (Ingenic XBurst II)

RESTORE_SP_AND_RET uses eretnc on R5, which XBurst II doesn't have (it
predates R5.04). Zhou fixed this in 2020, using eretnc only on R6:
"MIPS: stackframe: Fix the problem caused by the eretnc instruction."
With it the same kernel boots. Since this patch makes an X2600 kernel
R5-only, I think Zhou's fix should come before it in the series.

Hunter
