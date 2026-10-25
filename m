Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.165.236.26
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792926421;
	b=QsBaWOCgwqw6dUFU/N1EEATcdzRDXpgv17XMwPQMUqe+SUKOKY7Xs79QCuCKLLPGJLQQ
	 LCyZsnv4yGKSl536KW6PxW8P6B71g8fIcbqymkHBtUUu35pSwReRPb/qGzXkkzQyy7AIz
	 Iac51hK/ROuMHFKdu3Cq6N9TfOegt9z1xaV+JxbL4NgV0vFVrr5JTQDtZZydLDQoQFSXB
	 IAbS/fAn4MrBR011MgebBrSXf6YFr+tQi1AXyIO0YKLy0NUUj+ldma9XXM9oZWqE4owQ7
	 c6vkUDDYbVNiuz5xXevUwLCPH9Ebe60MUBfqw/bIjxUGtrl77vYt4RXgAJP079PqquQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792926421;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Spam-Status;
	bh=a0aCQyDy90BNEJ4e8lH1WLAVmb1KpwEcnKCaoOYvyl8=;
	b=foBDJegKwd+4TEbnfyZWs0iS0KacwXlvcetrtigfQNw07hgncwDZ3cgx3TbAhZwHTAEH
	 ZuEOHP+QYcMyTBlRsOifZZVCOhjTSAc98IGL0HDfmyLHw2EhGLaYgZgsqGmlZ57OwppV9
	 mVCeBx2ZAQZf5GNoJtuqBkpLmdJIzLcS86q75W/eWVdsHyxhZAdrtVMClkIeB6B3mty21
	 B0FP6ShVTNDPIumZU5IpBssUUd2uoFFYo4u04fq+iuP8HwkyBC/EKybuSxrnxskTD9+lH
	 rCQ7tDvEc7rAcie/tYYNq9INzX6iDhEAPIKusQEgaO16pDn8U91qc3glKQ7WsnV3X3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=boddie.org.uk;
	spf=pass smtp.mailfrom=boddie.org.uk;
	dkim=pass header.d=boddie.org.uk header.i=@boddie.org.uk header.a=rsa-sha256 header.s=dkim header.b=Yuxauk0p;
	arc=none smtp.remote-ip=46.165.236.26
Received: from smtp1.de.opalstack.com (smtp1.de.opalstack.com [46.165.236.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFC3606A31B
	for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 11:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CFC3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=boddie.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=boddie.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=boddie.org.uk header.i=@boddie.org.uk header.a=rsa-sha256 header.s=dkim header.b=Yuxauk0p
Received: from webmail.de.opalstack.com (webmail.de.opalstack.com [172.104.205.51])
	by smtp1.de.opalstack.com (Postfix) with ESMTPSA id 3308F3F1865;
	Sun, 25 Oct 2026 11:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boddie.org.uk;
	s=dkim; t=1792926412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a0aCQyDy90BNEJ4e8lH1WLAVmb1KpwEcnKCaoOYvyl8=;
	b=Yuxauk0p9+JekDq4VV4OEFeI1akbrRsUr/pvVg3p93LFFvJUCT1csCK4Mphd0Tk3dUzzjY
	u7b+xIX8i4vNuc8YI6csKjORqqh2uffomxA8gNjh0jXdazTCb0Q77s1V8TXYOfFeKlABiu
	gOt9XMLEkf9xI9H/91N9FaLhm21dBuk=
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sun, 25 Oct 2026 11:06:51 +0000
From: Paul Boddie <paul@boddie.org.uk>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>, linux-mips@vger.kernel.org,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, Andreas
 Kemnade <akemnade@kernel.org>
Subject: Re: [PATCH] MIPS: cpu-probe: Recognise the XBurst core of the Ingenic
 X1600
In-Reply-To: <alpine.DEB.2.21.2610250558190.42255@angie.orcam.me.uk>
References: <20261023204205.48222-1-olivier@mgcrea.io>
 <F93B4D14-97DB-4F8E-988E-3C6803F5C850@goldelico.com>
 <alpine.DEB.2.21.2610250558190.42255@angie.orcam.me.uk>
Message-ID: <00f33012e2f754e4dec0ec17a76d4285@boddie.org.uk>
X-Sender: paul@boddie.org.uk
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2026-10-25 06:00, Maciej W. Rozycki wrote:
> On Sat, 24 Oct 2026, H. Nikolaus Schaller wrote:
>> 
>> Well, XBURST is an MIPS CPU architecture and not a SoC. So there 
>> should be no X1600 in
>> this macro name, especially if this ends up in a non-SoC-specific 
>> arch/mips/include.
> 
>  Is there a documentation reference available for this value of PrID?

 From the X1600 Programming Manual:

"2.2 PRID of X1600-CPU
Processor ID register (CP0 Register 15, select 0) in XBurst CPUs is a 
read-only register being
used to identify implementation detail of each SOC's CPU. Please refer 
to the programming
manual of XBurst CPU for detail of the register. For X1600, its value is 
0x00D0000"

As previously noted, see:

https://github.com/Ingenic-community/datasheets/tree/main/X

Paul
